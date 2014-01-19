open Netlist_ast
open Bigarray


let init p =
	let n = List.length p.p_eqs in
	Format.eprintf "%d logical gates loaded@." n;
	let a = Array1.create int c_layout n in
	
	p








