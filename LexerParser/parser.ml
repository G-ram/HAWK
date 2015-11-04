exception Error

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
  | STRING of (
# 16 "parser.mly"
       (string)
# 17 "parser.ml"
)
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
  | INT of (
# 18 "parser.mly"
       (int)
# 39 "parser.ml"
)
  | IN
  | IF
  | ID of (
# 20 "parser.mly"
       (string)
# 46 "parser.ml"
)
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
  | DOUBLE of (
# 19 "parser.mly"
       (float)
# 61 "parser.ml"
)
  | DOLLAR_EQ
  | DIVIDES
  | COMMA
  | COLON
  | CHAR of (
# 17 "parser.mly"
       (char)
# 70 "parser.ml"
)
  | CARROT
  | BEGIN
  | ASSIGN
  | AMP_RBRACK

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState185
  | MenhirState182
  | MenhirState177
  | MenhirState171
  | MenhirState169
  | MenhirState167
  | MenhirState166
  | MenhirState162
  | MenhirState160
  | MenhirState134
  | MenhirState128
  | MenhirState127
  | MenhirState123
  | MenhirState119
  | MenhirState113
  | MenhirState111
  | MenhirState110
  | MenhirState102
  | MenhirState96
  | MenhirState90
  | MenhirState84
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState71
  | MenhirState70
  | MenhirState64
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState34
  | MenhirState27
  | MenhirState22
  | MenhirState17
  | MenhirState9
  | MenhirState8
  | MenhirState7
  | MenhirState4
  | MenhirState2


# 3 "parser.mly"
   open Ast 
# 135 "parser.ml"
let _eRR =
  Error

let rec _menhir_goto_pattern : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_pattern -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv717 * _menhir_state * 'tv_pattern) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv713 * _menhir_state * 'tv_pattern) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | FOR ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | FUN ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | IF ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | LBRACE ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | RETURN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | WHILE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | RBRACE ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185) : 'freshtv714)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv715 * _menhir_state * 'tv_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv716)) : 'freshtv718)

and _menhir_goto_regex_set_sequence : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regex_set_sequence -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv707 * _menhir_state) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv703 * _menhir_state) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_regex = 
# 163 "parser.mly"
                                    (RegexSet(_2))
# 213 "parser.ml"
             in
            _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)) : 'freshtv704)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv705 * _menhir_state) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv706)) : 'freshtv708)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state * 'tv_regex_set) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv709 * _menhir_state * 'tv_regex_set) * _menhir_state * 'tv_regex_set_sequence) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_regex_set_sequence = 
# 182 "parser.mly"
                                ((_1, _2))
# 232 "parser.ml"
         in
        _menhir_goto_regex_set_sequence _menhir_env _menhir_stack _menhir_s _v) : 'freshtv710)) : 'freshtv712)
    | _ ->
        _menhir_fail ()

and _menhir_goto_css_selector : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_css_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMP_RBRACK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv691 * _menhir_state) * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState166 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_pattern = 
# 153 "parser.mly"
                                    (CssPattern(_2))
# 258 "parser.ml"
         in
        _menhir_goto_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)) : 'freshtv692)
    | GT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState166 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | HASH ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | ID _v ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | LBRACK ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | PERIOD ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | TIMES ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv694)
    | ID _v ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
    | PLUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState166 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | HASH ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | ID _v ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
        | LBRACK ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | PERIOD ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | TIMES ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv696)
    | TILDE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv697 * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState166 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | HASH ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | ID _v ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
        | LBRACK ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | PERIOD ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | TIMES ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv698)
    | TIMES ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv700)

and _menhir_goto_simple_selector_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_simple_selector_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv675) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_simple_selector_seq) = _v in
        ((let _v : 'tv_css_selector = 
# 188 "parser.mly"
                     (SingleSelector(_1))
# 351 "parser.ml"
         in
        _menhir_goto_css_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv674)) : 'freshtv676)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv679 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv677 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : 'tv_simple_selector_seq) = _v in
        ((let ((_menhir_stack, _menhir_s, _1), _) = _menhir_stack in
        let _v : 'tv_css_selector = 
# 191 "parser.mly"
                                          (ChainedSelectors(_1,AnySibling,_3))
# 367 "parser.ml"
         in
        _menhir_goto_css_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv681 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : 'tv_simple_selector_seq) = _v in
        ((let ((_menhir_stack, _menhir_s, _1), _) = _menhir_stack in
        let _v : 'tv_css_selector = 
# 189 "parser.mly"
                                         (ChainedSelectors(_1,DirectSibling,_3))
# 383 "parser.ml"
         in
        _menhir_goto_css_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv682)) : 'freshtv684)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv687 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : 'tv_simple_selector_seq) = _v in
        ((let ((_menhir_stack, _menhir_s, _1), _) = _menhir_stack in
        let _v : 'tv_css_selector = 
# 190 "parser.mly"
                                       (ChainedSelectors(_1,Descendent,_3))
# 399 "parser.ml"
         in
        _menhir_goto_css_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv686)) : 'freshtv688)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regex_sequence : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regex_sequence -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FSLASH_RBRACK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv663 * _menhir_state) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv661 * _menhir_state) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_pattern = 
# 154 "parser.mly"
                                              (RegexPattern(_2))
# 425 "parser.ml"
             in
            _menhir_goto_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)) : 'freshtv664)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv665 * _menhir_state) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv666)) : 'freshtv668)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state * 'tv_regex) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state * 'tv_regex) * _menhir_state * 'tv_regex_sequence) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_regex_sequence = 
