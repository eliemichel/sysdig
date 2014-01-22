(*
 * Sysdig -- core.ml
 * =================
 *
 * This is the core simulation module.
 * Its main function, `tic`, needs an initialized ROM/RAM and a scheduled
 * integer-based program AST.
 *)

open Netlist_ast
open Format
open Unix


let eval_exp = ref 0.
let appel_rec = ref 0.
let env_add = ref 0.

exception Sim_error of string
let ramUp = ref []

let bool_of_value (v, n) =
	if n <> 0
	then raise (Sim_error "A bit array is used as single bit")
	else v mod 2 = 1

let ty_of_value = snd

let string_of_ty = function
	| 0 -> "TBit"
	| n -> "TBitArray " ^ string_of_int n

let mask v n =
	v land (lnot (-1 lsl (max n 1))), n

let evalArg p = function
	| Ivar index -> p.i_env.(index)
	| Iconst v   -> v

let evalBinop (a, na) (b, nb) op =
	if na <> nb
	then raise (Sim_error "Arguments of binary operators must have the same type")
	else
		mask
			(match op with
			| Or   -> a lor b
			| Xor  -> a lxor b
			| And  -> a land b
			| Nand -> lnot (a land b)
			)
			na

let getWord mem addr wordSize =
	try Hashtbl.find mem addr
	with Not_found -> 0, wordSize

let setWord p mem wa wordSize data =
	Hashtbl.replace mem wa (evalArg p data)

let getAddr addrSize addr = fst addr

let romHandler rom addrSize wordSize rAddr =
	let a = getAddr addrSize rAddr in
		getWord rom a wordSize


let ramHandler ram addrSize wordSize rAddr writeEnable wAddr data =
	let ra = getAddr addrSize rAddr in
	let wa = getAddr addrSize wAddr in
		if bool_of_value writeEnable
		then ramUp := (ram, wa, wordSize, data) :: !ramUp;
		getWord ram ra wordSize


let rec getRamTable ram ident =
	try Hashtbl.find ram ident
	with Not_found -> (
		Hashtbl.add ram ident (Hashtbl.create 97);
		getRamTable ram ident
		)

let evalExp p ram rom index =
	let evalArg = evalArg p in
	(** evalExp [p] [ram] [rom] [index] [exp] evaluates [exp] in program [p] with
	the values bounded in [env], [rom], [ram] *)
	function
	| Iarg arg   -> evalArg arg
	| Ireg index -> p.i_old_env.(index)
	| Inot arg   -> let v, n = evalArg arg in mask (lnot v) n
	| Ibinop (op, arg1, arg2) -> evalBinop (evalArg arg1) (evalArg arg2) op
	| Imux (arg1, arg2, arg3) ->
		let a, na = evalArg arg1 in
		let b, nb = evalArg arg2 in
		let c, nc = evalArg arg3 in
			if nc <> 0
			then raise (Sim_error "Mux selector must be a single bit")
			else if na <> nb
			then raise (Sim_error "The first two arguments of Mux must have the same type")
			else (if c <> 0 then a else b), na
	| Irom (addr, ws, ra)            -> romHandler rom addr ws (evalArg ra)
	| Iram (addr, ws, ra, we, wa, d) ->
		let ramTable = getRamTable ram index in
		ramHandler
			ramTable
			addr
			ws
			(evalArg ra)
			(evalArg we)
			(evalArg wa)
			d
	| Iconcat (arg1, arg2) ->
		let v1, n1 = evalArg arg1 in
		let v2, n2 = evalArg arg2 in
		let n1 = max n1 1 in
		let n2 = max n2 1 in
			v1 lor (v2 lsl n1),  n1 + n2
	| Islice (i, j, arg)   ->
		let v, n = evalArg arg in
		let n' = j - i + 1 in
		if i > j || i < 0 || j >= n
		then raise (Sim_error (sprintf "Index out of bound in slice (%d-%d in %d)" i j n))
		else
			if n = 0
			then raise (Sim_error "Single bit can not be sliced")
			else mask (v lsr i) n'
	| Iselect (i, arg)     ->
		let v, n = evalArg arg in
			if i >= max n 1
			then raise (Sim_error (sprintf "Index out of bound in select (%d in %d)" i n))
			else mask (v lsr i) 0


let rec var_list_length p = function
	| [] -> 0
	| var :: q -> var_list_length p q + (max (snd p.i_env.(var)) 1)


let addInput async p vars =
	let rec aux next = function
		| [] -> ()
		| var :: q ->
			let value = match snd p.i_env.(var) with
				| 0 -> next (), 0
				| n ->
					let a = ref 0 in
						for i = 0 to n - 1 do
							a := (!a lsl 1) lor next ()
						done; !a, n
			in
			p.i_env.(var) <- value;
			aux next q
	in
	let next =
		let l = var_list_length p vars in
		let cur = ref 0 in
		let input = String.create l in
		let m = ref 0 in
		while !m < l do
			let n = Unix.read Unix.stdin input !m l in
			if n = 0
			then raise (Sim_error ("End of pipe"))
			else m := !m + n;
		done;
		if async then ((* clear input buffer *)
			Unix.set_nonblock stdin;
			(try
				while !m > 0 do
					m := Unix.read stdin "               " 0 15
				done
			with
				| Unix_error (EAGAIN, _, _)
				| Unix_error (EWOULDBLOCK, _, _) -> ()
			);
			Unix.clear_nonblock stdin
		);
		fun () ->
			let c = input.[!cur] in
				incr cur;
				if c = '1' then 1 else 0
	in
		aux next vars

let getOutput p =
	let rec aux = function
		| []     -> []
		| o :: q -> p.i_env.(o) :: (aux q)
	in aux p.i_outputs

let updateRam p =
	List.iter
		(fun (ramTable, wa, ws, d) -> setWord p ramTable wa ws d)
		!ramUp

let swap p =
	let t = p.i_env in
	p.i_env <- p.i_old_env;
	p.i_old_env <- t


let tic async ram rom p =
	(** tic [ram] [rom] [p] computes the programm [p] with the
	hash tables [ram] and [rom] containing RAM and ROM values and then returns
	the output vector. *)
	
	ramUp := [];
	swap p;
	addInput async p p.i_inputs;
	for i = 0 to Array.length p.i_eqs - 1 do
		let index, exp = p.i_eqs.(i) in
		p.i_env.(index) <- (
			try
				evalExp p ram rom index exp
			with Sim_error s -> raise (
				Sim_error (
					sprintf "%s (in definition of #%d = %s)"
						s
						index
						(Hashtbl.find Init.idtable index)
					)
				)
		)
	done;
	updateRam p;
	getOutput p


