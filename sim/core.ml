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

exception Sim_error of string
let ramUp = ref []


let evalBinop a b = function
	| 0 -> a lor b
	| 1 -> a lxor b
	| 2 -> a land b
	| 3 -> lnot (a land b)
	| _ -> assert false

let getWord mem addr =
	try Hashtbl.find mem addr
	with Not_found -> 0

let setWord p mem wa data =
	Hashtbl.replace mem wa p.i_env.(data)

let getAddr addrSize addr = addr

let romHandler rom addrSize wordSize rAddr =
	let a = getAddr addrSize rAddr in
		getWord rom a


let ramHandler ram addrSize wordSize rAddr writeEnable wAddr data =
	let ra = getAddr addrSize rAddr in
	let wa = getAddr addrSize wAddr in
		if writeEnable <> 0
		then ramUp := (ram, wa, wordSize, data) :: !ramUp;
		getWord ram ra


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
	match table.(h) with
	| 0x1 -> p.i_env.(table.(h + 1)), h + 1
	| 0x2 -> p.i_old_env.(table.(h + 1)), h + 2
	| 0x3 -> p.i_env.(table.(h + 1)) lxor 1, h + 2
	| 0x4 | 0x5 | 0x6 | 0x7 ->
		let a = p.i_env.(table.(h + 1)) in
		let b = p.i_env.(table.(h + 2)) in
			evalBinop a b (table.(h) land 3), h + 3
	| 0x8 ->
		let a = p.i_env.(table.(h + 1)) in
		let b = p.i_env.(table.(h + 2)) in
		let c = p.i_env.(table.(h + 3)) in
			(if c <> 0 then a else b), h + 4
	| 0x9 ->
		let addr =          table.(h + 1)  in
		let ws   =          table.(h + 2)  in
		let ra   = p.i_env.(table.(h + 3)) in
			romHandler rom addr ws ra, h + 4
	| 0xa ->
		let addr =          table.(h + 1)  in
		let ws   =          table.(h + 2)  in
		let ra   = p.i_env.(table.(h + 3)) in
		let we   = p.i_env.(table.(h + 4)) in
		let wa   = p.i_env.(table.(h + 5)) in
		let d    =          table.(h + 6)  in
		let ramTable = getRamTable ram table.(h - 1) in
			ramHandler ramTable addr ws ra we wa d, h + 7
	| _ -> assert false


let addInput async p vars =
	let next =
		let l = List.length vars in
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
		List.iter (fun var -> p.i_env.(var) <- next ()) vars

let getOutput p =
	let rec aux = function
		| []     -> []
		| o :: q -> p.i_env.(o) :: (aux q)
	in aux p.i_outputs

let updateRam p =
	List.iter
		(fun (ramTable, wa, ws, d) -> setWord p ramTable wa  d)
		!ramUp


let tic async ram rom p =
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
	addInput async p p.i_inputs;
	let n = Array.length p.i_eqs in
	let head = ref 0 in
	while !head < n do
		head := applyEq !head
	done;
	updateRam p;
	getOutput p


