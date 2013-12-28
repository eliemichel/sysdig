open Netlist_ast

exception Exit

let default_rom_file = "rom.sim"
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
		Format.eprintf "Warning: No ROM loaded: %s@." s


let simulate filename =
	loadRom ();
	
	let p =
		try Netlist.read_file filename
		with Netlist.Parse_error s -> (
			Format.eprintf "An error occurred: %s@." s;
			exit 1
			)
	in
	
	let p =
		try Scheduler.schedule p
		with Scheduler.Combinational_cycle -> (
			Format.eprintf "The netlist has a combinatory cycle.@.";
			exit 1
			)
	in
	
	
	let output o =
		let aux b = Printf.printf "%s" (if b then "1" else "0") in
		List.iter
			(function
				| VBit      b -> aux b
				| VBitArray a -> Array.iter aux a
			)
			o;
		Printf.printf "%s" separateur
	in
	
	
	let check_power o =
		(** Si la première sortie est un bit, elle est utilisée pour indiquer
		    si la machine virtuelle est allumée. Lorsque cette sortie est
		    passée à 0, le simulateur s'arrête. *)
		output o;
		match o with
			| (VBit b) :: q -> if not b then raise Exit
			| o -> ()
	in
	
	let s = Stream.of_channel stdin in
	
	Format.eprintf "Running simulation...@.";
	let rec run env =
		let new_env, o =
			Core.tic s env ram rom p
		in (
			check_power o;
			run new_env
			)
	in
	try run Env.empty
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
		]
		simulate
		"sim [filename] simulates the circuit described in the given .net file."

