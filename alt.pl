
nfa_compile_token(FA_ID, InState, OutState, [alt|Args], falso) :-
	gensym(FA_ID, Inizio),
	gensym(FA_ID, OutState),
	assert(delta(FA_ID, InState, epsilon, Inizio)),
	nfa_compile_token_alt(FA_ID, Inizio, OutState, Args, falso).

nfa_compile_token_alt(_,_,_,[], falso).
nfa_compile_token_alt(FA_ID, Inizio, OutState, [Primo | Args], falso) :-
	nfa_compile_token(FA_ID, Inizio, OutStateRic, Primo, falso),
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)),
	nfa_compile_token_alt(FA_ID, Inizio, OutState, Args, falso).
