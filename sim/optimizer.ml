(******************************************************************************)
(******************************************************************************)
(*******************************               ********************************)
(*******************************   OPTIMIZER   ********************************)
(*******************************               ********************************)
(******************************************************************************)
(******************************************************************************)

exception Combinational_cycle

(******************************************************************************)
(***************************** SYNTAXE ABSTRAITE ******************************)
(******************************************************************************)
type name = string
type typ = int
type value = int
type status =
  | S_input
  | S_output
  | S_internal
  | S_value
type mark = int
type binop =
  | B_or
  | B_xor
  | B_and
  | B_nand
type node =
    { mutable n_status : status    ;
      mutable n_mark   : mark      ;
      mutable n_name   : name      ; (* S_input, S_output, S_internal *)
      mutable n_typ    : typ       ;
      mutable n_expr   : expr      ; (* S_output, S_internal *)
      mutable n_value  : value     ; (* S_value *)
      mutable n_deps   : node list ; (* Dépendants généraux *)
      mutable n_tdeps  : node list } (* Dépendants au temps t *)
and expr =
  | E_void
  | E_arg of node
  | E_reg of node
  | E_not of node
  | E_binop of binop * node * node
  | E_mux of node * node * node
  | E_rom of int(*addrsize*) * int(*wordsize*) * node
  | E_ram of int(*addrsize*) * int(*wordsize*) * node * node * node * node
  | E_concat of node * node
  | E_slice of int * int * node
  | E_select of int * node
type program =
    { mutable p_inputs : node list ;
      mutable p_outputs : node list ;
      mutable p_nodes : (name, node) Hashtbl.t }



(******************************************************************************)
(******************** FONCTIONS NETLIST -> GRAPH -> NETLIST *******************)
(******************************************************************************)


(******************************************************************************)
(* reset_marks : program -> unit                                              *)
let reset_marks p_graph =
  Hashtbl.iter
    (fun nam nod -> nod.n_mark <- 0)
    p_graph.p_nodes


