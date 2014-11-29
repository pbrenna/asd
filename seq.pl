%seq ha arità variabile
nfa_compile_token(FA_ID, InState, OutState, [seq|Args], _) :-
	%genera stato d'ingresso
	gensym(FA_ID, Sym1), 
	%connettilo al mondo esterno
	assert(delta(FA_ID, InState, epsilon, Sym1)), 
	%lancia ricorsione su argomenti
	nfa_compile_token_seq(FA_ID, Sym1, OutStateRic, Args, falso), 
	%genera simbolo di uscita
	gensym(FA_ID, OutState), 
	%connettigli l'ultimo automa della seq
	assert(delta(FA_ID, OutStateRic, epsilon, OutState)).

%caso base
nfa_compile_token_seq(_, OutState, OutState, [], _).
%caso ricorsivo
nfa_compile_token_seq(FA_ID, LastState, OutStateEsce, [Primo | Args], falso) :-
	%compila l'argomento
	nfa_compile_token(FA_ID, LastState, OutStateBuilder, Primo, falso), 
	%ricorsione sugli altri
	nfa_compile_token_seq(FA_ID, OutStateBuilder, OutStateEsce, Args, falso).
