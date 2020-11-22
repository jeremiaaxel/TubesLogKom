/* Exploration Mechanism */

/* Facts */
/*inisialisasi fakta map(1,1,fence) sampai map(16,19,fence)...(?)*/
map(1,3,store).
map(15,18,dungeon).
map(7,4,quest).
map(8,8,quest).
map(12,14,quest).


/* Rules */
/*pemain berpindah 1 tile ke atas*/
w :- begin(true),
    fighting(false),
    map(x,y,_place),
    z is y+1,
    \+map(x,z,fence),
    map(x,z,_place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move north.'),!.

/* Jika ada musuh*/
w :- begin(true),
    fighting(false),
    map(x,y,_place),
    z is y+1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundEnemy,!.

/* Jika berada di tile bos*/
w :- begin(true),
    fighting(false),
    map(x,y,_place),
    z is y+1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundBoss,!.

/* Jika menemukan quest */
w :- begin(true),
    fighting(false),
    map(x,y,_place),
    z is y+1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundQuest,!.

/* Jika nabrak pagar */
w :- begin(true),
    fighting(false),
    map(x,y,_place),
    z is y+1,
    map(x,z,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum mulai */
w :- begin(false),
    write("You can't move before you start the game."),!.

/* Jika lagi melawan musuh */
w :- fighting(true),run.

/*----------------------------------*/

/*pemain berpindah 1 tile ke kiri*/
a :- begin(true),
    map(x,y,_place),
    z is x-1,
    \+map(z,y,fence),
    map(z,y,_place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move west.'),!.

/* Jika ketemu musuh*/
a :- begin(true),
    map(x,y,_place),
    z is x-1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundEnemy,!.

/* Jika berada di tile bos */
a :- begin(true),
    map(x,y,_place),
    z is x-1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundBoss,!.

/* Jika menemukan quest */
a :- begin(true),
    map(x,y,_place),
    z is x-1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundQuest,!.

/* jika menabrak pagar */
a :- begin(true),
    map(x,y,_place),
    z is x-1,
    map(z,y,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
a :- begin(false),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
a :- fighting(true), run.

/*----------------------------------*/


/*pemain berpindah 1 tile ke bawah*/
s :- begin(true),
    map(x,y,_place),
    z is y-1,
    \+map(x,z,fence),
    map(x,z,_place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move south.'),!.

/* Jika ketemu musuh */
s :- begin(true),
    map(x,y,_place),
    z is y-1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundEnemy,!.

/* Jika ketemu bos */
s :- begin(true),
    map(x,y,_place),
    z is y-1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundBoss,!.

/* Jika menemukan quest */
s :- begin(true),
    map(x,y,_place),
    z is y-1,
    \+map(x,z,fence),
    map(x,z,_place),
    foundQuest,!.

/* Jika menabrak pagar */
s :- begin(true),
    map(x,y,_place),
    z is y-1,
    map(x,z,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
s :- begin(false),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
s :- fighting(true), run.

/*----------------------------------*/


/*pemain berpindah 1 tile ke kanan*/
d :- begin(true),
    map(x,y,_place),
    z is x+1,
    \+map(z,y,fence),
    map(z,y,_place),
    \+foundEnemy,
    \+foundBoss,
    \+foundQuest,
    write('You move east.'),!.

/* Jika ketemu musuh */
d :- begin(true),
    map(x,y,_place),
    z is x+1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundEnemy,!.

/* Jika berada di tile bos */
d :- begin(true),
    map(x,y,_place),
    z is x+1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundBoss,!.

/* Jika menemukan quest */
d :- begin(true),
    map(x,y,_place),
    z is x+1,
    \+map(z,y,fence),
    map(z,y,_place),
    foundQuest,!.

/* Jika menabrak pagar */
d :- begin(true),
    map(x,y,_place),
    z is x+1,
    map(z,y,fence),
    write('You hit a fence. I began to lose faith in you, mortal.').

/* Jika game belum dimulai */
d :- begin(false),
    write("You can't move before you start the game."),!.

/* Jika sedang melawan musuh */
d :- fighting(true),run.

/*pemain melihat status pemain*/
status :- write('Your status: '),nl,
    write('Job: '),write(job),nl,
    write('Level: '),write(level),nl,
    write('Health: '),write(health),nl,
    write('Attack: '),write(attack),nl,
    write('Defense: '),write(defense),nl,
    write('Gold: '),write(gold).
