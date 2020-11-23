/* Exploration Mechanism */

/* Rules */
/*pemain berpindah 1 tile ke atas*/
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    \+map(X,Z,fence),
    map(X,Z,Place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move north.'),!.

/* Jika ada musuh*/
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    \+map(X,Z,fence),
    map(X,Z,Place),
    foundEnemy,!.

/* Jika berada di tile bos*/
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    \+map(X,Z,fence),
    map(X,Z,dungeon),
    foundBoss,!.

/* Jika menemukan quest */
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    \+map(X,Z,fence),
    map(X,Z,quest),
    foundQuest,!.

/* Jika berada di tile store */
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    \+map(X,Z,fence),
    map(X,Z,store),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika nabrak pagar */
w :- begin(1),
    fighting(0),
    map(X,Y,Place),
    Z is Y+1,
    map(X,Z,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum mulai */
w :- begin(0),
    write("You can't move before you start the game."),!.

/* Jika lagi melawan musuh */
w :- fighting(1),run.

/*----------------------------------*/

/*pemain berpindah 1 tile ke kiri*/
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    \+map(Z,Y,fence),
    map(Z,Y,Place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move west.'),!.

/* Jika ketemu musuh*/
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    \+map(Z,Y,fence),
    map(Z,Y,Place),
    foundEnemy,!.

/* Jika berada di tile bos */
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    \+map(Z,Y,fence),
    map(Z,Y,dungeon),
    foundBoss,!.

/* Jika menemukan quest */
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    \+map(Z,Y,fence),
    map(Z,Y,quest),
    foundQuest,!.

/* Jika berada di tile store */
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    \+map(Z,Y,fence),
    map(Z,Y,store),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* jika menabrak pagar */
a :- begin(1),
    map(X,Y,Place),
    Z is X-1,
    map(Z,Y,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
a :- begin(0),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
a :- fighting(1), run.

/*----------------------------------*/


/*pemain berpindah 1 tile ke bawah*/
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    \+map(X,Z,fence),
    map(X,Z,Place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move south.'),!.

/* Jika ketemu musuh */
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    \+map(X,Z,fence),
    map(X,Z,Place),
    foundEnemy,!.

/* Jika ketemu bos */
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    \+map(X,Z,fence),
    map(X,Z,dungeon),
    foundBoss,!.

/* Jika menemukan quest */
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    \+map(X,Z,fence),
    map(X,Z,quest),
    foundQuest,!.

/* Jika berada di tile store */
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    \+map(X,Z,fence),
    map(X,Z,store),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika menabrak pagar */
s :- begin(1),
    map(X,Y,Place),
    Z is Y-1,
    map(X,Z,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
s :- begin(0),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
s :- fighting(1), run.

/*----------------------------------*/


/*pemain berpindah 1 tile ke kanan*/
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    \+map(Z,Y,fence),
    map(Z,Y,Place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move east.'),!.

/* Jika ketemu musuh */
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    \+map(Z,Y,fence),
    map(Z,Y,Place),
    foundEnemy,!.

/* Jika berada di tile bos */
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    \+map(Z,Y,fence),
    map(Z,Y,dungeon),
    foundBoss,!.

/* Jika menemukan quest */
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    \+map(Z,Y,fence),
    map(Z,Y,quest),
    foundQuest,!.

/* Jika berada di tile store */
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    \+map(Z,Y,fence),
    map(Z,Y,store),
    write('Hello, sir. Welcome to my store! Here, take a look.'),!.

/* Jika menabrak pagar */
d :- begin(1),
    map(X,Y,Place),
    Z is X+1,
    map(Z,Y,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
d :- begin(0),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
d :- fighting(1),run.

/*pemain melihat status pemain*/
status :- write('Your status: '),nl,
    write('Job: '),write(job),nl,
    write('Level: '),write(level),nl,
    write('Health: '),write(health),nl,
    write('Attack: '),write(attack),nl,
    write('Defense: '),write(defense),nl,
    write('Gold: '),write(gold).
