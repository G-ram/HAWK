/*NOTE: much of the parsing code for statements/expressions is directly adapted from MicroC*/

%{ open Ast 
   open Util
%}

%token LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE
%token PLUS MINUS TIMES DIVIDES MOD
%token LT GT LEQ GEQ EQ NEQ AND OR
%token PERIOD ASSIGN HASH TILDE COMMA COLON PERIOD QUEST CARROT VERT
%token FUN
%token SEMI
%token LBRACK_AMP
%token AMP_RBRACK
%token LBRACK_FSLASH
%token FSLASH_RBRACK
%token EOF
%token <string> STRING
%token <string> REGEX_STRING
%token <int> INT
%token <float> DOUBLE
%token <string> ID
%token <string> CSSID

/*Program structure*/
%token BEGIN END
/*other keywords*/
%token ELSE IF RETURN THIS WHILE FOR IN

/* the attribute selectors */
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/
%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left AND
%left OR
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDES MOD VERT QUEST
%nonassoc UMINUS

%start program
%type <Ast.program> program

%%

/*Program structure */
program:
	begin_stmt pattern_action_list end_stmt EOF { {begin_stmt = $1;
													pattern_actions = $2;
													end_stmt = $3} }

begin_stmt:
	BEGIN LBRACE stmt_list RBRACE {Block($3)}
end_stmt:
	END LBRACE stmt_list RBRACE {Block($3)}

pattern_action_list:
	/* */ {[]}
	| pattern_action pattern_action_list {$1 :: $2}

pattern_action:
	pattern LBRACE stmt_list RBRACE { ($1,Block($3)) }

/*End of program structure*/


/*Statements and expressions*/
stmt_list:
	/* */ {[]}
	| stmt stmt_list {$1 :: $2}

stmt:
	expr_no_brace SEMI {Expr($1)}
	| RETURN expr SEMI {Return($2)}
	| LBRACE stmt_list RBRACE {Block($2)}
	| IF LPAREN expr RPAREN stmt %prec NOELSE { If($3,$5, Block([]))}
	| IF LPAREN expr RPAREN stmt ELSE stmt { If($3,$5,$7) }
	| WHILE LPAREN expr RPAREN stmt { While($3,$5) }
	| FOR LPAREN ID IN ID RPAREN stmt { For($3,$5,$7) }
	| FUN func_decl {Func($2)}
	| SEMI {Empty}

expr:
    table_literal {TableLiteral($1)}
    /*below fixes S/R error. Basically, do all arithmetic before this reduction */
    | expr_no_brace {$1} %prec ASSIGN

expr_no_brace:
    ID {Id($1)}
	| literal {Literal($1)}
	| expr_no_brace TIMES expr_no_brace {Binop($1,Times,$3)}
	| expr_no_brace DIVIDES expr_no_brace {Binop($1,Divides,$3)}
	| expr_no_brace MOD expr_no_brace {Binop($1,Mod,$3)}
	| expr_no_brace MINUS expr_no_brace {Binop($1,Minus,$3)}
	| expr_no_brace PLUS expr_no_brace {Binop($1,Plus,$3)}
	| expr_no_brace EQ expr_no_brace {Binop($1,Equal,$3)}
	| expr_no_brace LT expr_no_brace {Binop($1,Less,$3)}
	| expr_no_brace GT expr_no_brace {Binop($1,Greater,$3)}
	| expr_no_brace LEQ expr_no_brace {Binop($1,LessEqual,$3)}
	| expr_no_brace GEQ expr_no_brace {Binop($1,GreaterEqual,$3)}
	| expr_no_brace NEQ expr_no_brace {Binop($1,NotEqual,$3)}
	| expr_no_brace AND expr_no_brace {Binop($1,BAnd,$3)}
	| expr_no_brace OR expr_no_brace {Binop($1,BOr,$3)}
	| ID ASSIGN expr {Assign($1,$3)}
	| ID LPAREN expr_list RPAREN {Call($1,$3)}
	| ID LPAREN  RPAREN {Call($1,[])}
	| ID bracket_expr_list {TableAccess($1,$2)}
	| ID bracket_expr_list ASSIGN expr {TableAssign($1,$2,$4)}
    | LPAREN expr RPAREN {$2}
    | MINUS expr_no_brace %prec UMINUS {Uminus($2)}

expr_list:
	| expr { [$1] }
	| expr COMMA  expr_list { $1 :: $3 }

