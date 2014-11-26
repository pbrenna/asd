nfa_accept(FA_ID, [I|Is], S) :-
	verso_il_male(S),
	delta(FA_ID,S, I, N),
	!,
	nfa_accept(FA_ID, Is, N).

nfa_accept(FA_ID, [I|Is], S) :-
	delta(FA_ID,S, I, N),
	nfa_accept(FA_ID, Is, N).

nfa_accept(FA_ID, Is, S) :-
	delta(FA_ID, S, epsilon, N),
	nfa_accept(FA_ID, Is, N).

nfa_accept(FA_ID, [_|Is], S) :-
	delta(FA_ID,S, qualunque_cosa, N),
	nfa_accept(FA_ID, Is, N).

%nfa_accept(FA_ID, _, Q) :-
%	statoErrore(FA_ID, Q),
%	!,
%	fail.

nfa_accept(FA_ID, [], Q) :- 
	final(FA_ID, Q).

nfa_recognize(FA_ID, Input) :-
	initial(FA_ID, S),
	nfa_accept(FA_ID, Input, S),
	!.
