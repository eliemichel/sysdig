open Netlist_ast
open Graph
exception Combinational_cycle

let read_exp eq =
	let read_arg l = function
		| Avar id -> id::l
		| _ -> l
	in
	let aux l = function
		| Earg a -> read_arg l a
		| Ereg id -> id::l
		| Enot a -> read_arg l a
		| Ebinop (_, a, b) -> read_arg (read_arg l a) b
		| Emux (a, b, c) -> read_arg (read_arg (read_arg l a) b) c
		| Erom (_, _, a) -> read_arg l a
		| Eram (_, _, a, b, c, d) ->
			read_arg (read_arg (read_arg (read_arg l a) b) c) d
		| Econcat (a, b) -> read_arg (read_arg l a) b
		| Eslice (_, _, a) -> read_arg l a
		| Eselect (_, a) -> read_arg l a
	in aux [] (snd eq)



let schedule p =
	let g = mk_graph () in
	let add_edges eq = match snd eq with
		| Ereg _ | Eram _ | Erom _ -> ()
		| _ -> List.iter (add_edge g (fst eq)) (read_exp eq)
	in
	List.iter (fun eq -> add_node g (fst eq)) p.p_eqs;
	List.iter (add_node g) p.p_inputs;
	List.iter add_edges p.p_eqs;
	let rec aux l = function
		| []   -> l
		| t::q ->
			if List.mem t p.p_inputs
			then aux l q
			else let eq = List.find (fun (id,_) -> id = t) p.p_eqs in
				aux (eq::l) q
	in
	{
		p_eqs = aux [] (topological g);
		p_inputs = p.p_inputs;
		p_outputs = p.p_outputs;
		p_vars = p.p_vars;
	}



