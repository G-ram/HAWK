type token =
  | LPAREN
  | RPAREN
  | LBRACK
  | RBRACK
  | LBRACE
  | RBRACE
  | PLUS
  | MINUS
  | TIMES
  | DIVIDES
  | LT
  | GT
  | LEQ
  | GEQ
  | EQ
  | NEQ
  | PERIOD
  | ASSIGN
  | HASH
  | TILDE
  | COMMA
  | COLON
  | UNDER
  | QUEST
  | CARROT
  | VERT
  | FUN
  | SEMI
  | LBRACK_FSLASH
  | FSLASH_RBRACK
  | LBRACK_AMP
  | AMP_RBRACK
  | EOF
  | STRING of (string)
  | CHAR of (char)
  | INT of (int)
  | DOUBLE of (float)
  | ID of (string)
  | BEGIN
  | END
  | ELSE
  | IF
  | RETURN
  | THIS
  | WHILE
  | FOR
  | IN
  | TIMES_EQ
  | XOR_EQ
  | DOLLAR_EQ
  | TILDE_EQ

open Parsing;;
let _ = parse_error;;
# 3 "parser.mly"
 open Ast 
# 59 "parser.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACK *);
  260 (* RBRACK *);
  261 (* LBRACE *);
  262 (* RBRACE *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDES *);
  267 (* LT *);
  268 (* GT *);
  269 (* LEQ *);
  270 (* GEQ *);
  271 (* EQ *);
  272 (* NEQ *);
  273 (* PERIOD *);
  274 (* ASSIGN *);
  275 (* HASH *);
  276 (* TILDE *);
  277 (* COMMA *);
  278 (* COLON *);
  279 (* UNDER *);
  280 (* QUEST *);
  281 (* CARROT *);
  282 (* VERT *);
  283 (* FUN *);
  284 (* SEMI *);
  285 (* LBRACK_FSLASH *);
  286 (* FSLASH_RBRACK *);
  287 (* LBRACK_AMP *);
  288 (* AMP_RBRACK *);
    0 (* EOF *);
  294 (* BEGIN *);
  295 (* END *);
  296 (* ELSE *);
  297 (* IF *);
  298 (* RETURN *);
  299 (* THIS *);
  300 (* WHILE *);
  301 (* FOR *);
  302 (* IN *);
  303 (* TIMES_EQ *);
  304 (* XOR_EQ *);
  305 (* DOLLAR_EQ *);
  306 (* TILDE_EQ *);
    0|]