# 171 "parser.mly"
                        ((_1, _2))
# 444 "parser.ml"
         in
        _menhir_goto_regex_sequence _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regex_set : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regex_set -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv655 * _menhir_state) * _menhir_state * 'tv_regex_set) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv653 * _menhir_state) * _menhir_state * 'tv_regex_set) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_regex_set = 
# 178 "parser.mly"
                    (RegexComplementSet(_2))
# 463 "parser.ml"
         in
        _menhir_goto_regex_set _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)) : 'freshtv656)
    | MenhirState123 | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv659 * _menhir_state * 'tv_regex_set) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CARROT ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | CHAR _v ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | STRING _v ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | UNDER ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | RBRACK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv657 * _menhir_state * 'tv_regex_set) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex_set_sequence = 
# 181 "parser.mly"
           ((_1, []))
# 487 "parser.ml"
             in
            _menhir_goto_regex_set_sequence _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv660)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typed_simple_selector_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typed_simple_selector_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState171 | MenhirState169 | MenhirState167 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv647) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typed_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv645) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_typed_simple_selector_seq) = _v in
        ((let _v : 'tv_simple_selector_seq = 
# 195 "parser.mly"
                           (_1)
# 512 "parser.ml"
         in
        _menhir_goto_simple_selector_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)) : 'freshtv648)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv651 * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typed_simple_selector_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv649 * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_2 : 'tv_typed_simple_selector_seq) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_css_selector = 
# 192 "parser.mly"
                                          (ChainedSelectors(_1,DirectChild,_2))
# 528 "parser.ml"
         in
        _menhir_goto_css_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)) : 'freshtv652)
    | _ ->
        _menhir_fail ()

and _menhir_goto_property_selector_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_property_selector_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv635 * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_property_selector_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv633 * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_2 : 'tv_property_selector_list) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_typed_simple_selector_seq = 
# 200 "parser.mly"
                                        ((_1,_2))
# 550 "parser.ml"
         in
        _menhir_goto_typed_simple_selector_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv639 * _menhir_state * 'tv_property_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_property_selector_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv637 * _menhir_state * 'tv_property_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_2 : 'tv_property_selector_list) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_property_selector_list = 
# 208 "parser.mly"
                                            ( _1::_2)
# 566 "parser.ml"
         in
        _menhir_goto_property_selector_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)) : 'freshtv640)
    | MenhirState171 | MenhirState169 | MenhirState167 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv643) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_property_selector_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv641) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_property_selector_list) = _v in
        ((let _v : 'tv_simple_selector_seq = 
# 196 "parser.mly"
                          ((NoType,_1))
# 581 "parser.ml"
         in
        _menhir_goto_simple_selector_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)) : 'freshtv644)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regex : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regex -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState127 | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv627 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBRACK ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | PLUS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv613 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState127 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv611 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex = 
# 165 "parser.mly"
              (RegexUnOp(_1,KleenePlus))
# 611 "parser.ml"
             in
            _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
        | QUEST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv617 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState127 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv615 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex = 
# 164 "parser.mly"
               (RegexUnOp(_1,Optional))
# 626 "parser.ml"
             in
            _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)) : 'freshtv618)
        | STRING _v ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
        | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv621 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState127 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv619 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex = 
# 166 "parser.mly"
               (RegexUnOp(_1,KleeneTimes))
# 643 "parser.ml"
             in
            _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)) : 'freshtv622)
        | VERT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv623 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState127 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACK ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | STRING _v ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv624)
        | FSLASH_RBRACK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv625 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex_sequence = 
# 170 "parser.mly"
       ((_1, []))
# 669 "parser.ml"
             in
            _menhir_goto_regex_sequence _menhir_env _menhir_stack _menhir_s _v) : 'freshtv626)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv628)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv631 * _menhir_state * 'tv_regex) * _menhir_state) * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv629 * _menhir_state * 'tv_regex) * _menhir_state) * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _1), _), _, _3) = _menhir_stack in
        let _v : 'tv_regex = 
# 167 "parser.mly"
                    (RegexBinOp(_1,Or,_3))
# 685 "parser.ml"
         in
        _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)) : 'freshtv632)
    | _ ->
        _menhir_fail ()

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv609) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_regex_set = 
# 177 "parser.mly"
         (RegexAnyCharSet())
# 700 "parser.ml"
     in
    _menhir_goto_regex_set _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "parser.mly"
       (string)
