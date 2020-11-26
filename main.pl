:- dynamic(init/1).
:- dynamic(character/8).

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
:- include('src/story.pl').

help :-
    write('------------------------ Commands: ------------------------'), nl,
    write('1.  start    : To start the game'), nl,
    write('2.  map      : To show map'), nl,
    write('3.  status   : To show your status of course'), nl,
    write('4.  moving commands:'), nl,
    write('          w : move toward north one step'), nl,
    write('          a : move toward west one step'), nl,
    write('          s : move toward south one step'), nl,
    write('          d : move toward east one step'), nl,
    write('5.  shop     : To open shop menu'), nl,
    write('6.  inventory: To open player\'s inventory'), nl,
    write('7.  battle commands:'), nl,
    write('          attack        : attack enemy'), nl,
    write('          specialAttack : attack enemy using special power'), nl,
    write('          usePotion     : use a health potion to regain HP'), nl,
    write('          run           : run from a battle'), nl,
    write('8.  teleport : To teleport to other teleporting stations'), nl,
    write('9.  quest    : To show all quests status'), nl,
    write('10. help     : To show all commands and legends'), nl,
    write('11. quit     : To quit the game because'), nl,
    write('              you realise you have assignments to do'), nl, nl,
    sleep(0.5),
    write('------------------------ Legends: ------------------------'), nl,
    write('   - P       = Player'), nl,
    write('   - #       = Wall'), nl,
    write('   - S       = Store'), nl,
    write('   - D       = (Boss) Dungeon'), nl,
    write('   - Q       = Quest'), nl,
    write('   - W,X,Y,Z = Teleporting Stations'), nl,
    write('----------------------------------------------------------'), nl,nl.

title :-
    /* welcome msg */
    /*shell(clear),*/
    sleep(0.5),
    write('          W   E   L   C   O   M   E      T   O          '),nl,
    write(' _      _  _     _    ___  _                            '), nl,
    write('/ \\  /|/ \\/ \\   / \\   \\  \\//                            '), nl,
    write('| |  ||| || |   | |    \\  /                             '), nl,
    write('| |/\\||| || |_/\\| |_/\\ / /                              '), nl,
    write('\\_/  \\|\\_/\\____/\\____//_/                               '), nl,nl,
    sleep(0.2),
    write(' ____  ____  _     _____ _      _____  _     ____  _____'), nl,
    write('/  _ \\/  _ \\/ \\ |\\/  __// \\  /|/__ __\\/ \\ /\\/  __\\/  __/'), nl,
    write('| / \\|| | \\|| | //|  \\  | |\\ ||  / \\  | | |||  \\/||  \\  '), nl,
    write('| |-||| |_/|| \\// |  /_ | | \\||  | |  | \\_/||    /|  /_ '), nl,
    write('\\_/ \\|\\____/\\__/  \\____\\\\_/  \\|  \\_/  \\____/\\_/\\_\\\\____\\'), nl,nl,
    sleep(0.7),
    prologue,nl,nl,
    help,sleep(1).


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
    read(JobInput), nl,
    (
        jobExist(JobInput, Job) ->
        characterDB(_, Job, _, MaxHP, _, DP, AP, _);
        write('Job does not exist or you typed falsely.'), nl,
        fail
    ),
    /* defaultStat(Job,MaxHP,DP,AP), */
    retractall(character(_,_,_,_,_,_,_,_)),
    asserta(character(Username, Job, 1, MaxHP, MaxHP, DP, AP, 0)),
    write('Welcome '), write(Username), write(' the '), write(Job), write('.'), nl,nl,
    insertDefault(Job),
    random(10,20,Len),
    random(10,20,Width),
    initMap(Len,Width),
    initLocations,
    asserta(fighting(0)),
    asserta(init(1)),
    asserta(newMove(0)),
    asserta(questOnGoing(0)),
    map,
    !.

/* Check ada ga jobnya */
jobExist(JobInput, Job) :-
    \+ integer(JobInput),
    (JobInput=swordsman;JobInput=archer; JobInput=sorcerer) -> Job = JobInput, !.

jobExist(JobInput, Job) :-
    integer(JobInput),
    JobInput==1,
    Job = swordsman, !.

jobExist(JobInput, Job) :-
    integer(JobInput),
    JobInput==2,
    Job = archer, !.

jobExist(JobInput, Job) :-
    integer(JobInput),
    JobInput==3,
    Job = sorcerer, !.

quit :-
    \+ init(_),
    write('The game is not started'),
    !.

quit :-
    sleep(0.5),
    write('Thanks for playing...'), nl,
    sleep(0.5),
    write('Do not forget you have a lot of assignments to be done any time soon!'),nl,nl,
    sleep(0.5),
    write('Made by Kelompok 07 Kelas 04 - wollowongko'),nl,
    /* semua data diretract */
    /* main.pl */
    retract(init(_)),
    write('13519116 - Jeane Mikha Erwansyah'),nl,
    retract(character(_,_,_,_,_,_,_,_)),
    write('13519120 - Epata Tuah'),nl,
    /* battle.pl */
    retract(fighting(_)),
    write('13519144 - Jonathan Christhoper Jahja'),nl,
    write('13519188 - Jeremia Axel Bachtera'),nl,
    /* character.pl */
    /* enemy.pl */
    /* fail.pl */
    /* goal.pl */
    /* item.pl */
    retract(weapon(_)),
    retract(armor(_)),
    (
        potion(_,_,_) -> retract(potion(_,_,_));
        \+potion(_,_,_)
    ),
    retract(gold(_)),
    (
        accessory(_) -> retract(accessory(_));
        \+accessory(_)
    ),
    /* map.pl */
    retract(posPlayer(_,_)),
    retract(len(_)),
    retract(width(_)),
    retract(store(_,_)),
    retract(dungeon(_,_)),
    retract(teleportW(_,_)),
    retract(teleportX(_,_)),
    retract(teleportY(_,_)),
    retract(teleportZ(_,_)),
    retract(quest1(_,_)),
    retract(quest2(_,_)),
    retract(quest3(_,_)),
    /* quest.pl */
    (
        win1(_) -> retract(win1(_));
        \+win1(_)
    ),
    (
        win2(_) -> retract(win2(_));
        \+win2(_)
    ),
    (
        win3(_) -> retract(win3(_));
        \+win3(_)
    ),
    (
        quest1(_,_,_) -> retract(quest1(_,_,_));
        \+quest1(_,_,_)
    ),
    (
        quest2(_,_,_) -> retract(quest2(_,_,_));
        \+quest2(_,_,_)
    ),
    (
        quest3(_,_,_) -> retract(quest3(_,_,_));
        \+quest3(_,_,_)
    ),
    /* move.pl */
    (
        newMove(_) -> retract(newMove(_));
        \+newMove(_)
    ),
    /* store.pl */
    !.

quit.
