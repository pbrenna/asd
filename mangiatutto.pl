mangiatutto(Xatomico, qualunque_cosa) :-
	atomic(Xatomico).

mangiatutto(star(Reg), star(Nuovo)) :-
	mangiatutto(Reg, Nuovo).

mangiatutto(plus(Reg), plus(Nuovo)) :-
	mangiatutto(Reg, Nuovo).

mangiatutto(bar(Reg), Nuovo) :-
	mangiatutto(Reg, Nuovo).
	
mangiatutto([alt | Args], Nuovo) :-
	mangiatutto_list(Args, ArgNuovi),
	Nuovo =.. [alt | ArgNuovi].

mangiatutto([oneof | Args], Nuovo) :-
	mangiatutto_list(Args, ArgNuovi),
	Nuovo =.. [oneof | ArgNuovi].

mangiatutto([seq | Args], Nuovo) :-
	mangiatutto_list(Args, ArgNuovi),
	Nuovo =.. [seq | ArgNuovi].	

mangiatutto(X, Nuovo) :-
	not(is_list(X)),
	X =.. Lista,
	mangiatutto(Lista, Nuovo).
	
mangiatutto_list([Primo | Resto], [Nuovo | RestoNuovo]) :-
	mangiatutto(Primo, Nuovo),
	mangiatutto_list(Resto, RestoNuovo).
mangiatutto_list([], []).
