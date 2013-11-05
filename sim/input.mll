{
	exception EOF
	exception Input_error of string
	
	let input = ref []
	let current_line = ref []
	let current_array = ref []
	
	let bool_of_char c = c = '1'
}

let comment = ( '\n'? '#' [^'\n']* )+
let value = ['0' '1']
let whitespace = [' ' '\t']+
let newline = comment? '\n'


rule token = parse
	| whitespace { token lexbuf }
	| newline    {
		input := (List.rev !current_line) :: !input;
		current_line := [];
		token lexbuf
		}
	| value as v {
		current_line := (Netlist_ast.VBit (bool_of_char v)) :: !current_line;
		token lexbuf
		}
	| '['        {
		current_array := [];
		bit_array lexbuf
		}
	| eof        { () }

and bit_array = parse
	| whitespace { bit_array lexbuf }
	| value as v {
		current_array := (bool_of_char v) :: !current_array;
		bit_array lexbuf
		}
	| ']'        {
		let a = Netlist_ast.VBitArray (Array.of_list (List.rev !current_array)) in
			current_line := a :: !current_line;
			token lexbuf
		}
	| eof        { raise (Input_error "Syntax error") }

{
	let read_file filename =
		let ic =
			try open_in filename
			with _ -> raise (Input_error ("No such file '" ^ filename ^ "'"))
		in
			token (Lexing.from_channel ic);
			List.rev !input
	
}