# 707 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv607) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 16 "parser.mly"
       (string)
# 717 "parser.ml"
    )) = _v in
    ((let _v : 'tv_regex_set = 
# 174 "parser.mly"
         (RegexStringSet(_1))
# 722 "parser.ml"
     in
    _menhir_goto_regex_set _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "parser.mly"
       (char)
# 729 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MINUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv601 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 741 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CHAR _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv597 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 751 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 17 "parser.mly"
       (char)
# 756 "parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv595 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 763 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_3 : (
# 17 "parser.mly"
       (char)
# 768 "parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_regex_set = 
# 176 "parser.mly"
                    (RegexCharRangeSet(_1, _3))
# 774 "parser.ml"
             in
            _menhir_goto_regex_set _menhir_env _menhir_stack _menhir_s _v) : 'freshtv596)) : 'freshtv598)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv599 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 784 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv600)) : 'freshtv602)
    | CARROT | CHAR _ | RBRACK | STRING _ | UNDER ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 793 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_regex_set = 
# 175 "parser.mly"
        (RegexCharSet(_1))
# 799 "parser.ml"
         in
        _menhir_goto_regex_set _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv605 * _menhir_state * (
# 17 "parser.mly"
       (char)
# 809 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv606)

and _menhir_run119 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CARROT ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | CHAR _v ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | STRING _v ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | UNDER ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119

and _menhir_goto_type_selector : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv593 * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | HASH ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState160
    | LBRACK ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState160
    | PERIOD ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState160
    | AMP_RBRACK | GT | ID _ | PLUS | TILDE | TIMES ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv591 * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_typed_simple_selector_seq = 
# 199 "parser.mly"
               ((_1,[]))
# 854 "parser.ml"
         in
        _menhir_goto_typed_simple_selector_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv594)

and _menhir_goto_property_selector : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_property_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv589 * _menhir_state * 'tv_property_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | HASH ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | LBRACK ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | PERIOD ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | AMP_RBRACK | GT | ID _ | PLUS | TILDE | TIMES ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv587 * _menhir_state * 'tv_property_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_property_selector_list = 
# 207 "parser.mly"
                   ( [_1])
# 883 "parser.ml"
         in
        _menhir_goto_property_selector_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv590)

and _menhir_goto_pattern_action_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_pattern_action_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DOUBLE _v ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
                | FOR ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | FUN ->
                    _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | ID _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
                | IF ->
                    _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | INT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
                | LBRACE ->
                    _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | LPAREN ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | MINUS ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | RETURN ->
                    _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | STRING _v ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
                | THIS ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | WHILE ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | RBRACE ->
                    _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState177
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177) : 'freshtv574)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv576)) : 'freshtv578)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv579 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)) : 'freshtv582)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv585 * _menhir_state * 'tv_pattern_action) * _menhir_state * 'tv_pattern_action_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv583 * _menhir_state * 'tv_pattern_action) * _menhir_state * 'tv_pattern_action_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_pattern_action_list = 
# 58 "parser.mly"
                                      (_1 :: _2)
# 967 "parser.ml"
         in
        _menhir_goto_pattern_action_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)) : 'freshtv586)
    | _ ->
        _menhir_fail ()

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "parser.mly"
       (string)
# 976 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv571) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 16 "parser.mly"
       (string)
# 986 "parser.ml"
    )) = _v in
    ((let _v : 'tv_regex = 
# 162 "parser.mly"
        (RegexString(_1))
# 991 "parser.ml"
     in
    _menhir_goto_regex _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CARROT ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | CHAR _v ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | STRING _v ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | UNDER ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_type_selector = 
# 203 "parser.mly"
       (Universal)
# 1023 "parser.ml"
     in
    _menhir_goto_type_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 20 "parser.mly"
       (string)
# 1039 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563 * _menhir_state) = Obj.magic _menhir_stack in
        let (_2 : (
# 20 "parser.mly"
       (string)
# 1047 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_property_selector = 
# 211 "parser.mly"
           (ClassMatch(_2))
# 1053 "parser.ml"
         in
        _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)) : 'freshtv566)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv568)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 20 "parser.mly"
       (string)
# 1076 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ASSIGN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1087 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | STRING _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv499 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1097 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "parser.mly"
       (string)
# 1102 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | RBRACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv495 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1113 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1117 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv493 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1124 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1128 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _2), _4) = _menhir_stack in
                    let _v : 'tv_property_selector = 
# 214 "parser.mly"
                                  (AttributeEquals(_2,_4))
# 1134 "parser.ml"
                     in
                    _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)) : 'freshtv496)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv497 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1144 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1148 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)) : 'freshtv500)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv501 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1159 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv502)) : 'freshtv504)
        | DOLLAR_EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1168 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | STRING _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv511 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1178 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "parser.mly"
       (string)
# 1183 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | RBRACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv507 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1194 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1198 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv505 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1205 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1209 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _2), _4) = _menhir_stack in
                    let _v : 'tv_property_selector = 
