
%star(Reg), riciclato per plus(Reg)
nfa_compile_token(FA_ID, InState, OutState, star(Reg), falso) :-
	gensym(FA_ID,Sym1),									%occorre stato d'entrata
	assert(delta(FA_ID, InState, epsilon, Sym1)),		%collegato al resto
	
	nfa_compile_token(FA_ID, Sym1, OutStateRic, Reg, falso),	%ricorsione per 
														%creare
														%l'automa dell'argomento

	assert(delta(FA_ID, OutStateRic, epsilon, Sym1)),	%e-mossa tra uscita
														%dell'argomento e 
														%entrata dello star
	
	gensym(FA_ID,OutState),							%stato di uscita dello star
	
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)),	%e-mossa da uscita
															%dell'argomento a
															%uscita di star
															
	assert(delta(FA_ID, Sym1, epsilon, OutState)).	%e-mossa da ingresso a
													%uscita di star
%ciao
