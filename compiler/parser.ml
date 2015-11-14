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
\009\000\009\000\009\000\014\000\014\000\014\000\013\000\013\000\
\013\000\013\000\012\000\012\000\015\000\015\000\016\000\018\000\
\018\000\019\000\020\000\020\000\017\000\017\000\011\000\021\000\
\021\000\007\000\007\000\024\000\024\000\024\000\024\000\024\000\
\024\000\024\000\023\000\023\000\026\000\026\000\026\000\026\000\
\026\000\025\000\025\000\022\000\022\000\022\000\022\000\022\000\
\027\000\027\000\028\000\028\000\030\000\030\000\029\000\029\000\
\031\000\031\000\031\000\031\000\031\000\031\000\031\000\031\000\
\000\000"

let yylen = "\002\000\
\004\000\004\000\004\000\000\000\002\000\004\000\000\000\002\000\
\002\000\003\000\003\000\005\000\007\000\005\000\007\000\002\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\004\000\003\000\002\000\000\000\001\000\003\000\001\000\001\000\
\001\000\001\000\001\000\001\000\002\000\003\000\003\000\001\000\
\003\000\003\000\001\000\001\000\001\000\003\000\007\000\000\000\
\003\000\003\000\003\000\001\000\003\000\003\000\002\000\002\000\
\002\000\003\000\001\000\002\000\001\000\001\000\003\000\001\000\
\002\000\001\000\002\000\001\000\003\000\003\000\003\000\002\000\
\001\000\001\000\001\000\002\000\001\000\001\000\001\000\002\000\
\002\000\002\000\003\000\005\000\005\000\005\000\005\000\005\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\097\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\040\000\
\039\000\041\000\000\000\000\000\000\000\042\000\000\000\000\000\
\000\000\000\000\000\000\020\000\000\000\000\000\060\000\000\000\
\000\000\000\000\085\000\000\000\000\000\086\000\000\000\076\000\
\081\000\082\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\000\000\000\000\017\000\043\000\044\000\000\000\035\000\
\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\002\000\008\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\009\000\000\000\072\000\
\000\000\069\000\000\000\000\000\000\000\059\000\064\000\065\000\
\063\000\000\000\068\000\000\000\089\000\090\000\000\000\000\000\
\000\000\058\000\080\000\084\000\088\000\000\000\001\000\000\000\
\045\000\000\000\000\000\000\000\000\000\000\000\048\000\000\000\
\034\000\011\000\056\000\037\000\000\000\000\000\031\000\000\000\
\010\000\000\000\000\000\000\000\000\000\021\000\022\000\000\000\
\000\000\000\000\000\000\000\000\000\000\061\000\073\000\000\000\
\062\000\075\000\066\000\091\000\000\000\000\000\000\000\000\000\
\000\000\077\000\078\000\079\000\000\000\006\000\000\000\046\000\
\047\000\000\000\000\000\000\000\032\000\000\000\033\000\000\000\
\000\000\000\000\071\000\000\000\000\000\000\000\000\000\000\000\
\003\000\054\000\052\000\051\000\049\000\050\000\000\000\000\000\
\038\000\000\000\014\000\000\000\092\000\093\000\094\000\095\000\
\096\000\000\000\057\000\000\000\000\000\000\000\013\000\015\000\
\055\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\046\000\025\000\010\000\011\000\026\000\
\027\000\051\000\058\000\052\000\028\000\117\000\053\000\054\000\
\109\000\110\000\111\000\112\000\156\000\039\000\032\000\033\000\
\084\000\085\000\040\000\041\000\042\000\043\000\044\000"

