nfa_compile_token(FA_ID, InState, OutState, bar(Reg), falso) :-
	nfa_compile_token(FA_ID, InState, OutState, Reg, vero).

nfa_compile_token(FA_ID, InState, OutState, bar(Reg), vero) :-
	nfa_compile_token(FA_ID, InState, OutState, Reg, falso).

nfa_compile_token(FA_ID, InState, OutState, barStupido(barStupido(Reg)), _) :-
	nfa_compile_token(FA_ID, InState, OutState, Reg, falso).
nfa_compile_token(FA_ID, InState, OutState, barStupido(Reg), _) :-
	gensym(FA_ID, Sym1),
	assert(delta(FA_ID, InState, epsilon,Sym1)),
	gensym(FA_ID, OutState),
	nfa_compile_token(FA_ID, Sym1, OutStateRic, Reg, falso),
	assert(delta(FA_ID, Sym1, epsilon, OutState)),
	assert(statoErrore(OutStateRic)).

%nfa_compile_token(FA_ID, InState, OutState, bar(Reg), _) :-
	
