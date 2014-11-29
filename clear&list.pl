nfa_clear :-
	retractall(initial(_, _)),
	retractall(final(_, _)),
	retractall(delta(_, _, _, _)).

nfa_clear_nfa(FA_ID) :-
	retractall(initial(FA_ID, _)),
	retractall(final(FA_ID, _)),
	retractall(delta(FA_ID, _, _, _)).

nfa_list :-
	initial(_, _),
	listing(delta(_, _, _, _)),
	listing(final(_, _)).

nfa_list(FA_ID) :-
	initial(FA_ID, _),
	listing(initial(FA_ID, _)),
	listing(delta(FA_ID, _, _, _)),
	listing(final(FA_ID, _)).
