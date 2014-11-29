%oneof è un caso particolare di alt
nfa_compile_token(FA_ID, InState, OutState, [oneof | Args], TogliStar) :-
	nfa_compile_token(FA_ID, InState, OutState, [alt | Args], TogliStar).
