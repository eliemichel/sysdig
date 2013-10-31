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
  | NAME of (
# 24 "netlist_parser.mly"
       (string)
# 19 "netlist_parser.ml"
)
  | MUX
  | INT of (
# 23 "netlist_parser.mly"
       (int)
# 25 "netlist_parser.ml"
)
  | INPUT
  | IN
  | EQUAL
  | EOF
  | CONCAT
  | COMMA
  | COLON
  | AND

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState69
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState59
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState53
  | MenhirState52
  | MenhirState50
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState36
  | MenhirState32
  | MenhirState29
  | MenhirState25
  | MenhirState22
  | MenhirState21
  | MenhirState19
  | MenhirState15
  | MenhirState9
  | MenhirState7
  | MenhirState3
  | MenhirState1


# 1 "netlist_parser.mly"
  
 open Netlist_ast

 let value_of_int n =
   let rec aux n =
     let b =
       match n mod 10 with
         | 0 -> false
         | 1 -> true
         | i -> Format.eprintf "Unexpected: %d@." i; raise Parsing.Parse_error
     in
     if n < 10 then
       [b]
     else
       b::(aux (n / 10))
   in
   match aux n with
     | [] -> Format.eprintf "Empty list@."; raise Parsing.Parse_error
     | [b] -> VBit b
     | bl -> VBitArray (Array.of_list (List.rev bl))

# 99 "netlist_parser.ml"
let _eRR =
  Error

let rec _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv301) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 112 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv299) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 120 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv300)) : 'freshtv302)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv305) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 137 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv303 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, x), _, y) = _menhir_stack in
        let _v : 'tv_exp = 
# 50 "netlist_parser.mly"
                    ( Ebinop(Xor, x, y) )
# 145 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv309) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 153 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 157 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 161 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv307 * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 167 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 171 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), min), max), _, x) = _menhir_stack in
        let _v : 'tv_exp = 
# 61 "netlist_parser.mly"
     ( Eslice (min, max, x) )
# 177 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)) : 'freshtv310)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv313) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 185 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 189 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv311 * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 195 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), idx), _, x) = _menhir_stack in
        let _v : 'tv_exp = 
# 59 "netlist_parser.mly"
     ( Eselect (idx, x) )
# 201 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)) : 'freshtv314)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv317) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 209 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 213 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 217 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv315 * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 223 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 227 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), addr), word), _, ra) = _menhir_stack in
        let _v : 'tv_exp = 
# 53 "netlist_parser.mly"
    ( Erom(addr, word, ra) )
# 233 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)) : 'freshtv318)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv321) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 241 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 245 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 249 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv319) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 257 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 261 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 265 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv320)) : 'freshtv322)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv325) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 282 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 286 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 290 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv323) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 298 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 302 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 306 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv324)) : 'freshtv326)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv329) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 323 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 327 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 331 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv327) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 339 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 343 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 347 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv328)) : 'freshtv330)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((((('freshtv333) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 364 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 368 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 372 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv331 * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 378 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 382 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((((((_menhir_stack, _menhir_s), addr), word), _, ra), _, we), _, wa), _, data) = _menhir_stack in
        let _v : 'tv_exp = 
# 55 "netlist_parser.mly"
    ( Eram(addr, word, ra, we, wa, data) )
# 388 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv337) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 396 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv335) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 404 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv336)) : 'freshtv338)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv341) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 421 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv339 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, x), _, y) = _menhir_stack in
        let _v : 'tv_exp = 
# 48 "netlist_parser.mly"
                   ( Ebinop(Or, x, y) )
# 429 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)) : 'freshtv342)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv345) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 437 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, x) = _menhir_stack in
        let _v : 'tv_exp = 
# 45 "netlist_parser.mly"
              ( Enot x )
# 445 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)) : 'freshtv346)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv349) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 453 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv347) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 461 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv348)) : 'freshtv350)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv353) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 478 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv351 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, x), _, y) = _menhir_stack in
        let _v : 'tv_exp = 
# 49 "netlist_parser.mly"
                     ( Ebinop(Nand, x, y) )
# 486 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)) : 'freshtv354)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv357) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 494 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv355) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 502 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv356)) : 'freshtv358)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv361) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 519 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv359) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 527 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv360)) : 'freshtv362)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv365) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 544 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv363 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, x), _, y), _, z) = _menhir_stack in
        let _v : 'tv_exp = 
# 51 "netlist_parser.mly"
                          ( Emux(x, y, z) )
