:- dynamic(init/1).
:- dynamic(character/8).
:- dynamic(sure/1).

:- include('src/battle.pl').
:- include('src/character.pl').
:- include('src/enemy.pl').
:- include('src/fail.pl').
:- include('src/goal.pl').
:- include('src/item.pl').
:- include('src/map.pl').
:- include('src/move.pl').
:- include('src/quest.pl').
:- include('src/store.pl').

help :-
    write('Commands:'), nl,
    write('1. start  : To start to waste your useless life'), nl,
    write('2. map    : To show map'), nl,
    write('3. status : To show your status of course'), nl,
    write('4. moving commands:'), nl,
    write('           w : move toward north one step'), nl,
    write('           a : move toward west one step'), nl,
    write('           s : move toward south one step'), nl,
    write('           d : move toward east one step'), nl,
    write('5. shop   : To open shop menu'), nl,
    write('6. battle commands:'), nl,
    write('           attack        : attack enemy'), nl,
    write('           specialAttack : attack enemy using special power'), nl,
    write('           usePotion     : use a health potion to regain HP'), nl,
    write('           run           : run from a battle'), nl,
    write('7. help   : show all commands and legends'), nl,
    write('8. quit   : To quit the game because'), nl,
    write('            you realise you have assignments to do'), nl, nl,
    sleep(0.5),
    write('Legends:'), nl,
    write('   - P = Player'), nl,
    write('   - # = Wall'), nl,
    write('   - S = Store'), nl,
    write('   - D = (Boss) Dungeon'), nl,
    write('   - Q = Quest'), nl,nl.

title :-
    /* welcome msg */
    sleep(0.5),
    write('          W   E   L   C   O   M   E      T   O          '),nl,
    /* cls :- write('\e[2J').
    fungsi buat clear screen
    buat animasi uwu
    tapi nanti yeyeyeyye.
    miaw */
    sleep(0.5),
    write(' _      _  _     _    ___  _                            '), nl,
    sleep(0.1),
    write('/ \\  /|/ \\/ \\   / \\   \\  \\//                            '), nl,
    sleep(0.1),
    write('| |  ||| || |   | |    \\  /                             '), nl,
    sleep(0.1),
    write('| |/\\||| || |_/\\| |_/\\ / /                              '), nl,
    sleep(0.1),
    write('\\_/  \\|\\_/\\____/\\____//_/                               '), nl,nl,
    sleep(0.1),
    write(' ____  ____  _     _____ _      _____  _     ____  _____'), nl,
    sleep(0.1),
    write('/  _ \\/  _ \\/ \\ |\\/  __// \\  /|/__ __\\/ \\ /\\/  __\\/  __/'), nl,
    sleep(0.1),
    write('| / \\|| | \\|| | //|  \\  | |\\ ||  / \\  | | |||  \\/||  \\  '), nl,
    sleep(0.1),
    write('| |-||| |_/|| \\// |  /_ | | \\||  | |  | \\_/||    /|  /_ '), nl,
    sleep(0.1),
    write('\\_/ \\|\\____/\\__/  \\____\\\\_/  \\|  \\_/  \\____/\\_/\\_\\\\____\\'), nl,nl,
    sleep(0.1),
    help.


/* start command */
start :-
    init(_),
    write('The game has started'),
    !.

start :-
    /* command utama untuk start new */
    \+ init(_),
    title,
    /* input username dan konfirmasi */
    repeat,
    write('Insert username: '),
    read(Username), nl,
    write(Username), write(' is your username, are you sure? (y/n) '),
    read(Sure), nl,
    (
        Sure \= y -> 
            fail;
            !
    ),
    /* input job dan pemeriksaan */
    repeat,
    write('Available jobs:'), nl,
    write('1. Swordsman'), nl,
    write('2. Archer'), nl,
    write('3. Sorcerer'), nl, nl,
    sleep(0.5),
    write('Your choice: '),
    asserta(init(1)),
    read(Job), nl,
    (
        /*
        Job == '1', Job is swordsman;
        Job == '2', Job is archer;
        Job == '3', Job is sorcerer,
        */
        \+ jobExist(Job) ->
        write('Job does not exist or you typed falsely.'), nl,
            fail;
            !
        ),
    /* defaultStat(Job,MaxHP,DP,AP), */
    character(_, Job, _, MaxHP, _, DP, AP, _),
    asserta(character(Username, Job, 1, MaxHP, MaxHP, DP, AP, 0)),
    random(10,20,Len),
    random(10,20,Width),
    initMap(Len,Width),
    !.

/* Check ada ga jobnya */
jobExist(Job) :- 
    Job=swordsman;Job=archer;Job=sorcerer;
    !.

quit :-
    \+ init(_),
    write('The game is not started'),
    !.

quit :-
    sleep(0.5),
    write('Now go! Realize your pitiful life!'), nl,
    sleep(0.5),
    write('Do not forget you have a lot of assignments to be done any time soon!'),nl,
    sleep(0.5),
    write('Made by Kelompok 07 Kelas 04 - wollowongko'),nl,
    sleep(0.5),
    write('insert nim'),
    /* semua data diretract */
    retract(init(_)),
    retract(initMap(_)),
    retract(posPlayer(_)),
    retract(dungeon(_,_)),
    retract(quest1(_,_)),
    retract(quest2(_,_)),
    retract(quest3(_,_)),
    retract(store(_,_)),
    retract(weapon(_)),
    retract(armor(_)),
    retract(accessory(_)),
    retract(potion(_,_,_)),
    retract(gold(_)),
    !.
