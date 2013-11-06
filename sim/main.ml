open Netlist_ast

let default_input_file = "input.sim"
let default_output_file = "output.sim"
let default_rom_file = "rom.sim"

let input_file = ref default_input_file
let output_file = ref default_output_file
let rom_file = ref default_rom_file
let number_steps = ref (-1)
let export_sch = ref false
let prefix = ref false

let env = ref (Env.empty)
let (ram : (int, Netlist_ast.value) Hashtbl.t) = Hashtbl.create 97
let (rom : (int, Netlist_ast.value) Hashtbl.t) = Hashtbl.create 97

let loadRom () =
	try
		let addr = ref 0 in
		List.iter
			(fun l -> List.iter
				(fun v ->
					Hashtbl.add rom !addr v;
					incr addr
				)
				l
			)
			(Sim_lexer.read_file !rom_file)
	with Sim_lexer.Sim_lexing_error s ->
		Format.eprintf "Error during ROM loading: %s@." s


let simulate filename =
	if !prefix then (
		let f = Filename.chop_suffix filename ".net" in
		if !input_file = default_input_file
		then input_file := f ^ "_input.sim";
		
		if !output_file = default_output_file
		then output_file := f ^ "_output.sim";
		
		if !rom_file = default_rom_file
		then rom_file := f ^ "_rom.sim";
	);
	
	let out = open_out !output_file in
	let close_all () =
		close_out out
	in
	
	let inputs = Sim_lexer.read_file !input_file in
	loadRom ();
	
	let p =
		try Netlist.read_file filename
		with Netlist.Parse_error s -> (
			Format.eprintf "An error occurred: %s@." s;
			exit 2
			)
	in
	
	let p =
		try Scheduler.schedule p
		with Scheduler.Combinational_cycle -> (
			Format.eprintf "The netlist has a combinatory cycle.@.";
			close_all ();
			exit 2
			)
	in
	
	let formatedOutput o =
		let aux_array a =
			output out "[" 0 1;
			for k = 0 to Array.length a - 1 do
				output out (if a.(k) then "1 " else "0 ") 0 2
			done;
			output out "] " 0 2
		in
		let rec aux = function
			| []                 -> output out "\n" 0 1
			| (VBit b) :: q      -> (
				output out (if b then "1 " else "0 ") 0 2;
				aux q
				)
			| (VBitArray a) :: q -> (aux_array a ; aux q)
		in aux o
	in
	
	if !export_sch then (
		let outnet = open_out "sch.net" in
			Netlist_printer.print_program outnet p;
			close_out outnet;
	);
	
	Format.eprintf "Running simulation...@.";
	let rec run n inputs = if n <> !number_steps then match inputs with
		| []     -> print_string "Simulation done.\n"
		| i :: q ->
			let env', o =
				try Core.tic i !env ram rom p
				with Core.Sim_error s -> (
					Format.eprintf
						"Simulation error on line %d:\n%s@."
						(n + 1)
						s;
					exit 2
				)
			in (
				env := env';
				formatedOutput o;
				run (n + 1) q
				)
	in
		run 0 inputs;
		close_all ()
	

let () =
	Arg.parse
		["-input", Arg.Set_string input_file,
		 "File containing input values (set by default to input.sim)";
		
		 "-output", Arg.Set_string output_file,
		 "File in which the result is returned (if not specified, result is\
		 displayed in output.sim)";
		 
		 "-rom", Arg.Set_string rom_file,
		 "File containing ROM (set by default to rom.sim)";
		 
		 "-n", Arg.Set_int number_steps,
		 "Number of steps to simulate (if not specified, number of lines of\
		 input file)";
		 
		 "-p", Arg.Set prefix,
		 "If specified, default input, output and rom files will be prefixed\
		 by [filename]_";
		 
		 "-sch", Arg.Set export_sch,
		 "Specify whether the sorted netlist must be exported (in sch.net)";
		]
		simulate
		"sim [filename] simulates the circuit described in the given .net file."