# 552 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)) : 'freshtv366)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv369) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 560 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv367) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 568 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv368)) : 'freshtv370)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv373) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 585 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, x), _, y) = _menhir_stack in
        let _v : 'tv_exp = 
# 57 "netlist_parser.mly"
     ( Econcat(x, y) )
# 593 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)) : 'freshtv374)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv377) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 601 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv375) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 609 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv376)) : 'freshtv378)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv381) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 626 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv379 * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, x), _, y) = _menhir_stack in
        let _v : 'tv_exp = 
# 47 "netlist_parser.mly"
                    ( Ebinop(And, x, y) )
# 634 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv385) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 642 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, a) = _menhir_stack in
        let _v : 'tv_exp = 
# 44 "netlist_parser.mly"
          ( Earg a )
# 650 "netlist_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_equ_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_equ_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv293) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv291) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_list_equ_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv287) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv285) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _, xs0), _, xs1), _, xs2), _, eqs) = _menhir_stack in
            let _v : (
# 31 "netlist_parser.mly"
      (Netlist_ast.program)
# 678 "netlist_parser.ml"
            ) = let vars =
              let xs = xs2 in
              
# 135 "standard.mly"
    ( xs )
# 684 "netlist_parser.ml"
              
            in
            let out =
              let xs = xs1 in
              
# 135 "standard.mly"
    ( xs )
# 692 "netlist_parser.ml"
              
            in
            let inp =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 700 "netlist_parser.ml"
              
            in
            
# 38 "netlist_parser.mly"
    ( { p_eqs = eqs; p_vars = Env.of_list vars; p_inputs = inp; p_outputs = out; } )
# 706 "netlist_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv283) = _menhir_stack in
            let (_v : (
# 31 "netlist_parser.mly"
      (Netlist_ast.program)
# 713 "netlist_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
            let (_v : (
# 31 "netlist_parser.mly"
      (Netlist_ast.program)
# 720 "netlist_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
            let (_1 : (
# 31 "netlist_parser.mly"
      (Netlist_ast.program)
# 727 "netlist_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv280)) : 'freshtv282)) : 'freshtv284)) : 'freshtv286)) : 'freshtv288)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv289) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv297) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * 'tv_equ) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state * 'tv_equ) * _menhir_state * 'tv_list_equ_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : 'tv_list_equ_ = 
# 116 "standard.mly"
    ( x :: xs )
# 746 "netlist_parser.ml"
         in
        _menhir_goto_list_equ_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv277) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 758 "netlist_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv275 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 766 "netlist_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let (e : 'tv_exp) = _v in
    ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
    let _v : 'tv_equ = 
# 41 "netlist_parser.mly"
                     ( (x, e) )
# 774 "netlist_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv273) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_equ) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_equ) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_equ) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NAME _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | EOF ->
        _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv270)) : 'freshtv272)) : 'freshtv274)) : 'freshtv276)) : 'freshtv278)

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "netlist_parser.mly"
       (string)
# 801 "netlist_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (id : (
# 24 "netlist_parser.mly"
       (string)
# 811 "netlist_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 65 "netlist_parser.mly"
            ( Avar id )
# 816 "netlist_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "netlist_parser.mly"
       (int)
# 823 "netlist_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (n : (
# 23 "netlist_parser.mly"
       (int)
# 833 "netlist_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 64 "netlist_parser.mly"
          ( Aconst (value_of_int n) )
# 838 "netlist_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)

and _menhir_goto_separated_nonempty_list_COMMA_var_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_var_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv259) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_var_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_COMMA_var_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_var_ = 
# 146 "standard.mly"
    ( x :: xs )
# 858 "netlist_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_var_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv258)) : 'freshtv260)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv263) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_var_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_COMMA_var_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_var__ = 
# 59 "standard.mly"
    ( x )
# 873 "netlist_parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_var__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)) : 'freshtv264)
    | _ ->
        _menhir_fail ()

and _menhir_reduce17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_equ_ = 
# 114 "standard.mly"
    ( [] )
# 884 "netlist_parser.ml"
     in
    _menhir_goto_list_equ_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "netlist_parser.mly"
       (string)
