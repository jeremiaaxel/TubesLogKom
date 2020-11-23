/* Items */
:- include('character.pl').

/* Facts */
:- dynamic(weapon/1).
:- dynamic(armor/1).
:- dynamic(accessory/1).
:- dynamic(potion/2).
:- dynamic(gold/1).

/*itemList([woodSword,stoneSword,ironSword,shortBow,longBow,
    crossBow,fireBall,iceRay,thunderStrike,leatherArmor,ironArmor]).*/

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
    retract(equip(weapon([_,Type1,X]))),
    assertz(equip(weapon([N,Type,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]).
equipItem(armor([N,Type,X])) :- 
    retract(equip(armor([_,Type1,X]))),
    assertz(equip(armor([N,Type,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]).
equipItem(accessory([N,Type,X])) :- 
    retract(equip(accessory([_,Type1,X]))),
    assertz(equip(accessory([N,Type,X]))),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]).

/*************************************************************************************/

/* Inventory */
/* Rules */
/* Untuk print inventory player */
inventory :- 
    weapon(Item),
    printlist(Item),
    (equip(weapon(Item)),print(' (Equipped)\n');nl),
    fail.
inventory :- 
    armor(Item),
    printlist(Item),
    (equip(armor(Item)),print(' (Equipped)\n');nl),
    fail.
inventory :- 
    accessory(Item),
    printlist(Item),
    (equip(accessory(Item)),print(' (Equipped)\n');nl),
    fail.
inventory :- 
    potion(Type,N),
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

heal. /* Nambah status health player */ 

usePotion :- 
    /*choosePotion,
    read(Type),
    Type=health,*/
    potion(N,'Health'),!,
    retract(potion(N,'Health')),
    N1 is N-1,
    assertz(potion(N1,'Health')).
    /*heal.*/ 

usePotion :-
    print('You have run out of healing potion!'),fail.

/* Print List */
printlist([Head|[]]) :- !,print(Head).
printlist([Head|Tail]) :- print(Head), print(' '),printlist(Tail).

/*************************************************************************************/
/* Item - item yang dimiliki player akan disimpan dalam bentuk predikat dynamic*/


