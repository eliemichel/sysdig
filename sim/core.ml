open Netlist_ast

(* Peut-on faire des opérations sur les slices ? *)
exception Sim_error of string


let tic inputs oldEnv p =
	(** tic [inputs] [oldEnv] [p] computes the programm p with input vector [i] and the environnement [oldEnv]
	(for registers and memories) and returns the output vector. *)
	let rec addInput valuation vars = match valuation, vars with
		| [], []            -> Env.empty
		| [], _ | _, []     -> raise (Sim_error "Given input does not match required input (bad amount of nets)")
		| v :: q1, id :: q2 -> let env = addInput q1 q2 in Env.add id v env
	in
	
	
	let evalDefault ident =
		try
		match Env.find ident p.p_vars with
			| TBit        -> VBit false
			| TBitArray n -> VBitArray (Array.make n false)
		with Not_found -> raise (Sim_error ("Unknown register or memory : " ^ ident))
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
		| _ -> raise (Sim_error "Binary operator can not be applied to a VBitArray")
	in
	
	let evalExp oldEnv env =
		(** evalExp [oldEnv] [env] [exp] evaluates [exp] with the variables bounded in [env] and the old values
		(values of precedent tic call) in [oldEnv] *)
		let evalArg = evalArg env in
		function
		| Earg arg   -> evalArg arg
		| Ereg ident -> (
			try Env.find ident oldEnv
			with Not_found -> evalDefault ident
			)
		| Enot arg   -> (match evalArg arg with
			| VBit b      -> VBit (not b)
			| VBitArray a -> VBitArray (Array.map (fun b -> not b) a)
			)
		| Ebinop (op, arg1, arg2) -> evalBinop (evalArg arg1) (evalArg arg2) op
		| Emux (arg1, arg2, arg3) -> (
			match evalArg arg1, evalArg arg2, evalArg arg3 with
			| VBit a, VBit b, VBit c -> VBit (a && c || b && (not c))
			| _                      -> raise (Sim_error "Mux can not be applied to a VBitArray")
			)
		| Erom (addrSize, wordSize, rAddr) ->
			VBit false (*TODO*)
		| Eram (addrSize, wordSize, rAddr, enable, wAddr, data) ->
			VBit false (*TODO*)
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
			| _           -> raise (Sim_error "Selection in VBit is not possible")
			)
	in
	
	
	
	let rec applyEq oldEnv env = function
		| []                -> env
		| (ident, exp) :: q ->
			let env' = Env.add ident (evalExp oldEnv env exp) env in
				applyEq oldEnv env' q
	in
	
	let rec getOutput env = function
		| []     -> []
		| o :: q -> (Env.find o env) :: (getOutput env q)
	in
	let env = applyEq oldEnv (addInput inputs p.p_inputs) p.p_eqs in
		env, getOutput env p.p_outputs


