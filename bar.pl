 
nfa_compile_token(FA_ID, InState, OutState, bar(Reg), falso) :-
	nfa_compile_token(FA_ID, InState, OutState, Reg, vero).

nfa_compile_token(FA_ID, InState, OutState, bar(Reg), vero) :-
	nfa_compile_token(FA_ID, InState, OutState, Reg, falso).
