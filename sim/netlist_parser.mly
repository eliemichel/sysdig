%{
 (* From TD1 *)
 open Netlist_ast
 
 let value_of_int n m =
   let rec aux n m =
     let b =
       match n mod 10 with
         | 0 -> false
         | 1 -> true
         | i -> Format.eprintf "Unexpected: %d@." i; raise Parsing.Parse_error
     in
     if m = 1 then
       [b]
     else
       b::(aux (n / 10) (m - 1))
   in
   match aux n m with
     | [] -> Format.eprintf "Empty list@."; raise Parsing.Parse_error
     | [b] -> VBit b
     | bl -> VBitArray (Array.of_list (List.rev bl))
 
 let value_of_string s = value_of_int (int_of_string s) (String.length s)
 
%}

%token <string> INT
%token <string> NAME
%token AND MUX NAND OR RAM ROM XOR REG NOT
%token CONCAT SELECT SLICE
%token COLON EQUAL COMMA VAR IN INPUT OUTPUT
%token EOF

%start program             /* the entry point */
%type <Netlist_ast.program> program

%%
program:
  INPUT inp=separated_list(COMMA, NAME)
    OUTPUT out=separated_list(COMMA, NAME)
    VAR vars=separated_list(COMMA, var) IN eqs=list(equ) EOF
    { { p_eqs = eqs; p_vars = Env.of_list vars; p_inputs = inp; p_outputs = out; } }

equ:
  x=NAME EQUAL e=exp { (x, e) }

exp:
  | a=arg { Earg a }
  | NOT x=arg { Enot x }
  | REG x=NAME { Ereg x }
  | AND x=arg y=arg { Ebinop(And, x, y) }
  | OR x=arg y=arg { Ebinop(Or, x, y) }
  | NAND x=arg y=arg { Ebinop(Nand, x, y) }
  | XOR x=arg y=arg { Ebinop(Xor, x, y) }
  | MUX x=arg y=arg z=arg { Emux(x, y, z) }
  | ROM addr=INT word=INT ra=arg
    { Erom(int_of_string addr, int_of_string word, ra) }
  | RAM addr=INT word=INT ra=arg we=arg wa=arg data=arg
    { Eram(int_of_string addr, int_of_string word, ra, we, wa, data) }
  | CONCAT x=arg y=arg
     { Econcat(x, y) }
  | SELECT idx=INT x=arg
     { Eselect (int_of_string idx, x) }
  | SLICE min=INT max=INT x=arg
     { Eslice (int_of_string min, int_of_string max, x) }

arg:
  | n=INT { Aconst (value_of_string n) }
  | id=NAME { Avar id }

var: x=NAME ty=ty_exp { (x, ty) }
ty_exp:
  | /*empty*/ { TBit }
  | COLON n=INT { TBitArray (int_of_string n) }
