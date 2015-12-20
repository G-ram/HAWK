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
  | MOD
  | LT
  | GT
  | LEQ
  | GEQ
  | EQ
  | NEQ
  | AND
  | OR
  | PERIOD
  | ASSIGN
  | HASH
  | TILDE
  | COMMA
  | COLON
  | QUEST
  | CARROT
  | VERT
  | FUN
  | SEMI
  | LBRACK_AMP
  | AMP_RBRACK
  | LBRACK_FSLASH
  | FSLASH_RBRACK
  | EOF
  | STRING of (string)
  | REGEX_STRING of (string)
  | INT of (int)
  | DOUBLE of (float)
  | ID of (string)
  | CSSID of (string)
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
   open Util
# 63 "parser.ml"
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
  267 (* MOD *);
  268 (* LT *);
  269 (* GT *);
  270 (* LEQ *);
  271 (* GEQ *);
  272 (* EQ *);
  273 (* NEQ *);
  274 (* AND *);
  275 (* OR *);
  276 (* PERIOD *);
  277 (* ASSIGN *);
  278 (* HASH *);
  279 (* TILDE *);
  280 (* COMMA *);
  281 (* COLON *);
  282 (* QUEST *);
  283 (* CARROT *);
  284 (* VERT *);
  285 (* FUN *);
  286 (* SEMI *);
  287 (* LBRACK_AMP *);
  288 (* AMP_RBRACK *);
  289 (* LBRACK_FSLASH *);
  290 (* FSLASH_RBRACK *);
    0 (* EOF *);
  297 (* BEGIN *);
  298 (* END *);
  299 (* ELSE *);
  300 (* IF *);
  301 (* RETURN *);
  302 (* THIS *);
  303 (* WHILE *);
  304 (* FOR *);
  305 (* IN *);
  306 (* TIMES_EQ *);
  307 (* XOR_EQ *);
  308 (* DOLLAR_EQ *);
  309 (* TILDE_EQ *);
    0|]