(******************************************************************************)
(* netlist_to_graph                                                           *)
(* netlist_to_graph : Netlist_ast.program -> program                          *)
let netlist_to_graph p =
  let p_graph =
    { p_inputs = [] ;
      p_outputs = [] ;
      p_nodes = Hashtbl.create (List.length p.Netlist_ast.p_eqs) }
  in

  let get_nam nam i = (nam^"_n"^(string_of_int i)) in

  (* On ajoute (quasiment) tous les noeuds, en version bits *)
  let add_node nam statu =
    Hashtbl.add p_graph.p_nodes
      nam
      { n_status = statu  ;
	n_mark   = 0      ;
	n_name   = nam    ;
	n_typ    = 0      ;
	n_expr   = E_void ;
	n_value  = -1     ;
	n_deps   = []     ;
	n_tdeps  = []       }
  in
  Netlist_ast.Env.iter
    (fun nam ty ->
      (* On ramène le ty à 1 minimum tbit ~ tbitarray 1 *)
      let ty = max 1 ty in
      let statu =
	if List.mem nam p.Netlist_ast.p_inputs then
	  S_input
	else if List.mem nam p.Netlist_ast.p_outputs then
	  S_output
	else
	  S_internal in
      for i=0 to ty-1 do
	add_node (get_nam nam i) statu
      done)
    p.Netlist_ast.p_vars;

  (* On traite maintenant les inputs et outputs *)
  let rec traite_io = function
    | [] -> []
    | nam::q ->
      let ty = max 1 (Netlist_ast.Env.find nam p.Netlist_ast.p_vars) in
      let res = ref (traite_io q) in
      for i=ty-1 downto 0 do
	res := (Hashtbl.find p_graph.p_nodes (get_nam nam i)) :: !res
      done;
      !res
  in
  p_graph.p_inputs <- traite_io p.Netlist_ast.p_inputs;
  p_graph.p_outputs <- traite_io p.Netlist_ast.p_outputs;

  (* On traite les équations *)
  let nodes_from_nam nam =
    let ty = max 1 (Netlist_ast.Env.find nam p.Netlist_ast.p_vars) in
    let res = ref [] in
    for i = ty-1 downto 0 do
      res := (Hashtbl.find p_graph.p_nodes (get_nam nam i)) :: !res
    done;
    !res
  in
  (* Lorsqu'on crée un noeud value, on fait le choix de ne pas l'enregistrer
     dans la Hashtbl. En effet, à quoi bon ? <- c'est une vraie question ! *)
  let traite_arg = function
    | Netlist_ast.Avar i -> nodes_from_nam i
    | Netlist_ast.Aconst (v,ty) ->
      let ty = max 1 ty in
      let res = ref [] in
      let v = ref v in
      for i=0 to ty-1 do
	res := (!v mod 2) :: !res;
	v := !v lsr 1
      done;
      List.rev_map
	(fun i ->
	  { n_status = S_value ;
	    n_mark = 0 ;
	    n_name = "" ;
	    n_typ = 0 ;
	    n_expr = E_void ;
	    n_value = i ;
	    n_deps = [] ;
	    n_tdeps = [] })
	!res
  in
  let traite_eq (nam,exp) =
    let nodes = nodes_from_nam nam in
    match exp with

      (* Earg *)
      | Netlist_ast.Earg a ->
	List.iter2
	  (fun n1 n2 ->
	    n1.n_expr <- E_arg n2;
	    n2.n_deps <- n1 :: n2.n_deps;
	    n2.n_tdeps <- n1 :: n2.n_tdeps)
	  nodes (traite_arg a)

      (* Ereg *)
      | Netlist_ast.Ereg i ->
	let n1 = List.hd(nodes)
	and n2 = List.hd(nodes_from_nam i) in
	n1.n_expr <- E_reg n2;
	n2.n_deps <- n1 :: n2.n_deps (* mais pas tdeps ! *)

      (* Enot *)
      | Netlist_ast.Enot a ->
	let n1 = List.hd(nodes)
	and n2 = List.hd(traite_arg a) in
	n1.n_expr <- E_not n2;
	n2.n_deps <- n1 :: n2.n_deps;
	n2.n_tdeps <- n1 :: n2.n_tdeps

      (* Ebinop *)
      | Netlist_ast.Ebinop (b, a1, a2) ->
	let b = match b with
	  | Netlist_ast.Or -> B_or
	  | Netlist_ast.Xor -> B_xor
	  | Netlist_ast.And -> B_and
	  | Netlist_ast.Nand -> B_nand
	and n1 = List.hd(nodes)
	and n2 = List.hd(traite_arg a1)
	and n3 = List.hd(traite_arg a2) in
	n1.n_expr <- E_binop (b, n2, n3);
	n2.n_deps <- n1 :: n2.n_deps;
	n2.n_tdeps <- n1 :: n2.n_tdeps;
	n3.n_deps <- n1 :: n3.n_deps;
	n3.n_tdeps <- n1 :: n3.n_tdeps

      (* Emux *)
      | Netlist_ast.Emux (a1, a2, a3) ->
	let n1 = List.hd(nodes)
	and n2 = List.hd(traite_arg a1)
	and n3 = List.hd(traite_arg a2)
	and n4 = List.hd(traite_arg a3) in
	n1.n_expr <- E_mux (n2, n3, n4);
	n2.n_deps <- n1 :: n2.n_deps;
	n2.n_tdeps <- n1 :: n2.n_tdeps;
	n3.n_deps <- n1 :: n3.n_deps;
	n3.n_tdeps <- n1 :: n3.n_tdeps;
	n4.n_deps <- n1 :: n4.n_deps;
	n4.n_tdeps <- n1 :: n4.n_tdeps

      (* Erom *)
      | Netlist_ast.Erom (addr_size, word_size, a) ->
	(* Des fonctions utiles pour la création temporaire de variables *)
	let tmpnam nam = (nam^"tmp") in
	let add_tmp_nod nam ty exp =
	  let nod =
	    { n_status = S_internal ;
	      n_mark = 0 ;
	      n_name = tmpnam nam ;
	      n_typ = ty ;
	      n_expr = exp ;
	      n_value = (-1) ;
	      n_deps = [] ;
	      n_tdeps = [] }
	  in
	  Hashtbl.add p_graph.p_nodes (tmpnam nam) nod;
	  nod
	in
	(* La construction pré-ROM *)
	let nodes2 = traite_arg a in
	let prec = ref (add_tmp_nod ((List.hd nodes2).n_name) 0 (E_arg (List.hd nodes2))) in
	for i=1 to addr_size-1 do
	  let newprec = add_tmp_nod ((List.nth nodes2 i).n_name) (i+1)
	    (E_concat (!prec, List.nth nodes2 i))
	  in
	  (!prec).n_deps <- newprec :: (!prec).n_deps;
	  (!prec).n_tdeps <- newprec :: (!prec).n_tdeps;
	  prec := newprec
	done;
	(* L'appel de la ROM *)
	let wordnod = 
	  { n_status = S_internal ;
	    n_mark = 0 ;
	    n_name = nam ;
	    n_typ = word_size ;
	    n_expr = E_rom (addr_size, word_size, !prec) ;
	    n_value = -1 ;
	    n_deps = [] ;
	    n_tdeps = [] } in
	Hashtbl.add p_graph.p_nodes nam wordnod;
	(* La construction post-ROM *)
	let i = ref 0 in
	List.iter
	  (fun n1 ->
	    n1.n_expr <- E_select (!i, wordnod);
	    wordnod.n_deps <- n1 :: wordnod.n_deps ;
	    wordnod.n_tdeps <- n1 :: wordnod.n_tdeps ;
	    incr i)
	  nodes
	    

      (* Eram *)
      (* La gestion de la RAM est très longue, mais en fait c'est comme pour *)
      (* la ROM, mais avec trois constructions de tmp *)
      | Netlist_ast.Eram (addr_size, word_size, ra, we, wa, d) ->
	let tmpnam nam = (nam^"tmp") in
	let add_tmp_nod nam ty exp =
	  let nod =
	    { n_status = S_internal ;
	      n_mark = 0 ;
	      n_name = tmpnam nam ;
	      n_typ = ty ;
	      n_expr = exp ;
	      n_value = (-1) ;
	      n_deps = [] ;
	      n_tdeps = [] }
	  in
	  Hashtbl.add p_graph.p_nodes (tmpnam nam) nod;
	  nod
	in

	(* La construction de tmpRA *)
	let nodes_ra = traite_arg ra in
	let prec = ref (add_tmp_nod
			  ((List.hd nodes_ra).n_name) 0
			  (E_arg (List.hd nodes_ra))) in
	for i=1 to addr_size-1 do (* c'est une adresse *)
	  let newprec = add_tmp_nod ((List.nth nodes_ra i).n_name) (i+1)
	    (E_concat (!prec, List.nth nodes_ra i))
	  in
	  (!prec).n_deps <- newprec :: (!prec).n_deps;
	  (!prec).n_tdeps <- newprec :: (!prec).n_tdeps;
	  prec := newprec
	done;
	let fin_ra = !prec in

	(* La construction de tmpWA *)
	let nodes_wa = traite_arg wa in
	prec := (add_tmp_nod ((List.hd nodes_wa).n_name) 0
		   (E_arg (List.hd nodes_wa)));
	for i=1 to addr_size-1 do (* c'est une adresse *)
	  let newprec = add_tmp_nod ((List.nth nodes_wa i).n_name) (i+1)
	    (E_concat (!prec, List.nth nodes_wa i))
	  in
	  (!prec).n_deps <- newprec :: (!prec).n_deps;
	  (!prec).n_tdeps <- newprec :: (!prec).n_tdeps;
	  prec := newprec
	done;
	let fin_wa = !prec in
	
	(* La construction de tmpD *)
	let nodes_d = traite_arg d in
	prec := (add_tmp_nod ((List.hd nodes_d).n_name) 0
		   (E_arg (List.hd nodes_d)));
	for i=1 to word_size-1 do (* c'est un mot *)
	  let newprec = add_tmp_nod ((List.nth nodes_d i).n_name) (i+1)
	    (E_concat (!prec, List.nth nodes_d i))
	  in
	  (!prec).n_deps <- newprec :: (!prec).n_deps;
	  (!prec).n_tdeps <- newprec :: (!prec).n_tdeps;
	  prec := newprec
	done;

	(* L'appel de la RAM *)
	let wordnod = 
	  { n_status = S_internal ;
	    n_mark = 0 ;
	    n_name = nam ;
	    n_typ = word_size ;
	    n_expr = E_ram (addr_size, word_size, fin_ra, (List.hd(traite_arg we)), fin_wa, !prec) ;
	    n_value = -1 ;
	    n_deps = [] ;
	    n_tdeps = [] } in
	Hashtbl.add p_graph.p_nodes nam wordnod;

	(* La construction post-RAM *)
	let i = ref 0 in
	List.iter
	  (fun n1 ->
	    n1.n_expr <- E_select (!i, wordnod);
	    wordnod.n_deps <- n1 :: wordnod.n_deps ;
	    wordnod.n_tdeps <- n1 :: wordnod.n_tdeps ;
	    incr i)
	  nodes


      (* Econcat *)
      | Netlist_ast.Econcat (a1, a2) ->
	List.iter2
	  (fun n1 n2 ->
	    n1.n_expr <- E_arg n2;
	    n2.n_deps <- n1 :: n2.n_deps;
	    n2.n_tdeps <- n1 :: n2.n_tdeps)
	  nodes ((traite_arg a1)@(traite_arg a2))

      (* E_slice *)
      | Netlist_ast.Eslice (i1, i2, a) ->
	let rec sublist i = function
	  | [] -> []
	  | t::q ->
	    if i>=i1 && i<=i2 then t :: sublist (i+1) q else sublist (i+1) q
	in
	List.iter2
	  (fun n1 n2 ->
	    n1.n_expr <- E_arg n2;
	    n2.n_deps <- n1 :: n2.n_deps;
	    n2.n_tdeps <- n1 :: n2.n_tdeps)
	  nodes
	  (sublist 0 (traite_arg a))

      (* E_select *)
      | Netlist_ast.Eselect (i, a) ->
	let n1 = List.hd(nodes)
	and n2 = List.nth (traite_arg a) i in
	n1.n_expr <- E_arg n2;
	n2.n_deps <- n1 :: n2.n_deps;
	n2.n_tdeps <- n1 :: n2.n_tdeps

  in
  List.iter traite_eq p.Netlist_ast.p_eqs;

  p_graph

      

(******************************************************************************)
(* check_combinatory : program -> unit                                        *)
let check_cycles p_graph =
  let rec check_for_combinational nod =
    if nod.n_mark = 1 then raise Combinational_cycle
    else if nod.n_mark = 0 then
      begin
	nod.n_mark <- 1;
	let _ =
	  match nod.n_expr with
	    | E_void | E_reg _ ->
	      ()
	    | E_arg node | E_not node | E_rom (_, _, node)
	    | E_slice (_, _, node) | E_select (_, node) ->
	      let _ = check_for_combinational node
	      in ()
	    | E_binop (_, node1, node2) | E_concat (node1, node2) ->
	      let _ = check_for_combinational node1
	      and _ = check_for_combinational node2
	      in ()
	    | E_mux (node1, node2, node3) ->
	      let _ = check_for_combinational node1
	      and _ = check_for_combinational node2
	      and _ = check_for_combinational node3
	      in ()
	    | E_ram (_, _, node1, node2, node3, node4) ->
	      let _ = check_for_combinational node1
	      and _ = check_for_combinational node2
	      and _ = check_for_combinational node3
	      and _ = check_for_combinational node4
	      in ()
	in
	nod.n_mark <- 2
      end
  in
  let x = Hashtbl.iter (fun nam nod -> check_for_combinational nod) p_graph.p_nodes in
  reset_marks p_graph;
  x



(******************************************************************************)
(* graph_to_netlist : Netlist_ast.program -> program -> Netlist_ast.program   *)
let graph_to_netlist p_graph =
  reset_marks p_graph;

  (* On parcourt le graphe à partir des outputs, pour marquer tous les *)
  (* noeuds utiles à leur calcul, et donc ignorer les autres *)
  let rec parc n =
    if n.n_mark = 0 then
      begin
	n.n_mark <- 1;
	match n.n_expr with
	  | E_void -> ()
	  | E_reg node | E_arg node | E_not node | E_rom (_, _, node)
	  | E_slice (_, _, node) | E_select (_, node) ->
	    parc node
	  | E_binop (_, node1, node2) | E_concat (node1, node2) ->
	    parc node1;
	    parc node2
	  | E_mux (node1, node2, node3) ->
	    parc node1;
	    parc node2;
	    parc node3
	  | E_ram (_, _, node1, node2, node3, node4) ->
	    parc node1;
	    parc node2;
	    parc node3;
	    parc node4
      end
  in
  let li =
    Hashtbl.fold
      (fun nam nod li ->
	if nod.n_status = S_output then nod :: li
	else li)
      p_graph.p_nodes
      []
  in
  List.iter parc li;
  Hashtbl.iter
    (fun nam nod -> 
      if nod.n_mark = 0 && nod.n_status <> S_input then
	nod.n_mark <- -1 (* on le marque inutile *)
      else
	nod.n_mark <- 0)
    p_graph.p_nodes;

  (* Ici, on fait le tri topologique. Les noeuds inutiles sont marqués d'un *)
  (* -1 donc sont ignorés dans cette phase *)
  let n_list = ref [] in
  let add_n n = n_list := n :: !n_list
  in
  let rec parc n =
    if n.n_mark = 0 then
      begin
	n.n_mark <- 1;
	let _ =
	  match n.n_expr with
	    | E_void | E_reg _ -> ()
	    | E_arg node | E_not node | E_rom (_, _, node)
	    | E_slice (_, _, node) | E_select (_, node) ->
	      parc node
	    | E_binop (_, node1, node2) | E_concat (node1, node2) ->
	      parc node1;
	      parc node2
	    | E_mux (node1, node2, node3) ->
	      parc node1;
	      parc node2;
	      parc node3
	    | E_ram (_, _, node1, node2, node3, node4) ->
	      parc node1;
	      parc node2;
	      parc node3;
	      parc node4
	in
	add_n n
      end
  in
  Hashtbl.iter (fun nam nod -> parc nod) p_graph.p_nodes;

  let arg_from_node n =
    if n.n_status = S_value then
      Netlist_ast.Aconst (n.n_value, n.n_typ)
    else
      Netlist_ast.Avar n.n_name
  in
  let eq_list =
    List.fold_left
      (fun eq_list nod ->
	if nod.n_status = S_value || nod.n_status = S_input then
	  eq_list
	else
	  ( nod.n_name ,
	    begin match nod.n_expr with
	      | E_void ->
		Netlist_ast.Earg (Netlist_ast.Avar "nawak")(**)
	      | E_arg n ->
		Netlist_ast.Earg (arg_from_node n)
	      | E_reg n ->
		if n.n_status = S_value then
		  assert false
		else
		  Netlist_ast.Ereg n.n_name
	      | E_not n ->
		Netlist_ast.Enot (arg_from_node n)
	      | E_binop (b, n1, n2) ->
		Netlist_ast.Ebinop (
		  begin match b with
		      B_or -> Netlist_ast.Or
		    | B_xor -> Netlist_ast.Xor
		    | B_and -> Netlist_ast.And
		    | B_nand -> Netlist_ast.Nand
		  end, arg_from_node n1, arg_from_node n2)
	      | E_mux (n1, n2, n3) ->
		Netlist_ast.Emux(arg_from_node n1, arg_from_node n2, arg_from_node n3)
	      | E_rom (i1, i2, n) ->
		Netlist_ast.Erom(i1, i2, arg_from_node n)
	      | E_ram (i1, i2, n1, n2, n3, n4) ->
		Netlist_ast.Eram(i1, i2, arg_from_node n1, arg_from_node n2,
				 arg_from_node n3, arg_from_node n4)
	      | E_concat (n1, n2) ->
		Netlist_ast.Econcat(arg_from_node n1, arg_from_node n2)
	      | E_slice (i1, i2, n) ->
		Netlist_ast.Eslice(i1, i2, arg_from_node n)
	      | E_select (i, n) ->
		Netlist_ast.Eselect(i, arg_from_node n)
	    end) :: eq_list)
      []
      !n_list
  in
  reset_marks p_graph;
  { Netlist_ast.p_eqs = eq_list ;
    Netlist_ast.p_inputs = List.map (fun n -> n.n_name) p_graph.p_inputs ;
    Netlist_ast.p_outputs = List.map (fun n -> n.n_name) p_graph.p_outputs ;
    Netlist_ast.p_vars =
      Netlist_ast.Env.of_list
	(List.fold_left
	   (fun xty_list nod ->
	     if nod.n_status = S_value then
	       xty_list
	     else
	       (nod.n_name,nod.n_typ)::xty_list)
	   []
	   !n_list) }



(******************************************************************************)
(************************ FONCTIONS NETLIST -> NETLIST ************************)
(******************************************************************************)


(******************************************************************************)
(* delete_doubles                                                             *)
let delete_doubles p =
  
  (* A un élément x on associe son père.                                    *)
  (* Un élément x est son propre père, sauf s'il y a une déclaration        *)
  (* x = y, auquel cas, le père de x est celui de y                         *)
  let assoc = Hashtbl.create 100 in
  let add_father id_son id_father = Hashtbl.add assoc id_son id_father in
  let rec find_father id =
    try find_father (Hashtbl.find assoc id)
    with Not_found -> id
  in

  (* On parcourt les équations pour faire les liens fils -> père.           *)
  (* Les outputs sont épargnés à la suppression, au cas ou.                 *)
  List.iter
    (fun (id_son,ex) ->
      if not(List.mem id_son p.Netlist_ast.p_outputs) then
	begin
	  match ex with
	    | Netlist_ast.Earg (Netlist_ast.Avar id_father) -> add_father id_son id_father
	    | _ -> ()
	end)
    p.Netlist_ast.p_eqs;

  let ma = function
    | Netlist_ast.Avar i -> Netlist_ast.Avar (find_father i)
    | _ as a -> a
  in

  (* On se charge maintenant de la suppression                              *)
  let new_eqs =
    List.fold_left
      (fun new_eqs (id,ex) ->
	if id <> find_father id then
	  new_eqs
	else
	  ( id,
	    begin match ex with
	      | Netlist_ast.Earg a ->
		Netlist_ast.Earg (ma a)
	      | Netlist_ast.Ereg i ->
		Netlist_ast.Ereg (find_father i)
	      | Netlist_ast.Enot a ->
		Netlist_ast.Enot (ma a)
	      | Netlist_ast.Ebinop (b, a1, a2) ->
		Netlist_ast.Ebinop (b, ma a1, ma a2)
	      | Netlist_ast.Emux (a1, a2, a3) ->
		Netlist_ast.Emux (ma a1, ma a2, ma a3)
	      | Netlist_ast.Erom (i1, i2, a) ->
		Netlist_ast.Erom (i1, i2, ma a)
	      | Netlist_ast.Eram (i1, i2, a1, a2, a3, a4) ->
		Netlist_ast.Eram (i1, i2, ma a1, ma a2, ma a3, ma a4)
	      | Netlist_ast.Econcat (a1, a2) ->
		Netlist_ast.Econcat (ma a1, ma a2)
	      | Netlist_ast.Eslice (i1, i2, a) ->
		Netlist_ast.Eslice (i1, i2, ma a)
	      | Netlist_ast.Eselect (i, a) ->
		Netlist_ast.Eselect (i, ma a)
	    end ) :: new_eqs)
      []
      (List.rev p.Netlist_ast.p_eqs)
  in

  { Netlist_ast.p_eqs     = new_eqs                    ;
    Netlist_ast.p_inputs  = p.Netlist_ast.p_inputs     ;
    Netlist_ast.p_outputs = p.Netlist_ast.p_outputs    ;
    Netlist_ast.p_vars =
     Netlist_ast.Env.of_list
	(Netlist_ast.Env.fold
	   (fun id ty new_vars ->
	     if id <> find_father id then
	       new_vars
	     else
	       (id,ty) :: new_vars)
	   p.Netlist_ast.p_vars
	   [])                             }



(******************************************************************************)
(* launcher : bool -> program -> program                                      *)
let launch p =

  let pg p = Format.eprintf " %d gates.@." (List.length p.Netlist_ast.p_eqs)
  and pn p = Format.eprintf " %d nodes.@." (Hashtbl.length p.p_nodes)
  in

  Format.eprintf "Starting with netlist...@?"; pg p;

  (* netlist -> graphe *)
  Format.eprintf "Creating the graph...@?";
  let p_graph = netlist_to_graph p in
  pn p_graph;

  (* On vérifie l'absence de cycles *)
  Format.eprintf "Looking for combinatory cycles... @?";
  check_cycles p_graph;
  Format.eprintf "It's OK.@.";

  (* graphe -> netlist *)
  Format.eprintf "Back to the netlist...@?";
  let p = graph_to_netlist p_graph in
  pg p;

  (* doublons *)
  Format.eprintf "Deleting doubles...@?";
  let p = delete_doubles p in
  pg p;

  (* Fin *)
  p
