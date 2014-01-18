open Netlist_ast



let eval_exp = ref 0.
let appel_rec = ref 0.
let env_add = ref 0.

let oldTime = ref (Unix.gettimeofday ())
let curTime = ref (Unix.gettimeofday ())
let debug_delta () =
	(* 0 *) oldTime := !curTime;
	curTime := Unix.gettimeofday ();
	!curTime -. !oldTime

let debug_time m =
	(* 0 *) Format.eprintf "[time]%f (%s)@." (debug_delta ()) m

let env = ref (Hashtbl.create 97)
let oldEnv = ref (Hashtbl.create 97)


exception Sim_error of string
let ramUp = ref []

let array_of_value = function
	| VBit b      -> (* 0 *) [|b|]
	| VBitArray a -> (* 3 *) a

let bool_of_value = function
	| VBit b      -> (* 1 *) b
	| VBitArray a -> (* 0 *) raise (
		Sim_error
		"A bit array is used as single bit"
		)

let ty_of_value = function
	| VBit _      -> (* 0 *) TBit
	| VBitArray a -> (* 0 *) TBitArray (Array.length a)

let string_of_ty = function
	| TBit        -> (* 0 *) "TBit"
	| TBitArray n -> (* 0 *) "TBitArray " ^ string_of_int n

let evalArg = function
	| Avar ident -> (* 32916 *) (
		try Hashtbl.find !env ident
		with Not_found ->
			raise (Sim_error ("Unknown identifier : " ^ ident))
		)
	| Aconst v   -> (* 1603 *) v

let evalBinop a b = (* 5906 *) match a, b with
	| VBit a, VBit b -> (* 5906 *) (function
		| Or   -> (* 1287 *) VBit (a || b)
		| Xor  -> (* 2754 *) VBit (a <> b)
		| And  -> (* 1865 *) VBit (a && b)
		| Nand -> (* 0 *) VBit (not (a && b))
		)
	| _ -> (* 0 *) raise (
		Sim_error
		"Binary operator can not be applied to a VBitArray"
		)

let fixSize ws d =
	(* 2 *) let d = match d with
		| VBit b      -> (* 1 *) [|b|]
		| VBitArray a -> (* 1 *) a
	in
	let diff = Array.length d - ws in
	VBitArray (
		if diff > 0
		then Array.sub d diff ws (* On suppose les poids faibles à droite *)
		else Array.append (Array.make (-diff) false) d
	)

let getWord mem addr wordSize =
	(* 2 *) fixSize
		wordSize
		(
			try Hashtbl.find mem addr
			with Not_found -> VBit false
		)

let setWord mem wa wordSize data =
	(* 0 *) let data = fixSize wordSize (evalArg data) in
		Hashtbl.replace mem wa data

let getAddr addrSize addr =
	(* 3 *) let a = array_of_value addr in
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
	(* 1 *) let a = getAddr addrSize rAddr in
		getWord rom a wordSize


let ramHandler ram addrSize wordSize rAddr writeEnable wAddr data =
	(* 1 *) let ra = getAddr addrSize rAddr in
	let wa = getAddr addrSize wAddr in
		if bool_of_value writeEnable
		then ramUp := (ram, wa, wordSize, data) :: !ramUp;
			getWord ram ra wordSize


let rec getRamTable ram ident =
	(* 2 *) try Hashtbl.find ram ident
	with Not_found -> (
		Hashtbl.add ram ident (Hashtbl.create 97);
		getRamTable ram ident
		)

