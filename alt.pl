%alt ha arità variabile
%definisco un predicato ausiliario nfa_compile_token_alt
%che si occupi di ogni espressione contenuta.
%notare che uno star contenuto in uno star(alt()) verrà eliminato in quanto
%superfluo dal punto di vista della regexp e dannoso dal punto di vista del 
%riconoscimento.

nfa_compile_token(FA_ID, InState, OutState, [alt|Args], TogliStar) :-
	%creo simbolo iniziale e finale
	gensym(FA_ID, Inizio),
	gensym(FA_ID, OutState),
	%connetto stato iniziale a stato precedente
	assert(delta(FA_ID, InState, epsilon, Inizio)),
	%lancio compilazione per ogni espressione.
	nfa_compile_token_alt(FA_ID, Inizio, OutState, Args, TogliStar).

%caso base della ricorsione
nfa_compile_token_alt(_,_,_,[], _).
%caso ricorsivo
nfa_compile_token_alt(FA_ID, Inizio, OutState, [Primo | Args], TogliStar) :-
	%compilo l'espressione connettendola allo stato iniziale dell'alt
	nfa_compile_token(FA_ID, Inizio, OutStateRic, Primo, TogliStar),
	%connetto con e-mossa lo stato finale del sotto-automa allo stato finale
	%di alt
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)),
	%eseguo la ricorsione sulle altre espressioni.
	nfa_compile_token_alt(FA_ID, Inizio, OutState, Args, TogliStar).
