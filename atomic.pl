%atomico: caso base
nfa_compile_token(FA_ID, InState, OutState, Xatomico, _) :-
	atomic(Xatomico),
	%occorrono 2 stati
	gensym(FA_ID, Sym1),
	%di cui uno di uscita dalla scatola
	gensym(FA_ID, OutState),
	%collega l'automa al mondo esterno con e-mossa
	assert(delta(FA_ID, InState, epsilon, Sym1)),
	%e il primo stato al secondo se mangia l'atomo Xatomico
	assert(delta(FA_ID, Sym1, Xatomico, OutState)).
