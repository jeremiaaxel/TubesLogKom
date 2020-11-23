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
    asserta(dungeon(5,7)).
    asserta(quest1(7,4)),
    asserta(quest2(8,8)),
    asserta(quest3(6,2)).
    asserta(store(1,5)).
    asserta(posPlayer(1,1)),

/* Wall Generating */
wall(0,Y) :-
    Y >= 0, Y =< width(_).

wall(width(_),Y) :-
    Y >= 0, Y =< width(_).

wall(X,0) :-
    X >= -1, X =< len(_).

wall(X,len(_)) :-
    X >= -1, X =< len(_).

/* Printing unoccupied area */
unoccupied(X,Y) :-
    X > (0),
    X < width(_),
    Y > (0),
    Y < len(_).

/* Printing Map */
printMap(X,Y) :- 
    posPlayer(X,Y),
    write('P').

printMap(X,Y) :- 
    border(X,Y),
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
    asserta(len(_)),
    asserta(width(_)).

map :- 
    init(_),
    forall(between(0,len(_),A),
          (forall(between(0,width(_),B),
          printMap(X,Y)),nl)),
    nl.

map :-
    \+ init(_),
    write('Please start the game first.'), nl,
    !.