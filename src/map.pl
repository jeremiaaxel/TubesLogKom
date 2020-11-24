:- dynamic(len/1).
:- dynamic(width/1).
:- dynamic(posPlayer/2).
:- dynamic(store/2).
:- dynamic(quest1/2).
:- dynamic(quest2/2).
:- dynamic(quest3/2).
:- dynamic(dungeon/2).

/* TODO: buat wall di dalam map, bukan border */

initLocations :-
    asserta(dungeon(5,7)),
    asserta(quest1(7,4)),
    asserta(quest2(8,8)),
    asserta(quest3(6,2)),
    asserta(store(1,5)),
    asserta(posPlayer(1,1)).

/* Wall Generating */
wall(0,Y) :-
    width(W),
    W1 is W + 1,
    Y >= 0, Y =< W1.

wall(X,0) :-
    len(L),
    L1 is L + 1,
    X >= 0, X =< L1.

wall(L1,Y) :-
    width(W),
    W1 is W + 1,
    len(L),
    L1 is L + 1,
    Y >= 0, Y =< W1.

wall(X,W1) :-
    width(W),
    W1 is W + 1,
    len(L),
    L1 is L + 1,
    X >= 0, X =< L1.

/* Printing unoccupied area */
unoccupied(X,Y) :-
    width(W),
    W1 is W + 1,
    len(L),
    L1 is L + 1,
    X > (0),
    X < L1,
    Y > (0),
    Y < W1.

/* Printing Map */
printMap(X,Y) :- 
    posPlayer(X,Y),
    write('P').

printMap(X,Y) :- 
    wall(X,Y),
    write('#').

printMap(X,Y) :- 
    store(X,Y),
    write('S').

printMap(X,Y) :- 
    dungeon(X,Y),
    write('D').

printMap(X,Y) :- 
    quest1(X,Y),
    write('Q').

printMap(X,Y) :- 
    quest2(X,Y),
    write('Q').

printMap(X,Y) :- 
    quest3(X,Y),
    write('Q').

printMap(X,Y) :- 
    unoccupied(X,Y),
    write('.').

initMap(X,Y) :-
    asserta(len(X)),
    asserta(width(Y)).

/* command menampilkan map */
map :-
    \+ init(_),
    write('Please start the game first.'), nl,
    !.

map :- 
    init(_),
    initLocations,
    width(W),
    len(L),
    W1 is W+1,
    L1 is L+1,
    forall(between(0,W1,Y),
          (forall(between(0,L1,X),
                printMap(X,Y)),nl)),
    nl.
