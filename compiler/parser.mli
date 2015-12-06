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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
