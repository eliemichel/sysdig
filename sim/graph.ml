(*
 * Sysdig -- graph.ml
 * ==================
 *
 * This module provides a graph structure and manipulation functions.
 * It is used by the scheduler.
 *)

exception Cycle
type mark = NotVisited | InProgress | Visited

type 'a graph =
    { mutable g_nodes : 'a node list }
and 'a node = {
  n_label : 'a;
  mutable n_mark : mark;
  mutable n_link_to : 'a node list;
  mutable n_linked_by : 'a node list;
}

let mk_graph () = { g_nodes = [] }

let add_node g x =
  let n = { n_label = x; n_mark = NotVisited; n_link_to = []; n_linked_by = [] } in
  g.g_nodes <- n::g.g_nodes

let node_for_label g x =
  List.find (fun n -> n.n_label = x) g.g_nodes

let add_edge g id1 id2 =
  let n1 = node_for_label g id1 in
  let n2 = node_for_label g id2 in
  n1.n_link_to <- n2::n1.n_link_to;
  n2.n_linked_by <- n1::n2.n_linked_by

let clear_marks g =
  List.iter (fun n -> n.n_mark <- NotVisited) g.g_nodes

let find_roots g =
  List.filter (fun n -> n.n_linked_by = []) g.g_nodes


let has_cycle g =
	clear_marks g;
	let rec aux = function
		| [] -> true
		| n::q ->
			n.n_mark = Visited || (
				n.n_mark = NotVisited &&
				(n.n_mark <- InProgress ; aux n.n_link_to) &&
				(n.n_mark <- Visited ; aux q)
			)
	in not (aux g.g_nodes)


let topological g =
	if has_cycle g then raise Cycle
	else
		clear_marks g;
		let rec aux l = function
			| []   -> l
			| n::q ->
				let l' =
					if n.n_mark = Visited
					then l
					else (
						n.n_mark <- Visited;
						n.n_label::(aux l n.n_linked_by)
					)
				in aux l' q
		in aux [] g.g_nodes


let print_graph g =
	List.iter
		(fun n ->
			print_string (n.n_label ^ " <- ");
			List.iter (fun n -> print_string (n.n_label ^ " ; ")) n.n_linked_by;
			print_string "\n"
		)
		g.g_nodes


let print_graph2 g =
	List.iter
		(fun n ->
			print_string (n.n_label ^ " needs ");
			List.iter (fun n -> print_string (n.n_label ^ " ; ")) n.n_link_to;
			print_string "\n"
		)
		g.g_nodes