# 217 "parser.mly"
                                     (AttributeEndsWith(_2,_4))
# 1215 "parser.ml"
                     in
                    _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv509 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1225 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1229 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)) : 'freshtv512)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv513 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1240 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)
        | RBRACK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1249 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv517 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1256 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _2) = _menhir_stack in
            let _v : 'tv_property_selector = 
# 213 "parser.mly"
                    (AttributeExists(_2))
# 1262 "parser.ml"
             in
            _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
        | TILDE_EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv531 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1270 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | STRING _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv527 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1280 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "parser.mly"
       (string)
# 1285 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | RBRACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv523 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1296 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1300 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv521 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1307 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1311 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _2), _4) = _menhir_stack in
                    let _v : 'tv_property_selector = 
# 218 "parser.mly"
                                    (AttributeWhitespaceContains(_2,_4))
# 1317 "parser.ml"
                     in
                    _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)) : 'freshtv524)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv525 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1327 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1331 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv529 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1342 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
        | TIMES_EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1351 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | STRING _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv539 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1361 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "parser.mly"
       (string)
# 1366 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | RBRACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv535 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1377 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1381 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv533 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1388 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1392 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _2), _4) = _menhir_stack in
                    let _v : 'tv_property_selector = 
# 215 "parser.mly"
                                    (AttributeContains(_2,_4))
# 1398 "parser.ml"
                     in
                    _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)) : 'freshtv536)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv537 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1408 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1412 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv541 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1423 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
        | XOR_EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv555 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1432 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | STRING _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv551 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1442 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "parser.mly"
       (string)
# 1447 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | RBRACK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv547 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1458 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1462 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv545 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1469 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1473 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _2), _4) = _menhir_stack in
                    let _v : 'tv_property_selector = 
# 216 "parser.mly"
                                  (AttributeBeginsWith(_2,_4))
# 1479 "parser.ml"
                     in
                    _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)) : 'freshtv548)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv549 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1489 "parser.ml"
                    )) * (
# 16 "parser.mly"
       (string)
# 1493 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)) : 'freshtv552)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv553 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1504 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv557 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1515 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv558)) : 'freshtv560)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv561 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 1530 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv491) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 20 "parser.mly"
       (string)
# 1540 "parser.ml"
    )) = _v in
    ((let _v : 'tv_type_selector = 
# 204 "parser.mly"
     (Elt(_1))
# 1545 "parser.ml"
     in
    _menhir_goto_type_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 20 "parser.mly"
       (string)
# 1561 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state) = Obj.magic _menhir_stack in
        let (_2 : (
# 20 "parser.mly"
       (string)
# 1569 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_property_selector = 
# 212 "parser.mly"
           (IdMatch(_2))
# 1575 "parser.ml"
         in
        _menhir_goto_property_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)

and _menhir_goto_key : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_key -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv483 * _menhir_state * 'tv_key) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479 * _menhir_state * 'tv_key) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv480)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state * 'tv_key) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)

and _menhir_goto_table_literal : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_table_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_table_literal) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_table_literal) = _v in
    ((let _v : 'tv_expr = 
# 82 "parser.mly"
                  (Literal(TableLiteral(_1)))
# 1633 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)) : 'freshtv478)

and _menhir_reduce49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_pattern_action_list = 
# 57 "parser.mly"
       ([])
# 1642 "parser.ml"
     in
    _menhir_goto_pattern_action_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACK ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | STRING _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | HASH ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | ID _v ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
    | LBRACK ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | PERIOD ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | TIMES ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv455 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1691 "parser.ml"
        )) * (
# 20 "parser.mly"
       (string)
# 1695 "parser.ml"
        )) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv453 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 1701 "parser.ml"
        )) * (
# 20 "parser.mly"
       (string)
# 1705 "parser.ml"
        )) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _3), _5), _, _7) = _menhir_stack in
        let _v : 'tv_stmt = 
# 78 "parser.mly"
                                   ( For(_3,_5,_7) )
# 1711 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
    | MenhirState185 | MenhirState177 | MenhirState2 | MenhirState74 | MenhirState96 | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | FOR ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | FUN ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | IF ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | LBRACE ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | RETURN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | WHILE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | RBRACE ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv458)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv465 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv459 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | FOR ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | FUN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | ID _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | IF ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | LBRACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | LPAREN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | RETURN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | WHILE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv460)
        | DOUBLE _ | FOR | FUN | ID _ | IF | INT _ | LBRACE | LPAREN | MINUS | RBRACE | RETURN | STRING _ | THIS | WHILE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv461 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, _3), _, _5) = _menhir_stack in
            let _v : 'tv_stmt = 
# 75 "parser.mly"
                                           ( If(_3,_5, Block([])))
# 1801 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv463 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)) : 'freshtv466)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv469 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv467 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, _3), _, _5), _, _7) = _menhir_stack in
        let _v : 'tv_stmt = 