# 891 "netlist_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv255 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 900 "netlist_parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | EQUAL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv251) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 909 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv249) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 916 "netlist_parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv155) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 925 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv153) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 934 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv154)) : 'freshtv156)
        | CONCAT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv159) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 951 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv157) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 960 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv158)) : 'freshtv160)
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | MUX ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv163) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 979 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv161) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 988 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv162)) : 'freshtv164)
        | NAME _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | NAND ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv167) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1007 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv165) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1016 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv166)) : 'freshtv168)
        | NOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv171) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1033 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv169) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1042 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv170)) : 'freshtv172)
        | OR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv175) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1059 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv173) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1068 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv174)) : 'freshtv176)
        | RAM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv191) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1085 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv189) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1094 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv185) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1103 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1108 "netlist_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv183) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1116 "netlist_parser.ml"
                )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1120 "netlist_parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | INT _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv179) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1129 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1133 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1138 "netlist_parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((((('freshtv177) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1146 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1150 "netlist_parser.ml"
                    )) * (
# 23 "netlist_parser.mly"
       (int)
# 1154 "netlist_parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | INT _v ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
                    | NAME _v ->
                        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv178)) : 'freshtv180)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv181) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1173 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1177 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)) : 'freshtv184)) : 'freshtv186)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv187) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1188 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)
        | REG ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv201) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1197 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv199) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1206 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | NAME _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv195) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1215 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                let (_v : (
# 24 "netlist_parser.mly"
       (string)
# 1220 "netlist_parser.ml"
                )) = _v in
                ((let _ = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv193 * _menhir_state) = Obj.magic _menhir_stack in
                let (x : (
# 24 "netlist_parser.mly"
       (string)
# 1228 "netlist_parser.ml"
                )) = _v in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                let _v : 'tv_exp = 
# 46 "netlist_parser.mly"
               ( Ereg x )
# 1234 "netlist_parser.ml"
                 in
                _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)) : 'freshtv196)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv197) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1244 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)) : 'freshtv200)) : 'freshtv202)
        | ROM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv217) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1253 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv215) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1262 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv211) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1271 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1276 "netlist_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv209) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1284 "netlist_parser.ml"
                )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1288 "netlist_parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | INT _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv205) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1297 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1301 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1306 "netlist_parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((((('freshtv203) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1314 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1318 "netlist_parser.ml"
                    )) * (
# 23 "netlist_parser.mly"
       (int)
# 1322 "netlist_parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | INT _v ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
                    | NAME _v ->
                        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv204)) : 'freshtv206)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv207) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1341 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1345 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)) : 'freshtv212)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv213) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1356 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)) : 'freshtv218)
        | SELECT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv227) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1365 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv225) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1374 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv221) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1383 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1388 "netlist_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv219) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1396 "netlist_parser.ml"
                )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1400 "netlist_parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | INT _v ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                | NAME _v ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv220)) : 'freshtv222)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv223) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1419 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)) : 'freshtv228)
        | SLICE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv243) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1428 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv241) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1437 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv237) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1446 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1451 "netlist_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv235) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1459 "netlist_parser.ml"
                )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1463 "netlist_parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | INT _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv231) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1472 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1476 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1481 "netlist_parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((((((('freshtv229) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1489 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1493 "netlist_parser.ml"
                    )) * (
# 23 "netlist_parser.mly"
       (int)
# 1497 "netlist_parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | INT _v ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
                    | NAME _v ->
                        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv230)) : 'freshtv232)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv233) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1516 "netlist_parser.ml"
                    )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 1520 "netlist_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)) : 'freshtv238)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv239) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1531 "netlist_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)) : 'freshtv244)
        | XOR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv247) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1540 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv245) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1549 "netlist_parser.ml"
            )) * _menhir_state) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | NAME _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv246)) : 'freshtv248)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv250)) : 'freshtv252)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1572 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)) : 'freshtv256)

and _menhir_goto_ty_exp : _menhir_env -> 'ttv_tail -> 'tv_ty_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv151) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1583 "netlist_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_v : 'tv_ty_exp) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1590 "netlist_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (ty : 'tv_ty_exp) = _v in
    ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
    let _v : 'tv_var = 
# 67 "netlist_parser.mly"
                      ( (x, ty) )
# 1597 "netlist_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_var) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143 * _menhir_state * 'tv_var) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv137) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_var) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | NAME _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv136)) : 'freshtv138)
    | IN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_var_ = 
# 144 "standard.mly"
    ( [ x ] )
# 1633 "netlist_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_var_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)) : 'freshtv144)) : 'freshtv146)) : 'freshtv148)) : 'freshtv150)) : 'freshtv152)

and _menhir_goto_loption_separated_nonempty_list_COMMA_var__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_var__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv133) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv131) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | NAME _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | EOF ->
            _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv126)) : 'freshtv128)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv129) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)) : 'freshtv132)) : 'freshtv134)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "netlist_parser.mly"
       (string)