let yysindex = "\015\000\
\239\254\000\000\024\255\000\000\023\255\085\255\008\255\009\255\
\016\255\023\255\042\255\132\255\085\255\048\255\035\255\000\000\
\000\000\000\000\014\255\081\255\132\255\000\000\087\255\091\255\
\096\255\085\255\063\000\000\000\008\255\125\255\000\000\074\255\
\148\255\099\255\000\000\101\255\133\255\000\000\134\255\000\000\
\000\000\000\000\084\255\084\255\106\255\156\000\000\000\085\255\
\001\255\073\000\174\255\000\000\000\000\000\000\180\255\000\000\
\187\255\000\000\132\255\156\255\132\255\132\255\176\255\132\255\
\172\255\000\000\000\000\048\255\048\255\048\255\048\255\048\255\
\048\255\048\255\048\255\048\255\048\255\000\000\238\255\000\000\
\125\255\000\000\204\255\216\255\125\255\000\000\000\000\000\000\
\000\000\008\255\000\000\021\255\000\000\000\000\009\255\009\255\
\009\255\000\000\000\000\000\000\000\000\085\255\000\000\215\255\
\000\000\000\000\000\000\201\255\219\255\139\255\000\000\205\255\
\000\000\000\000\000\000\000\000\006\255\222\255\000\000\228\255\
\000\000\236\255\193\255\122\255\122\255\000\000\000\000\154\255\
\154\255\154\255\154\255\085\000\085\000\000\000\000\000\209\255\
\000\000\000\000\000\000\000\000\213\255\223\255\224\255\225\255\
\230\255\000\000\000\000\000\000\242\255\000\000\243\254\000\000\
\000\000\065\255\243\254\012\255\000\000\132\255\000\000\085\255\
\085\255\207\255\000\000\005\000\006\000\014\000\016\000\020\000\
\000\000\000\000\000\000\000\000\000\000\000\000\018\000\244\255\
\000\000\252\255\000\000\003\000\000\000\000\000\000\000\000\000\
\000\000\085\255\000\000\085\255\085\255\013\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\254\255\021\000\000\000\000\000\
\000\000\254\255\000\000\000\000\021\000\000\000\000\000\000\000\
\000\000\000\000\185\255\000\000\000\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\
\008\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\170\255\171\255\000\000\000\000\000\000\021\000\
\000\000\003\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\017\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\119\255\000\000\022\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\021\000\000\000\000\000\
\000\000\073\255\113\255\036\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\203\255\221\255\000\000\000\000\239\255\
\001\000\019\000\037\000\039\000\041\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\072\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\018\001\000\000\243\255\000\000\000\000\192\255\
\245\255\237\255\000\000\000\000\211\255\000\000\000\000\000\000\
\149\000\000\000\147\000\000\000\000\000\000\000\013\001\233\255\
\230\000\236\000\235\255\024\001\141\000\000\000\000\000"

let yytablesize = 355
let yytable = "\055\000\
\050\000\063\000\056\000\108\000\018\000\079\000\105\000\157\000\
\029\000\050\000\030\000\034\000\067\000\175\000\059\000\001\000\
\060\000\035\000\036\000\016\000\003\000\017\000\018\000\018\000\
\140\000\036\000\158\000\037\000\006\000\022\000\018\000\061\000\
\176\000\106\000\104\000\107\000\018\000\036\000\141\000\116\000\
\031\000\119\000\120\000\022\000\122\000\038\000\048\000\050\000\
\012\000\050\000\050\000\007\000\050\000\008\000\045\000\014\000\
\124\000\125\000\126\000\127\000\128\000\129\000\130\000\131\000\
\132\000\133\000\139\000\142\000\143\000\144\000\145\000\057\000\
\012\000\146\000\147\000\148\000\012\000\012\000\040\000\012\000\
\016\000\062\000\017\000\018\000\019\000\012\000\034\000\064\000\
\149\000\013\000\022\000\065\000\014\000\040\000\052\000\178\000\
\179\000\171\000\012\000\172\000\036\000\066\000\037\000\086\000\
\012\000\108\000\012\000\012\000\012\000\174\000\102\000\015\000\
\012\000\012\000\012\000\012\000\012\000\016\000\039\000\017\000\
\018\000\019\000\070\000\191\000\192\000\020\000\021\000\022\000\
\023\000\024\000\070\000\071\000\012\000\039\000\051\000\092\000\
\049\000\093\000\177\000\014\000\095\000\070\000\035\000\070\000\
\153\000\096\000\050\000\080\000\029\000\081\000\030\000\070\000\
\070\000\097\000\087\000\103\000\088\000\082\000\083\000\154\000\
\068\000\069\000\070\000\071\000\016\000\098\000\017\000\018\000\
\019\000\094\000\038\000\089\000\190\000\090\000\022\000\113\000\
\083\000\087\000\083\000\087\000\031\000\083\000\087\000\100\000\
\101\000\114\000\019\000\115\000\118\000\083\000\087\000\019\000\
\019\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
\019\000\083\000\087\000\121\000\024\000\019\000\083\000\087\000\
\123\000\024\000\024\000\136\000\019\000\024\000\024\000\024\000\
\024\000\024\000\024\000\137\000\150\000\151\000\023\000\024\000\
\152\000\159\000\155\000\023\000\023\000\160\000\024\000\023\000\
\023\000\023\000\023\000\023\000\023\000\161\000\162\000\134\000\
\026\000\023\000\163\000\180\000\087\000\164\000\088\000\169\000\
\023\000\026\000\026\000\026\000\026\000\026\000\026\000\165\000\
\166\000\167\000\027\000\026\000\189\000\089\000\168\000\090\000\
\181\000\182\000\026\000\027\000\027\000\027\000\027\000\027\000\
\027\000\183\000\193\000\184\000\028\000\027\000\186\000\185\000\
\187\000\074\000\007\000\047\000\027\000\028\000\028\000\028\000\
\028\000\028\000\028\000\188\000\004\000\067\000\029\000\028\000\
\025\000\053\000\030\000\170\000\173\000\091\000\028\000\029\000\
\029\000\029\000\029\000\029\000\029\000\025\000\025\000\030\000\
\030\000\029\000\138\000\025\000\135\000\030\000\099\000\000\000\
\029\000\000\000\025\000\000\000\030\000\068\000\069\000\070\000\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\076\000\
\077\000\000\000\078\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000"

