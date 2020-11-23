/* Items */
:- include('character.pl').

/* Facts */
:- dynamic(weapon/1).
:- dynamic(armor/1).
:- dynamic(accessory/1).
:- dynamic(potion/3).
:- dynamic(gold/1).

itemList([['Wood','Sword'],['Stone','Sword'],['Iron','Sword'],['Short','Bow'],
    ['Long','Bow'],['Cross','Bow'],['Fireball','Spellscroll'],['Iceray','Spellscroll'],
    ['Thunderstrike','Spellscroll'],['Leather','Armor'],['Iron','Armor']]).

/* Rules */
/*Basis*/
back([],_) :- !.
back([Head|[]],R) :- !,R=Head.
/*Rekurens*/
back([_|Tail],R) :- back(Tail,R1),R=R1.

/* Insert Item ke inventory*/
/* armor([1,'Leather','Armor']). */

checkItem([N,Type,Z],Y) :- 
    (weapon([X,Type,Z]);armor([X,Type,Z]);accessory([X,Type,Z])),!,
    retract(weapon([X,Type,Z]));retract(armor([X,Type,Z]));retract(accessory([X,Type,Z])),
    Y is X+N.
checkItem([N,_,_],Y) :- 
    Y is N.

insertDefault(Job) :-
    Job=swordsman,!,
    insert([1,'Wood','Sword'],yes),
    insert([1,'Leather','Armor'],yes).
insertDefault(Job) :-
    Job=archer,!,
    insert([1,'Short','Bow'],yes),
    insert([1,'Leather','Armor'],yes).
insertDefault(Job) :-
    Job=sorcerer,!,
    insert([1,'Fireball','Spellscroll'],yes),
    insert([1,'Leather','Armor'],yes).

insert(Item,Equip) :- 
    back(Item,Type),
    (Type='Sword'; Type='Bow'; Type='Spellscroll'),!,
    assertz(weapon(Item)),
    Equip=yes,
    equipItem(weapon(Item)).
insert(Item,Equip) :- 
    back(Item,Type),
    Type='Armor',!,
    assertz(armor(Item)),
    Equip=yes,
    equipItem(armor(Item)).
insert(Item,Equip) :- 
    back(Item,Type),
    (Type='Ring'; Type='Amulet'),!,
    assertz(accessory(Item)),
    Equip=yes,
    equipItem(amulet(Item)).

/* Equip item */
/* Untuk periksa item yang di-equip player */
:- dynamic(equip/1).

/* equip(armor([1,'Leather','Armor'])). */

equipItem(weapon([N,Type,X])) :- 
    (retract(equip(weapon([_,Type1,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]);
    write('Equiping '),printlist([Type,X])),
    assertz(equip(weapon([N,Type,X]))),
    updateStats.
equipItem(armor([N,Type,X])) :- 
    (retract(equip(armor([_,Type1,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]);
    write('Equiping '),printlist([Type,X])),
    assertz(equip(armor([N,Type,X]))),
    updateStats.
equipItem(accessory([N,Type,X])) :- 
    (retract(equip(accessory([_,Type1,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]);
    write('Equiping '),printlist([Type,X])),
    assertz(equip(accessory([N,Type,X]))),
    updateStats.

/* Update Stats Player */
checkStats(Type,Stat) :-
    (Type='Wood';Type='Short';Type='Fireball'),!,
    Stat = 10.
checkStats(Type,Stat) :-
    (Type='Stone';Type='Long';Type='Iceray'),!,
    Stat = 20.
checkStats(Type,Stat) :-
    (Type='Iron';Type='Cross';Type='Thunderstrike'),!,
    Stat is 40.
checkStats(Type,Stat) :-
    Type='Leather',!,
    Stat is 100.
checkStats(Type,Stat) :-
    Type='Iron',!,
    Stat is 500.

updateStats :-
    retract(character(Username, Job, MaxHP, HP, DP, AP)),
    equip(weapon(_,Weapon,_)),
    checkStats(Weapon,AStat),
    AP1 is AP + AStat,
    equip(armor(_,Armor,_)),
    checkStats(Armor,DStat),
    DP1 is DP + DStat,
    asserta(character(Username, Job, MaxHP, HP, DP1, AP1)).

/*************************************************************************************/
 
/* Inventory */
/* Rules */
/* Untuk print inventory player */
inventory :- 
    weapon(Item),
    printlist(Item),
    (equip(weapon(Item)),print(' (Equipped)');nl),
    fail.
inventory :- 
    armor(Item),
    printlist(Item),
    (equip(armor(Item)),print(' (Equipped)');nl),
    fail.
inventory :- 
    accessory(Item),
    printlist(Item),
    (equip(accessory(Item)),print(' (Equipped)');nl),
    fail.
inventory :- 
    potion(Type,N,_),
    printlist([N,Type,'potion']),
    nl,
    fail.

/*
choosePotion :-
    potion(N,Type),!,
    print('Which potion you want to use:\n'),
    printlist([N,Type,'potion']).
choosePotion :-
    print('You have run out of potion!'),
    fail.*/

usePot :- 
    /*choosePotion,
    read(Type),
    Type=health,*/
    potion(N,'Health',Heal),!,
    retract(potion(N,'Health',Heal)),
    N1 is N-1,
    assertz(potion(N1,'Health',Heal)).
usePot :-
    write('You have run out of healing potion!'),fail.

/* Print List */
/*Basis*/
printlist([Head|[]]) :- !,write(Head).
/*Rekurens*/
printlist([Head|Tail]) :- write(Head), write(' '),printlist(Tail).

/*************************************************************************************/
/* Item - item yang dimiliki player akan disimpan dalam bentuk predikat dynamic*/
