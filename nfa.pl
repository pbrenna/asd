nfa_accept(FA_ID, _, S) :-
	statoErrore(FA_ID, S),
	assert(raggiuntoErrore(FA_ID, S)),
	fail.
nfa_accept(FA_ID, [I|Is], S) :-
	delta(FA_ID, S, I, N),
	nfa_accept(FA_ID, Is, N).

nfa_accept(FA_ID, Is, S) :-
	delta(FA_ID, S, epsilon, N),
	nfa_accept(FA_ID, Is, N).

nfa_accept(FA_ID, [_|Is], S) :-
	delta(FA_ID, S, qualunque_cosa, N),
	nfa_accept(FA_ID, Is, N).
nfa_accept(FA_ID, [], Q) :- 
	final(FA_ID, Q).

nfa_recognize(FA_ID, Input) :-
	retractall(raggiuntoErrore(_, _)),
	initial(FA_ID, S),
	nfa_accept(FA_ID, Input, S),
	!.