let yycheck = "\013\000\
\012\000\021\000\014\000\049\000\002\001\029\000\006\001\002\001\
\001\001\021\000\003\001\003\001\026\000\002\001\001\001\001\000\
\003\001\009\001\002\001\033\001\038\001\035\001\036\001\021\001\
\004\001\017\001\021\001\019\001\005\001\043\001\028\001\018\001\
\021\001\033\001\048\000\035\001\036\001\021\001\018\001\059\000\
\033\001\061\000\062\000\043\001\064\000\037\001\005\001\059\000\
\001\001\061\000\062\000\029\001\064\000\031\001\039\001\008\001\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\090\000\047\001\048\001\049\001\050\001\037\001\
\001\001\095\000\096\000\097\000\005\001\006\001\006\001\008\001\
\033\001\001\001\035\001\036\001\037\001\001\001\003\001\001\001\
\102\000\005\001\043\001\001\001\008\001\021\001\022\001\160\000\
\161\000\033\001\027\001\035\001\017\001\006\001\019\001\030\001\
\033\001\151\000\035\001\036\001\037\001\155\000\005\001\027\001\
\041\001\042\001\043\001\044\001\045\001\033\001\006\001\035\001\
\036\001\037\001\004\001\188\000\189\000\041\001\042\001\043\001\
\044\001\045\001\009\001\010\001\001\001\021\001\022\001\037\001\
\005\001\037\001\158\000\008\001\007\001\023\001\009\001\025\001\
\006\001\012\001\158\000\023\001\001\001\025\001\003\001\033\001\
\034\001\020\001\007\001\000\000\009\001\033\001\034\001\021\001\
\007\001\008\001\009\001\010\001\033\001\032\001\035\001\036\001\
\037\001\037\001\037\001\024\001\186\000\026\001\043\001\002\001\
\007\001\007\001\009\001\009\001\033\001\012\001\012\001\043\000\
\044\000\006\001\002\001\001\001\033\001\020\001\020\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\032\001\032\001\028\001\002\001\021\001\037\001\037\001\
\037\001\007\001\008\001\008\001\028\001\011\001\012\001\013\001\
\014\001\015\001\016\001\004\001\006\001\021\001\002\001\021\001\
\006\001\004\001\022\001\007\001\008\001\002\001\028\001\011\001\
\012\001\013\001\014\001\015\001\016\001\002\001\046\001\002\001\
\002\001\021\001\034\001\037\001\007\001\033\001\009\001\006\001\
\028\001\011\001\012\001\013\001\014\001\015\001\016\001\033\001\
\033\001\033\001\002\001\021\001\002\001\024\001\033\001\026\001\
\004\001\004\001\028\001\011\001\012\001\013\001\014\001\015\001\
\016\001\004\001\006\001\004\001\002\001\021\001\005\001\004\001\
\037\001\004\001\006\001\010\000\028\001\011\001\012\001\013\001\
\014\001\015\001\016\001\040\001\039\001\030\001\002\001\021\001\
\002\001\006\001\002\001\151\000\154\000\033\000\028\001\011\001\
\012\001\013\001\014\001\015\001\016\001\015\001\016\001\015\001\
\016\001\021\001\085\000\021\001\081\000\021\001\039\000\255\255\
\028\001\255\255\028\001\255\255\028\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\255\255\028\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001"

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
# 403 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 52 "parser.mly"
                               (Block(_3))