let yytransl_block = [|
  289 (* STRING *);
  290 (* CHAR *);
  291 (* INT *);
  292 (* DOUBLE *);
  293 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\004\000\003\000\003\000\006\000\005\000\005\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\010\000\010\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\014\000\014\000\013\000\013\000\013\000\
\013\000\012\000\012\000\015\000\015\000\016\000\018\000\018\000\
\019\000\020\000\020\000\017\000\017\000\011\000\021\000\021\000\
\007\000\007\000\024\000\024\000\024\000\024\000\024\000\024\000\
\024\000\023\000\023\000\026\000\026\000\026\000\026\000\026\000\
\025\000\025\000\022\000\022\000\022\000\022\000\022\000\027\000\
\027\000\028\000\028\000\030\000\030\000\029\000\029\000\031\000\
\031\000\031\000\031\000\031\000\031\000\031\000\031\000\000\000"

let yylen = "\002\000\
\004\000\004\000\004\000\000\000\002\000\004\000\000\000\002\000\
\002\000\003\000\003\000\005\000\007\000\005\000\007\000\002\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\004\000\003\000\002\000\000\000\003\000\001\000\001\000\001\000\
\001\000\001\000\001\000\002\000\003\000\003\000\001\000\003\000\
\003\000\001\000\001\000\001\000\003\000\007\000\000\000\003\000\
\003\000\003\000\001\000\003\000\003\000\002\000\002\000\002\000\
\003\000\001\000\002\000\001\000\001\000\003\000\001\000\002\000\
\001\000\002\000\001\000\003\000\003\000\003\000\002\000\001\000\
\001\000\001\000\002\000\001\000\001\000\001\000\002\000\002\000\
\002\000\003\000\005\000\005\000\005\000\005\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\096\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\039\000\
\038\000\040\000\000\000\000\000\000\000\041\000\000\000\000\000\
\000\000\000\000\000\000\020\000\000\000\000\000\059\000\000\000\
\000\000\000\000\084\000\000\000\000\000\085\000\000\000\075\000\
\080\000\081\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\000\000\000\000\017\000\042\000\043\000\000\000\035\000\
\000\000\016\000\036\000\000\000\000\000\000\000\000\000\000\000\
\000\000\002\000\008\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\009\000\000\000\071\000\
\000\000\068\000\000\000\000\000\000\000\058\000\063\000\064\000\
\062\000\000\000\067\000\000\000\088\000\089\000\000\000\000\000\
\000\000\057\000\079\000\083\000\087\000\000\000\001\000\000\000\
\044\000\000\000\000\000\000\000\000\000\000\000\047\000\000\000\
\034\000\011\000\055\000\000\000\000\000\031\000\000\000\010\000\
\000\000\000\000\000\000\000\000\021\000\022\000\000\000\000\000\
\000\000\000\000\000\000\000\000\060\000\072\000\000\000\061\000\
\074\000\065\000\090\000\000\000\000\000\000\000\000\000\000\000\
\076\000\077\000\078\000\000\000\006\000\000\000\045\000\046\000\
\000\000\000\000\000\000\032\000\000\000\033\000\000\000\000\000\
\000\000\070\000\000\000\000\000\000\000\000\000\000\000\003\000\
\053\000\051\000\050\000\048\000\049\000\000\000\000\000\037\000\
\000\000\014\000\000\000\091\000\092\000\093\000\094\000\095\000\
\000\000\056\000\000\000\000\000\000\000\013\000\015\000\054\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\046\000\025\000\010\000\011\000\026\000\
\027\000\051\000\058\000\052\000\028\000\116\000\053\000\054\000\
\109\000\110\000\111\000\112\000\155\000\039\000\032\000\033\000\
\084\000\085\000\040\000\041\000\042\000\043\000\044\000"

let yysindex = "\008\000\
\238\254\000\000\016\255\000\000\242\254\091\255\004\255\015\255\
\243\254\242\254\031\255\011\255\091\255\048\255\001\255\000\000\
\000\000\000\000\077\255\054\255\011\255\000\000\081\255\089\255\
\105\255\091\255\061\000\000\000\004\255\223\255\000\000\099\255\
\116\255\060\255\000\000\084\255\100\255\000\000\132\255\000\000\
\000\000\000\000\162\255\162\255\145\255\154\000\000\000\091\255\
\067\255\071\000\155\255\000\000\000\000\000\000\161\255\000\000\
\170\255\000\000\000\000\143\255\011\255\011\255\152\255\011\255\
\147\255\000\000\000\000\048\255\048\255\048\255\048\255\048\255\
\048\255\048\255\048\255\048\255\048\255\000\000\019\000\000\000\
\223\255\000\000\174\255\182\255\223\255\000\000\000\000\000\000\
\000\000\004\255\000\000\021\255\000\000\000\000\015\255\015\255\
\015\255\000\000\000\000\000\000\000\000\091\255\000\000\181\255\
\000\000\000\000\000\000\179\255\195\255\002\255\000\000\180\255\
\000\000\000\000\000\000\009\255\202\255\000\000\203\255\000\000\
\205\255\164\255\065\255\065\255\000\000\000\000\255\255\255\255\
\255\255\255\255\083\000\083\000\000\000\000\000\184\255\000\000\
\000\000\000\000\000\000\186\255\187\255\191\255\192\255\206\255\
\000\000\000\000\000\000\222\255\000\000\023\000\000\000\000\000\
\252\254\023\000\020\255\000\000\011\255\000\000\091\255\091\255\
\207\255\000\000\234\255\241\255\254\255\006\000\009\000\000\000\
\000\000\000\000\000\000\000\000\000\000\238\255\231\255\000\000\
\236\255\000\000\020\000\000\000\000\000\000\000\000\000\000\000\
\091\255\000\000\091\255\091\255\253\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\242\255\024\000\000\000\000\000\
\000\000\242\255\000\000\000\000\024\000\000\000\000\000\000\000\
\000\000\000\000\183\255\000\000\000\000\000\000\000\000\000\000\
\000\000\024\000\000\000\000\000\000\000\000\000\000\000\000\000\
\010\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\136\255\146\255\000\000\000\000\000\000\024\000\
\000\000\149\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\097\255\000\000\025\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\024\000\000\000\000\000\
\000\000\141\255\153\255\032\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\201\255\219\255\000\000\000\000\239\255\003\000\
\021\000\039\000\012\255\221\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\071\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\017\001\000\000\243\255\000\000\000\000\001\000\
\245\255\237\255\000\000\000\000\211\255\000\000\000\000\000\000\
\145\000\000\000\147\000\000\000\000\000\000\000\013\001\233\255\
\218\000\223\000\247\255\018\001\050\000\000\000\000\000"

let yytablesize = 353
let yytable = "\055\000\
\050\000\063\000\056\000\108\000\029\000\079\000\030\000\152\000\
\001\000\050\000\156\000\012\000\067\000\025\000\007\000\049\000\
\008\000\034\000\014\000\003\000\006\000\174\000\153\000\035\000\
\139\000\045\000\025\000\025\000\170\000\157\000\171\000\036\000\
\025\000\037\000\104\000\048\000\031\000\057\000\140\000\025\000\
\175\000\118\000\119\000\016\000\121\000\017\000\018\000\019\000\
\012\000\050\000\050\000\038\000\050\000\022\000\062\000\014\000\
\123\000\124\000\125\000\126\000\127\000\128\000\129\000\130\000\
\131\000\132\000\138\000\141\000\142\000\143\000\144\000\012\000\
\105\000\070\000\071\000\012\000\012\000\059\000\012\000\060\000\
\016\000\064\000\017\000\018\000\019\000\145\000\146\000\147\000\
\148\000\065\000\022\000\012\000\100\000\101\000\061\000\013\000\
\092\000\012\000\014\000\106\000\069\000\107\000\018\000\012\000\
\108\000\012\000\012\000\012\000\173\000\022\000\066\000\012\000\
\012\000\012\000\012\000\012\000\029\000\015\000\030\000\069\000\
\093\000\069\000\087\000\016\000\088\000\017\000\018\000\019\000\
\086\000\069\000\069\000\020\000\021\000\022\000\023\000\024\000\
\094\000\176\000\095\000\089\000\035\000\090\000\082\000\096\000\
\082\000\050\000\039\000\082\000\031\000\102\000\018\000\097\000\
\086\000\103\000\086\000\082\000\113\000\086\000\038\000\177\000\
\178\000\039\000\051\000\098\000\034\000\086\000\114\000\082\000\
\038\000\018\000\115\000\189\000\082\000\038\000\050\000\117\000\
\018\000\086\000\036\000\120\000\037\000\135\000\086\000\122\000\
\019\000\136\000\149\000\190\000\191\000\019\000\019\000\019\000\
\019\000\019\000\019\000\019\000\019\000\019\000\019\000\150\000\
\151\000\154\000\024\000\019\000\159\000\158\000\160\000\024\000\
\024\000\161\000\019\000\024\000\024\000\024\000\024\000\024\000\
\024\000\162\000\163\000\164\000\023\000\024\000\030\000\165\000\
\166\000\023\000\023\000\168\000\024\000\023\000\023\000\023\000\
\023\000\023\000\023\000\030\000\030\000\180\000\167\000\023\000\
\026\000\030\000\185\000\179\000\181\000\080\000\023\000\081\000\
\030\000\026\000\026\000\026\000\026\000\026\000\026\000\082\000\
\083\000\182\000\192\000\026\000\027\000\068\000\069\000\070\000\
\071\000\183\000\026\000\186\000\184\000\027\000\027\000\027\000\
\027\000\027\000\027\000\187\000\133\000\188\000\028\000\027\000\
\004\000\087\000\047\000\088\000\073\000\007\000\027\000\028\000\
\028\000\028\000\028\000\028\000\028\000\052\000\169\000\066\000\
\029\000\028\000\089\000\172\000\090\000\091\000\137\000\134\000\
\028\000\029\000\029\000\029\000\029\000\029\000\029\000\016\000\
\099\000\017\000\018\000\029\000\000\000\000\000\000\000\000\000\
\000\000\022\000\029\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\068\000\069\000\070\000\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\000\000\
\078\000\068\000\069\000\070\000\071\000\072\000\073\000\074\000\
\075\000"

let yycheck = "\013\000\
\012\000\021\000\014\000\049\000\001\001\029\000\003\001\006\001\
\001\000\021\000\002\001\001\001\026\000\002\001\029\001\005\001\
\031\001\003\001\008\001\038\001\005\001\002\001\021\001\009\001\
\004\001\039\001\015\001\016\001\033\001\021\001\035\001\017\001\
\021\001\019\001\048\000\005\001\033\001\037\001\018\001\028\001\
\021\001\061\000\062\000\033\001\064\000\035\001\036\001\037\001\
\001\001\061\000\062\000\037\001\064\000\043\001\001\001\008\001\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\090\000\047\001\048\001\049\001\050\001\001\001\
\006\001\009\001\010\001\005\001\006\001\001\001\008\001\003\001\
\033\001\001\001\035\001\036\001\037\001\095\000\096\000\097\000\
\102\000\001\001\043\001\001\001\043\000\044\000\018\001\005\001\
\037\001\027\001\008\001\033\001\004\001\035\001\036\001\033\001\
\150\000\035\001\036\001\037\001\154\000\043\001\006\001\041\001\
\042\001\043\001\044\001\045\001\001\001\027\001\003\001\023\001\
\037\001\025\001\007\001\033\001\009\001\035\001\036\001\037\001\
\030\001\033\001\034\001\041\001\042\001\043\001\044\001\045\001\
\037\001\157\000\007\001\024\001\009\001\026\001\007\001\012\001\
\009\001\157\000\006\001\012\001\033\001\005\001\002\001\020\001\
\007\001\000\000\009\001\020\001\002\001\012\001\006\001\159\000\
\160\000\021\001\022\001\032\001\003\001\020\001\006\001\032\001\
\037\001\021\001\001\001\185\000\037\001\021\001\022\001\033\001\
\028\001\032\001\017\001\028\001\019\001\008\001\037\001\037\001\
\002\001\004\001\006\001\187\000\188\000\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\021\001\
\006\001\022\001\002\001\021\001\002\001\004\001\002\001\007\001\
\008\001\046\001\028\001\011\001\012\001\013\001\014\001\015\001\
\016\001\034\001\033\001\033\001\002\001\021\001\002\001\033\001\
\033\001\007\001\008\001\006\001\028\001\011\001\012\001\013\001\
\014\001\015\001\016\001\015\001\016\001\004\001\033\001\021\001\
\002\001\021\001\005\001\037\001\004\001\023\001\028\001\025\001\
\028\001\011\001\012\001\013\001\014\001\015\001\016\001\033\001\
\034\001\004\001\006\001\021\001\002\001\007\001\008\001\009\001\
\010\001\004\001\028\001\037\001\004\001\011\001\012\001\013\001\
\014\001\015\001\016\001\040\001\002\001\002\001\002\001\021\001\
\039\001\007\001\010\000\009\001\004\001\006\001\028\001\011\001\
\012\001\013\001\014\001\015\001\016\001\006\001\150\000\030\001\
\002\001\021\001\024\001\153\000\026\001\033\000\085\000\081\000\
\028\001\011\001\012\001\013\001\014\001\015\001\016\001\033\001\
\039\000\035\001\036\001\021\001\255\255\255\255\255\255\255\255\
\255\255\043\001\028\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\255\255\
\028\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACK\000\
  RBRACK\000\
  LBRACE\000\
  RBRACE\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDES\000\
  LT\000\
  GT\000\
  LEQ\000\
  GEQ\000\
  EQ\000\
  NEQ\000\
  PERIOD\000\
  ASSIGN\000\
  HASH\000\
  TILDE\000\
  COMMA\000\
  COLON\000\
  UNDER\000\
  QUEST\000\
  CARROT\000\
  VERT\000\
  FUN\000\
  SEMI\000\
  LBRACK_FSLASH\000\
  FSLASH_RBRACK\000\
  LBRACK_AMP\000\
  AMP_RBRACK\000\
  EOF\000\
  BEGIN\000\
  END\000\
  ELSE\000\
  IF\000\
  RETURN\000\
  THIS\000\
  WHILE\000\
  FOR\000\
  IN\000\
  TIMES_EQ\000\
  XOR_EQ\000\
  DOLLAR_EQ\000\
  TILDE_EQ\000\
  "

let yynames_block = "\
  STRING\000\
  CHAR\000\
  INT\000\
  DOUBLE\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'begin_stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'pattern_action_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'end_stmt) in
    Obj.repr(
# 47 "parser.mly"
                                             ( {begin_stmt = _1;
													pattern_actions = _2;
													end_stmt = _3} )
# 398 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 52 "parser.mly"
                               (Block(_3))
# 405 "parser.ml"
               : 'begin_stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 54 "parser.mly"
                             (Block(_3))
# 412 "parser.ml"
               : 'end_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
       ([])
# 418 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pattern_action) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_action_list) in
    Obj.repr(
# 58 "parser.mly"
                                      (_1 :: _2)
# 426 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 61 "parser.mly"
                                 ( (_1,Block(_3)) )
# 434 "parser.ml"
               : 'pattern_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
       ([])
# 440 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 69 "parser.mly"
                  (_1 :: _2)
# 448 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr_no_brace) in
    Obj.repr(
# 72 "parser.mly"
                    (Expr(_1))
# 455 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                    (Return(_2))
# 462 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 74 "parser.mly"
                           (Block(_2))
# 469 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 75 "parser.mly"
                                           ( If(_3,_5, Block([])))
# 477 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 76 "parser.mly"
                                        ( If(_3,_5,_7) )
# 486 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 77 "parser.mly"
                                 ( While(_3,_5) )
# 494 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                   ( For(_3,_5,_7) )
# 503 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'func_decl) in
    Obj.repr(
# 79 "parser.mly"
                 (Func(_2))
# 510 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'table_literal) in
    Obj.repr(
# 82 "parser.mly"
                  (Literal(TableLiteral(_1)))
# 517 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 84 "parser.mly"
                    (_1)
# 524 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 88 "parser.mly"
       (Id(_1))
# 531 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 89 "parser.mly"
           (Literal(_1))
# 538 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 90 "parser.mly"
                                     (Binop(_1,Times,_3))
# 546 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 91 "parser.mly"
                                       (Binop(_1,Divides,_3))
# 554 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 92 "parser.mly"
                                     (Binop(_1,Minus,_3))
# 562 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 93 "parser.mly"
                                    (Binop(_1,Plus,_3))
# 570 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 94 "parser.mly"
                                  (Binop(_1,Equal,_3))
# 578 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 95 "parser.mly"
                                  (Binop(_1,Less,_3))
# 586 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 96 "parser.mly"
                                  (Binop(_1,Greater,_3))
# 594 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 97 "parser.mly"
                                   (Binop(_1,LessEqual,_3))
# 602 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 98 "parser.mly"
                                   (Binop(_1,GreaterEqual,_3))
# 610 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 99 "parser.mly"
                                   (Binop(_1,NotEqual,_3))
# 618 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                  (Assign(_1,_3))
# 626 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 101 "parser.mly"
                              (Call(_1,_3))
# 634 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 102 "parser.mly"
                           (TableAccess(_1,_3))
# 642 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                         (_2)
# 649 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 104 "parser.mly"
                                       (Uminus(_2))
# 656 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
       ( [] )
# 662 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                        ( _3 :: _1 )
# 670 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 111 "parser.mly"
     (IntLiteral(_1))
# 677 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parser.mly"
         (StringLiteral(_1))
# 684 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 113 "parser.mly"
         (DoubleLiteral(_1))
# 691 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
          (This)
# 697 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'array_literal) in
    Obj.repr(
# 117 "parser.mly"
               (_1)
# 704 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue_literal) in
    Obj.repr(
# 118 "parser.mly"
                   (KeyValueLiteral(_1))
# 711 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
                  ( EmptyTable )
# 717 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'literal_list) in
    Obj.repr(
# 122 "parser.mly"
                             (ArrayLiteral(_2))
# 724 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'keyvalue_list) in
    Obj.repr(
# 125 "parser.mly"
                             (_2)
# 731 "parser.ml"
               : 'keyvalue_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 128 "parser.mly"
          ( [_1] )
# 738 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'keyvalue_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 129 "parser.mly"
                               ( _3 :: _1)
# 746 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'key) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 132 "parser.mly"
                    ( (_1,_3) )
# 754 "parser.ml"
               : 'keyvalue))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 135 "parser.mly"
        (IntKey(_1))
# 761 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 136 "parser.mly"
            (StringKey(_1))
# 768 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 139 "parser.mly"
         ( [_1] )
# 775 "parser.ml"
               : 'literal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'literal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'literal_list) in
    Obj.repr(
# 140 "parser.mly"
                              ( _1 :: _3)
# 783 "parser.ml"
               : 'literal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'params_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 143 "parser.mly"
                                                      ( {fname=_1;
															params=_3;
															body=_6;
														})
# 795 "parser.ml"
               : 'func_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "parser.mly"
       ( [] )
# 801 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 150 "parser.mly"
                        (_3::_1)
# 809 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    Obj.repr(
# 153 "parser.mly"
                                    (CssPattern(_2))
# 816 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 154 "parser.mly"
                                              (RegexPattern(_2))
# 823 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 161 "parser.mly"
        (RegexString(_1))
# 830 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 162 "parser.mly"
                       (RegexNested(_2))
# 837 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 163 "parser.mly"
                                    (RegexSet(_2))
# 844 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 164 "parser.mly"
               (RegexUnOp(_1,Optional))
# 851 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 165 "parser.mly"
              (RegexUnOp(_1,KleenePlus))
# 858 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 166 "parser.mly"
               (RegexUnOp(_1,KleeneTimes))
# 865 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'regex) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 167 "parser.mly"
                    (RegexBinOp(_1,Or,_3))
# 873 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 170 "parser.mly"
       ([_1])
# 880 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_sequence) in
    Obj.repr(
# 171 "parser.mly"
                        (_1 :: _2)
# 888 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 174 "parser.mly"
         (RegexStringSet(_1))
# 895 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 175 "parser.mly"
        (RegexCharSet(_1))
# 902 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 176 "parser.mly"
                    (RegexCharRangeSet(_1, _3))
# 910 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    Obj.repr(
# 177 "parser.mly"
         (RegexAnyCharSet)
# 916 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 178 "parser.mly"
                    (RegexComplementSet(_2))
# 923 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 181 "parser.mly"
           ([_1])
# 930 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set_sequence) in
    Obj.repr(
# 182 "parser.mly"
                                (_1 :: _2)
# 938 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 188 "parser.mly"
                     (SingleSelector(_1))
# 945 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 189 "parser.mly"
                                         (ChainedSelectors(_1,DirectSibling,_3))
# 953 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 190 "parser.mly"
                                       (ChainedSelectors(_1,Descendent,_3))
# 961 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 191 "parser.mly"
                                          (ChainedSelectors(_1,AnySibling,_3))
# 969 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 192 "parser.mly"
                                          (ChainedSelectors(_1,DirectChild,_2))
# 977 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 195 "parser.mly"
                           (_1)
# 984 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 196 "parser.mly"
                          ((NoType,_1))
# 991 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_selector) in
    Obj.repr(
# 199 "parser.mly"
               ((_1,[]))
# 998 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 200 "parser.mly"
                                        ((_1,_2))
# 1006 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 203 "parser.mly"
       (Universal)
# 1012 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 204 "parser.mly"
     (Elt(_1))
# 1019 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector) in
    Obj.repr(
# 207 "parser.mly"
                   ( [_1])
# 1026 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'property_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 208 "parser.mly"
                                            ( _1::_2)
# 1034 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 211 "parser.mly"
           (ClassMatch(_2))
# 1041 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 212 "parser.mly"
           (IdMatch(_2))
# 1048 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 213 "parser.mly"
                    (AttributeExists(_2))
# 1055 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 214 "parser.mly"
                                  (AttributeEquals(_2,_4))
# 1063 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 215 "parser.mly"
                                    (AttributeContains(_2,_4))
# 1071 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 216 "parser.mly"
                                  (AttributeBeginsWith(_2,_4))
# 1079 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 217 "parser.mly"
                                     (AttributeEndsWith(_2,_4))
# 1087 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 218 "parser.mly"
                                    (AttributeWhitespaceContains(_2,_4))
# 1095 "parser.ml"
               : 'property_selector))
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