let evalExp oldValue ram rom ident = function
	(** evalExp [oldValue] [ram] [rom] [ident] [exp] evaluates [exp] with
	the values bounded in [env], [rom], [ram] *)
	| Earg arg   -> (* 1187 *) evalArg arg
	| Ereg ident -> (* 160 *) oldValue ident
	| Enot arg   -> (* 164 *) (match evalArg arg with
		| VBit b      -> (* 164 *) VBit (not b)
		| VBitArray a -> (* 0 *) VBitArray (Array.map (fun b -> (* 0 *) not b) a)
		)
	| Ebinop (op, arg1, arg2) -> (* 5906 *) evalBinop (evalArg arg1) (evalArg arg2) op
	| Emux (arg1, arg2, arg3) -> (* 1762 *) (
		match evalArg arg1, evalArg arg2, evalArg arg3 with
		| VBit a, VBit b, VBit c -> (* 1762 *) VBit (a && c || b && (not c))
		| _ -> (* 0 *) raise (Sim_error "Mux can not be applied to a VBitArray")
		)
	| Erom (addr, ws, ra)            -> (* 1 *) romHandler rom addr ws (evalArg ra)
	| Eram (addr, ws, ra, we, wa, d) ->
		(* 1 *) let ramTable = getRamTable ram ident in
		ramHandler
			ramTable
			addr
			ws
			(evalArg ra)
			(evalArg we)
			(evalArg wa)
			d
	| Econcat (arg1, arg2) -> (* 3093 *) (match evalArg arg1, evalArg arg2 with
		| VBitArray a, VBitArray b -> (* 125 *) VBitArray (Array.append a b)
		| VBitArray a, VBit b      -> (* 413 *) VBitArray (Array.append a [|b|])
		| VBit a, VBitArray b      -> (* 2102 *) VBitArray (Array.append [|a|] b)
		| VBit a, VBit b           -> (* 453 *) VBitArray [|a; b|]
		)
	| Eslice (i, j, arg)   -> (* 4705 *) (match evalArg arg with
		| VBitArray a -> (* 4705 *) VBitArray (Array.sub a i (j - i + 1))
		| _           -> (* 0 *) raise (Sim_error "VBit can not be sliced")
		)
	| Eselect (i, arg)     -> (* 5175 *) (match evalArg arg with
		| VBitArray a -> (* 5154 *) VBit a.(i)
		| vb          -> (*raise (
			Sim_error
			"Selection in VBit is not allowed"
			)*)
			(* 21 *) if i = 0 then vb else raise (Invalid_argument "index out of bound")
		)


let rec var_list_length p = function
	| [] -> (* 1 *) 0
	| var :: q -> (* 1 *) var_list_length p q + (
		match Env.find var p.p_vars with
			| TBit        -> (* 1 *) 1
			| TBitArray n -> (* 0 *) n
		)


let addInput p vars =
	(* 1 *) let rec aux_array next a k =
		(* 0 *) if k < Array.length a
		then (
			a.(k) <- next ();
			aux_array next a (k + 1)
		)
	in
	let rec aux next = function
		| [] -> (* 1 *) ()
		| var :: q ->
			(* 1 *) let value = match Env.find var p.p_vars with
				| TBit        -> (* 1 *) VBit (next ())
				| TBitArray n ->
					(* 0 *) let a  = Array.make n false in (
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
		in fun () -> (* 1 *) let c = input.[!cur] in incr cur ; c = '1'
	in
		aux next vars

let tic ram rom p =
	(** tic [ram] [rom] [p] computes the programm [p] with the
	hash tables [ram] and [rom] containing RAM and ROM values and then returns
	the output vector. *)
	
	(* 1 *) ramUp := [];
	
	
	let evalDefault ident =
		(* 160 *) try
		match Env.find ident p.p_vars with
			| TBit        -> (* 160 *) VBit false
			| TBitArray n -> (* 0 *) VBitArray (Array.make n false)
		with Not_found ->
			raise (Sim_error ("Unknown register or memory : " ^ ident))
	in
	
	
	let oldValue ident =
		(* 160 *) try Hashtbl.find !oldEnv ident
		with Not_found -> evalDefault ident
	in
	
	let updateRam =
		List.iter
			(fun (ramTable, wa, ws, d) -> (* 0 *) setWord ramTable wa ws d)
			!ramUp
	in
	
	let rec applyEq = function
		| []                -> (* 1 *) ()
		| (ident, exp) :: q ->
			(* 22154 *) let eval = (
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
		| []     -> (* 1 *) []
		| o :: q -> (* 2 *) (Hashtbl.find !env o) :: (getOutput q)
	in
	
	oldEnv := !env;
	addInput p p.p_inputs;
	applyEq p.p_eqs;
	updateRam;
	getOutput p.p_outputs


