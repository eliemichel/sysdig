{
  let txt = ref ""
let line = ref 1

let print s =
  txt := !txt ^ s

let print_li s =
  let n = String.length s in
  let str = 
    if n >= 1 && n <= 3 then "011"^(String.make (3-n) '0')^s^" # li "^s^"\n"
    else if n >= 4 && n <= 6 then 
      let p1 = (String.make (6-n) '0') ^ (String.sub s 0 (n-3)) in
      let p2 = (String.sub s (n-3) 3) in
      "# li " ^ s ^"\n"^
	"011011 # li 3 \n"^ (* li 3 *)
	"100100 # 2 pour move a0 -> a1 \n"^ (* move a0 -> a1 *)
	"100001 \n"^
	"011"^p1^" # 1er li : "^p1^"\n"^ (* li *)
	"010111 # shift \n"^ (* shift *)
	"100001 # move r0 -> a1 \n"^ (* move r0 -> a1 *)
	"011"^p2^" # 2nd li : "^p2^" \n"^
	"010000 # add \n"^ (* add *)
	"100000 # move r0 -> a0 \n"^ (* move r0 -> a0 *)
	"# end li \n"
    else (Printf.printf "Problème ligne %d \n" !line ; 
	  failwith "Mauvais format") 
  in
  txt := !txt ^ str

let print_load addr c a01 = (* load dans addr à c = 0 ou 1, dans a0 ou a1 *)
  let s = addr in
  let n = String.length s in
  let str = "011"^(String.make (3-n) '0')^s^" # li "^s^"\n" in
  let l = "10100" ^ a01 ^ "\n" in
  let l2 = (if (int_of_string c) = 0 then
      "000011\n"^l^"000010\n" else l) in
  let str2 =
    "# load2 " ^ addr ^ " " ^ c^" "^a01 ^"\n"^ (* titre *)
      str^ " # li " ^addr^ "\n"^ (* li addr *)
      "100100\n"^ (* mvar 00 *)
      l2 ^
      "# end load2 \n"
  in
  txt := !txt ^ str2

let print_save addr c = (* save à addr à c = 0 ou 1, la val de a1 *)
  let s = addr in
  let n = String.length s in
  let str = "011"^(String.make (3-n) '0')^s^" # li "^s^"\n" in
  let l = "101101\n" in
  let l2 = (if (int_of_string c) = 0 then
      "000011\n"^l^"000010\n" else l) in
  let str2 =
    "# save2 " ^ addr ^ " " ^ c ^"\n"^ (* titre *)
      str^ " # li " ^addr^ "\n"^ (* li addr *)
      "100100\n"^ (* mvar 00 *)
      l2 ^
      "# end save2 \n"
  in
  txt := !txt ^ str2

let print_output s =
  let n = String.length s in
  let str =  
    if n >= 1 && n <= 3 then "001"^(String.make (3-n) '0')^s
    else (Printf.printf "Problème ligne %d \n" !line ; 
	  failwith "Mauvais format") 
  in
  txt := !txt ^ str ^ " # output " ^ s ^ "\n"

let print_ij s ij com =
  txt := !txt ^ s ^ ij ^ " # " ^ com ^ " " ^ ij ^ "\n"

let print_com com =
  txt := !txt ^ (String.make 1 com)
}

let space = [' ' '\t' '\r']
let bit = ['0' '1']+
let alpha = ['a'-'z' 'A'-'Z' '-' '<' '>' ''' '*' '+' '!' '?' ' ' '\t' '\r' '0'-'9' '(' ')' '=' ',' ';' ':' '.' '&']
let mul = ('\n')+

rule scan = parse
  | space { scan lexbuf }
  | mul { incr line ; scan lexbuf }
  | "*" { txt := !txt ^ "# " ; com lexbuf }
  | "input" (space?) (bit as ij) { print_ij "0001" ij "input"; scan lexbuf }
  | "output" (space?) (bit as b) { print_output b ; scan lexbuf }
  | "flip" { print "001111 # flip \n" ; scan lexbuf }
  | "add" { print "010000 # add \n" ; scan lexbuf }
  | "sub" { print "010001 # sub \n" ; scan lexbuf }
  | "mult" { print "010010 # mult \n" ; scan lexbuf }
  | "div" { print "010011 # div \n" ; scan lexbuf }
  | "and" { print "010100 # and \n" ; scan lexbuf }
  | "or" { print "010101 # or \n" ; scan lexbuf }
  | "not" { print "010110 # not \n" ; scan lexbuf }
  | "shift" { print "010111 # shift \n" ; scan lexbuf }
  | "li" (space?) (bit as i) { print_li i ; scan lexbuf }
  | "mvra" (space?) (bit as ij) {  print_ij "1000" ij "mvra"; scan lexbuf }
  | "mvar" (space?) (bit as ij) { print_ij "1001" ij "mvar"; scan lexbuf }
  | "load" (space?) (bit as ij) { print_ij "1010" ij "load"; scan lexbuf }
  | "save" (space?) (bit as ij) { print_ij "1011" ij "save"; scan lexbuf }
  | "jfra" (space?) (bit as ij) { print_ij "1100" ij "jfra"; scan lexbuf }
  | "jbra" (space?) (bit as ij) { print_ij "1101" ij "jbra"; scan lexbuf }
  | "iio" (space?) (bit as ij) { print_ij "1110" ij "iio"; scan lexbuf }
  | "jaaa" { print "111100 # jaaa \n" ; scan lexbuf }
  | "jaar" { print "111101 # jaar \n" ; scan lexbuf }
  | "wca" { print "111110 # wca \n" ; scan lexbuf }
  | "nop" { print "000000 # nop \n" ; scan lexbuf }
  | "incr" { print "000010 # incr \n" ; scan lexbuf }
  | "decr" { print "000011 # decr \n" ; scan lexbuf }
  | "load2" (space?) (bit as addr) (space?) (bit as c) (space?) (bit as a01) { print_load addr c a01 ; scan lexbuf }
  | "save2" (space?) (bit as addr) (space?) (bit as c) { print_save addr c ; scan lexbuf }
  | "end" { print "111111 # end \n" ; scan lexbuf }
  | eof { }
  | _ { Printf.printf "Problème ligne %d \n" !line ; 
	failwith "Oubli d'un argument ou caractère inconnu"; 
	exit 1 }

and com = parse
  | mul { txt := !txt ^ "\n" ; incr line ; scan lexbuf }
  | eof { }
  | (alpha as a) { print_com a ; com lexbuf }
  | _ { Printf.printf "Problème ligne %d \n" !line ; 
	failwith "Oubli d'un argument ou caractère inconnu (commentaire)"; 
	exit 1 }

{
  let () =
    let file = Sys.argv.(1) in
    let c = open_in file in
    (if not (Filename.check_suffix file ".s") then failwith "Mauvaise extension du fichier d'entrée");
    let name = (Filename.chop_suffix file ".s")^".bin" in
    let o = open_out name in
    let b = Lexing.from_channel c in
    scan b ;
    output_string o !txt;
    close_out o;
    close_in c
}


