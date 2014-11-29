%Plus, implementato come seq(Reg, star(Reg)).
nfa_compile_token(FA_ID, InState, OutState, plus(Reg), _) :-
	nfa_compile_token(FA_ID, InState, OutState, seq(Reg, star(Reg)),
		falso).
