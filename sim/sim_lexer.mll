{
	exception EOF
	exception Sim_lexing_error of string
	
	let input = ref []
	let current_array = ref []
	let empty = ref true
	let ws = ref (-1)
	
	let bool_of_char c = c = '1'
	
	let handleNewline () =
		let line = (* Correction de la taille *)
			let d = Array.of_list (List.rev !current_array) in
			if !ws = -1 then ws := Array.length d;
			let diff = Array.length d - !ws in
			Netlist_ast.VBitArray (
				if diff > 0
				then Array.sub d diff !ws (* On suppose les poids faibles à droite *)
				else Array.append (Array.make (-diff) false) d
			)
		in
		input := line :: !input;
		current_array := [];
		empty := true
}

let value = ['0' '1']
let whitespace = [' ' '\t']+
let newline = '\n'


rule token = parse
	| whitespace { empty := false ; token lexbuf }
	| newline    {
		handleNewline ();
		token lexbuf
		}
	| value as v {
		empty := false;
		current_array := (bool_of_char v) :: !current_array;
		token lexbuf
		}
	| '#'        { if not !empty then handleNewline () ; comment lexbuf }
	| _          { raise (Sim_lexing_error "Syntax error") }
	| eof        { () }


and comment = parse
	| newline { empty := true ; token lexbuf }
	| _       { comment lexbuf }
	| eof     { () }

{
	let read_file filename =
		let ic =
			try open_in filename
			with _ -> raise (
				Sim_lexing_error
				("No such file '" ^ filename ^ "'")
				)
		in
			input := [];
			current_array := [];
			token (Lexing.from_channel ic);
			List.rev !input
	
}


