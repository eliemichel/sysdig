open Netlist_ast



let eval_exp = ref 0.
let appel_rec = ref 0.
let env_add = ref 0.

let oldTime = ref (Unix.gettimeofday ())
let curTime = ref (Unix.gettimeofday ())
let debug_delta () =
	oldTime := !curTime;
	curTime := Unix.gettimeofday ();
	!curTime -. !oldTime

let debug_time m =
	Format.eprintf "[time]%f (%s)@." (debug_delta ()) m

let env = ref (Hashtbl.create 97)
let oldEnv = ref (Hashtbl.create 97)


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

let evalArg = function
	| Avar ident -> (
		try Hashtbl.find !env ident
		with Not_found ->
			raise (Sim_error ("Unknown identifier : " ^ ident))
		)
	| Aconst v   -> v

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

let setWord mem wa wordSize data =
	Hashtbl.replace mem wa (evalArg data)

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

let evalExp oldValue ram rom ident = function
	(** evalExp [oldValue] [ram] [rom] [ident] [exp] evaluates [exp] with
	the values bounded in [env], [rom], [ram] *)
	| Earg arg   -> evalArg arg
	| Ereg ident -> oldValue ident
	| Enot arg   -> let v, n = evalArg arg in mask (lnot v) n
	| Ebinop (op, arg1, arg2) -> evalBinop (evalArg arg1) (evalArg arg2) op
	| Emux (arg1, arg2, arg3) ->
		let a, na = evalArg arg1 in
		let b, nb = evalArg arg2 in
		let c, nc = evalArg arg3 in
			if nc <> 0
			then raise (Sim_error "Mux selector must be a single bit")
			else if na <> nb
			then raise (Sim_error "The first two arguments of Mux must have the same type")
			else (if c <> 0 then a else b), na
	| Erom (addr, ws, ra)            -> romHandler rom addr ws (evalArg ra)
	| Eram (addr, ws, ra, we, wa, d) ->
		let ramTable = getRamTable ram ident in
		ramHandler
			ramTable
			addr
			ws
			(evalArg ra)
			(evalArg we)
			(evalArg wa)
			d
	| Econcat (arg1, arg2) ->
		let v1, n1 = evalArg arg1 in
		let v2, n2 = evalArg arg2 in
		let n1 = max n1 1 in
		let n2 = max n2 1 in
			v1 lor (v2 lsl n1),  n1 + n2
	| Eslice (i, j, arg)   ->
		let v, n = evalArg arg in
		let n' = j - i + 1 in
		if i > j || i < 0 || j >= n
		then raise (Sim_error "Index out of bound")
		else
			if n = 0
			then raise (Sim_error "Single bit can not be sliced")
			else mask (v lsr i) n'
	| Eselect (i, arg)     ->
		let v, n = evalArg arg in
			if i >= max n 1
			then raise (Sim_error "Index out of bound")
			else mask (v lsr i) 0


let rec var_list_length p = function
	| [] -> 0
	| var :: q -> var_list_length p q + (max (Env.find var p.p_vars) 1)


let addInput p vars =
	let rec aux next = function
		| [] -> ()
		| var :: q ->
			let value = match Env.find var p.p_vars with
				| 0 -> next (), 0
				| n ->
					let a = ref 0 in
						for i = 0 to n - 1 do
							a := (!a lsl 1) lor next ()
						done; !a, n
			in
			Hashtbl.replace !env var value;
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

let tic ram rom p =
	(** tic [ram] [rom] [p] computes the programm [p] with the
	hash tables [ram] and [rom] containing RAM and ROM values and then returns
	the output vector. *)
	
	ramUp := [];
	
	let oldValue ident =
		try Hashtbl.find !oldEnv ident
		with Not_found -> (
			try 0, Env.find ident p.p_vars
			with Not_found ->
			raise (Sim_error ("Undeclared net : " ^ ident))
		)
	in
	
	let updateRam () =
		List.iter
			(fun (ramTable, wa, ws, d) -> setWord ramTable wa ws d)
			!ramUp
	in
	
	let rec applyEq = function
		| []                -> ()
		| (ident, exp) :: q ->
			let eval = (
				try
					evalExp oldValue ram rom ident exp
				with Sim_error s -> raise (
					Sim_error
					(s ^ " (in definition of " ^ ident ^ ")")
					)
			) in
			Hashtbl.replace !env ident eval;
			applyEq q
	in
	
	let rec getOutput = function
		| []     -> []
		| o :: q -> (Hashtbl.find !env o) :: (getOutput q)
	in
	
	let swap a b =
		let t = !a in
		a := !b;
		b := t
	in
	
	swap oldEnv env;
	addInput p p.p_inputs;
	applyEq p.p_eqs;
	updateRam ();
	getOutput p.p_outputs


