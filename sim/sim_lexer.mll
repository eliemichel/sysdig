{
	exception EOF
	exception Sim_lexing_error of string
	
	let input = ref []
	let a = ref 0
	let n = ref 0
	let empty = ref true
	let ws = ref (-1)
	
	let bool_of_char c = c = '1'
	
	let int_rev v n =
		v
	
	
	let handleNewline () =
		if !ws = -1 then ws := !n;
		a := int_rev !a n;
		input := (!a, !ws) :: !input;
		a := 0;
		n := 0;
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
		a := (!a lsl 1) lor int_of_char v;
		incr n;
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
			a := 0;
			n := 0;
			token (Lexing.from_channel ic);
			List.rev !input
	
}