# 76 "parser.mly"
                                        ( If(_3,_5,_7) )
# 1820 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)) : 'freshtv470)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv471 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, _3), _, _5) = _menhir_stack in
        let _v : 'tv_stmt = 
# 77 "parser.mly"
                                 ( While(_3,_5) )
# 1832 "parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)) : 'freshtv474)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv419 * 'tv_expr_list) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * 'tv_expr_list) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _1), _, _3) = _menhir_stack in
        let _v : 'tv_expr_list = 
# 108 "parser.mly"
                        ( _3 :: _1 )
# 1851 "parser.ml"
         in
        _menhir_goto_expr_list _menhir_env _menhir_stack _v) : 'freshtv418)) : 'freshtv420)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 1859 "parser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv421 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 1865 "parser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 100 "parser.mly"
                  (Assign(_1,_3))
# 1871 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)) : 'freshtv424)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv431 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv425 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 103 "parser.mly"
                         (_2)
# 1890 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv429 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | FOR ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | FUN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | ID _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | IF ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | LBRACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | LPAREN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | RETURN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | WHILE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv434)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)) : 'freshtv438)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_stmt = 
# 73 "parser.mly"
                    (Return(_2))
# 1965 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv440)) : 'freshtv442)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv443 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv444)) : 'freshtv446)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv451 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
            | FOR ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | FUN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | ID _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
            | IF ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
            | LBRACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | LPAREN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | RETURN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | WHILE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState78
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | _ ->
        _menhir_fail ()

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_reduce33 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 16 "parser.mly"
       (string)
# 2270 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_key = 
# 136 "parser.mly"
            (StringKey(_1))
# 2277 "parser.ml"
     in
    _menhir_goto_key _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_array_literal : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_array_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_array_literal) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv413) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_array_literal) = _v in
    ((let _v : 'tv_table_literal = 
# 117 "parser.mly"
               (_1)
# 2294 "parser.ml"
     in
    _menhir_goto_table_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)

and _menhir_reduce32 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "parser.mly"
       (int)
# 2301 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_key = 
# 135 "parser.mly"
        (IntKey(_1))
# 2308 "parser.ml"
     in
    _menhir_goto_key _menhir_env _menhir_stack _menhir_s _v

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_keyvalue_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_keyvalue_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv411 * _menhir_state) * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState22 in
            let (_v : (
# 18 "parser.mly"
       (int)
# 2338 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv394)
        | STRING _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState22 in
            let (_v : (
# 16 "parser.mly"
       (string)
# 2350 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv396)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv398)
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_keyvalue_literal = 
# 125 "parser.mly"
                             (_2)
# 2369 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_keyvalue_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_keyvalue_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_keyvalue_literal) = _v in
        ((let _v : 'tv_table_literal = 
# 118 "parser.mly"
                   (KeyValueLiteral(_1))
# 2386 "parser.ml"
         in
        _menhir_goto_table_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)) : 'freshtv404)) : 'freshtv406)) : 'freshtv408)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv409 * _menhir_state) * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)) : 'freshtv412)

and _menhir_goto_literal_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_literal_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv387 * _menhir_state) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv383 * _menhir_state) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv381 * _menhir_state) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_array_literal = 
# 122 "parser.mly"
                             (ArrayLiteral(_2))
# 2417 "parser.ml"
             in
            _menhir_goto_array_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)) : 'freshtv384)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv385 * _menhir_state) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)) : 'freshtv388)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state * 'tv_literal) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv389 * _menhir_state * 'tv_literal) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_literal_list = 
# 140 "parser.mly"
                              ( _1 :: _3)
# 2436 "parser.ml"
         in
        _menhir_goto_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)) : 'freshtv392)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * (
# 20 "parser.mly"
       (string)
# 2451 "parser.ml"
        )) * 'tv_params_list) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv315 * (
# 20 "parser.mly"
       (string)
# 2461 "parser.ml"
            )) * 'tv_params_list) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv313 * (
# 20 "parser.mly"
       (string)
# 2468 "parser.ml"
            )) * 'tv_params_list) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _1), _3), _, _6) = _menhir_stack in
            let _v : 'tv_func_decl = 
# 143 "parser.mly"
                                                      ( {fname=_1;
															params=_3;
															body=_6;
														})
# 2477 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv311) = _menhir_stack in
            let (_v : 'tv_func_decl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : 'tv_func_decl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv307 * _menhir_state) = Obj.magic _menhir_stack in
            let (_2 : 'tv_func_decl) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _v : 'tv_stmt = 
# 79 "parser.mly"
                 (Func(_2))
# 2492 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)) : 'freshtv310)) : 'freshtv312)) : 'freshtv314)) : 'freshtv316)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv317 * (
# 20 "parser.mly"
       (string)
# 2502 "parser.ml"
            )) * 'tv_params_list) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)) : 'freshtv320)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_stmt_list = 
# 69 "parser.mly"
                  (_1 :: _2)
