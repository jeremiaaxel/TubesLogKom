:- dynamic(len/1).
:- dynamic(width/1).
:- dynamic(wall/1).
:- dynamic(posPlayer/2).
:- dynamic(store/2).
:- dynamic(quest1/2).
:- dynamic(quest2/2).
:- dynamic(quest3/2).
:- dynamic(dungeon/2).

initLocations :-
    asserta(dungeon(5,7)).
    asserta(quest1(7,4)),
    asserta(quest2(8,8)),
    asserta(quest3(6,2)).
    asserta(store(1,5)).
    asserta(posPlayer(1,1)),

posPlayer(X,Y) :-
    posPlayer(A,B),
    X =:= A,
    Y =:= B.

posStore(X,Y) :-
    store(A,B),
    X =:= 7,
    Y =:= 4.

posQuest1(X,Y) :-
    quest1(A,B),
    X =:= A,
    Y =:= B.

posQuest2(X,Y) :-
    quest2(A,B),
    X =:= A,
    Y =:= B.

posQuest3(X,Y) :-
    quest3(A,B),
    X =:= A,
    Y =:= B.

posDungeon(X,Y) :-
    dungeon(A,B),
    X =:= A,
    Y =:= B.

/* Wall Generating */
wall(0,Y) :-
    Y >= 0, Y =< width(W).

wall(width(W),Y) :-
    Y >= 0, Y =< width(W).

wall(X,0) :-
    X >= -1, X =< len(L).

wall(X,len(L)) :-
    X >= -1, X =< len(L).

/* Printing unoccupied area */
unoccupied(X,Y) :-
    X > (0),
    X < width(W),
    Y > (0),
    Y < len(L).

/* Printing Map */
printMap(X,Y) :- 
    posPlayer(X,Y),
    write('P').

printMap(X,Y) :- 
    border(X,Y),
    write('#').

printMap(X,Y) :- 
    posStore(X,Y),
    write('S').

printMap(X,Y) :- 
    posDungeon(X,Y),
    write('D').

printMap(X,Y) :- 
    posQuest(X,Y),
    write('Q').

printMap(X,Y) :- 
    unoccupied(X,Y),
    write('.').

initMap(X, Y) :-
    asserta(len(X)),
    asserta(width(Y)).

map :- 
    init(_),
    forall(between(0,len(L),A),
          (forall(between(0,width(W),B),
          printMap(X,Y)),nl)),
    nl.

map :-
    \+ init(_),
    write('Please start the game first.'), nl,
    !.