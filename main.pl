:- dynamic(init/1).

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

title :-
    /* welcome msg */
    write('Welcome to Indomaret. Happy shopping.'), nl,
    write('Fresh bread please, fresh fruit please.'), nl,
    write('#######################################################'), nl,
    write('#               Untitled                              #'), nl,
    write('# Commands                                            #'), nl,
    write('# 1. start  : To start to waste your useless life     #'), nl,
    write('# 2. map    : To show map                             #'), nl,
    write('# 3. status : To show your status of course           #'), nl,
    write('# 4. Move commands :                                  #'), nl,
    write('#            w : move toward north one step           #'), nl,
    write('#            a : move toward west one step            #'), nl,
    write('#            s : move toward south one step           #'), nl,
    write('#            d : move toward east one step            #'), nl,
    write('# 4. quit   : To quit the game and                    #'), nl,
    write('#             realize you have assignments to do      #'), nl,
    write('#######################################################'), nl.
    

start :-
    /* command utama untuk start new */
    \+ init(_),
    title,
    asserta(init(1)),
    !.
    
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
    write('Do not forget you have a lot of assignments to be done any time soon!'),
    /* semua data diretract */
    retract(init(_)),
    !.   