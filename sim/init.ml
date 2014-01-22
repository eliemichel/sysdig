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

let arg_length = function
	| Avar   _ -> 1
	| Aconst _ -> 2

let exp_length = function
	| Earg    a -> 1 + (arg_length a)
	| Ereg    _ -> 2
	| Enot    a -> 1 + (arg_length a)
	| Ebinop  (_, a, b) -> 1 + (arg_length a) + (arg_length b)
	| Emux    (a, b, c) -> 1 + (arg_length a) + (arg_length b) + (arg_length c)
	| Erom    (_, _, a) -> 3 + (arg_length a)
	| Eram    (_, _, a, b, c, d) ->
		3 + (arg_length a) + (arg_length b) + (arg_length c) + (arg_length d)
	| Econcat (a, b)    -> 1 + (arg_length a) + (arg_length b)
	| Eslice  (_, _, a) -> 3 + (arg_length a)
	| Eselect (_, a)    -> 2 + (arg_length a)

let eqs_length l =
	List.fold_left (+) 0 (List.map (fun e -> 1 + exp_length (snd e)) l)

let i_arg_of_arg int_of_ident = function
	| Avar id  -> 1, int_of_ident id, 0
	| Aconst n -> 0, fst n, snd n

let int_of_op = function
	| Or   -> 0
	| Xor  -> 1
	| And  -> 2
	| Nand -> 3

let i_exp_of_exp int_of_ident push =
	(* Operations are encoded bitwise.
	 * 0bxxxxbbbb represents the xxxx-th operation, and bbbb specifies for each
	 * argument if it is a Avar (1) or a Areg (0).
	 *)
	let arg = i_arg_of_arg int_of_ident in
	function
		| Earg a ->
			let b, v0, v1 = arg a in
			push (0x10 lor b);
			push v0;
			if b = 0 then push v1
		| Ereg id ->
			push (0x21);
			push (int_of_ident id)
		| Enot a ->
			let b, v0, v1 = arg a in
			push (0x30 lor b);
			push v0;
			if b = 0 then push v1
		| Ebinop (op, a, b) ->
			let ba, v0a, v1a = arg a in
			let bb, v0b, v1b = arg b in
			push (((0x4 lor int_of_op op) lsl 3 lor ba) lsl 1 lor bb);
			push v0a;
			if ba = 0 then push v1a;
			push v0b;
			if bb = 0 then push v1b
		| Emux (a, b, c) ->
			let ba, v0a, v1a = arg a in
			let bb, v0b, v1b = arg b in
			let bc, v0c, v1c = arg c in
			push (((0x8 lsl 2 lor ba) lsl 1 lor bb) lsl 1 lor bc);
			push v0a;
			if ba = 0 then push v1a;
			push v0b;
			if bb = 0 then push v1b;
			push v0c;
			if bc = 0 then push v1c
		| Erom (i, j, a) ->
			let b, v0, v1 = arg a in
			push (0x9 lsl 4 lor b);
			push i;
			push j;
			push v0;
			if b = 0 then push v1
		| Eram (i, j, a, b, c, d) ->
			let ba, v0a, v1a = arg a in
			let bb, v0b, v1b = arg b in
			let bc, v0c, v1c = arg c in
			let bd, v0d, v1d = arg d in
			push ((((0xa lsl 1 lor ba) lsl 1 lor bb) lsl 1 lor bc) lsl 1 lor bd);
			push i;
			push j;
			push v0a;
			if ba = 0 then push v1a;
			push v0b;
			if bb = 0 then push v1b;
			push v0c;
			if bc = 0 then push v1c;
			push v0d;
			if bd = 0 then push v1d
		| Econcat (a, b) ->
			let ba, v0a, v1a = arg a in
			let bb, v0b, v1b = arg b in
			push ((0xb lsl 3 lor ba) lsl 1 lor bb);
			push v0a;
			if ba = 0 then push v1a;
			push v0b;
			if bb = 0 then push v1b
		| Eslice (i, j, a) ->
			let b, v0, v1 = arg a in
			push (0xc lsl 4 lor b);
			push i;
			push j;
			push v0;
			if b = 0 then push v1
		| Eselect (i, a) ->
			let b, v0, v1 = arg a in
			push (0xd lsl 4 lor b);
			push i;
			push v0;
			if b = 0 then push v1

let i_eq_of_eq int_of_ident push (id, exp) =
	push (int_of_ident id);
	i_exp_of_exp int_of_ident push exp

let init p =
	let n_eqs = List.length p.p_eqs in
	let n_inputs = List.length p.p_inputs in
	let n = n_eqs + n_inputs in
	eprintf "%d logical gates loaded@." n_eqs;
	let old_env = Array.make n (0, -1) in
	let env     = Array.make n (0, -1) in
	
	let head = ref 0 in
	
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
		try
			let c = !head in
			let n = Env.find id p.p_vars in
				(*eprintf "Init %s -> %d (type: %d)@." id c n;*)
				env.(c) <- (0, n);
				old_env.(c) <- (0, n);
				incr head;
				Hashtbl.add idtable c id;
				Hashtbl.add table id c;
				c
		with Not_found -> raise (VarUndef id)
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








