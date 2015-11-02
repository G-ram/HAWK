type token =
  | PERIOD
  | LBRACE
  | RBRACE
  | AMPERSAND
  | LT
  | GT
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | EQ
  | HASH
  | TILDE
  | CSS_PLUS
  | CSS_GT
  | EOF
  | STRING of (string)
  | ID of (string)
  | TIMES_EQ
  | XOR_EQ
  | DOLLAR_EQ
  | TILDE_EQ

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 30 "parser.ml"
let yytransl_const = [|
  257 (* PERIOD *);
  258 (* LBRACE *);
  259 (* RBRACE *);
  260 (* AMPERSAND *);
  261 (* LT *);
  262 (* GT *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIV *);
  267 (* EQ *);
  268 (* HASH *);
  269 (* TILDE *);
  270 (* CSS_PLUS *);
  271 (* CSS_GT *);
    0 (* EOF *);
  274 (* TIMES_EQ *);
  275 (* XOR_EQ *);
  276 (* DOLLAR_EQ *);
  277 (* TILDE_EQ *);
    0|]

let yytransl_block = [|
  272 (* STRING *);
  273 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\003\000\003\000\
\003\000\004\000\004\000\005\000\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\003\000\002\000\001\000\002\000\
\001\000\001\000\001\000\002\000\002\000\003\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\010\000\000\000\011\000\016\000\
\000\000\000\000\000\000\009\000\012\000\000\000\013\000\001\000\
\000\000\000\000\000\000\006\000\008\000\014\000\000\000\004\000\
\003\000\005\000\000\000\015\000"

let yydgoto = "\002\000\
\008\000\009\000\010\000\011\000\012\000"

let yysindex = "\255\255\
\003\255\000\000\245\254\248\254\000\000\005\255\000\000\000\000\
\023\000\001\255\015\255\000\000\000\000\008\255\000\000\000\000\
\003\255\003\255\003\255\000\000\000\000\000\000\009\255\000\000\
\000\000\000\000\021\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\026\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\011\000\000\000\000\000\020\000"

let yytablesize = 274
let yytable = "\001\000\
\007\000\003\000\004\000\003\000\004\000\013\000\017\000\018\000\
\014\000\005\000\022\000\005\000\006\000\019\000\006\000\003\000\
\004\000\007\000\023\000\007\000\020\000\015\000\016\000\028\000\
\027\000\002\000\006\000\024\000\025\000\026\000\021\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\007\000\007\000\
\000\000\007\000\000\000\000\000\000\000\007\000\000\000\000\000\
\000\000\007\000"

let yycheck = "\001\000\
\000\000\001\001\002\001\001\001\002\001\017\001\006\001\007\001\
\017\001\009\001\003\001\009\001\012\001\013\001\012\001\001\001\
\002\001\017\001\011\001\017\001\010\000\017\001\000\000\003\001\
\016\001\000\000\012\001\017\000\018\000\019\000\011\000\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\006\001\007\001\
\255\255\009\001\255\255\255\255\255\255\013\001\255\255\255\255\
\255\255\017\001"

let yynames_const = "\
  PERIOD\000\
  LBRACE\000\
  RBRACE\000\
  AMPERSAND\000\
  LT\000\
  GT\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  EQ\000\
  HASH\000\
  TILDE\000\
  CSS_PLUS\000\
  CSS_GT\000\
  EOF\000\
  TIMES_EQ\000\
  XOR_EQ\000\
  DOLLAR_EQ\000\
  TILDE_EQ\000\
  "

let yynames_block = "\
  STRING\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    Obj.repr(
# 22 "parser.mly"
                  (_1)
# 201 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 25 "parser.mly"
                     (SingleSelector(_1))
# 208 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple_selector_seq) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'css_selector) in
    Obj.repr(
# 26 "parser.mly"
                                                        (ChainedSelectors(SingleSelector(_1),direct_sibling,_3))
# 216 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple_selector_seq) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'css_selector) in
    Obj.repr(
# 27 "parser.mly"
                                                    (ChainedSelectors(SingleSelector(_1),descendent,_3))
# 224 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple_selector_seq) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'css_selector) in
    Obj.repr(
# 28 "parser.mly"
                                          (ChainedSelectors(SingleSelector(_1),any_sibling,_3))
# 232 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'simple_selector_seq) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'css_selector) in
    Obj.repr(
# 29 "parser.mly"
                                    (ChainedSelectors(SingleSelector(_1),direct_child,_2))
# 240 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_selector) in
    Obj.repr(
# 33 "parser.mly"
               ((_1,[]))
# 247 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 34 "parser.mly"
                                        ((_1,_2))
# 255 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 35 "parser.mly"
                          ((no_type,_1))
# 262 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
       (Universal)
# 268 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 39 "parser.mly"
     (Elt(ID))
# 275 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 42 "parser.mly"
           (ClassMatch(_2))
# 282 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
           (IdMatch(_2))
# 289 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 44 "parser.mly"
                    (AttributeExists(_2))
# 296 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 45 "parser.mly"
                              (AttributeEquals(_2,_4))
# 304 "parser.ml"
               : 'property_selector_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
