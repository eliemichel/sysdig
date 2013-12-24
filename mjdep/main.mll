{
	module SSet = Set.Make(String)
	
	let output_file = ref "fullmain.mj"
	let root = ref ""
	let loaded = ref SSet.empty
	
	let fix_name f =
		if Filename.check_suffix f ".mj"
		then f
		else f ^ ".mj"
	
	let include_file lexer write replace_main f =
		let filename = fix_name f in
		if SSet.mem filename !loaded
		then (
			Printf.eprintf "Warning: file '%s' already read\n" filename;
			write ("(* mjdep: cyclic requirement : " ^ f ^ " *)")
		)
		else (
			loaded := SSet.add filename !loaded;
			try
				let i = open_in (Filename.concat !root filename) in
					Printf.eprintf "Include '%s'\n" filename;
					write ("(* mjdep: Begin file '" ^ filename ^ "' *)\n");
					lexer write replace_main (Lexing.from_channel i);
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
		)
}

let filename = ['0'-'9' 'a'-'z' 'A'-'Z' '_']+

rule token write rm = parse
	| "(*"    { write "(*" ; comment write rm lexbuf ; token write rm lexbuf }
	| "main" { write (if rm then "main_protected" else "main") ; token write rm lexbuf }
	| _ as c  { write (String.make 1 c) ; token write rm lexbuf }
	| eof     { () }

and comment write rm = parse
	| '"'    { write "\"" ; str write rm lexbuf; comment write rm lexbuf }
	| "*)"   { write "*)" }
	| "#require" ' '* '(' {
			write "*)\n";
			require write rm lexbuf;
			write "\n(*";
			comment write rm lexbuf
		}
	| _ as c { write (String.make 1 c) ; comment write rm lexbuf }
	| eof    { () }

and str write rm = parse
	| "\\\"" { write "\\\"" ; str write rm lexbuf }
	| '"'    { write "\"" }
	| _ as c { write (String.make 1 c) ; str write rm lexbuf }
	| eof    { () }

and require write rm = parse
	| ' '* ','? ' '* (filename as f) {
			include_file token write true f;
			require write rm lexbuf
		}
	| ')'  { () }
	| _    { require write rm lexbuf }
	| eof  { () }

{
	let main filename =
		let o = open_out !output_file in
		let write = Printf.fprintf o "%s" in
		let basename = Filename.basename filename in
			root := Filename.dirname filename;
			Printf.eprintf "mjdep: Working in directory '%s'\n" !root;
			include_file token write false basename;
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


