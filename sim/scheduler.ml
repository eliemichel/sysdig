open Netlist_ast
open Graph
exception Combinational_cycle

let read_exp f eq =
	let read_arg = function
		| Avar id -> f id
		| _ -> ()
	in
	match snd eq with
		| Earg a -> read_arg a
		| Ereg _ -> ()
		| Enot a -> read_arg a
		| Ebinop (_, a, b) -> read_arg a ; read_arg b
		| Emux (a, b, c) -> read_arg a ; read_arg b ; read_arg c
		| Erom (_, _, a) -> read_arg a
		| Eram (_, _, a, b, c, d) ->
			read_arg a ; read_arg b ; read_arg c
		| Econcat (a, b) -> read_arg a ; read_arg b
		| Eslice (_, _, a) -> read_arg a
		| Eselect (_, a) -> read_arg a



let schedule p =
	let g = mk_graph () in
	let add_edges eq = read_exp (add_edge g (fst eq)) eq
	in
	List.iter (fun eq -> add_node g (fst eq)) p.p_eqs;
	List.iter (add_node g) p.p_inputs;
	List.iter add_edges p.p_eqs;
	let rec aux = function
		| []   -> []
		| t::q ->
			if List.mem t p.p_inputs
			then aux q
			else let eq = List.find (fun (id,_) -> id = t) p.p_eqs in
				eq :: (aux q)
	in
	try
	{
		p_eqs = aux (topological g);
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}
	with Cycle -> raise Combinational_cycle



