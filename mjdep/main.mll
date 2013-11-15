{
	let output_file = ref "fullmain.mj"
	let root = ref ""
	
	let fix_name f =
		if Filename.check_suffix f ".mj"
		then f
		else f ^ ".mj"
	
	let include_file lexer write f =
		let filename = fix_name f in
		try
			let i = open_in (Filename.concat !root filename) in
				Printf.eprintf "Include '%s'\n" filename;
				write ("(* mjdep: Begin file '" ^ filename ^ "' *)\n");
				lexer write (Lexing.from_channel i);
				write ("(* mjdep: End file '" ^ filename ^ "' *)");
				close_in i
		with Sys_error s -> (
			Printf.eprintf "Warning: file '%s' not found\n" filename;
			write (
				"(* mjdep: unable to #require(" ^
				f ^
				") (file not found) *)"
				)
			)
}

let filename = ['0'-'9' 'a'-'z' 'A'-'Z' '_']+

rule token write = parse
	| "(*"   { write "(*" ; comment write lexbuf; token write lexbuf }
	| _ as c { write (String.make 1 c) ; token write lexbuf }
	| eof    { () }

and comment write = parse
	| '"'    { write "\"" ; str write lexbuf; comment write lexbuf }
	| "*)"   { write "*)" }
	| "#require" ' '* '(' {
			write "*)\n";
			require write lexbuf;
			write "\n(*";
			comment write lexbuf
		}
	| _ as c { write (String.make 1 c) ; comment write lexbuf }
	| eof    { () }

and str write = parse
	| "\\\"" { write "\\\"" ; str write lexbuf }
	| '"'    { write "\"" }
	| _ as c { write (String.make 1 c) ; str write lexbuf }
	| eof    { () }

and require write = parse
	| ' '* ','? ' '* (filename as f) {
			include_file token write f;
			require write lexbuf
		}
	| ')'  { () }
	| _    { require write lexbuf }
	| eof  { () }

{
	let main filename =
		let o = open_out !output_file in
		let write = Printf.fprintf o "%s" in
		let basename = Filename.basename filename in
			root := Filename.dirname filename;
			Printf.eprintf "mjdep: Working in directory '%s'\n" !root;
			include_file token write basename;
			close_out o
	
	
	let () = Arg.parse
		["-o", Arg.Set_string output_file,
			"Sets output file (default is `fullmain.mj`)"]
		main
		"mjdep -o [output] [filename] includes requiered files in filename and \
		returns the result in [output]. Requiered files are specified in \
		commentaries by the syntax `#require(file1, file2.mj, ...)` \
		(commas between file names and .mj extension are optionnal)."
}