# 2515 "parser.ml"
         in
        _menhir_goto_stmt_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)) : 'freshtv324)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv327 * _menhir_state) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_stmt = 
# 74 "parser.mly"
                           (Block(_2))
# 2534 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)) : 'freshtv328)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv329 * _menhir_state) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv339) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv337) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _3) = _menhir_stack in
            let _v : 'tv_begin_stmt = 
# 52 "parser.mly"
                               (Block(_3))
# 2560 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv335) = _menhir_stack in
            let (_v : 'tv_begin_stmt) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv333 * 'tv_begin_stmt) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACK_AMP ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | LBRACK_FSLASH ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | END ->
                _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv334)) : 'freshtv336)) : 'freshtv338)) : 'freshtv340)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv341) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)) : 'freshtv344)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv367) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv361) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, _3) = _menhir_stack in
            let _v : 'tv_end_stmt = 
# 54 "parser.mly"
                             (Block(_3))
# 2604 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv359) = _menhir_stack in
            let (_v : 'tv_end_stmt) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv357 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) * 'tv_end_stmt) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv353 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) * 'tv_end_stmt) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv351 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) * 'tv_end_stmt) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _1), _, _2), _3) = _menhir_stack in
                let _v : (
# 41 "parser.mly"
      (Ast.program)
# 2624 "parser.ml"
                ) = 
# 47 "parser.mly"
                                             ( {begin_stmt = _1;
													pattern_actions = _2;
													end_stmt = _3} )
# 2630 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv349) = _menhir_stack in
                let (_v : (
# 41 "parser.mly"
      (Ast.program)
# 2637 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
                let (_v : (
# 41 "parser.mly"
      (Ast.program)
# 2644 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
                let (_1 : (
# 41 "parser.mly"
      (Ast.program)
# 2651 "parser.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv346)) : 'freshtv348)) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv355 * 'tv_begin_stmt) * _menhir_state * 'tv_pattern_action_list) * 'tv_end_stmt) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)) : 'freshtv358)) : 'freshtv360)) : 'freshtv362)) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)) : 'freshtv368)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state * 'tv_pattern) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv375 * _menhir_state * 'tv_pattern) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv373 * _menhir_state * 'tv_pattern) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_pattern_action = 
# 61 "parser.mly"
                                 ( (_1,Block(_3)) )
# 2684 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv371) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_pattern_action) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_pattern_action) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LBRACK_AMP ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState182
            | LBRACK_FSLASH ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState182
            | END ->
                _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState182
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182) : 'freshtv370)) : 'freshtv372)) : 'freshtv374)) : 'freshtv376)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv377 * _menhir_state * 'tv_pattern) * _menhir_state * 'tv_stmt_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)) : 'freshtv380)
    | _ ->
        _menhir_fail ()

and _menhir_reduce39 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 16 "parser.mly"
       (string)
# 2719 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_literal = 
# 112 "parser.mly"
         (StringLiteral(_1))
# 2726 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce38 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "parser.mly"
       (int)
# 2733 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_literal = 
# 111 "parser.mly"
     (IntLiteral(_1))
# 2740 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr_list : _menhir_env -> 'ttv_tail -> 'tv_expr_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv305 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2751 "parser.ml"
    )) * 'tv_expr_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | LBRACE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv298)
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv301 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2787 "parser.ml"
        )) * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv299 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2794 "parser.ml"
        )) * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _3) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 101 "parser.mly"
                              (Call(_1,_3))
# 2800 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)) : 'freshtv302)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 2810 "parser.ml"
        )) * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)

and _menhir_goto_expr_no_brace : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr_no_brace -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState76 | MenhirState71 | MenhirState4 | MenhirState8 | MenhirState64 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv223 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_expr = 
# 84 "parser.mly"
                    (_1)
# 2852 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)) : 'freshtv228)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 90 "parser.mly"
                                     (Binop(_1,Times,_3))
# 2871 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)) : 'freshtv232)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | PLUS | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv233 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 93 "parser.mly"
                                    (Binop(_1,Plus,_3))
# 2891 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv241 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv239 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 91 "parser.mly"
                                       (Binop(_1,Divides,_3))
# 2910 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)) : 'freshtv242)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv243 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 99 "parser.mly"
                                   (Binop(_1,NotEqual,_3))
# 2942 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)) : 'freshtv248)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | PLUS | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 92 "parser.mly"
                                     (Binop(_1,Minus,_3))
# 2969 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv255 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 95 "parser.mly"
                                  (Binop(_1,Less,_3))
# 3000 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv257 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv261 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 97 "parser.mly"
                                   (Binop(_1,LessEqual,_3))
# 3031 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv263 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 96 "parser.mly"
                                  (Binop(_1,Greater,_3))
# 3062 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv269 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | GEQ | GT | LEQ | LT | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 98 "parser.mly"
                                   (Binop(_1,GreaterEqual,_3))
# 3093 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv275 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)) : 'freshtv278)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EQ | NEQ | RPAREN | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv279 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr_no_brace = 
# 94 "parser.mly"
                                  (Binop(_1,Equal,_3))
