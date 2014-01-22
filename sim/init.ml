(*
 * Sysdig -- init.ml
 * =================
 *
 * This module converts the AST comming from the parser into a more efficient
 * to simulate one, in which nets are described by integers instead of strings.
 * This enable the use of array to store simulated nets state.
 *)

open Netlist_ast
open Bigarray

exception VarUndef of ident

let idtable = Hashtbl.create 97
let table = Hashtbl.create 97

let i_arg_of_arg int_of_ident = function
	| Avar id -> Ivar (int_of_ident id)
	| Aconst n -> Iconst n

let i_exp_of_exp int_of_ident =
	let arg = i_arg_of_arg int_of_ident in
	function
		| Earg a -> Iarg (arg a)
		| Ereg id -> Ireg (int_of_ident id)
		| Enot a -> Inot (arg a)
		| Ebinop (op, a, b) -> Ibinop (op, arg a, arg b)
		| Emux (a, b, c) -> Imux (arg a, arg b, arg c)
		| Erom (i, j, a) -> Irom (i, j, arg a)
		| Eram (i, j, a, b, c, d) -> Iram (i, j,
			arg a, arg b, arg c, arg d)
		| Econcat (a, b) -> Iconcat (arg a, arg b)
		| Eslice (i, j, a) -> Islice (i, j, arg a)
		| Eselect (i, a) -> Iselect (i, arg a)

let i_eq_of_eq int_of_ident (id, exp) =
	int_of_ident id, i_exp_of_exp int_of_ident exp

let init p =
	let n_eqs = List.length p.p_eqs in
	let n_inputs = List.length p.p_inputs in
	let n = n_eqs + n_inputs in
	Format.eprintf "%d logical gates loaded@." n_eqs;
	let old_env = Array.make n (0, -1) in
	let env     = Array.make n (0, -1) in
	
	let head = ref 0 in
	
	let int_of_ident id =
		try  Hashtbl.find table id
		with Not_found ->
		try
			let c = !head in
				env.(c) <- (0, Env.find id p.p_vars);
				incr head;
				Hashtbl.add idtable c id;
				Hashtbl.add table id c;
				c
		with Not_found -> raise (VarUndef id)
	in
	
	{
		i_eqs     = Array.map (i_eq_of_eq int_of_ident) (Array.of_list p.p_eqs);
		i_inputs  = List.map int_of_ident p.p_inputs;
		i_outputs = List.map int_of_ident p.p_outputs;
		i_old_env = old_env;
		i_env     = env;
	}








