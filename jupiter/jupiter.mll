{
  let txt = ref ""
    
let print s =
  txt := !txt ^ s

let print_li s =
  let n = String.length s in
  let str = 
    if n >= 1 && n <= 3 then "011"^(String.make (3-n) '0')^s
    else if n >= 4 && n <= 6 then "011"^(String.sub s 0 2)^"010111"^"100100"^"100001"^"011"^(String.sub s 3 (n-1))^"010000"^"100000"
    else failwith "Mauvais format" in
  txt := !txt ^ str

let print_ij s ij =
  txt := !txt ^ s ^ ij
}

let space = [' ' '\t' '\r' '\n']
let bit = ['0' '1']+

rule scan = parse
  | space { scan lexbuf }
  | "*" { com lexbuf }
  | "input" (space?) (bit as ij) { print_ij "0001" ij ; scan lexbuf }
  | "flip" { print "001111" ; scan lexbuf }
  | "add" { print "010000" ; scan lexbuf }
  | "sub" { print "010001" ; scan lexbuf }
  | "mult" { print "010010" ; scan lexbuf }
  | "div" { print "010011" ; scan lexbuf }
  | "and" { print "010100" ; scan lexbuf }
  | "or" { print "010101" ; scan lexbuf }
  | "not" { print "010110" ; scan lexbuf }
  | "shift" { print "010111" ; scan lexbuf }
  | "li" (space?) (bit as i) { print_li i ; scan lexbuf }
  | "mvra" (space?) (bit as ij) {  print_ij "1000" ij ; scan lexbuf }
  | "mvar" (space?) (bit as ij) { print_ij "1001" ij ; scan lexbuf }
  | "load" (space?) (bit as ij) { print_ij "1010" ij ; scan lexbuf }
  | "save" (space?) (bit as ij) { print_ij "1011" ij ; scan lexbuf }
  | "jfra" (space?) (bit as ij) { print_ij "1100" ij ; scan lexbuf }
  | "jbra" (space?) (bit as ij) { print_ij "1101" ij ; scan lexbuf }
  | "iio" (space?) (bit as ij) { print_ij "1110" ij ; scan lexbuf }
  | "jaaa" { print "111100" ; scan lexbuf }
  | "jaar" { print "111101" ; scan lexbuf }
  | "wca" { print "111110" ; scan lexbuf }
  | "end" { print "111111" ; scan lexbuf }
  | eof { }
  | _ { failwith "Oubli d'un argument ou caractère inconnu"; exit 1 }

and com = parse
  | '\n' { scan lexbuf }
  | eof { }
  | _ { com lexbuf }

{
  let () =
    let file = Sys.argv.(1) in
    let c = open_in file in
    (if not (Filename.check_suffix file ".bar") then failwith "Mauvaise extension du fichier d'entrée");
    let name = (Filename.chop_suffix file ".bar")^".bin" in
    let o = open_out name in
    let b = Lexing.from_channel c in
    scan b ;
    output_string o !txt;
    close_out o;
    close_in c
}


