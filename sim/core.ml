open Netlist_ast

(* Peut-on faire des opérations sur les slices ? *)
exception Sim_error of string

module Vmap = Map.Make(struct type t = ident let compare = compare end)


let evalArg map = function
	| Avar ident -> Vmap.find ident map
	| Aconst v   -> v


let evalBinop a b = match a, b with
	| VBit a, VBit b -> (function
		| Or   -> VBit (a || b)
		| Xor  -> VBit (a <> b)
		| And  -> VBit (a && b)
		| Nand -> VBit (not (a && b))
		)
	| _ -> raise (Sim_error "Binary operator can not be applied to a VBitArray")


let evalExp map =
	(** evalExp [map] adds to  *)
	let evalArg = evalArg map in
	function
	| Earg arg   -> evalArg arg
	| Ereg ident -> VBit false (*TODO*)
	| Enot arg   -> (match evalArg arg with
		| VBit b      -> VBit (not b)
		| VBitArray a -> VBitArray (Array.map (fun b -> not b) a)
		)
	| Ebinop (op, arg1, arg2) -> evalBinop (evalArg arg1) (evalArg arg2) op
	| Emux (arg1, arg2, arg3) -> (match evalArg arg1, evalArg arg2, evalArg arg3 with
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


let tic inputs p =
	(** tic [inputs] [p] executes the programm p with input vector [i] and returns the output vector. *)
	let rec addInput valuation vars = match valuation, vars with
		| [], []            -> Vmap.empty
		| [], _ | _, []     -> raise (Sim_error "Given input does not match required input (bad amount of nets)")
		| v :: q1, id :: q2 -> let map = addInput q1 q2 in Vmap.add id v map
	in
	
	let rec applyEq map = function
		| []              -> map
		| (ident, exp) :: q -> let map' = Vmap.add ident (evalExp map exp) map in applyEq map' q
	in
	
	let rec getOutput map = function
		| []     -> []
		| o :: q -> (Vmap.find o map) :: (getOutput map q)
	in getOutput (applyEq (addInput inputs p.p_inputs) p.p_eqs) p.p_outputs


