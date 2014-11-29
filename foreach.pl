%foreach(List, Predicate(El))
%controlla Predicato(X) per ogni X in List
foreach([], _).
foreach([Primo|X], Pred) :- 
	Pred =.. Y,
	append(Y, [Primo], Lista),
	Chiamato =..Lista,
	call(Chiamato),
	foreach(X, Pred).

