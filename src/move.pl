/* Exploration Mechanism */
:- dynamic(fighting/1).
:- dynamic(posPlayer/2).

/* rules */
notQuest(P,Q) :- \+quest1(P,Q),\+quest2(P,Q),\+quest3(P,Q).
yesQuest(P,Q) :- quest1(P,Q);quest2(P,Q);quest3(P,Q).

/* randomize enemy */
enemyRandom(0) :- \+foundEnemy.
enemyRandom(1) :- foundEnemy.
enemyRandom(X) :-  random(0,1,X), enemyRandom(X).

/*pemain berpindah 1 tile ke atas*/
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandom(P), P =:= 0,
    write('You move north.'),!.

/* Jika ada musuh*/
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandom(1),!.

/* Jika berada di tile bos*/
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    dungeon(X,Z),
    foundBoss,!.

/* Jika menemukan quest */
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    yesQuest(X,Z),
    foundQuest,!.

/* Jika berada di store */
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    store(X,Z),
    write('Hello, sir. Welcome to my store! Here, take a look'),!.

/* Jika nabrak pagar */
w :- init(_),
    fighting(0),
    posPlayer(X,Y),
    Z is Y+1,
    wall(X,Z),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika game belum mulai */
w :- \+init(_),
    write('You can\'t move before you start the game.'),!.

/* Jika lagi melawan musuh */
w :- init(_),fighting(1),
    write('You can\'t move while in the middle of battleground, mortal.'),!.

/*----------------------------------*/

/*pemain berpindah 1 tile ke kiri*/
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandom(P), P =:= 0,
    write('You move west.'),!.

/* Jika ketemu musuh*/
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandom(1),!.

/* Jika berada di tile bos */
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    dungeon(Z,Y),
    foundBoss,!.

/* Jika menemukan quest */
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    yesQuest(Z,Y),
    foundQuest,!.

/* Jika berada di tile store */
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    store(Z,Y),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* jika menabrak pagar */
a :- init(_),
    posPlayer(X,Y),
    Z is X-1,
    wall(Z,Y),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika game belum dimulai */
a :- \+init(_),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
a :- init(_),fighting(1),
    write("You can't move while in the middle of battleground, mortal."),!.

/*----------------------------------*/


/*pemain berpindah 1 tile ke bawah*/
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandom(P), P =:= 0,
    write('You move south.'),!.

/* Jika ketemu musuh */
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    \+dungeon(X,Z),notQuest(X,Z),\+store(X,Z),
    enemyRandom(1),!.

/* Jika ketemu bos */
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    dungeon(X,Z),
    foundBoss,!.

/* Jika menemukan quest */
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    yesQuest(X,Z),
    foundQuest,!.

/* Jika berada di tile store */
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    \+wall(X,Z),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(X,Z)),
    store(X,Z),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika menabrak pagar */
s :- init(_),
    posPlayer(X,Y),
    Z is Y-1,
    wall(X,Z),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika game belum dimulai */
s :- \+init(_),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
s :- init(_),fighting(1),
    write("You can't move while in the middle of battleground, mortal.").

/*----------------------------------*/


/*pemain berpindah 1 tile ke kanan*/
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandom(P), P =:= 0,
    write('You move east.'),!.

/* Jika ketemu musuh */
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    \+dungeon(Z,Y),notQuest(Z,Y),\+store(Z,Y),
    enemyRandom(1),
    foundEnemy,!.

/* Jika berada di tile bos */
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    dungeon(Z,Y),
    foundBoss,!.

/* Jika menemukan quest */
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    yesQuest(Z,Y),
    foundQuest,!.

/* Jika berada di tile store */
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    \+wall(Z,Y),
    retract(posPlayer(X,Y)),
    asserta(posPlayer(Z,Y)),
    store(Z,Y),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika menabrak pagar */
d :- init(_),
    posPlayer(X,Y),
    Z is X+1,
    wall(Z,Y),
    write('You hit a wall. I began to lose faith in you, mortal.'),!.

/* Jika game belum dimulai */
d :- \+init(_),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
d :- init(_),fighting(1),
    write("You can't move while in the middle of battleground, mortal."),!.
