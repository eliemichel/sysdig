open Netlist_ast

exception Exit


let oldTime = ref (Unix.gettimeofday ())
let curTime = ref (Unix.gettimeofday ())
let debug_time m =
	oldTime := !curTime;
	curTime := Unix.gettimeofday ();
	let delta = !curTime -. !oldTime in
		Format.eprintf "[time]%f (%s)@." delta m



let default_rom_file = "rom.sim"
let schedule_only = ref false
let sim_only = ref false
let separateur = "\n"

let rom_file = ref default_rom_file

let (ram : (ident, (int, Netlist_ast.value) Hashtbl.t) Hashtbl.t) = Hashtbl.create 17
let (rom : (int, Netlist_ast.value) Hashtbl.t) = Hashtbl.create 97

let loadRom () =
	try
		let addr = ref 0 in
		List.iter
			(fun v ->
				Hashtbl.add rom !addr v;
				incr addr
			)
			(Sim_lexer.read_file !rom_file)
	with Sim_lexer.Sim_lexing_error s ->
		Printf.eprintf "Warning: No ROM loaded: %s\n" s


let simulate filename =
	loadRom ();
	
	Format.eprintf "Open file...@.";
	let p =
		try Netlist.read_file filename
		with Netlist.Parse_error s -> (
			Printf.eprintf "An error occurred: %s\n" s;
			exit 1
			)
	in
	
	let p =
		if not !sim_only then (
			Format.eprintf "Schedule...@.";
			try Scheduler.schedule p
			with Scheduler.Combinational_cycle -> (
				Printf.eprintf "The netlist has a combinatory cycle.\n";
				exit 1
				)
		)
		else p
	in
	
	
	let output o =
		let aux i =
			ignore (Unix.write Unix.stdout (if i = 1 then "1" else "0") 0 1)
		in
		List.iter
			(fun (v, n) ->
				let a = ref v in
				for i = 0 to (max n 1) - 1 do
					aux (!a mod 2);
					a := !a lsr 1;
				done
			)
			o;
	in
	
	
	let check_power o =
		(** Si la première sortie est un bit, elle est utilisée pour indiquer
		    si la machine virtuelle est allumée. Lorsque cette sortie est
		    passée à 0, le simulateur s'arrête. *)
		output o;
		match o with
			| (v, 0) :: q -> if v = 0 then raise Exit
			| o -> ()
	in
	
	if !schedule_only
	then
		let f = (Filename.chop_suffix filename ".net") ^ ".sch.net" in
		Format.eprintf "Export scheduled netlist in %s...@." f;
		let outnet = open_out f in
			Netlist_printer.print_program outnet p;
			close_out outnet;
			Format.eprintf "Done.@.";
			exit 0
	else
		Format.eprintf "Initializing simulation...@.";
		let p = 
			Init.init p
		in
		
		Format.eprintf "Running simulation...@.";
		let rec run () =
			let o =
				Core.tic ram rom p
			in (
				check_power o;
				run ()
				)
		in
		try run ()
		with
			| Exit -> (
				Format.eprintf "Simulation done.@.";
				exit 0
				)
			| Core.Sim_error s -> (
				Format.eprintf "Simulation error:\n%s@." s;
				exit 1
				)

let () =
	Arg.parse
		["-rom", Arg.Set_string rom_file,
		 "File containing ROM (set by default to rom.sim)";
		 
		 "--schedule-only", Arg.Set schedule_only,
		 "Schedule the netlist and then export it netlist.sch.net without \
		  simulating it.";
		 
		 "--sim-only", Arg.Set sim_only,
		 "Simulate netlist assuming that it has already been scheduled. Use it \
		  carefully.";
		]
		simulate
		"sim [filename] schedule and simulates the circuit described in the \
		 given .net file."

