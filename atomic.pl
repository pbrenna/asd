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

%atomico: caso base
nfa_compile_token(FA_ID, InState, OutState, Xatomico, vero) :-
	atomic(Xatomico),
	gensym(FA_ID,Sym1),			%occorrono 2 stati
	gensym(FA_ID,ErrState),		%di cui uno di uscita dalla scatola
	gensym(FA_ID,OutState),		%di cui uno di uscita dalla scatola
	
	assert(delta(FA_ID, InState, epsilon, Sym1)),	%collega l'automa al mondo
													%esterno con e-mossa
	assert(verso_il_male(Sym1)),
	
	assert(delta(FA_ID, Sym1, Xatomico, ErrState)), %e il primo stato al secondo
													%se mangia l'atomo
													%Xatomico
	assert(delta(FA_ID, Sym1, qualunque_cosa,OutState)).
