%{
(*
 * Sysdig -- netlist_parser.mly
 * ============================
 *
 * This netlist parser mainly comes from the one given for the first TD.
 * It has been modified to handle values with integers instead of bool arrays.
 *)

 open Netlist_ast

 let bit_of_string s = match s with
  | "t" | "1" -> 1
  | "f" | "0" -> 0
  | _ -> raise Parsing.Parse_error

%}

%token <string> CONST
%token <string> NAME
%token AND MUX NAND OR RAM ROM XOR REG NOT
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
  | ROM addr=int word=int ra=arg
    { Erom(addr, word, ra) }
  | RAM addr=int word=int ra=arg we=arg wa=arg data=arg
    { Eram(addr, word, ra, we, wa, data) }


arg:
  | n=CONST { Aconst (bit_of_string n) }
  | id=NAME { Avar id }

var: x=NAME ty=ty_exp { (x, ty) }
ty_exp:
  | /*empty*/ { () }
  | COLON int { () }

int:
  | c=CONST { int_of_string c }

