 
%nfa_compile_token(FA_ID, InState, OutState, bar(Reg), falso) :-
%	gensym(FA_ID, Sym1),
%	assert(delta(FA_ID,InState, epsilon, Sym1)),
%	nfa_compile_token(FA_ID, Sym1, OutStateErr, Reg, vero),
%	assert(statoErrore(OutStateErr)),
%	gensym(FA_ID,Sym2),
%	assert(delta(FA_ID, Sym1, epsilon, Sym2)),
%	gensym(FA_ID, OutState),
%	assert(delta(FA_ID,Sym2,epsilon, OutState)),
%	assert(delta(FA_ID,Sym2,qualunque_cosa, OutState)).
	
