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
# 61 "parser.ml"
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
  296 (* BEGIN *);
  297 (* END *);
  298 (* ELSE *);
  299 (* IF *);
  300 (* RETURN *);
  301 (* THIS *);
  302 (* WHILE *);
  303 (* FOR *);
  304 (* IN *);
  305 (* TIMES_EQ *);
  306 (* XOR_EQ *);
  307 (* DOLLAR_EQ *);
  308 (* TILDE_EQ *);
    0|]

let yytransl_block = [|
  291 (* STRING *);
  292 (* REGEX_STRING *);
  293 (* INT *);
  294 (* DOUBLE *);
  295 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\004\000\003\000\003\000\006\000\005\000\005\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\010\000\010\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\014\000\014\000\015\000\015\000\013\000\013\000\013\000\
\013\000\012\000\012\000\016\000\016\000\017\000\018\000\018\000\
\019\000\020\000\020\000\011\000\021\000\021\000\021\000\007\000\
\007\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
\024\000\023\000\023\000\026\000\026\000\026\000\026\000\025\000\
\025\000\022\000\022\000\022\000\022\000\022\000\027\000\027\000\
\028\000\028\000\030\000\030\000\029\000\029\000\031\000\031\000\
\031\000\031\000\031\000\031\000\031\000\031\000\000\000"

let yylen = "\002\000\
\004\000\004\000\004\000\000\000\002\000\004\000\000\000\002\000\
\002\000\003\000\003\000\005\000\007\000\005\000\007\000\002\000\
\001\000\001\000\001\000\001\000\001\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\004\000\003\000\002\000\004\000\003\000\
\002\000\001\000\003\000\003\000\004\000\001\000\001\000\001\000\
\001\000\001\000\001\000\002\000\003\000\003\000\001\000\003\000\
\003\000\001\000\001\000\007\000\000\000\001\000\003\000\003\000\
\003\000\001\000\001\000\003\000\003\000\002\000\002\000\002\000\
\003\000\001\000\002\000\001\000\003\000\002\000\003\000\001\000\
\002\000\001\000\003\000\003\000\003\000\002\000\001\000\001\000\
\001\000\002\000\001\000\001\000\001\000\002\000\002\000\002\000\
\003\000\005\000\005\000\005\000\005\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\103\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\047\000\046\000\048\000\000\000\000\000\000\000\049\000\000\000\
\000\000\000\000\000\000\000\000\021\000\000\000\091\000\000\000\
\000\000\092\000\000\000\082\000\087\000\088\000\000\000\000\000\
\000\000\000\000\067\000\066\000\000\000\000\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\018\000\050\000\051\000\
\000\000\041\000\000\000\016\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\002\000\008\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\000\000\095\000\096\000\000\000\
\000\000\000\000\064\000\086\000\090\000\094\000\000\000\000\000\
\000\000\000\000\000\000\000\000\065\000\071\000\072\000\070\000\
\000\000\075\000\000\000\001\000\000\000\052\000\000\000\000\000\
\000\000\000\000\000\000\055\000\000\000\040\000\011\000\000\000\
\037\000\000\000\000\000\035\000\000\000\000\000\010\000\000\000\
\000\000\000\000\000\000\022\000\023\000\024\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\097\000\000\000\
\000\000\000\000\000\000\000\000\083\000\084\000\085\000\068\000\
\000\000\078\000\000\000\069\000\081\000\073\000\000\000\006\000\
\000\000\053\000\054\000\000\000\000\000\000\000\000\000\036\000\
\000\000\039\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\079\000\077\000\003\000\043\000\059\000\058\000\
\056\000\057\000\000\000\000\000\045\000\000\000\014\000\000\000\
\098\000\099\000\100\000\101\000\102\000\063\000\000\000\000\000\
\000\000\000\000\013\000\015\000\060\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\048\000\026\000\010\000\011\000\027\000\
\052\000\113\000\060\000\054\000\029\000\114\000\064\000\055\000\
\056\000\115\000\116\000\117\000\167\000\035\000\045\000\046\000\
\099\000\100\000\036\000\037\000\038\000\039\000\040\000"

let yysindex = "\050\000\
\050\255\000\000\088\255\000\000\251\254\099\255\002\255\003\255\
\053\255\251\254\094\255\167\255\099\255\178\255\063\255\000\000\
\000\000\000\000\000\000\024\255\104\255\167\255\000\000\105\255\
\109\255\106\255\099\255\240\000\000\000\072\255\000\000\074\255\
\080\255\000\000\201\255\000\000\000\000\000\000\014\255\014\255\
\003\255\013\255\000\000\000\000\086\255\028\255\116\255\127\000\
\000\000\099\255\146\255\048\001\128\255\000\000\000\000\000\000\
\126\255\000\000\138\255\000\000\162\255\167\255\167\255\119\255\
\167\255\111\255\167\255\110\255\000\000\000\000\178\255\178\255\
\178\255\178\255\178\255\178\255\178\255\178\255\178\255\178\255\
\178\255\178\255\178\255\000\000\009\255\000\000\000\000\002\255\
\002\255\002\255\000\000\000\000\000\000\000\000\148\255\013\255\
\013\255\140\255\152\255\013\255\000\000\000\000\000\000\000\000\
\003\255\000\000\099\255\000\000\151\255\000\000\000\000\000\000\
\134\255\154\255\026\255\000\000\136\255\000\000\000\000\123\255\
\000\000\169\255\165\255\000\000\167\255\171\255\000\000\172\255\
\130\255\087\255\087\255\000\000\000\000\000\000\220\255\220\255\
\220\255\220\255\253\000\253\000\061\001\074\001\000\000\141\255\
\142\255\145\255\153\255\155\255\000\000\000\000\000\000\000\000\
\185\255\000\000\156\255\000\000\000\000\000\000\176\255\000\000\
\167\255\000\000\000\000\044\255\167\255\174\255\194\255\000\000\
\200\255\000\000\099\255\099\255\170\255\207\255\214\255\228\255\
\230\255\233\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\123\255\234\255\000\000\196\255\000\000\239\255\
\000\000\000\000\000\000\000\000\000\000\000\000\099\255\099\255\
\099\255\236\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\202\255\240\255\000\000\000\000\
\000\000\202\255\000\000\000\000\240\255\000\000\000\000\000\000\
\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\
\000\000\000\000\240\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\212\255\213\255\
\000\000\000\000\000\000\000\000\000\000\012\255\000\000\000\000\
\000\000\240\255\000\000\129\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\045\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\006\255\000\000\243\255\000\000\000\000\000\000\000\000\
\000\000\000\000\240\255\000\000\000\000\000\000\009\001\029\001\
\041\255\000\000\000\000\000\000\000\000\000\000\000\000\247\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\064\000\083\000\000\000\000\000\000\000\102\000\121\000\
\140\000\159\000\178\000\197\000\216\000\205\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\248\255\000\000\000\000\
\251\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\247\255\000\000\000\000\079\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\240\255\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\238\000\000\000\244\255\000\000\000\000\147\255\
\250\255\246\255\000\000\000\000\000\000\198\255\085\000\000\000\
\000\000\000\000\092\000\000\000\084\000\000\000\037\000\168\000\
\242\255\177\000\186\255\241\000\049\000\000\000\000\000"

let yytablesize = 603
let yytable = "\028\000\
\057\000\053\000\122\000\041\000\030\000\042\000\028\000\058\000\
\076\000\076\000\031\000\066\000\143\000\074\000\070\000\096\000\
\030\000\149\000\150\000\151\000\028\000\032\000\043\000\033\000\
\061\000\007\000\062\000\008\000\041\000\144\000\042\000\163\000\
\076\000\032\000\102\000\033\000\103\000\109\000\044\000\097\000\
\034\000\076\000\042\000\028\000\063\000\074\000\042\000\043\000\
\098\000\164\000\001\000\123\000\124\000\104\000\126\000\105\000\
\128\000\145\000\146\000\147\000\148\000\190\000\191\000\044\000\
\130\000\131\000\132\000\133\000\134\000\135\000\136\000\137\000\
\138\000\139\000\140\000\141\000\142\000\095\000\183\000\012\000\
\184\000\153\000\106\000\012\000\012\000\157\000\012\000\093\000\
\094\000\003\000\203\000\204\000\006\000\047\000\159\000\073\000\
\074\000\075\000\050\000\012\000\028\000\059\000\182\000\013\000\
\065\000\067\000\014\000\012\000\012\000\068\000\085\000\069\000\
\086\000\012\000\170\000\012\000\012\000\012\000\087\000\101\000\
\107\000\012\000\012\000\012\000\012\000\012\000\108\000\015\000\
\016\000\118\000\019\000\119\000\019\000\017\000\019\000\018\000\
\019\000\020\000\120\000\125\000\127\000\021\000\022\000\023\000\
\024\000\025\000\012\000\155\000\129\000\152\000\051\000\110\000\
\019\000\014\000\186\000\156\000\160\000\161\000\019\000\162\000\
\165\000\166\000\012\000\121\000\028\000\028\000\051\000\012\000\
\169\000\014\000\168\000\051\000\171\000\172\000\014\000\174\000\
\175\000\173\000\012\000\176\000\111\000\181\000\112\000\019\000\
\020\000\014\000\202\000\177\000\179\000\178\000\023\000\180\000\
\028\000\028\000\028\000\188\000\017\000\187\000\018\000\019\000\
\020\000\017\000\062\000\018\000\019\000\020\000\023\000\088\000\
\192\000\031\000\193\000\023\000\017\000\089\000\018\000\019\000\
\020\000\194\000\089\000\093\000\089\000\093\000\023\000\090\000\
\089\000\093\000\071\000\072\000\073\000\074\000\075\000\195\000\
\091\000\196\000\089\000\093\000\197\000\200\000\199\000\034\000\
\201\000\205\000\004\000\089\000\093\000\007\000\080\000\049\000\
\061\000\062\000\089\000\093\000\044\000\189\000\044\000\185\000\
\044\000\044\000\044\000\044\000\044\000\044\000\044\000\044\000\
\044\000\044\000\044\000\044\000\044\000\044\000\198\000\044\000\
\158\000\154\000\044\000\092\000\000\000\020\000\000\000\020\000\
\044\000\020\000\020\000\020\000\020\000\020\000\020\000\020\000\
\020\000\020\000\020\000\020\000\020\000\020\000\020\000\000\000\
\000\000\000\000\000\000\020\000\000\000\000\000\038\000\000\000\
\038\000\020\000\038\000\038\000\038\000\038\000\038\000\038\000\
\038\000\038\000\038\000\038\000\038\000\038\000\038\000\038\000\
\000\000\026\000\000\000\026\000\038\000\026\000\026\000\026\000\
\000\000\000\000\038\000\026\000\026\000\026\000\026\000\026\000\
\026\000\026\000\026\000\000\000\025\000\000\000\025\000\026\000\
\025\000\025\000\025\000\000\000\000\000\026\000\025\000\025\000\
\025\000\025\000\025\000\025\000\025\000\025\000\000\000\028\000\
\000\000\028\000\025\000\028\000\000\000\000\000\000\000\000\000\
\025\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
\028\000\000\000\029\000\000\000\029\000\028\000\029\000\000\000\
\000\000\000\000\000\000\028\000\029\000\029\000\029\000\029\000\
\029\000\029\000\029\000\029\000\000\000\030\000\000\000\030\000\
\029\000\030\000\000\000\000\000\000\000\000\000\029\000\030\000\
\030\000\030\000\030\000\030\000\030\000\030\000\030\000\000\000\
\031\000\000\000\031\000\030\000\031\000\000\000\000\000\000\000\
\000\000\030\000\031\000\031\000\031\000\031\000\031\000\031\000\
\031\000\031\000\000\000\027\000\000\000\027\000\031\000\027\000\
\000\000\000\000\000\000\000\000\031\000\000\000\000\000\000\000\
\000\000\027\000\027\000\027\000\027\000\000\000\032\000\000\000\
\032\000\027\000\032\000\000\000\000\000\000\000\034\000\027\000\
\034\000\000\000\034\000\000\000\032\000\032\000\032\000\032\000\
\000\000\033\000\000\000\033\000\032\000\033\000\034\000\034\000\
\000\000\000\000\032\000\000\000\034\000\000\000\000\000\000\000\
\000\000\033\000\034\000\000\000\000\000\000\000\000\000\033\000\
\000\000\000\000\000\000\000\000\000\000\033\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\080\000\
\081\000\082\000\083\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\000\000\084\000\047\000\047\000\
\047\000\047\000\047\000\047\000\047\000\047\000\047\000\047\000\
\047\000\047\000\047\000\047\000\000\000\000\000\000\000\000\000\
\047\000\059\000\046\000\046\000\046\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
\000\000\000\000\000\000\000\000\046\000\058\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\080\000\
\081\000\082\000\083\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\081\000\000\000\083\000\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000"

let yycheck = "\006\000\
\013\000\012\000\061\000\001\001\003\001\003\001\013\000\014\000\
\003\001\004\001\009\001\022\000\004\001\002\001\027\000\003\001\
\003\001\088\000\089\000\090\000\027\000\020\001\020\001\022\001\
\001\001\031\001\003\001\033\001\001\001\021\001\003\001\006\001\
\027\001\020\001\007\001\022\001\009\001\050\000\036\001\027\001\
\039\001\036\001\002\001\050\000\021\001\034\001\006\001\020\001\
\036\001\024\001\001\000\062\000\063\000\026\001\065\000\028\001\
\067\000\049\001\050\001\051\001\052\001\171\000\172\000\036\001\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\041\000\035\001\001\001\
\037\001\096\000\046\000\005\001\006\001\100\000\008\001\039\000\
\040\000\040\001\200\000\201\000\005\001\041\001\107\000\009\001\
\010\001\011\001\005\001\001\001\107\000\039\001\161\000\005\001\
\001\001\001\001\008\001\029\001\030\001\001\001\039\001\006\001\
\039\001\035\001\125\000\037\001\038\001\039\001\039\001\034\001\
\005\001\043\001\044\001\045\001\046\001\047\001\000\000\029\001\
\030\001\002\001\002\001\006\001\004\001\035\001\006\001\037\001\
\038\001\039\001\001\001\021\001\030\001\043\001\044\001\045\001\
\046\001\047\001\001\001\008\001\039\001\002\001\005\001\006\001\
\024\001\008\001\165\000\004\001\006\001\024\001\030\001\006\001\
\025\001\039\001\001\001\002\001\171\000\172\000\005\001\001\001\
\004\001\008\001\002\001\005\001\002\001\002\001\008\001\035\001\
\035\001\048\001\001\001\035\001\035\001\006\001\037\001\038\001\
\039\001\008\001\199\000\035\001\004\001\035\001\045\001\036\001\
\199\000\200\000\201\000\002\001\035\001\024\001\037\001\038\001\
\039\001\035\001\003\001\037\001\038\001\039\001\045\001\007\001\
\039\001\009\001\004\001\045\001\035\001\013\001\037\001\038\001\
\039\001\004\001\007\001\007\001\009\001\009\001\045\001\023\001\
\013\001\013\001\007\001\008\001\009\001\010\001\011\001\004\001\
\032\001\004\001\023\001\023\001\004\001\042\001\005\001\039\001\
\002\001\006\001\041\001\032\001\032\001\006\001\004\001\010\000\
\002\001\002\001\039\001\039\001\002\001\169\000\004\001\164\000\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\187\000\021\001\
\105\000\097\000\024\001\035\000\255\255\002\001\255\255\004\001\
\030\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\255\255\255\255\255\255\024\001\255\255\255\255\002\001\255\255\
\004\001\030\001\006\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\255\255\002\001\255\255\004\001\024\001\006\001\007\001\008\001\
\255\255\255\255\030\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\255\255\002\001\255\255\004\001\024\001\
\006\001\007\001\008\001\255\255\255\255\030\001\012\001\013\001\
\014\001\015\001\016\001\017\001\018\001\019\001\255\255\002\001\
\255\255\004\001\024\001\006\001\255\255\255\255\255\255\255\255\
\030\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\255\255\002\001\255\255\004\001\024\001\006\001\255\255\
\255\255\255\255\255\255\030\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\002\001\255\255\004\001\
\024\001\006\001\255\255\255\255\255\255\255\255\030\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\255\255\
\002\001\255\255\004\001\024\001\006\001\255\255\255\255\255\255\
\255\255\030\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\255\255\002\001\255\255\004\001\024\001\006\001\
\255\255\255\255\255\255\255\255\030\001\255\255\255\255\255\255\
\255\255\016\001\017\001\018\001\019\001\255\255\002\001\255\255\
\004\001\024\001\006\001\255\255\255\255\255\255\002\001\030\001\
\004\001\255\255\006\001\255\255\016\001\017\001\018\001\019\001\
\255\255\002\001\255\255\004\001\024\001\006\001\018\001\019\001\
\255\255\255\255\030\001\255\255\024\001\255\255\255\255\255\255\
\255\255\018\001\030\001\255\255\255\255\255\255\255\255\024\001\
\255\255\255\255\255\255\255\255\255\255\030\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\255\255\030\001\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\255\255\255\255\255\255\255\255\
\024\001\025\001\006\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\255\255\255\255\255\255\255\255\024\001\025\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\255\255\019\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001"

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
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'begin_stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'pattern_action_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'end_stmt) in
    Obj.repr(
# 49 "parser.mly"
                                             ( {begin_stmt = _1;
													pattern_actions = _2;
													end_stmt = _3} )
# 474 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 54 "parser.mly"
                               (Block(_3))
# 481 "parser.ml"
               : 'begin_stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 56 "parser.mly"
                             (Block(_3))
# 488 "parser.ml"
               : 'end_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
       ([])
# 494 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pattern_action) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_action_list) in
    Obj.repr(
# 60 "parser.mly"
                                      (_1 :: _2)
# 502 "parser.ml"
               : 'pattern_action_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 63 "parser.mly"
                                 ( (_1,Block(_3)) )
# 510 "parser.ml"
               : 'pattern_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
       ([])
# 516 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 71 "parser.mly"
                  (_1 :: _2)
# 524 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr_no_brace) in
    Obj.repr(
# 74 "parser.mly"
                    (Expr(_1))
# 531 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                    (Return(_2))
# 538 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 76 "parser.mly"
                           (Block(_2))
# 545 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 77 "parser.mly"
                                           ( If(_3,_5, Block([])))
# 553 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 78 "parser.mly"
                                        ( If(_3,_5,_7) )
# 562 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 79 "parser.mly"
                                 ( While(_3,_5) )
# 570 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 80 "parser.mly"
                                   ( For(_3,_5,_7) )
# 579 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'func_decl) in
    Obj.repr(
# 81 "parser.mly"
                 (Func(_2))
# 586 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
        (Empty)
# 592 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'table_literal) in
    Obj.repr(
# 85 "parser.mly"
                  (TableLiteral(_1))
# 599 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 87 "parser.mly"
                    (_1)
# 606 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 90 "parser.mly"
       (Id(_1))
# 613 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 91 "parser.mly"
           (Literal(_1))
# 620 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 92 "parser.mly"
                                     (Binop(_1,Times,_3))
# 628 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 93 "parser.mly"
                                       (Binop(_1,Divides,_3))
# 636 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 94 "parser.mly"
                                   (Binop(_1,Mod,_3))
# 644 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 95 "parser.mly"
                                     (Binop(_1,Minus,_3))
# 652 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 96 "parser.mly"
                                    (Binop(_1,Plus,_3))
# 660 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 97 "parser.mly"
                                  (Binop(_1,Equal,_3))
# 668 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 98 "parser.mly"
                                  (Binop(_1,Less,_3))
# 676 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 99 "parser.mly"
                                  (Binop(_1,Greater,_3))
# 684 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 100 "parser.mly"
                                   (Binop(_1,LessEqual,_3))
# 692 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 101 "parser.mly"
                                   (Binop(_1,GreaterEqual,_3))
# 700 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 102 "parser.mly"
                                   (Binop(_1,NotEqual,_3))
# 708 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 103 "parser.mly"
                                   (Binop(_1,BAnd,_3))
# 716 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr_no_brace) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 104 "parser.mly"
                                  (Binop(_1,BOr,_3))
# 724 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                  (Assign(_1,_3))
# 732 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 106 "parser.mly"
                              (Call(_1,_3))
# 740 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 107 "parser.mly"
                     (Call(_1,[]))
# 747 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bracket_expr_list) in
    Obj.repr(
# 108 "parser.mly"
                        (TableAccess(_1,_2))
# 755 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'bracket_expr_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                                    (TableAssign(_1,_2,_4))
# 764 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 110 "parser.mly"
                         (_2)
# 771 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr_no_brace) in
    Obj.repr(
# 111 "parser.mly"
                                       (Uminus(_2))
# 778 "parser.ml"
               : 'expr_no_brace))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
        ( [_1] )
# 785 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr_list) in
    Obj.repr(
# 115 "parser.mly"
                         ( _1 :: _3 )
# 793 "parser.ml"
               : 'expr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                      ([_2])
# 800 "parser.ml"
               : 'bracket_expr_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bracket_expr_list) in
    Obj.repr(
# 119 "parser.mly"
                                        ( _2 :: _4)
# 808 "parser.ml"
               : 'bracket_expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 122 "parser.mly"
     (IntLiteral(_1))
# 815 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 123 "parser.mly"
         (StringLiteral(_1))
# 822 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 124 "parser.mly"
         (DoubleLiteral(_1))
# 829 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 125 "parser.mly"
        (This)
# 835 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'array_literal) in
    Obj.repr(
# 128 "parser.mly"
               (_1)
# 842 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue_literal) in
    Obj.repr(
# 129 "parser.mly"
                   (KeyValueLiteral(_1))
# 849 "parser.ml"
               : 'table_literal))
; (fun __caml_parser_env ->
    Obj.repr(
# 132 "parser.mly"
                  ( EmptyTable )
# 855 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_list) in
    Obj.repr(
# 133 "parser.mly"
                          (ArrayLiteral(_2))
# 862 "parser.ml"
               : 'array_literal))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'keyvalue_list) in
    Obj.repr(
# 136 "parser.mly"
                             (_2)
# 869 "parser.ml"
               : 'keyvalue_literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 139 "parser.mly"
          ( [_1] )
# 876 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'keyvalue_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'keyvalue) in
    Obj.repr(
# 140 "parser.mly"
                               ( _3 :: _1)
# 884 "parser.ml"
               : 'keyvalue_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'key) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                 ( (_1,_3) )
# 892 "parser.ml"
               : 'keyvalue))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 146 "parser.mly"
        (IntKey(_1))
# 899 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 147 "parser.mly"
            (StringKey(_1))
# 906 "parser.ml"
               : 'key))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'params_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 150 "parser.mly"
                                                      ( {fname=_1;
															params=_3;
															body=_6;
														})
# 918 "parser.ml"
               : 'func_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 156 "parser.mly"
       ( [] )
# 924 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 157 "parser.mly"
      ( [_1] )
# 931 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'params_list) in
    Obj.repr(
# 158 "parser.mly"
                        (_1::_3)
# 939 "parser.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    Obj.repr(
# 161 "parser.mly"
                                    (CssPattern(_2))
# 946 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 162 "parser.mly"
                                              (RegexPattern(_2))
# 953 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 169 "parser.mly"
              (RegexString(_1))
# 960 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    Obj.repr(
# 170 "parser.mly"
          (RegexAnyChar)
# 966 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_sequence) in
    Obj.repr(
# 171 "parser.mly"
                                (RegexNested(_2))
# 973 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 172 "parser.mly"
                                    (RegexSet(_2))
# 980 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 173 "parser.mly"
               (RegexUnOp(_1,Optional))
# 987 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 174 "parser.mly"
              (RegexUnOp(_1,KleenePlus))
# 994 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    Obj.repr(
# 175 "parser.mly"
               (RegexUnOp(_1,KleeneTimes))
# 1001 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'regex) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 176 "parser.mly"
                    (RegexBinOp(_1,Or,_3))
# 1009 "parser.ml"
               : 'regex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex) in
    Obj.repr(
# 179 "parser.mly"
       ([_1])
# 1016 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_sequence) in
    Obj.repr(
# 180 "parser.mly"
                        (_1 :: _2)
# 1024 "parser.ml"
               : 'regex_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 183 "parser.mly"
              (RegexStringSet(_1))
# 1031 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 184 "parser.mly"
                                  (RegexRangeSet(_1,_3))
# 1039 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 185 "parser.mly"
                    (RegexComplementSet(_2))
# 1046 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set_sequence) in
    Obj.repr(
# 186 "parser.mly"
                                    (RegexNestedSet(_2))
# 1053 "parser.ml"
               : 'regex_set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set) in
    Obj.repr(
# 189 "parser.mly"
           ([_1])
# 1060 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regex_set) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regex_set_sequence) in
    Obj.repr(
# 190 "parser.mly"
                                (_1 :: _2)
# 1068 "parser.ml"
               : 'regex_set_sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 196 "parser.mly"
                     (SingleSelector(_1))
# 1075 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 197 "parser.mly"
                                         (ChainedSelectors(_1,DirectSibling,_3))
# 1083 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 198 "parser.mly"
                                       (ChainedSelectors(_1,Descendent,_3))
# 1091 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'css_selector) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_selector_seq) in
    Obj.repr(
# 199 "parser.mly"
                                          (ChainedSelectors(_1,AnySibling,_3))
# 1099 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'css_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 200 "parser.mly"
                                          (ChainedSelectors(_1,DirectChild,_2))
# 1107 "parser.ml"
               : 'css_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_simple_selector_seq) in
    Obj.repr(
# 203 "parser.mly"
                           (_1)
# 1114 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 204 "parser.mly"
                          ((NoType,_1))
# 1121 "parser.ml"
               : 'simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_selector) in
    Obj.repr(
# 207 "parser.mly"
               ((_1,[]))
# 1128 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 208 "parser.mly"
                                        ((_1,_2))
# 1136 "parser.ml"
               : 'typed_simple_selector_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 211 "parser.mly"
       (Universal)
# 1142 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 212 "parser.mly"
     (Elt(_1))
# 1149 "parser.ml"
               : 'type_selector))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector) in
    Obj.repr(
# 215 "parser.mly"
                   ( [_1])
# 1156 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'property_selector) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'property_selector_list) in
    Obj.repr(
# 216 "parser.mly"
                                            ( _1::_2)
# 1164 "parser.ml"
               : 'property_selector_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 219 "parser.mly"
           (ClassMatch(_2))
# 1171 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 220 "parser.mly"
           (IdMatch(_2))
# 1178 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 221 "parser.mly"
                    (AttributeExists(_2))
# 1185 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 222 "parser.mly"
                                  (AttributeEquals(_2,_4))
# 1193 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 223 "parser.mly"
                                    (AttributeContains(_2,_4))
# 1201 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 224 "parser.mly"
                                  (AttributeBeginsWith(_2,_4))
# 1209 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 225 "parser.mly"
                                     (AttributeEndsWith(_2,_4))
# 1217 "parser.ml"
               : 'property_selector))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 226 "parser.mly"
                                    (AttributeWhitespaceContains(_2,_4))
# 1225 "parser.ml"
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