# 1682 "netlist_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv123 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1691 "netlist_parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv117) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1700 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv115) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1707 "netlist_parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv111) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1716 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 23 "netlist_parser.mly"
       (int)
# 1721 "netlist_parser.ml"
            )) = _v in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
            let (n : (
# 23 "netlist_parser.mly"
       (int)
# 1729 "netlist_parser.ml"
            )) = _v in
            ((let _v : 'tv_ty_exp = 
# 70 "netlist_parser.mly"
                ( TBitArray n )
# 1734 "netlist_parser.ml"
             in
            _menhir_goto_ty_exp _menhir_env _menhir_stack _v) : 'freshtv110)) : 'freshtv112)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv113) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1744 "netlist_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)) : 'freshtv116)) : 'freshtv118)
    | COMMA | IN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        ((let _v : 'tv_ty_exp = 
# 69 "netlist_parser.mly"
              ( TBit )
# 1754 "netlist_parser.ml"
         in
        _menhir_goto_ty_exp _menhir_env _menhir_stack _v) : 'freshtv120)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1764 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)) : 'freshtv124)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_loption_separated_nonempty_list_COMMA_NAME__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_NAME__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | OUTPUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv89) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv87) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | NAME _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | VAR ->
                _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv88)) : 'freshtv90)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv91) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | VAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv101) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv99) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | NAME _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | IN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState9 in
                ((let _v : 'tv_loption_separated_nonempty_list_COMMA_var__ = 
# 57 "standard.mly"
    ( [] )
# 1836 "netlist_parser.ml"
                 in
                _menhir_goto_loption_separated_nonempty_list_COMMA_var__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv100)) : 'freshtv102)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv103) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)) : 'freshtv106)) : 'freshtv108)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_NAME_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_NAME_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1861 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_NAME_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1869 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_COMMA_NAME_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_NAME_ = 
# 146 "standard.mly"
    ( x :: xs )
# 1877 "netlist_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_NAME_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv80)) : 'freshtv82)
    | MenhirState7 | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_NAME_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_COMMA_NAME_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_NAME__ = 
# 59 "standard.mly"
    ( x )
# 1892 "netlist_parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_NAME__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv84)) : 'freshtv86)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_equ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv23) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1911 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv25) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1920 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv27) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1929 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv29) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1938 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv31) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1947 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv33) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1956 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv35) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1965 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv37) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1974 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv39) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1983 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv41) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 1992 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv43) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2001 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv45) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2010 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((((('freshtv47) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2019 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2023 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2027 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((((('freshtv49) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2036 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2040 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2044 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv51) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2053 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2057 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2061 "netlist_parser.ml"
        )) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv53) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2070 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2074 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2078 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv55) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2087 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2091 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2095 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv57) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2104 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2108 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv59) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2117 "netlist_parser.ml"
        )) * _menhir_state) * (
# 23 "netlist_parser.mly"
       (int)
# 2121 "netlist_parser.ml"
        )) * (
# 23 "netlist_parser.mly"
       (int)
# 2125 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv61) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2134 "netlist_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv63) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2143 "netlist_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv65) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2152 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_var__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv69) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_var) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_NAME__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2181 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv78)

and _menhir_reduce19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_separated_nonempty_list_COMMA_NAME__ = 
# 57 "standard.mly"
    ( [] )
# 2195 "netlist_parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_COMMA_NAME__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "netlist_parser.mly"
       (string)
# 2202 "netlist_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2211 "netlist_parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2220 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv11) * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2227 "netlist_parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | NAME _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv12)) : 'freshtv14)
    | OUTPUT | VAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2242 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_NAME_ = 
# 144 "standard.mly"
    ( [ x ] )
# 2248 "netlist_parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_NAME_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state * (
# 24 "netlist_parser.mly"
       (string)
# 2258 "netlist_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 31 "netlist_parser.mly"
      (Netlist_ast.program)
# 2278 "netlist_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_startp = lexbuf.Lexing.lex_start_p;
        _menhir_endp = lexbuf.Lexing.lex_curr_p;
        _menhir_shifted = 1073741823;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = () in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | INPUT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | NAME _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | OUTPUT ->
            _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv2)) : 'freshtv4)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv6)) : 'freshtv8)) : 'freshtv10))



