%Affinché bar consumi input, è necessario creare un secondo automa
%parallelamente al primo, che consumi lo stesso numero di simboli di quello
%negato. Ciò si ottiene grazie alla trasformazione mangiatutto.
%Qualora lo stato negato dovesse accettare la stringa, è necessario che tale
%automa parallelo venga reso inaccessibile, effetto ottenuto condizionando
%la e-mossa con cui lo si raggiunge.

nfa_compile_token(FA_ID, InState, OutMangiatutto, bar(Reg), _) :-
	gensym(FA_ID, Inizio),
	assert(delta(FA_ID, InState, epsilon, Inizio)),
	gensym(FA_ID, InMangiatutto),
	nfa_compile_token(FA_ID, Inizio, OutStateErr, Reg, falso),
	assert(statoErrore(FA_ID, OutStateErr)),
	mangiatutto(Reg, Reg2),
	nfa_compile_token(FA_ID, InMangiatutto, OutMangiatutto, Reg2, falso),
	assert((delta(FA_ID, Inizio, epsilon,InMangiatutto) :- 
				not(raggiuntoErrore(FA_ID, OutStateErr)))).