let yytransl_block = [|
  291 (* STRING *);
  292 (* REGEX_STRING *);
  293 (* INT *);
  294 (* DOUBLE *);
  295 (* ID *);
  296 (* CSSID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\004\000\003\000\003\000\006\000\005\000\005\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\010\000\010\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\014\000\014\000\015\000\015\000\013\000\
\013\000\013\000\013\000\012\000\012\000\016\000\016\000\017\000\
\018\000\018\000\019\000\020\000\020\000\011\000\021\000\021\000\
\021\000\007\000\007\000\024\000\024\000\024\000\024\000\024\000\
\024\000\024\000\024\000\023\000\023\000\026\000\026\000\026\000\
\026\000\025\000\025\000\022\000\022\000\022\000\022\000\022\000\
\027\000\027\000\028\000\028\000\030\000\030\000\029\000\029\000\
\032\000\032\000\031\000\031\000\031\000\031\000\031\000\031\000\
\031\000\031\000\000\000"

let yylen = "\002\000\
\004\000\004\000\004\000\000\000\002\000\004\000\000\000\002\000\
\002\000\003\000\003\000\005\000\007\000\005\000\007\000\007\000\
\002\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\004\000\003\000\002\000\004\000\
\004\000\003\000\002\000\001\000\003\000\003\000\004\000\001\000\
\001\000\001\000\001\000\001\000\001\000\002\000\003\000\003\000\
\001\000\003\000\003\000\001\000\001\000\007\000\000\000\001\000\
\003\000\003\000\003\000\001\000\001\000\003\000\003\000\002\000\
\002\000\002\000\003\000\001\000\002\000\001\000\003\000\002\000\
\003\000\001\000\002\000\001\000\003\000\003\000\003\000\002\000\
\001\000\001\000\001\000\002\000\001\000\001\000\001\000\002\000\
\001\000\001\000\002\000\002\000\003\000\005\000\005\000\005\000\
\005\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\107\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\000\
\049\000\048\000\050\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\022\000\000\000\093\000\000\000\
\000\000\094\000\000\000\084\000\089\000\090\000\000\000\000\000\
\000\000\000\000\069\000\068\000\000\000\000\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\019\000\052\000\053\000\
\000\000\043\000\000\000\017\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\002\000\008\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\000\098\000\097\000\000\000\
\099\000\100\000\000\000\000\000\000\000\066\000\088\000\092\000\
\096\000\000\000\000\000\000\000\000\000\000\000\000\000\067\000\
\073\000\074\000\072\000\000\000\077\000\000\000\001\000\000\000\
\054\000\000\000\000\000\000\000\000\000\000\000\057\000\000\000\
\042\000\011\000\000\000\038\000\000\000\000\000\036\000\000\000\
\000\000\010\000\000\000\000\000\000\000\000\000\000\000\023\000\
\024\000\025\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\101\000\000\000\000\000\000\000\000\000\000\000\
\085\000\086\000\087\000\070\000\000\000\080\000\000\000\071\000\
\083\000\075\000\000\000\006\000\000\000\055\000\056\000\000\000\
\000\000\000\000\000\000\037\000\000\000\041\000\000\000\040\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\081\000\
\079\000\003\000\045\000\061\000\060\000\058\000\059\000\000\000\
\000\000\047\000\000\000\014\000\000\000\000\000\102\000\103\000\
\104\000\105\000\106\000\065\000\000\000\000\000\000\000\000\000\
\000\000\013\000\015\000\016\000\062\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\048\000\026\000\010\000\011\000\027\000\
\052\000\116\000\060\000\054\000\029\000\117\000\064\000\055\000\
\056\000\118\000\119\000\120\000\171\000\035\000\045\000\046\000\
\102\000\103\000\036\000\037\000\038\000\039\000\040\000\088\000"

let yysindex = "\013\000\
\241\254\000\000\026\255\000\000\092\255\105\255\002\255\003\255\
\248\254\092\255\032\255\175\255\105\255\008\255\024\255\000\000\
\000\000\000\000\000\000\078\255\104\255\175\255\106\255\114\255\
\121\255\126\255\105\255\006\001\000\000\046\255\000\000\046\255\
\046\255\000\000\124\255\000\000\000\000\000\000\007\255\007\255\
\003\255\015\255\000\000\000\000\128\255\088\255\134\255\165\000\
\000\000\105\255\140\255\070\001\164\255\000\000\000\000\000\000\
\162\255\000\000\169\255\000\000\159\255\175\255\175\255\151\255\
\175\255\143\255\175\255\175\255\135\255\000\000\000\000\008\255\
\008\255\008\255\008\255\008\255\008\255\008\255\008\255\008\255\
\008\255\008\255\008\255\008\255\000\000\000\000\000\000\009\255\
\000\000\000\000\002\255\002\255\002\255\000\000\000\000\000\000\
\000\000\179\255\015\255\015\255\174\255\181\255\015\255\000\000\
\000\000\000\000\000\000\003\255\000\000\105\255\000\000\178\255\
\000\000\000\000\000\000\168\255\189\255\076\255\000\000\182\255\
\000\000\000\000\165\255\000\000\201\255\204\255\000\000\175\255\
\220\255\000\000\222\255\225\255\157\255\083\255\083\255\000\000\
\000\000\000\000\180\255\180\255\180\255\180\255\019\001\019\001\
\083\001\096\001\000\000\193\255\194\255\195\255\196\255\200\255\
\000\000\000\000\000\000\000\000\232\255\000\000\188\255\000\000\
\000\000\000\000\231\255\000\000\175\255\000\000\000\000\101\255\
\175\255\215\255\238\255\000\000\240\255\000\000\105\255\000\000\
\105\255\245\254\241\255\242\255\243\255\247\255\249\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\165\255\
\007\000\000\000\205\255\000\000\012\000\015\000\000\000\000\000\
\000\000\000\000\000\000\000\000\105\255\105\255\105\255\105\255\
\009\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\234\255\031\000\000\000\000\000\
\000\000\234\255\000\000\000\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\017\000\000\000\000\000\042\000\000\000\
\000\000\000\000\031\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\202\255\210\255\
\000\000\000\000\000\000\000\000\000\000\062\255\000\000\000\000\
\000\000\031\000\000\000\238\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\067\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\029\255\000\000\014\000\000\000\
\000\000\000\000\000\000\000\000\000\000\031\000\000\000\000\000\
\000\000\031\001\051\001\034\255\000\000\000\000\000\000\000\000\
\000\000\000\000\036\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\086\000\105\000\000\000\
\000\000\000\000\124\000\143\000\162\000\181\000\200\000\219\000\
\214\255\227\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\037\000\000\000\000\000\248\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\036\000\
\000\000\000\000\082\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\030\001\000\000\244\255\000\000\000\000\098\255\
\250\255\246\255\000\000\000\000\000\000\198\255\126\000\000\000\
\000\000\000\000\130\000\000\000\109\000\000\000\235\255\210\000\
\237\255\220\000\010\000\028\001\115\000\000\000\000\000\125\000"

let yytablesize = 625
let yytable = "\028\000\
\057\000\053\000\125\000\041\000\030\000\042\000\028\000\058\000\
\012\000\030\000\031\000\066\000\147\000\001\000\071\000\014\000\
\195\000\099\000\196\000\098\000\028\000\032\000\043\000\033\000\
\109\000\003\000\032\000\197\000\033\000\148\000\006\000\078\000\
\078\000\047\000\198\000\044\000\050\000\112\000\044\000\044\000\
\034\000\100\000\017\000\028\000\018\000\019\000\020\000\210\000\
\211\000\212\000\101\000\126\000\127\000\023\000\129\000\078\000\
\131\000\132\000\149\000\150\000\151\000\152\000\059\000\076\000\
\078\000\134\000\135\000\136\000\137\000\138\000\139\000\140\000\
\141\000\142\000\143\000\144\000\145\000\146\000\061\000\157\000\
\062\000\167\000\012\000\161\000\086\000\087\000\012\000\012\000\
\041\000\012\000\042\000\074\000\075\000\076\000\105\000\076\000\
\106\000\163\000\063\000\168\000\153\000\154\000\155\000\028\000\
\065\000\012\000\187\000\043\000\067\000\013\000\012\000\012\000\
\014\000\107\000\068\000\108\000\012\000\174\000\012\000\012\000\
\012\000\069\000\007\000\044\000\008\000\012\000\012\000\012\000\
\012\000\012\000\091\000\070\000\031\000\015\000\016\000\188\000\
\092\000\189\000\110\000\017\000\012\000\018\000\019\000\020\000\
\051\000\113\000\093\000\014\000\021\000\022\000\023\000\024\000\
\025\000\096\000\097\000\094\000\089\000\090\000\191\000\012\000\
\124\000\104\000\034\000\051\000\111\000\121\000\014\000\122\000\
\028\000\123\000\028\000\128\000\130\000\133\000\114\000\012\000\
\115\000\019\000\020\000\051\000\156\000\159\000\014\000\164\000\
\160\000\023\000\072\000\073\000\074\000\075\000\076\000\165\000\
\209\000\017\000\166\000\018\000\019\000\020\000\028\000\028\000\
\028\000\028\000\172\000\170\000\023\000\178\000\169\000\173\000\
\091\000\017\000\091\000\018\000\019\000\020\000\091\000\034\000\
\095\000\034\000\095\000\034\000\023\000\175\000\095\000\185\000\
\091\000\176\000\177\000\179\000\180\000\181\000\182\000\034\000\
\095\000\091\000\183\000\184\000\186\000\034\000\192\000\193\000\
\091\000\095\000\062\000\034\000\199\000\200\000\201\000\206\000\
\095\000\046\000\202\000\046\000\203\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
\046\000\046\000\046\000\205\000\046\000\207\000\213\000\046\000\
\208\000\082\000\021\000\004\000\021\000\046\000\021\000\021\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\021\000\021\000\007\000\063\000\064\000\049\000\
\021\000\190\000\194\000\051\000\204\000\051\000\021\000\051\000\
\051\000\051\000\051\000\051\000\051\000\051\000\051\000\051\000\
\051\000\051\000\051\000\051\000\051\000\162\000\095\000\158\000\
\000\000\051\000\000\000\000\000\039\000\000\000\039\000\051\000\
\039\000\039\000\039\000\039\000\039\000\039\000\039\000\039\000\
\039\000\039\000\039\000\039\000\039\000\039\000\000\000\027\000\
\000\000\027\000\039\000\027\000\027\000\027\000\000\000\000\000\
\039\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
\027\000\000\000\026\000\000\000\026\000\027\000\026\000\026\000\
\026\000\000\000\000\000\027\000\026\000\026\000\026\000\026\000\
\026\000\026\000\026\000\026\000\000\000\029\000\000\000\029\000\
\026\000\029\000\000\000\000\000\000\000\000\000\026\000\029\000\
\029\000\029\000\029\000\029\000\029\000\029\000\029\000\000\000\
\030\000\000\000\030\000\029\000\030\000\000\000\000\000\000\000\
\000\000\029\000\030\000\030\000\030\000\030\000\030\000\030\000\
\030\000\030\000\000\000\031\000\000\000\031\000\030\000\031\000\
\000\000\000\000\000\000\000\000\030\000\031\000\031\000\031\000\
\031\000\031\000\031\000\031\000\031\000\000\000\032\000\000\000\
\032\000\031\000\032\000\000\000\000\000\000\000\000\000\031\000\
\032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
\000\000\028\000\000\000\028\000\032\000\028\000\000\000\000\000\
\000\000\000\000\032\000\000\000\000\000\000\000\000\000\028\000\
\028\000\028\000\028\000\000\000\033\000\000\000\033\000\028\000\
\033\000\000\000\000\000\000\000\035\000\028\000\035\000\000\000\
\035\000\000\000\033\000\033\000\033\000\033\000\000\000\020\000\
\000\000\020\000\033\000\020\000\035\000\035\000\000\000\000\000\
\033\000\000\000\035\000\000\000\000\000\000\000\000\000\000\000\
\035\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\
\000\000\000\000\000\000\020\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\084\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\000\000\085\000\049\000\049\000\049\000\049\000\
\049\000\049\000\049\000\049\000\049\000\049\000\049\000\049\000\
\049\000\049\000\000\000\000\000\000\000\000\000\049\000\061\000\
\048\000\048\000\048\000\048\000\048\000\048\000\048\000\048\000\
\048\000\048\000\048\000\048\000\048\000\048\000\000\000\000\000\
\000\000\000\000\048\000\060\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\084\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\000\000\084\000\072\000\073\000\
\074\000\075\000\076\000\077\000\078\000\079\000\080\000\081\000\
\082\000"

let yycheck = "\006\000\
\013\000\012\000\061\000\001\001\003\001\003\001\013\000\014\000\
\001\001\003\001\009\001\022\000\004\001\001\000\027\000\008\001\
\175\000\003\001\177\000\041\000\027\000\020\001\020\001\022\001\
\046\000\041\001\020\001\039\001\022\001\021\001\005\001\003\001\
\004\001\042\001\046\001\002\001\005\001\050\000\036\001\006\001\
\039\001\027\001\035\001\050\000\037\001\038\001\039\001\206\000\
\207\000\208\000\036\001\062\000\063\000\046\001\065\000\027\001\
\067\000\068\000\050\001\051\001\052\001\053\001\039\001\002\001\
\036\001\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\084\000\001\001\099\000\
\003\001\006\001\001\001\103\000\039\001\040\001\005\001\006\001\
\001\001\008\001\003\001\009\001\010\001\011\001\007\001\034\001\
\009\001\110\000\021\001\024\001\091\000\092\000\093\000\110\000\
\001\001\001\001\165\000\020\001\003\001\005\001\029\001\030\001\
\008\001\026\001\001\001\028\001\035\001\128\000\037\001\038\001\
\039\001\001\001\031\001\036\001\033\001\044\001\045\001\046\001\
\047\001\048\001\007\001\006\001\009\001\029\001\030\001\035\001\
\013\001\037\001\005\001\035\001\001\001\037\001\038\001\039\001\
\005\001\006\001\023\001\008\001\044\001\045\001\046\001\047\001\
\048\001\039\000\040\000\032\001\032\000\033\000\169\000\001\001\
\002\001\034\001\039\001\005\001\000\000\002\001\008\001\006\001\
\175\000\001\001\177\000\021\001\030\001\039\001\035\001\001\001\
\037\001\038\001\039\001\005\001\002\001\008\001\008\001\006\001\
\004\001\046\001\007\001\008\001\009\001\010\001\011\001\024\001\
\205\000\035\001\006\001\037\001\038\001\039\001\205\000\206\000\
\207\000\208\000\002\001\039\001\046\001\049\001\025\001\004\001\
\007\001\035\001\009\001\037\001\038\001\039\001\013\001\002\001\
\007\001\004\001\009\001\006\001\046\001\002\001\013\001\036\001\
\023\001\004\001\002\001\035\001\035\001\035\001\035\001\018\001\
\023\001\032\001\035\001\004\001\006\001\024\001\024\001\002\001\
\039\001\032\001\003\001\030\001\004\001\004\001\004\001\043\001\
\039\001\002\001\004\001\004\001\004\001\006\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\005\001\021\001\002\001\006\001\024\001\
\002\001\004\001\002\001\042\001\004\001\030\001\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\006\001\002\001\002\001\010\000\
\024\001\168\000\173\000\002\001\192\000\004\001\030\001\006\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\108\000\035\000\100\000\
\255\255\024\001\255\255\255\255\002\001\255\255\004\001\030\001\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\002\001\
\255\255\004\001\024\001\006\001\007\001\008\001\255\255\255\255\
\030\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\255\255\002\001\255\255\004\001\024\001\006\001\007\001\
\008\001\255\255\255\255\030\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\002\001\255\255\004\001\
\024\001\006\001\255\255\255\255\255\255\255\255\030\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\002\001\255\255\004\001\024\001\006\001\255\255\255\255\255\255\
\255\255\030\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\255\255\002\001\255\255\004\001\024\001\006\001\
\255\255\255\255\255\255\255\255\030\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\255\255\002\001\255\255\
\004\001\024\001\006\001\255\255\255\255\255\255\255\255\030\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\255\255\002\001\255\255\004\001\024\001\006\001\255\255\255\255\
\255\255\255\255\030\001\255\255\255\255\255\255\255\255\016\001\
\017\001\018\001\019\001\255\255\002\001\255\255\004\001\024\001\
\006\001\255\255\255\255\255\255\002\001\030\001\004\001\255\255\
\006\001\255\255\016\001\017\001\018\001\019\001\255\255\002\001\
\255\255\004\001\024\001\006\001\018\001\019\001\255\255\255\255\
\030\001\255\255\024\001\255\255\255\255\255\255\255\255\255\255\
\030\001\255\255\255\255\255\255\255\255\024\001\255\255\255\255\
\255\255\255\255\255\255\030\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\255\255\030\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\255\255\255\255\255\255\255\255\024\001\025\001\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\255\255\
\255\255\255\255\024\001\025\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\255\255\019\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001"

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
  MOD\000\
  LT\000\
  GT\000\
  LEQ\000\
  GEQ\000\
  EQ\000\
  NEQ\000\
  AND\000\
  OR\000\
  PERIOD\000\
  ASSIGN\000\
  HASH\000\
  TILDE\000\
  COMMA\000\
  COLON\000\
  QUEST\000\
  CARROT\000\
  VERT\000\
  FUN\000\
  SEMI\000\
  LBRACK_AMP\000\
  AMP_RBRACK\000\
  LBRACK_FSLASH\000\
  FSLASH_RBRACK\000\
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
  REGEX_STRING\000\
  INT\000\
  DOUBLE\000\
  ID\000\
  CSSID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'begin_stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'pattern_action_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'end_stmt) in
    Obj.repr(
# 52 "parser.mly"
                                             ( {begin_stmt = _1;
													pattern_actions = _2;
													end_stmt = _3} )
# 489 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 57 "parser.mly"
                               (Block(_3))
# 496 "parser.ml"
               : 'begin_stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 59 "parser.mly"
                             (Block(_3))
# 503 "parser.ml"
               : 'end_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "parser.mly"
       ([])
# 509 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pattern_action) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_action_list) in
    Obj.repr(
# 63 "parser.mly"
                                      (_1 :: _2)
# 517 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 66 "parser.mly"
                                 ( (_1,Block(_3)) )
# 525 "parser.ml"
               : 'pattern_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
       ([])
# 531 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 74 "parser.mly"
                  (_1 :: _2)
# 539 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr_no_brace) in
    Obj.repr(
# 77 "parser.mly"
                    (Expr(_1))
# 546 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                    (Return(_2))
# 553 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 79 "parser.mly"
                           (Block(_2))
# 560 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 80 "parser.mly"
                                           ( If(_3,_5, Block([])))
# 568 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "parser.mly"
                                        ( If(_3,_5,_7) )
# 577 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "parser.mly"
                                 ( While(_3,_5) )
# 585 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 83 "parser.mly"
                                   ( For(_3,_5,_7) )
# 594 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 84 "parser.mly"
                                     ( ForThis(_3,_7) )
# 602 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'func_decl) in
    Obj.repr(
# 85 "parser.mly"
                 (Func(_2))
# 609 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
        (Empty)
# 615 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'table_literal) in
    Obj.repr(
# 89 "parser.mly"
                  (TableLiteral(_1))
# 622 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 91 "parser.mly"
                    (_1)
# 629 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 94 "parser.mly"
       (Id(_1))
# 636 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 95 "parser.mly"
           (Literal(_1))
# 643 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 96 "parser.mly"
                                     (Binop(_1,Times,_3))
# 651 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 97 "parser.mly"
                                       (Binop(_1,Divides,_3))
# 659 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 98 "parser.mly"
                                   (Binop(_1,Mod,_3))
# 667 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 99 "parser.mly"
                                     (Binop(_1,Minus,_3))
# 675 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 100 "parser.mly"
                                    (Binop(_1,Plus,_3))
# 683 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 101 "parser.mly"
                                  (Binop(_1,Equal,_3))
# 691 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 102 "parser.mly"
                                  (Binop(_1,Less,_3))
# 699 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 103 "parser.mly"
                                  (Binop(_1,Greater,_3))
# 707 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 104 "parser.mly"
                                   (Binop(_1,LessEqual,_3))
# 715 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 105 "parser.mly"
                                   (Binop(_1,GreaterEqual,_3))
# 723 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 106 "parser.mly"
                                   (Binop(_1,NotEqual,_3))
# 731 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 107 "parser.mly"
                                   (Binop(_1,BAnd,_3))
# 739 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 108 "parser.mly"
                                  (Binop(_1,BOr,_3))
# 747 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                  (Assign(_1,_3))
# 755 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 110 "parser.mly"
                              (Call(_1,_3))
# 763 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 111 "parser.mly"
                     (Call(_1,[]))
# 770 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bracket_expr_list) in
    Obj.repr(
# 112 "parser.mly"
                        (TableAccess(_1,_2))
# 778 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                           (ThisAccess(_3))
# 785 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'bracket_expr_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                                    (TableAssign(_1,_2,_4))
# 794 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                         (_2)
# 801 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 116 "parser.mly"
                                       (Uminus(_2))
# 808 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
        ( [_1] )
# 815 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 120 "parser.mly"
                         ( _1 :: _3 )
# 823 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                      ([_2])
# 830 "parser.ml"
               : 'bracket_expr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bracket_expr_list) in
    Obj.repr(
# 124 "parser.mly"
                                        ( _2 :: _4)
# 838 "parser.ml"
               : 'bracket_expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 127 "parser.mly"
     (IntLiteral(_1))
# 845 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 128 "parser.mly"
         (StringLiteral(_1))
# 852 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 129 "parser.mly"
         (DoubleLiteral(_1))
# 859 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
        (This)
# 865 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'array_literal) in
    Obj.repr(
# 133 "parser.mly"
               (_1)
# 872 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue_literal) in
    Obj.repr(
# 134 "parser.mly"
                   (KeyValueLiteral(_1))
# 879 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 137 "parser.mly"
                  ( EmptyTable )
# 885 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 138 "parser.mly"
                          (ArrayLiteral(_2))
# 892 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'keyvalue_list) in
    Obj.repr(
# 141 "parser.mly"
                             (_2)
# 899 "parser.ml"
               : 'keyvalue_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 144 "parser.mly"
          ( [_1] )
# 906 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'keyvalue_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 145 "parser.mly"
                               ( _3 :: _1)
# 914 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'key) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 148 "parser.mly"
                 ( (_1,_3) )
# 922 "parser.ml"
               : 'keyvalue))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 151 "parser.mly"
        (IntKey(_1))
# 929 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 152 "parser.mly"
            (StringKey(_1))
# 936 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'params_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 155 "parser.mly"
                                                      ( {fname=_1;
															params=_3;
															body=_6;
														})
# 948 "parser.ml"
               : 'func_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 161 "parser.mly"
       ( [] )
# 954 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 162 "parser.mly"
      ( [_1] )
# 961 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'params_list) in
    Obj.repr(
# 163 "parser.mly"
                        (_1::_3)
# 969 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    Obj.repr(
# 166 "parser.mly"
                                    (CssPattern(_2))
# 976 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 167 "parser.mly"
                                              (RegexPattern(_2))
# 983 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 174 "parser.mly"
              (RegexString(_1))
# 990 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    Obj.repr(
# 175 "parser.mly"
          (RegexAnyChar)
# 996 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 176 "parser.mly"
                                (RegexNested(_2))
# 1003 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 177 "parser.mly"
                                    (RegexSet(_2))
# 1010 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 178 "parser.mly"
               (RegexUnOp(_1,Optional))
# 1017 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 179 "parser.mly"
              (RegexUnOp(_1,KleenePlus))
# 1024 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 180 "parser.mly"
               (RegexUnOp(_1,KleeneTimes))
# 1031 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'regex) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 181 "parser.mly"
                    (RegexBinOp(_1,Or,_3))
# 1039 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 184 "parser.mly"
       ([_1])
# 1046 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_sequence) in
    Obj.repr(
# 185 "parser.mly"
                        (_1 :: _2)
# 1054 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 188 "parser.mly"
              (RegexStringSet(_1))
# 1061 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 189 "parser.mly"
                                  (RegexRangeSet(_1,_3))
# 1069 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 190 "parser.mly"
                    (RegexComplementSet(_2))
# 1076 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 191 "parser.mly"
                                    (RegexNestedSet(_2))
# 1083 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 194 "parser.mly"
           ([_1])
# 1090 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set_sequence) in
    Obj.repr(
# 195 "parser.mly"
                                (_1 :: _2)
# 1098 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 201 "parser.mly"
                     (SingleSelector(_1))
# 1105 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 202 "parser.mly"
                                         (ChainedSelectors(_1,DirectSibling,_3))
# 1113 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 203 "parser.mly"
                                       (ChainedSelectors(_1,Descendent,_3))
# 1121 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 204 "parser.mly"
                                          (ChainedSelectors(_1,AnySibling,_3))
# 1129 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 205 "parser.mly"
                                          (ChainedSelectors(_1,DirectChild,_2))
# 1137 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 208 "parser.mly"
                           (_1)
# 1144 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 209 "parser.mly"
                          ((NoType,_1))
# 1151 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_selector) in
    Obj.repr(
# 212 "parser.mly"
               ((_1,[]))
# 1158 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 213 "parser.mly"
                                        ((_1,_2))
# 1166 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 216 "parser.mly"
       (Universal)
# 1172 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 217 "parser.mly"
     (Elt(_1))
# 1179 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector) in
    Obj.repr(
# 220 "parser.mly"
                   ( [_1])
# 1186 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'property_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 221 "parser.mly"
                                            ( _1::_2)
# 1194 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 224 "parser.mly"
       (_1)
# 1201 "parser.ml"
               : 'css_id))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 225 "parser.mly"
      (_1)
# 1208 "parser.ml"
               : 'css_id))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'css_id) in
    Obj.repr(
# 228 "parser.mly"
               (ClassMatch(_2))
# 1215 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'css_id) in
    Obj.repr(
# 229 "parser.mly"
               (IdMatch(_2))
# 1222 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'css_id) in
    Obj.repr(
# 230 "parser.mly"
                        (AttributeExists(_2))
# 1229 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'css_id) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 231 "parser.mly"
                                      (AttributeEquals(_2,_4))
# 1237 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'css_id) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 232 "parser.mly"
                                        (AttributeContains(_2,_4))
# 1245 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'css_id) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 233 "parser.mly"
                                      (AttributeBeginsWith(_2,_4))
# 1253 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'css_id) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 234 "parser.mly"
                                         (AttributeEndsWith(_2,_4))
# 1261 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'css_id) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 235 "parser.mly"
                                        (AttributeWhitespaceContains(_2,_4))
# 1269 "parser.ml"
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
