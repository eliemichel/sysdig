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

let evalArg p ty table h =
	if ty land 1 = 1
	then p.i_env.(table.(h)), h + 1
	else (table.(h), table.(h + 1)), h + 2

let evalPointer p ty table h =
	if ty land 1 = 1
	then (table.(h), -1), h + 1
	else (table.(h), table.(h + 1)), h + 2

let evalDeref p (a, n) =
	if n = -1
	then p.i_env.(a)
	else a, n


let evalBinop (a, na) (b, nb) op =
	if na <> nb
	then raise (Sim_error
		(sprintf "Arguments of binary operators must have the same type (tried %d with %d)" na nb)
	)
	else
		mask
			(match op with
			| 0 -> a lor b
			| 1 -> a lxor b
			| 2 -> a land b
			| 3 -> lnot (a land b)
			| _ -> assert false
			)
			na

let getWord mem addr wordSize =
	try Hashtbl.find mem addr
	with Not_found -> 0, wordSize

let setWord p mem wa wordSize data =
	Hashtbl.replace mem wa (evalDeref p data)

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

let evalExp p ram rom table h =
	(**evalExp [p] [ram] [rom] [table] [head] evaluates exp at address [head]
	 * in program table [table] from program [p] with the values bounded in
	 * [env], [rom], [ram]
	 *)
	let instr = table.(h) in
	let evalArg = evalArg p in
	match instr lsr 4 with
	| 0x1 -> evalArg instr table (h + 1)
	| 0x2 -> p.i_old_env.(table.(h + 1)), h + 2
	| 0x3 ->
		let (v, n), h1 = evalArg instr table (h + 1) in
			mask (lnot v) n, h1
	| 0x4 | 0x5 | 0x6 | 0x7 ->
		let a, h1 = evalArg (instr lsr 1) table (h + 1) in
		let b, h2 = evalArg instr table h1 in
			evalBinop a b (instr lsr 4 land 3), h2
	| 0x8 ->
		let (a, na), h1 = evalArg (instr lsr 2) table (h + 1) in
		let (b, nb), h2 = evalArg (instr lsr 1) table h1 in
		let (c, nc), h3 = evalArg instr table h2 in
			if nc <> 0
			then raise (Sim_error "Mux selector must be a single bit")
			else if na <> nb
			then raise (Sim_error "The first two arguments of Mux must have the same type")
			else ((if c <> 0 then a else b), na), h3
	| 0x9 ->
		let addr = table.(h + 1) in
		let ws = table.(h + 2) in
		let ra, h1 = evalArg instr table (h + 3) in
			romHandler rom addr ws ra, h1
	| 0xa ->
		let addr = table.(h + 1) in
		let ws = table.(h + 2) in
		let ra, h1 = evalArg (instr lsr 3) table (h + 3) in
		let we, h2 = evalArg (instr lsr 2) table h1 in
		let wa, h3 = evalArg (instr lsr 1) table h2 in
		let d, h4 = evalPointer p instr table h3 in
		let ramTable = getRamTable ram table.(h - 1) in
			ramHandler ramTable addr ws ra we wa d, h4
	| 0xb ->
		let (v1, n1), h1 = evalArg (instr lsr 1) table (h + 1) in
		let (v2, n2), h2 = evalArg instr table h1 in
		let n1 = max n1 1 in
		let n2 = max n2 1 in
			(v1 lor (v2 lsl n1),  n1 + n2), h2
	| 0xc ->
		let i = table.(h + 1) in
		let j = table.(h + 2) in
		let (v, n), h1 = evalArg instr table (h + 3) in
		let n' = j - i + 1 in
		if i > j || i < 0 || j >= n
		then raise (Sim_error "Index out of bound")
		else
			if n = 0
			then raise (Sim_error "Single bit can not be sliced")
			else mask (v lsr i) n', h1
	| 0xd ->
		let i = table.(h + 1) in
		let (v, n), h1 = evalArg instr table (h + 2) in
			if i >= max n 1
			then raise (Sim_error "Index out of bound")
			else mask (v lsr i) 0, h1
	| _ -> assert false


let rec var_list_length p = function
	| [] -> 0
	| var :: q -> var_list_length p q + (max (snd p.i_env.(var)) 1)


let addInput p vars =
	let rec aux next = function
		| [] -> ()
		| var :: q ->
			let value = match snd p.i_old_env.(var) with
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
		let input =
			let buff = String.create l in
			let n = Unix.read Unix.stdin buff 0 l in
			if n = l
			then buff
			else raise (Sim_error ("End of pipe (" ^ (string_of_int n) ^ ")"))
		in fun () ->
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


let tic ram rom p =
	(**tic [ram] [rom] [p] computes the programm [p] with the hash tables [ram]
	 * and [rom] containing RAM and ROM values and then returns the output vector.
	 *)
	
	ramUp := [];
	
	let applyEq h =
		let eval, h' = (
			try
				evalExp p ram rom p.i_eqs (h + 1)
			with Sim_error s -> raise (
				Sim_error (
					sprintf "%s (in definition of #%d = %s)"
						s p.i_eqs.(h) (Hashtbl.find Init.idtable p.i_eqs.(h))
					)
				)
		) in
		p.i_env.(p.i_eqs.(h)) <- eval;
		h'
	in
	
	let swap () =
		let t = p.i_env in
		p.i_env <- p.i_old_env;
		p.i_old_env <- t
	in
	
	swap ();
	addInput p p.i_inputs;
	let n = Array.length p.i_eqs in
	let head = ref 0 in
	while !head < n do
		head := applyEq !head
	done;
	updateRam p;
	getOutput p


