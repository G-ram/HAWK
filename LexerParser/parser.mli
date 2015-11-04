(* The type of tokens. *)
type token = 
  | XOR_EQ
  | WHILE
  | VERT
  | UNDER
  | TIMES_EQ
  | TIMES
  | TILDE_EQ
  | TILDE
  | THIS
  | STRING of (string)
  | SEMI
  | RPAREN
  | RETURN
  | RBRACK
  | RBRACE
  | QUEST
  | PLUS
  | PERIOD
  | NEQ
  | MINUS
  | LT
  | LPAREN
  | LEQ
  | LBRACK_FSLASH
  | LBRACK_AMP
  | LBRACK
  | LBRACE
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | HASH
  | GT
  | GEQ
  | FUN
  | FSLASH_RBRACK
  | FOR
  | EQ
  | EOF
  | END
  | ELSE
  | DOUBLE of (float)
  | DOLLAR_EQ
  | DIVIDES
  | COMMA
  | COLON
  | CHAR of (char)
  | CARROT
  | BEGIN
  | ASSIGN
  | AMP_RBRACK

(* This exception is raised by the monolithic API functions. *)
exception Error

(* The monolithic API. *)
val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)

