open Netlist_ast

exception Sim_error of string


let array_of_value = function
	| VBit b      -> [|b|]
	| VBitArray a -> a

let bool_of_value = function
	| VBit b      -> b
	| VBitArray a -> raise (
		Sim_error
		"A bit array is used as single bit"
		)



let tic inputs oldEnv ram rom p =
	(** tic [inputs] [oldEnv] [ram] [rom] [p] computes the programm p with input
	vector [i], the environnement [oldEnv] (for registers) and the hash tables
	[ram] and [rom] containing RAM and ROM values and then returns the output
	vector. *)
	
	let ramUp = ref [] in
	
	let rec addInput valuation vars = match valuation, vars with
		| [], []            -> Env.empty
		| [], _ | _, []     -> raise (
			Sim_error
			"Given input does not match required input (bad amount of nets)"
			)
		| v :: q1, id :: q2 -> let env = addInput q1 q2 in Env.add id v env
	in
	
	
	let evalDefault ident =
		try
		match Env.find ident p.p_vars with
			| TBit        -> VBit false
			| TBitArray n -> VBitArray (Array.make n false)
		with Not_found ->
			raise (Sim_error ("Unknown register or memory : " ^ ident))
	in
	
	let evalArg env = function
		| Avar ident -> (
			try Env.find ident env
			with Not_found ->
				raise (Sim_error ("Unknown identifier : " ^ ident))
			)
		| Aconst v   -> v
	in
	
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
	in
	
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
					raise (Sim_error "Invalid adress size in ROM access")
			);
			mask := !mask lsl 1
		done;
		!addr
	in
	
	let getWord mem addr wordSize =
		VBitArray (Array.init
			wordSize
			(fun k ->
				try Hashtbl.find mem (addr + k)
				with Not_found -> false
			)
		)
	in
	
	let setWord env mem wa wordSize data =
		let data = array_of_value (evalArg env data) in
		for k = 0 to wordSize - 1 do
			Hashtbl.replace mem (wa + k) data.(k)
		done;
	in
	
	let oldValue ident =
		try Env.find ident oldEnv
		with Not_found -> evalDefault ident
	in
	
	let romHandler addrSize wordSize rAddr =
		let a = getAddr addrSize rAddr in
			getWord rom a wordSize
	in
	
	let ramHandler addrSize wordSize rAddr writeEnable wAddr data =
		let ra = getAddr addrSize rAddr in
		let wa = getAddr addrSize wAddr in
			if bool_of_value writeEnable
			then ramUp := (wa, wordSize, data) :: !ramUp;
			getWord ram ra wordSize
	in
	
	let updateRam env =
		List.iter (fun (wa, ws, d) -> setWord env ram wa ws d) !ramUp
	in
	
	let evalExp env =
		(** evalExp [env] [exp] evaluates [exp] with the variables
		bounded in [env] *)
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
		| Erom (addr, ws, ra)            -> romHandler addr ws (evalArg ra)
		| Eram (addr, ws, ra, we, wa, d) ->
			ramHandler
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
			| vb          ->
				if i = 0
				then vb
				else raise (Invalid_argument "index out of bound")
			)
	in
	
	
	
	let rec applyEq env = function
		| []                -> env
		| (ident, exp) :: q ->
			let env' = Env.add ident (evalExp env exp) env in
				applyEq env' q
	in
	
	let rec getOutput env = function
		| []     -> []
		| o :: q -> (Env.find o env) :: (getOutput env q)
	in
	let env = applyEq (addInput inputs p.p_inputs) p.p_eqs in (
		updateRam env;
		env, getOutput env p.p_outputs
		)


