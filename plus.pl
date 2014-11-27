%Plus, implementato come seq(Reg, star(Reg)).
nfa_compile_token(FA_ID, InState, OutState, plus(Reg), _) :-
%	gensym(FA_ID,Sym1),
%	assert(delta(FA_ID,InState, epsilon, Sym1)),
%	nfa_compile_token(FA_ID, Sym1, OutStateA, Reg, _),
%	nfa_compile_token(FA_ID, OutStateA, OutState, star(Reg), falso).
	nfa_compile_token(FA_ID,InState,OutState,seq(Reg, star(Reg)), falso).
