nfa_compile_token(FA_ID, InState, OutState, [oneof | Args], falso) :-
	nfa_compile_token(FA_ID, InState, OutState, [alt | Args], falso).
