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

let evalArg = function
	| Avar ident -> (
		try Hashtbl.find !env ident
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

let setWord mem wa wordSize data =
	let data = fixSize wordSize (evalArg data) in
		Hashtbl.replace mem wa data

let getAddr addrSize addr =
	let a = array_of_value addr in
	let addr = ref 0 in
	let mask = ref 1 in
	(*for k = addrSize - 1 downto 0 do*) (* Poids faibles aux indices hauts *)
	for k = 0 to addrSize - 1 do (* Poids faibles aux indices bas *)
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

let evalExp oldValue ram rom ident = function
	(** evalExp [oldValue] [ram] [rom] [ident] [exp] evaluates [exp] with
	the values bounded in [env], [rom], [ram] *)
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
		| vb          -> (*raise (
			Sim_error
			"Selection in VBit is not allowed"
			)*)
			if i = 0 then vb else raise (Invalid_argument "index out of bound")
		)


let rec var_list_length p = function
	| [] -> 0
	| var :: q -> var_list_length p q + (
		match Env.find var p.p_vars with
			| TBit        -> 1
			| TBitArray n -> n
		)


let addInput p vars =
	let rec aux_array next a k =
		if k < Array.length a
		then (
			a.(k) <- next ();
			aux_array next a (k + 1)
		)
	in
	let rec aux next = function
		| [] -> ()
		| var :: q ->
			let value = match Env.find var p.p_vars with
				| TBit        -> VBit (next ())
				| TBitArray n ->
					let a  = Array.make n false in (
						aux_array next a 0;
						VBitArray a
					)
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
		in fun () -> let c = input.[!cur] in incr cur ; c = '1'
	in
		aux next vars

let tic ram rom p =
	(** tic [ram] [rom] [p] computes the programm [p] with the
	hash tables [ram] and [rom] containing RAM and ROM values and then returns
	the output vector. *)
	
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
		try Hashtbl.find !oldEnv ident
		with Not_found -> evalDefault ident
	in
	
	let updateRam =
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
	
	debug_time "--";
	oldEnv := !env;
	addInput p p.p_inputs;
	debug_time "addInput";
	applyEq p.p_eqs;
	debug_time "applyEq";
	updateRam;
	getOutput p.p_outputs