# 410 "parser.ml"
               : 'begin_stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 54 "parser.mly"
                             (Block(_3))
# 417 "parser.ml"
               : 'end_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
       ([])
# 423 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pattern_action) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_action_list) in
    Obj.repr(
# 58 "parser.mly"
                                      (_1 :: _2)
# 431 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 61 "parser.mly"
                                 ( (_1,Block(_3)) )
# 439 "parser.ml"
               : 'pattern_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
       ([])
# 445 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 69 "parser.mly"
                  (_1 :: _2)
# 453 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr_no_brace) in
    Obj.repr(
# 72 "parser.mly"
                    (Expr(_1))
# 460 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                    (Return(_2))
# 467 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 74 "parser.mly"
                           (Block(_2))
# 474 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 75 "parser.mly"
                                           ( If(_3,_5, Block([])))
# 482 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 76 "parser.mly"
                                        ( If(_3,_5,_7) )
# 491 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 77 "parser.mly"
                                 ( While(_3,_5) )
# 499 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                   ( For(_3,_5,_7) )
# 508 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'func_decl) in
    Obj.repr(
# 79 "parser.mly"
                 (Func(_2))
# 515 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'table_literal) in
    Obj.repr(
# 82 "parser.mly"
                  (Literal(TableLiteral(_1)))
# 522 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 84 "parser.mly"
                    (_1)
# 529 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 88 "parser.mly"
       (Id(_1))
# 536 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 89 "parser.mly"
           (Literal(_1))
# 543 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 90 "parser.mly"
                                     (Binop(_1,Times,_3))
# 551 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 91 "parser.mly"
                                       (Binop(_1,Divides,_3))
# 559 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 92 "parser.mly"
                                     (Binop(_1,Minus,_3))
# 567 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 93 "parser.mly"
                                    (Binop(_1,Plus,_3))
# 575 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 94 "parser.mly"
                                  (Binop(_1,Equal,_3))
# 583 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 95 "parser.mly"
                                  (Binop(_1,Less,_3))
# 591 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 96 "parser.mly"
                                  (Binop(_1,Greater,_3))
# 599 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 97 "parser.mly"
                                   (Binop(_1,LessEqual,_3))
# 607 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 98 "parser.mly"
                                   (Binop(_1,GreaterEqual,_3))
# 615 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 99 "parser.mly"
                                   (Binop(_1,NotEqual,_3))
# 623 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                  (Assign(_1,_3))
# 631 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 101 "parser.mly"
                              (Call(_1,_3))
# 639 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 102 "parser.mly"
                           (TableAccess(_1,_3))
# 647 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                         (_2)
# 654 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 104 "parser.mly"
                                       (Uminus(_2))
# 661 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
       ( [] )
# 667 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
        ( [_1] )
# 674 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                        ( _3 :: _1 )
# 682 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 112 "parser.mly"
     (IntLiteral(_1))
# 689 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "parser.mly"
         (StringLiteral(_1))
# 696 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 114 "parser.mly"
         (DoubleLiteral(_1))
# 703 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 115 "parser.mly"
          (This)
# 709 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'array_literal) in
    Obj.repr(
# 118 "parser.mly"
               (_1)
# 716 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue_literal) in
    Obj.repr(
# 119 "parser.mly"
                   (KeyValueLiteral(_1))
# 723 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
                  ( EmptyTable )
# 729 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'literal_list) in
    Obj.repr(
# 123 "parser.mly"
                             (ArrayLiteral(_2))
# 736 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'keyvalue_list) in
    Obj.repr(
# 126 "parser.mly"
                             (_2)
# 743 "parser.ml"
               : 'keyvalue_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 129 "parser.mly"
          ( [_1] )
# 750 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'keyvalue_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 130 "parser.mly"
                               ( _3 :: _1)
# 758 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'key) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 133 "parser.mly"
                    ( (_1,_3) )
# 766 "parser.ml"
               : 'keyvalue))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 136 "parser.mly"
        (IntKey(_1))
# 773 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 137 "parser.mly"
            (StringKey(_1))
# 780 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 140 "parser.mly"
         ( [_1] )
# 787 "parser.ml"
               : 'literal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'literal) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'literal_list) in
    Obj.repr(
# 141 "parser.mly"
                              ( _1 :: _3)
# 795 "parser.ml"
               : 'literal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'params_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 144 "parser.mly"
                                                      ( {fname=_1;
															params=_3;
															body=_6;
														})
# 807 "parser.ml"
               : 'func_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "parser.mly"
       ( [] )
# 813 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 151 "parser.mly"
                        (_3::_1)
# 821 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    Obj.repr(
# 154 "parser.mly"
                                    (CssPattern(_2))
# 828 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 155 "parser.mly"
                                              (RegexPattern(_2))
# 835 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 162 "parser.mly"
        (RegexString(_1))
# 842 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 163 "parser.mly"
                       (RegexNested(_2))
# 849 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 164 "parser.mly"
                                    (RegexSet(_2))
# 856 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 165 "parser.mly"
               (RegexUnOp(_1,Optional))
# 863 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 166 "parser.mly"
              (RegexUnOp(_1,KleenePlus))
# 870 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 167 "parser.mly"
               (RegexUnOp(_1,KleeneTimes))
# 877 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'regex) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 168 "parser.mly"
                    (RegexBinOp(_1,Or,_3))
# 885 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 171 "parser.mly"
       ([_1])
# 892 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_sequence) in
    Obj.repr(
# 172 "parser.mly"
                        (_1 :: _2)
# 900 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 175 "parser.mly"
         (RegexStringSet(_1))
# 907 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 176 "parser.mly"
        (RegexCharSet(_1))
# 914 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 177 "parser.mly"
                    (RegexCharRangeSet(_1, _3))
# 922 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    Obj.repr(
# 178 "parser.mly"
         (RegexAnyCharSet)
# 928 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 179 "parser.mly"
                    (RegexComplementSet(_2))
# 935 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 182 "parser.mly"
           ([_1])
# 942 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set_sequence) in
    Obj.repr(
# 183 "parser.mly"
                                (_1 :: _2)
# 950 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 189 "parser.mly"
                     (SingleSelector(_1))
# 957 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 190 "parser.mly"
                                         (ChainedSelectors(_1,DirectSibling,_3))
# 965 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 191 "parser.mly"
                                       (ChainedSelectors(_1,Descendent,_3))
# 973 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 192 "parser.mly"
                                          (ChainedSelectors(_1,AnySibling,_3))
# 981 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 193 "parser.mly"
                                          (ChainedSelectors(_1,DirectChild,_2))
# 989 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 196 "parser.mly"
                           (_1)
# 996 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 197 "parser.mly"
                          ((NoType,_1))
# 1003 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_selector) in
    Obj.repr(
# 200 "parser.mly"
               ((_1,[]))
# 1010 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 201 "parser.mly"
                                        ((_1,_2))
# 1018 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 204 "parser.mly"
       (Universal)
# 1024 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 205 "parser.mly"
     (Elt(_1))
# 1031 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector) in
    Obj.repr(
# 208 "parser.mly"
                   ( [_1])
# 1038 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'property_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 209 "parser.mly"
                                            ( _1::_2)
# 1046 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 212 "parser.mly"
           (ClassMatch(_2))
# 1053 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 213 "parser.mly"
           (IdMatch(_2))
# 1060 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 214 "parser.mly"
                    (AttributeExists(_2))
# 1067 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 215 "parser.mly"
                                  (AttributeEquals(_2,_4))
# 1075 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 216 "parser.mly"
                                    (AttributeContains(_2,_4))
# 1083 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 217 "parser.mly"
                                  (AttributeBeginsWith(_2,_4))
# 1091 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 218 "parser.mly"
                                     (AttributeEndsWith(_2,_4))
# 1099 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 219 "parser.mly"
                                    (AttributeWhitespaceContains(_2,_4))
# 1107 "parser.ml"
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
