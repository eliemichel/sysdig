open Netlist_ast

let input_file = ref "input.txt"
let output_file = ref "output.txt"
let number_steps = ref (-1)


let simulate filename =
	let out = open_out !output_file in
	let close_all () =
		close_out out
	in
	
	let inputs = Input.read_file !input_file in
	
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
	
	
	let env = ref (Env.empty) in
	let rec run n inputs = if n <> 0 then match inputs with
		| []     -> print_string "Simulation done.\n"
		| i :: q ->
			let env', o = Core.tic i !env p in (
				env := env';
				formatedOutput o;
				run (n - 1) q
				)
	in
		run !number_steps inputs;
		close_all ()
	

let () =
	Arg.parse
		["-input", Arg.Set_string input_file, "File containing input values (set by default to input.txt)";
		 "-output", Arg.Set_string output_file, "File in which the result is returned (if not specified, result is displayed in output.txt)";
		 "-n", Arg.Set_int number_steps, "Number of steps to simulate (if not specified, number of lines of input file)"]
		simulate
		""