bracket_expr_list:
	| LBRACK expr RBRACK {[$2]}
	| LBRACK expr RBRACK bracket_expr_list { $2 :: $4}

literal:
	INT {IntLiteral($1)}
	|STRING {StringLiteral($1)}
	|DOUBLE {DoubleLiteral($1)}
  |THIS {This}

table_literal:
	array_literal {$1}
	|keyvalue_literal {KeyValueLiteral($1)}

array_literal:
    LBRACE RBRACE { EmptyTable }
	|LBRACE expr_list RBRACE {ArrayLiteral($2)}

keyvalue_literal:
	LBRACE keyvalue_list RBRACE {$2}

keyvalue_list:
	keyvalue { [$1] }
	|keyvalue_list COMMA keyvalue { $3 :: $1}

keyvalue:
	key COLON expr  { ($1,$3) }

key:
    INT {IntKey($1)}
    |STRING {StringKey($1)}

func_decl:
	ID LPAREN params_list RPAREN LBRACE stmt_list RBRACE { {fname=$1;
															params=$3;
															body=$6;
														}}

params_list:
	/* */ { [] }
	| ID { [$1] }
	| ID COMMA params_list {$1::$3}

pattern:
	LBRACK_AMP css_selector AMP_RBRACK {CssPattern($2)}
	| LBRACK_FSLASH regex_sequence FSLASH_RBRACK {RegexPattern($2)}

/*End of statements and expressions*/

/*Start of Regex*/

regex:
	REGEX_STRING {RegexString($1)}
	| PERIOD {RegexAnyChar}
	| LPAREN regex_sequence RPAREN {RegexNested($2)}
	| LBRACK regex_set_sequence RBRACK {RegexSet($2)}
	| regex QUEST {RegexUnOp($1,Optional)}
	| regex PLUS {RegexUnOp($1,KleenePlus)}
	| regex TIMES {RegexUnOp($1,KleeneTimes)}
	| regex VERT regex {RegexBinOp($1,Or,$3)}

regex_sequence:
	regex {[$1]}
	| regex regex_sequence {$1 :: $2}

regex_set:
	REGEX_STRING {RegexStringSet($1)}
	| REGEX_STRING MINUS REGEX_STRING{RegexRangeSet($1,$3)}
	| CARROT regex_set {RegexComplementSet($2)}
	| LBRACK regex_set_sequence RBRACK {RegexNestedSet($2)}

regex_set_sequence:
	regex_set {[$1]}
	| regex_set regex_set_sequence {$1 :: $2}

/*End of Regex stuff*/

/*Start of CSS Selector stuff*/
css_selector:
	simple_selector_seq {SingleSelector($1)}
	| css_selector PLUS simple_selector_seq {ChainedSelectors($1,DirectSibling,$3)}
	| css_selector GT simple_selector_seq {ChainedSelectors($1,Descendent,$3)}
	| css_selector TILDE simple_selector_seq {ChainedSelectors($1,AnySibling,$3)}
	| css_selector typed_simple_selector_seq {ChainedSelectors($1,DirectChild,$2)}

simple_selector_seq:
	typed_simple_selector_seq {$1}
	| property_selector_list {(NoType,$1)}

typed_simple_selector_seq:
	type_selector {($1,[])}
	| type_selector property_selector_list {($1,$2)}

type_selector:
	TIMES {Universal}
	|ID {Elt(unwrap_id $1)}

property_selector_list:
	property_selector { [$1]}
	| property_selector property_selector_list { $1::$2}

css_id:
	CSSID {$1}
	| ID {unwrap_id $1}
	
property_selector:
	PERIOD css_id {ClassMatch($2)}
	| HASH css_id {IdMatch($2)}
	| LBRACK css_id RBRACK {AttributeExists($2)}
	| LBRACK css_id ASSIGN STRING RBRACK {AttributeEquals($2,$4)}
	| LBRACK css_id TIMES_EQ STRING RBRACK {AttributeContains($2,$4)}
	| LBRACK css_id XOR_EQ STRING RBRACK {AttributeBeginsWith($2,$4)}
	| LBRACK css_id DOLLAR_EQ STRING RBRACK {AttributeEndsWith($2,$4)}
	| LBRACK css_id TILDE_EQ STRING RBRACK {AttributeWhitespaceContains($2,$4)}
/*end of CSS selector stuff */
