{
	exception EOF
	exception Sim_lexing_error of string
	
	let input = ref []
	let current_line = ref []
	let current_array = ref []
	let empty = ref true
	
	let bool_of_char c = c = '1'
	
	let handleNewline () =
		input := (List.rev !current_line) :: !input;
		current_line := [];
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
		current_line := (Netlist_ast.VBit (bool_of_char v)) :: !current_line;
		token lexbuf
		}
	| '['        {
		empty := false;
		current_array := [];
		bit_array lexbuf
		}
	| '#'        { if not !empty then handleNewline () ;  comment lexbuf }
	| _          { raise (Sim_lexing_error "Syntax error") }
	| eof        { () }

and bit_array = parse
	| whitespace { bit_array lexbuf }
	| value as v {
		current_array := (bool_of_char v) :: !current_array;
		bit_array lexbuf
		}
	| ']'        {
		let a = Netlist_ast.VBitArray (
			Array.of_list (List.rev !current_array)
			)
		in
			current_line := a :: !current_line;
			token lexbuf
		}
	| _
	| eof        { raise (Sim_lexing_error "Syntax error") }

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
			current_line := [];
			current_array := [];
			token (Lexing.from_channel ic);
			List.rev !input
	
}


