nfa_compile_token(FA_ID, InState, OutState, [oneof | Args], NEGATO) :-
	nfa_compile_token(FA_ID, InState, OutState, [alt | Args], NEGATO).
