%star(Reg), riciclato per plus(Reg)
nfa_compile_token(FA_ID, Instate, OutState, star(Reg),vero) :-
	nfa_compile_token(FA_ID, Instate, OutState, Reg,vero),
	write(star(Reg)), writeln(': rimuovo star superfluo').

nfa_compile_token(FA_ID, InState, OutState, star(Reg), falso) :-
	%occorre stato d'entrata
	gensym(FA_ID,Sym1),
	%collegato al resto
	assert(delta(FA_ID, InState, epsilon, Sym1)),
	%ricorsione per creare l'automa dell'argomento
	nfa_compile_token(FA_ID, Sym1, OutStateRic, Reg, vero),
	%e-mossa tra uscita dell'argomento e entrata dello star
	assert(delta(FA_ID, OutStateRic, epsilon, Sym1)),
	%stato di uscita dello star
	gensym(FA_ID,OutState),
	%e-mossa da uscita dell'argomento a uscita di star
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)),
	%e-mossa da ingresso a uscita di star
	assert(delta(FA_ID, Sym1, epsilon, OutState)).
