:- dynamic(len/1).
:- dynamic(width/1).
:- dynamic(posPlayer/2).
:- dynamic(store/2).
:- dynamic(quest1/2).
:- dynamic(quest2/2).
:- dynamic(quest3/2).
:- dynamic(dungeon/2).

/* TODO: buat wall di dalam map, bukan border */

/* Randomizing Locations */
initLocations :-
    width(W),
    len(L),
    Lmid is L//2,
    Wmid is W//2,
    Ll is Lmid - 1,
    Lh is Lmid + 1,
    Wl is Wmid - 1,
    Wh is Wmid + 1,
    random(2,W,Y1),
    asserta(store(1,Y1)),
    random(2,Ll,X2),
    random(1,Wl,Y2),
    asserta(quest1(X2,Y2)),
    random(Lh,L,X3),
    random(1,Wh,Y3),
    asserta(quest2(X3,Y3)),
    random(2,Ll,X4),
    random(Wh,W,Y4),
    asserta(quest3(X4,Y4)),
    random(Lh,L,X5),
    random(Wh,W,Y5),
    asserta(dungeon(X5,Y5)),
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

wall(Lmid,Y) :-
    width(W),
    len(L),
    Lmid is L//2,
    Wmid is W//2,
    Wl is Wmid - 2,
    Y >= 2, Y =< Wl.

wall(X,Wmid) :-
    width(W),
    len(L),
    Lmid is L//2,
    Wmid is W//2,
    Ll is Lmid - 2,
    X >= 2, X =< Ll.

wall(Lmid,Y) :-
    width(W),
    len(L),
    Lmid is L//2,
    Wmid is W//2,
    Wh is Wmid + 2,
    Ww is W - 1,
    Y >= Wh, Y =< Ww.

wall(X,Wmid) :-
    width(W),
    len(L),
    Lmid is L//2,
    Wmid is W//2,
    Lh is Lmid + 2,
    Lll is L - 1,
    X >= Lh, X =< Lll.

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
