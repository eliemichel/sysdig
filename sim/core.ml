open Netlist_ast

exception Sim_error of string
let ramUp = ref []

let array_of_value = function
	| VBit b      -> [|b|]
	| VBitArray a -> a

let bool_of_value = function
	| VBit b      -> b
	| VBitArray a -> raise (
		Sim_error
		"A bit array is used as single bit"
		)

let ty_of_value = function
	| VBit _      -> TBit
	| VBitArray a -> TBitArray (Array.length a)

let string_of_ty = function
	| TBit        -> "TBit"
	| TBitArray n -> "TBitArray " ^ string_of_int n

let evalArg env = function
	| Avar ident -> (
		try Env.find ident env
		with Not_found ->
			raise (Sim_error ("Unknown identifier : " ^ ident))
		)
	| Aconst v   -> v

let evalBinop a b = match a, b with
	| VBit a, VBit b -> (function
		| Or   -> VBit (a || b)
		| Xor  -> VBit (a <> b)
		| And  -> VBit (a && b)
		| Nand -> VBit (not (a && b))
		)
	| _ -> raise (
		Sim_error
		"Binary operator can not be applied to a VBitArray"
		)

let fixSize ws d =
	let d = match d with
		| VBit b      -> [|b|]
		| VBitArray a -> a
	in
	let diff = Array.length d - ws in
	VBitArray (
		if diff > 0
		then Array.sub d diff ws (* On suppose les poids faibles à droite *)
		else Array.append (Array.make (-diff) false) d
	)

let getWord mem addr wordSize =
	fixSize
		wordSize
		(
			try Hashtbl.find mem addr
			with Not_found -> VBit false
		)

let setWord env mem wa wordSize data =
	let data = fixSize wordSize (evalArg env data) in
		Hashtbl.replace mem wa data

let getAddr addrSize addr =
	let a = array_of_value addr in
	let addr = ref 0 in
	let mask = ref 1 in
	for k = 0 to addrSize - 1 do
		(
		try
			if a.(k) then addr := !addr + !mask
		with
			Invalid_argument "index out of bounds" ->
				raise (Sim_error "Invalid adress size")
		);
		mask := !mask lsl 1
	done;
	!addr

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

let evalExp env oldValue ram rom ident =
	(** evalExp [env] [oldValue] [ram] [rom] [ident] [exp] evaluates [exp] with
	the values bounded in [env], [rom], [ram] *)
	let evalArg = evalArg env in
	function
	| Earg arg   -> evalArg arg
	| Ereg ident -> oldValue ident
	| Enot arg   -> (match evalArg arg with
		| VBit b      -> VBit (not b)
		| VBitArray a -> VBitArray (Array.map (fun b -> not b) a)
		)
	| Ebinop (op, arg1, arg2) -> evalBinop (evalArg arg1) (evalArg arg2) op
	| Emux (arg1, arg2, arg3) -> (
		match evalArg arg1, evalArg arg2, evalArg arg3 with
		| VBit a, VBit b, VBit c -> VBit (a && c || b && (not c))
		| _ -> raise (Sim_error "Mux can not be applied to a VBitArray")
		)
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
	| Econcat (arg1, arg2) -> (match evalArg arg1, evalArg arg2 with
		| VBitArray a, VBitArray b -> VBitArray (Array.append a b)
		| VBitArray a, VBit b      -> VBitArray (Array.append a [|b|])
		| VBit a, VBitArray b      -> VBitArray (Array.append [|a|] b)
		| VBit a, VBit b           -> VBitArray [|a; b|]
		)
	| Eslice (i, j, arg)   -> (match evalArg arg with
		| VBitArray a -> VBitArray (Array.sub a i (j - i + 1))
		| _           -> raise (Sim_error "VBit can not be sliced")
		)
	| Eselect (i, arg)     -> (match evalArg arg with
		| VBitArray a -> VBit a.(i)
		| vb          -> raise (
			Sim_error
			"Selection in VBit is not allowed"
			)
		)


let rec addInput p valuation vars = match valuation, vars with
	| [], []            -> Env.empty
	| [], _ | _, []     -> raise (
		Sim_error (
			"Given input does not match required input (" ^
			(if vars = [] then "too many" else "missing") ^
			" values)"
			)
		)
	| v :: q1, id :: q2 ->
		let t1 = ty_of_value v in
		let t2 = Env.find id p.p_vars in
			if t1 <> t2
			then Format.eprintf
				"Warning: Given value for `%s` has an invalid type.\n\
				(%s is required but %s was provided)@."
				id
				(string_of_ty t2)
				(string_of_ty t1);
			let env = addInput p q1 q2 in Env.add id v env

let tic inputs oldEnv ram rom p =
	(** tic [inputs] [oldEnv] [ram] [rom] [p] computes the programm p with input
	vector [i], the environnement [oldEnv] (for registers) and the hash tables
	[ram] and [rom] containing RAM and ROM values and then returns the output
	vector. *)
	
	ramUp := [];
	
	
	let evalDefault ident =
		try
		match Env.find ident p.p_vars with
			| TBit        -> VBit false
			| TBitArray n -> VBitArray (Array.make n false)
		with Not_found ->
			raise (Sim_error ("Unknown register or memory : " ^ ident))
	in
	
	
	let oldValue ident =
		try Env.find ident oldEnv
		with Not_found -> evalDefault ident
	in
	
	let updateRam env =
		List.iter
			(fun (ramTable, wa, ws, d) -> setWord env ramTable wa ws d)
			!ramUp
	in
	
	let rec applyEq env = function
		| []                -> env
		| (ident, exp) :: q ->
			let env' = Env.add ident (evalExp env oldValue ram rom ident exp) env in
				applyEq env' q
	in
	
	let rec getOutput env = function
		| []     -> []
		| o :: q -> (Env.find o env) :: (getOutput env q)
	in
	
	let env = applyEq (addInput p inputs p.p_inputs) p.p_eqs in (
		updateRam env;
		env, getOutput env p.p_outputs
		)


