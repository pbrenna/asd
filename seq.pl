
nfa_compile_token(FA_ID, InState, OutState, [seq|Args], falso) :-
	gensym(FA_ID, Sym1), 
	assert(delta(FA_ID, InState, epsilon, Sym1)), 
	nfa_compile_token_seq(FA_ID, Sym1, OutStateRic, Args, falso), 
	gensym(FA_ID, OutState), 
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)).

nfa_compile_token_seq(_, OutState, OutState, [], falso).
nfa_compile_token_seq(FA_ID, LastState, OutStateEsce, [Primo | Args], falso) :-
	nfa_compile_token(FA_ID, LastState, OutStateBuilder, Primo, falso), 
	nfa_compile_token_seq(FA_ID, OutStateBuilder, OutStateEsce, Args, falso).
