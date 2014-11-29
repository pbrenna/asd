%l'interprete richiede questa riga per controllare initial(FA_ID) prima che 
%sia stato mai usato.
:- dynamic initial/2.
:- multifile nfa_compile_token/5.
:- dynamic statoErrore/2.
:- dynamic raggiuntoErrore/2.
%Predicato nfa_compile_regexp
%InState è uno stato già esistente a cui il nuovo automa di token si collegherà
%con una epsilon mossa. 
%OutState è lo stato che il nuovo token crea come stato di uscita dal token.
%l'argomento 5, TogliStar, è "vero" se siamo direttamente dentro a uno star o
%dentro a uno star(alt()).

%questo è necessario per non duplicare un automa 
nfa_compile_regexp(FA_ID,_) :-
	initial(FA_ID, _),
	!,
	fail.
	
%predicato d'ingresso, inizia la ricorsione.
nfa_compile_regexp(FA_ID, Reg) :-
	functor(FA_ID, _, 0),		%controlla che FA_ID sia fatto bene
								%TODO rivedere la specifica non chiarissima
	
	is_regexp(Reg),				%controlla che Reg sia valida
	gensym(FA_ID, SymStart),	%crea uno stato iniziale
	assert(initial(FA_ID, SymStart)),
	nfa_compile_token(FA_ID, SymStart, OutState, Reg, falso),	%lancia 
														%ricorsione di 
														%nfa_compile_token/4
	assert(final(FA_ID, OutState)).			%imposta lo stato finale di tutto
											%l'automa come finale

%nfa_compile_token
%genera le parti di automa inscatolabili
:- consult('atomic.pl').

:- consult('star.pl').

:- consult('seq.pl').

:- consult('plus.pl').

:- consult('bar.pl').

:- consult('alt.pl').

:- consult('oneof.pl').


nfa_compile_token(FA_ID, InState, OutState, X, TogliStar) :-
	\+is_list(X), 
	compound(X),
	X =.. Y,
	nfa_compile_token(FA_ID, InState, OutState, Y, TogliStar).
