(*
 * Sysdig -- scheduler.ml
 * ======================
 *
 * The scheduler aims to reorder the netlist according to net links dependencies
 * and can detect if there are combinatory cycles.
 *)

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


(* Suppression des variables doublons *)
(* Présuppose être passé après scheduler *)
module Sset = Set.Make(String)
module Ssset = Set.Make(Sset)
let nb = ref 0
let auto_search_replace p =
  let rec search sss = function
    | [] -> sss
    | (ident_1, Earg(Avar ident_2))::t ->
      incr nb;
      let (s1,s2) = Ssset.partition (fun ss -> Sset.mem ident_1 ss || Sset.mem ident_2 ss) sss in
      let rec list_union = function
	| [] -> Sset.empty
	| h::t -> Sset.union h (list_union t)
      in
      let new_elt =
	begin match Ssset.cardinal s1 with
	  | 0 -> Sset.add ident_1 (Sset.add ident_2 (Sset.empty))
	  | 1 -> Sset.add ident_1 (Sset.add ident_2 (Ssset.choose s1))
	  | 2 -> Sset.union (Ssset.min_elt s1) (Ssset.max_elt s1)
	  | _ -> assert false
	end
      in
      search (Ssset.add new_elt s2) t
    | h::t -> search sss t
  in
  let sss = search Ssset.empty p.p_eqs
  in
  Format.eprintf "Suppression de %d doublons de variables...@." (!nb-Ssset.cardinal sss);
  let give_repres ident_ =
    let ident_sets = Ssset.filter (Sset.mem ident_) sss in
    if Ssset.cardinal ident_sets = 1 then
      Sset.choose (Ssset.choose ident_sets)
    else
      ident_
  in
  let replace_arg = function 
    | Avar i -> Avar (give_repres i)      
    | _ as a -> a
  in
  let rec replace = function
    | [] -> []
    | (ident_, exp_)::t ->
      (give_repres ident_, 
       match exp_ with
	 | Earg a -> Earg (replace_arg a)
	 | Ereg i -> Ereg (give_repres i)
	 | Enot a -> Enot (replace_arg a)
	 | Ebinop(b,a1,a2) ->
	     Ebinop(b, replace_arg a1, replace_arg a2)
	 | Emux(a1,a2,a3) ->
	     Emux(replace_arg a1, replace_arg a2, replace_arg a3)
	 | Erom(i1,i2,a) ->
	     Erom(i1,i2, replace_arg a)
	 | Eram(i1,i2,a1,a2,a3,a4) ->
	     Eram(i1, i2, replace_arg a1, replace_arg a2, replace_arg a3, replace_arg a4)
      ) :: (replace t)
  in
  { p_eqs     = replace p.p_eqs;
    p_inputs  = List.map give_repres p.p_inputs;
    p_outputs = List.map give_repres p.p_outputs;
    p_vars    =
      Env.fold
	(fun ident_ ty_ new_env ->
	  Env.add (give_repres ident_) ty_ new_env)
	p.p_vars
	Env.empty
  }
