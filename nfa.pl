accept([I|Is], S) :-
	delta(_,S, I, N),
	accept(Is, N).
	%write(S),write(I),write(N).

accept(Is, S) :-
	delta(_,S, epsilon, N),
	accept(Is, N).
	%write(S),write(delta),write(N).

accept([_|Is], S) :-
	delta(_,S, qualunque_cosa, N),
	accept(Is, N).
	%write(S),write(delta),write(N).

accept(_,Q) :-
	statoErrore(Q),
	!,
	fail.
accept([],Q) :- 
	final(_,Q).

recognise(Input) :- 
	initial(_,S),
	accept(Input,S), 
	!.


%delta(a,q0,epsilon,q1).
%delta(a,q1,a,q2).
%delta(a,q2,epsilon,q1).
%delta(a,q0,epsilon,q3).
%delta(a,q2,epsilon,q3).
%final(q3).
