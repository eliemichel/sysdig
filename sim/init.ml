(*
 * Sysdig -- init.ml
 * =================
 *
 * This module converts the AST comming from the parser into a more efficient
 * to simulate one, in which nets are described by integers instead of strings.
 * This enable the use of array to store simulated nets state.
 *)

open Netlist_ast
open Format

exception VarUndef of ident

let idtable = Hashtbl.create 97
let table = Hashtbl.create 97

let exp_length = function
	| Earg    a -> 2
	| Ereg    _ -> 2
	| Enot    a -> 2
	| Ebinop  (_, a, b) -> 3
	| Emux    (a, b, c) -> 4
	| Erom    (_, _, a) -> 4
	| Eram    (_, _, a, b, c, d) -> 6

let eqs_length l =
	List.fold_left (+) 0 (List.map (fun e -> 1 + exp_length (snd e)) l)

let i_arg_of_arg int_of_ident = function
	| Avar id  -> int_of_ident id
	| Aconst n -> n

let int_of_op = function
	| Or   -> 0
	| Xor  -> 1
	| And  -> 2
	| Nand -> 3

let i_exp_of_exp int_of_ident push =
	let arg = i_arg_of_arg int_of_ident in
	function
		| Earg a ->
			let v = arg a in
			push 0x1;
			push v
		| Ereg id ->
			push 0x2;
			push (int_of_ident id)
		| Enot a ->
			let v = arg a in
			push 0x3;
			push v
		| Ebinop (op, a, b) ->
			let a = arg a in
			let b = arg b in
			push (0x4 lor int_of_op op);
			push a;
			push b
		| Emux (a, b, c) ->
			let a = arg a in
			let b = arg b in
			let c = arg c in
			push 0x8;
			push a;
			push b;
			push c
		| Erom (i, j, a) ->
			let v = arg a in
			push 0x9;
			push i;
			push j;
			push v
		| Eram (i, j, a, b, c, d) ->
			let a = arg a in
			let b = arg b in
			let c = arg c in
			let d = arg d in
			push 0xa;
			push i;
			push j;
			push a;
			push b;
			push c;
			push d

let i_eq_of_eq int_of_ident push (id, exp) =
	push (int_of_ident id);
	i_exp_of_exp int_of_ident push exp

let init p =
	let n_eqs = List.length p.p_eqs in
	let n_inputs = List.length p.p_inputs in
	let n = n_eqs + n_inputs + 2 in
	eprintf "%d logical gates loaded@." n_eqs;
	let old_env = Array.make n 0 in
	let env     = Array.make n 0 in
	
	env.(1) <- 1;
	old_env.(1) <- 1;
	let head = ref 2 in
	
	let m = eqs_length p.p_eqs in
	let table_eqs = Array.make m 0 in
	eprintf "%d instructions@." m;
	let head_eqs = ref 0 in
	let push x =
		table_eqs.(!head_eqs) <- x;
		incr head_eqs
	in
	
	let int_of_ident id =
		try  Hashtbl.find table id
		with Not_found ->
			let c = !head in
				incr head;
				Hashtbl.add idtable c id;
				Hashtbl.add table id c;
				c
	in
	
	List.iter (i_eq_of_eq int_of_ident push) p.p_eqs;
	
	(*Debug.print_array (fun (a,b) -> sprintf "%x %x\n" a b) env;*)
	(*Debug.print_array (sprintf "%x\n") table_eqs;*)
	
	{
		i_eqs     = table_eqs;
		i_inputs  = List.map int_of_ident p.p_inputs;
		i_outputs = List.map int_of_ident p.p_outputs;
		i_old_env = old_env;
		i_env     = env;
	}








