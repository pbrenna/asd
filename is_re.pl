%controlla se l'unico argomento è regexp
%ogni atomo è un'espressione regolare
is_regexp(X) :- 
	atomic(X),
	!.

%star(regexp) è regexp, come plus e bar
is_regexp(star(X)) :- 
	is_regexp(X).
is_regexp(plus(X)) :- 
	is_regexp(X).
is_regexp(bar(X)) :- 
	is_regexp(X).

%qui ci arriviamo dall'ultima clausola che usa univ per spacchettare i predicati
%e riconosciamo solo seq alt e oneof.
%CUT: le prossime clausole sono mutualmente esclusive.
is_regexp([seq|X]) :- 
	foreach(X,is_regexp),
	!.
is_regexp([alt|X]) :- 
	foreach(X,is_regexp),
	!.
is_regexp([oneof|X]) :- 
	foreach(X,atomic), 
	!.
%se X è una lista dobbiamo fermarci per non spacchettare cose a caso
%spacchettamento per predicati con arità variabile
is_regexp(X) :- 
	\+is_list(X),
	compound(X),
	X =.. Y,
	is_regexp(Y).