# 3132 "parser.ml"
             in
            _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv281 * _menhir_state * 'tv_expr_no_brace) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv287 * _menhir_state) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv285 * _menhir_state) * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 104 "parser.mly"
                                       (Uminus(_2))
# 3151 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
    | MenhirState185 | MenhirState177 | MenhirState2 | MenhirState70 | MenhirState74 | MenhirState78 | MenhirState102 | MenhirState84 | MenhirState96 | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv291 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv289 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_stmt = 
# 72 "parser.mly"
                    (Expr(_1))
# 3188 "parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)) : 'freshtv292)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
    | _ ->
        _menhir_fail ()

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState9 in
        let (_v : (
# 18 "parser.mly"
       (int)
# 3218 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA | RBRACE ->
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
        | COLON ->
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211 * _menhir_state * (
# 18 "parser.mly"
       (int)
# 3235 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)) : 'freshtv214)
    | RBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState9 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_array_literal = 
# 121 "parser.mly"
                  ( EmptyTable )
# 3251 "parser.ml"
         in
        _menhir_goto_array_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)) : 'freshtv218)
    | STRING _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState9 in
        let (_v : (
# 16 "parser.mly"
       (string)
# 3261 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA | RBRACE ->
            _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack)
        | COLON ->
            _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv219 * _menhir_state * (
# 16 "parser.mly"
       (string)
# 3278 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_goto_params_list : _menhir_env -> 'ttv_tail -> 'tv_params_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv209 * (
# 20 "parser.mly"
       (string)
# 3296 "parser.ml"
    )) * 'tv_params_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199 * 'tv_params_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv195 * 'tv_params_list) = Obj.magic _menhir_stack in
            let (_v : (
# 20 "parser.mly"
       (string)
# 3313 "parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv193 * 'tv_params_list) = Obj.magic _menhir_stack in
            let (_3 : (
# 20 "parser.mly"
       (string)
# 3321 "parser.ml"
            )) = _v in
            ((let (_menhir_stack, _1) = _menhir_stack in
            let _v : 'tv_params_list = 
# 150 "parser.mly"
                        (_3::_1)
# 3327 "parser.ml"
             in
            _menhir_goto_params_list _menhir_env _menhir_stack _v) : 'freshtv194)) : 'freshtv196)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv197 * 'tv_params_list) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv198)) : 'freshtv200)
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * (
# 20 "parser.mly"
       (string)
# 3341 "parser.ml"
        )) * 'tv_params_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv201 * (
# 20 "parser.mly"
       (string)
# 3351 "parser.ml"
            )) * 'tv_params_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
            | FOR ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | FUN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | ID _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
            | IF ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
            | LBRACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | LPAREN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | RETURN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | WHILE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | RBRACE ->
                _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState84
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv202)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv203 * (
# 20 "parser.mly"
       (string)
# 3395 "parser.ml"
            )) * 'tv_params_list) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv204)) : 'freshtv206)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * (
# 20 "parser.mly"
       (string)
# 3405 "parser.ml"
        )) * 'tv_params_list) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv208)) : 'freshtv210)

and _menhir_goto_literal : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv168)
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_literal_list = 
# 139 "parser.mly"
         ( [_1] )
# 3444 "parser.ml"
             in
            _menhir_goto_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_key) * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * 'tv_key) * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_keyvalue = 
# 132 "parser.mly"
                    ( (_1,_3) )
# 3463 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_keyvalue) = _v in
        ((match _menhir_s with
        | MenhirState22 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv177 * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_keyvalue) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let (_3 : 'tv_keyvalue) = _v in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_keyvalue_list = 
# 129 "parser.mly"
                               ( _3 :: _1)
# 3483 "parser.ml"
             in
            _menhir_goto_keyvalue_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)) : 'freshtv178)
        | MenhirState9 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv181) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_keyvalue) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_1 : 'tv_keyvalue) = _v in
            ((let _v : 'tv_keyvalue_list = 
# 128 "parser.mly"
          ( [_1] )
# 3498 "parser.ml"
             in
            _menhir_goto_keyvalue_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)) : 'freshtv182)
        | _ ->
            _menhir_fail ()) : 'freshtv184)) : 'freshtv186)) : 'freshtv188)
    | MenhirState185 | MenhirState177 | MenhirState2 | MenhirState70 | MenhirState74 | MenhirState78 | MenhirState102 | MenhirState84 | MenhirState96 | MenhirState90 | MenhirState76 | MenhirState71 | MenhirState4 | MenhirState7 | MenhirState8 | MenhirState64 | MenhirState57 | MenhirState55 | MenhirState53 | MenhirState51 | MenhirState49 | MenhirState47 | MenhirState45 | MenhirState43 | MenhirState41 | MenhirState39 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 89 "parser.mly"
           (Literal(_1))
