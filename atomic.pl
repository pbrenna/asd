%atomico: caso base
nfa_compile_token(FA_ID, InState, OutState, Xatomico, falso) :-
	atomic(Xatomico),
	gensym(FA_ID,Sym1),			%occorrono 2 stati
	gensym(FA_ID,OutState),		%di cui uno di uscita dalla scatola
	
	assert(delta(FA_ID, InState, epsilon, Sym1)),	%collega l'automa al mondo
													%esterno con e-mossa
	
	assert(delta(FA_ID, Sym1, Xatomico, OutState)). %e il primo stato al secondo
													%se mangia l'atomo
													%Xatomico
