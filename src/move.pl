/* Exploration Mechanism */
:- dynamic(newMove/1).
/* rules */
notQuest(P,Q) :- \+quest1(P,Q),\+quest2(P,Q),\+quest3(P,Q).
yesQuest(P,Q) :- (quest1(P,Q);quest2(P,Q);quest3(P,Q)).

/* randomize enemy */
enemyRandomW(0) :- retract(newMove(1)),asserta(newMove(0)),
    write('You move north.').
enemyRandomW(1) :- retract(newMove(1)),asserta(newMove(0)),
    foundEnemy.
enemyRandomA(0) :- retract(newMove(1)),asserta(newMove(0)),
    write('You move west.').
enemyRandomA(1) :- retract(newMove(1)),asserta(newMove(0)),
    foundEnemy.
enemyRandomS(0) :- retract(newMove(1)),asserta(newMove(0)),
    write('You move south.').
enemyRandomS(1) :- retract(newMove(1)),asserta(newMove(0)),
    foundEnemy.
enemyRandomD(0) :- retract(newMove(1)),asserta(newMove(0)),
    write('You move east.').
enemyRandomD(1) :- retract(newMove(1)),asserta(newMove(0)),
    foundEnemy.

/*pemain berpindah 1 tile ke atas dengan mekanisme kemunculan musuh yang random*/
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    retract(newMove(0)),
    asserta(newMove(1)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandomW(0),!.

/* Jika nabrak pagar */
w :- newMove(0),
    init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y-1,
    wall(X,Z),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika berada di tile bos*/
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    dungeon(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundBoss,!.

/* Jika menemukan quest */
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    yesQuest(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundQuest,!.

/* Jika berada di store */
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    store(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    write('Hello, sir. Welcome to my store! Here, take a look!'),!.

/* Jika game belum mulai */
w :- \+init(_),
    write('You can\'t move before you start the game.'),!.

/* Jika lagi melawan musuh */
w :- init(_),fighting(1),
    write('You can\'t move while in the middle of battleground, mortal.'),!.

/*----------------------------------*/

/*pemain berpindah 1 tile ke kiri dengan mekanisme kemunculan musuh yang random*/
a :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    retract(newMove(0)),
    asserta(newMove(1)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandomA(0),!.

/* jika menabrak pagar */
a :-newMove(0),
    init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is X-1,
    wall(Z,Y),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika berada di tile bos */
a :- init(_),
    fighting(0),
    posPlayer(X,Y),
    dungeon(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundBoss,!.

/* Jika menemukan quest */
a :- init(_),
    fighting(0),
    posPlayer(X,Y),
    yesQuest(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundQuest,!.

/* Jika berada di tile store */
a :- init(_),
    fighting(0),
    posPlayer(X,Y),
    store(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika game belum dimulai */
a :- \+init(_),
    write('You can\'t move before you start the game.'),!.

/* Jika sedang melawan musuh */
a :- init(_),fighting(1),
    write('You can\'t move while in the middle of battleground, mortal.'),!.

/*----------------------------------*/


/*pemain berpindah 1 tile ke bawah dengan mekanisme kemunculan musuh yang random*/
s :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    retract(newMove(0)),
    asserta(newMove(1)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandomS(0),!.

/* Jika menabrak pagar */
s :-newMove(0),
    init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    wall(X,Z),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika ketemu bos */
s :-init(_),
    fighting(0),
    posPlayer(X,Y),
    dungeon(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundBoss,!.

/* Jika menemukan quest */
s :-init(_),
    fighting(0),
    posPlayer(X,Y),
    yesQuest(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundQuest,!.

/* Jika berada di tile store */
s :-init(_),
    fighting(0),
    posPlayer(X,Y),
    store(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika game belum dimulai */
s :- \+init(_),
    write('You can\'t move before you start the game.'),!.

/* Jika sedang melawan musuh */
s :- init(_),fighting(1),
    write('You can\'t move while in the middle of battleground, mortal.').

/*----------------------------------*/


/*pemain berpindah 1 tile ke kanan dengan mekanisme kemunculan musuh yang random*/
d :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    retract(newMove(0)),
    asserta(newMove(1)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandomD(0),!.

/* Jika menabrak pagar */
d :-newMove(0),
    init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is X+1,
    wall(Z,Y),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika berada di tile bos */
d :-init(_),
    fighting(0),
    posPlayer(X,Y),
    dungeon(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundBoss,!.

/* Jika menemukan quest */
d :- init(_),
    fighting(0),
    posPlayer(X,Y),
    yesQuest(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    foundQuest,!.

/* Jika berada di tile store */
d :- init(_),
    fighting(0),
    posPlayer(X,Y),
    store(X,Y),
    retract(newMove(1)),
    asserta(newMove(0)),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika game belum dimulai */
d :- \+init(_),
    write('You can\'t move before you start the game.'),!.

/* Jika sedang melawan musuh */
d :- init(_),fighting(1),
    write('You can\'t move while in the middle of battleground, mortal.'),!.

/* ******* SHOW STATUS ******** */
status :-
    \+ init(_),
    write('Please start the game first.'),
    !.

status :-
    init(_),
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    gold(Gold),
    write(Name), write(' status :'), nl,
    write('Job   : '), write(Job), nl,
    write('Level : '), write(Level), nl,
    write('HP    : '), write(HP), write('/'), write(MaxHP), nl,
    write('DP    : '), write(DP), nl,
    write('AP    : '), write(AP), nl,
    write('Exp   : '), write(Exp), nl,
    write('Gold  : '), write(Gold), nl,
    !. 

/* Teleporting */
teleport :-
    repeat,
    write('Insert absicca: '),
    read(X),
    write('Insert ordinate: '),
    read(Y), nl,
    (
        notAWall(X,Y,Z), Z == 1 ->
            (retract(posPlayer(_,_)), asserta(posPlayer(X,Y)),
            write('You are now at ('), write(X), write(','), write(Y), write(').\n'));
            /* Kalau tabrakan dengan tembok */
            write('Fool, you can\'t teleport there!\n\n'),fail
    ),!.
    
notAWall(X,Y,Z) :-
    \+ wall(X,Y),
    Z = 1, !.

notAWall(X,Y,Z) :-
    wall(X,Y),
    Z = 0, !.
