exception Error

type token = 
  | XOR
  | VAR
  | SLICE
  | SELECT
  | ROM
  | REG
  | RAM
  | OUTPUT
  | OR
  | NOT
  | NAND
  | NAME of (string)
  | MUX
  | INT of (int)
  | INPUT
  | IN
  | EQUAL
  | EOF
  | CONCAT
  | COMMA
  | COLON
  | AND


val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Netlist_ast.program)