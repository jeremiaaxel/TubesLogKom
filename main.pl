:- dynamic(init/1).
:- dynamic(player/1).
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
    write('5. help   : show all commands and legends'), nl,
    write('6. quit   : To quit the game because'), nl,
    write('            you realise you have assignments to do'), nl, nl,
    sleep(0.5),
    write('Legends:'), nl,
    write('   - P = Player'), nl,
    write('   - # = Wall'), nl,
    write('   - S = Store'), nl,
    write('   - D = (Boss) Dungeon'), nl,
    write('   - Q = Quest'), nl.

title :-
    /* welcome msg */
    sleep(0.5),
    write('     W   E   L   C   O   M   E      T   O     '),nl,
    /* cls :- write('\e[2J').
    fungsi buat clear screen
    buat animasi uwu
    tapi nanti yeyeyeyye*/
    sleep(0.2),
    write('  W  I  L  L  Y    A  D  V  E  N  T  U  R  E  '), nl, nl,
    sleep(0.5),
    help.


start :-
    /* command utama untuk start new */
    \+ init(_),
    title,
    /* input username dan konfirmasi */
    repeat,
    write('Insert username :'), nl,
    read(Username),
    write(Username), write(' is your username, are you sure? (y/n)'),
    read(Sure),
    sure(Sure),
    end_condition(Sure),
    retract(sure(_)),
    /* input job dan pemeriksaan */
    repeat,
    write('Choose your job :'), nl,
    write('1. Swordsman'), nl,
    write('2. Archer'), nl,
    write('3. Sorcerer'), nl,
    read(Job),
    jobExist(Job),
    end_condition(Job),
    defaultStat(Job,MaxHP,DP,AP),
    asserta(character(Username, Job, 1, MaxHP, MaxHP, DP, AP)),
    insertDefault(Job),
    random(10,20,Len),
    random(10,20,Width),
    initMap(Len,Width),
    asserta(init(1)),
    !.

/* Konfirmasi username */
sure(Sure) :- Sure =:= 'y', !.

/* Check ada ga jobnya */
jobExist(Job) :- 
    character(_, Job, _, _, _, _, _),
    !.

jobExist(Job) :- 
    write('Jobless. Job is not exist.').

/* start command */
start :-
start :-
start :-
    init(_),
    write('The game has started'),
    !.

quit :-
    \+ init(_),
    write('The game is not started'),
    !.

quit :-
    write('Now go! Realize your pitiful life!'), nl,
    write('Do not forget you have a lot of assignments to be done any time soon!'),nl,
    sleep(0.5),
    write('Made by Kelompok 07 Kelas 04 - wollowongko'),nl,
    write('insert nim'),
    /* semua data diretract */
    /* semua data diretract */
    /* semua data diretract */
    /* semua data diretract */
    /* semua data diretract */
    /* semua data diretract */
    retract(init(_)),
    retract(len(_)),
    retract(width(_)),
    retract(wall(_)),
    retract(posPlayer(_)),
    retract(dungeon(_,_)),
    retract(quest1(_,_)),
    retract(quest2(_,_)),
    retract(quest3(_,_)),
    retract(store(_,_)),
    !.   