# 3512 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)) : 'freshtv192)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_pattern_action) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv80)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * 'tv_css_selector) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state) * _menhir_state * 'tv_css_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_property_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state * 'tv_regex) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_regex) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_regex_set) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * 'tv_begin_stmt) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv108)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 3619 "parser.ml"
        )) * (
# 20 "parser.mly"
       (string)
# 3623 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * (
# 20 "parser.mly"
       (string)
# 3632 "parser.ml"
        )) * 'tv_params_list) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv116)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 3665 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state * 'tv_expr_no_brace) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * 'tv_expr_list) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv150)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state * 'tv_key) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state * 'tv_keyvalue_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state * 'tv_literal) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv166)

and _menhir_reduce87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_stmt_list = 
# 68 "parser.mly"
       ([])
# 3768 "parser.ml"
     in
    _menhir_goto_stmt_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | LBRACE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv72)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_literal = 
# 114 "parser.mly"
          (This)
# 3821 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv70)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "parser.mly"
       (string)
# 3828 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run71 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | LBRACE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | LBRACE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | FOR ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | FUN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | ID _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | IF ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | LBRACE ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | LPAREN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | RETURN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | STRING _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | THIS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | WHILE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | RBRACE ->
        _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "parser.mly"
       (int)
# 3956 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | LBRACE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv66)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
       (string)
# 4006 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4018 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOUBLE _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | ID _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | LBRACE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | LPAREN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | STRING _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | THIS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv44)
    | LBRACK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4048 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STRING _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv51 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4058 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "parser.mly"
       (string)
# 4063 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | RBRACK ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv47 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4074 "parser.ml"
                )) * (
# 16 "parser.mly"
       (string)
# 4078 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv45 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4085 "parser.ml"
                )) * (
# 16 "parser.mly"
       (string)
# 4089 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _1), _3) = _menhir_stack in
                let _v : 'tv_expr_no_brace = 
# 102 "parser.mly"
                           (TableAccess(_1,_3))
# 4095 "parser.ml"
                 in
                _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)) : 'freshtv48)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv49 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4105 "parser.ml"
                )) * (
# 16 "parser.mly"
       (string)
# 4109 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv53 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4120 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)) : 'freshtv56)
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4129 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        ((let _v : 'tv_expr_list = 
# 107 "parser.mly"
       ( [] )
# 4137 "parser.ml"
         in
        _menhir_goto_expr_list _menhir_env _menhir_stack _v) : 'freshtv58)) : 'freshtv60)
    | COMMA | DIVIDES | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | PLUS | RPAREN | SEMI | TIMES ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4145 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_expr_no_brace = 
# 88 "parser.mly"
       (Id(_1))
# 4151 "parser.ml"
         in
        _menhir_goto_expr_no_brace _menhir_env _menhir_stack _menhir_s _v) : 'freshtv62)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * (
# 20 "parser.mly"
       (string)
# 4161 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
        let (_v : (
# 20 "parser.mly"
       (string)
# 4178 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv35 * (
# 20 "parser.mly"
       (string)
# 4189 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
            ((let _v : 'tv_params_list = 
# 149 "parser.mly"
       ( [] )
# 4197 "parser.ml"
             in
            _menhir_goto_params_list _menhir_env _menhir_stack _v) : 'freshtv34)) : 'freshtv36)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv37 * (
# 20 "parser.mly"
       (string)
# 4207 "parser.ml"
            )) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv38)) : 'freshtv40)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv25 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 20 "parser.mly"
       (string)
# 4236 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv21 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4247 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ID _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv17 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4257 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : (
# 20 "parser.mly"
       (string)
# 4262 "parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | RPAREN ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (('freshtv13 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4273 "parser.ml"
                        )) * (
# 20 "parser.mly"
       (string)
# 4277 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | DOUBLE _v ->
                            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                        | FOR ->
                            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | FUN ->
                            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | ID _v ->
                            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                        | IF ->
                            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | INT _v ->
                            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                        | LBRACE ->
                            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | LPAREN ->
                            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | MINUS ->
                            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | RETURN ->
                            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | STRING _v ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                        | THIS ->
                            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | WHILE ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv14)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (('freshtv15 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4319 "parser.ml"
                        )) * (
# 20 "parser.mly"
       (string)
# 4323 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv19 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4334 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv23 * _menhir_state) * (
# 20 "parser.mly"
       (string)
# 4345 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "parser.mly"
       (float)
# 4367 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 19 "parser.mly"
       (float)
# 4377 "parser.ml"
    )) = _v in
    ((let _v : 'tv_literal = 
# 113 "parser.mly"
         (DoubleLiteral(_1))
# 4382 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
      }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 41 "parser.mly"
      (Ast.program)
# 4401 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = () in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOUBLE _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
            | FOR ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | FUN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | ID _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
            | IF ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
            | LBRACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | LPAREN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | RETURN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | STRING _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
            | THIS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | WHILE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | RBRACE ->
                _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState2
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2) : 'freshtv2)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv4)) : 'freshtv6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv8)) : 'freshtv10))



