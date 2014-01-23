{
(*
 * Sysdig -- sim_lexer.mll
 * =======================
 *
 * Although it has originaly been designed for input file lexing, this module
 * is now dedicated to ROM loading since there is no more input file.
 * In the ROM file, the first line determine the word size for the whole memory.
 * Specify it carefully !
 *)

	exception EOF
	exception Sim_lexing_error of string
	
	let input = ref []
	let current_array = ref []
	let empty = ref true
	let ws = ref (-1)
	
	let bit_of_char c = if c = '1' then 1 else 0
	
	let int_of_list =
		let rec aux a = function
			| []     -> a
			| t :: q -> aux ((a lsl 1) + t) q
		in aux 0
	
	let handleNewline () =
		if !ws = -1 then ws := List.length !current_array;
		let v = int_of_list !current_array in
		input := v :: !input;
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
		current_array := (bit_of_char v) :: !current_array;
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


