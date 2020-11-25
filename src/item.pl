/* Items */

/* Facts */
:- dynamic(weapon/1).
:- dynamic(armor/1).
:- dynamic(accessory/1).
:- dynamic(potion/3).
:- dynamic(gold/1).

itemList(swordsman,[['Wood','Sword'],['Stone','Sword'],['Iron','Sword'],['Leather','Armor'],['Iron','Armor']]).
itemList(archer,[['Short','Bow'],['Long','Bow'],['Cross','Bow'],['Leather','Armor'],['Iron','Armor']]).
itemList(sorcerer,[['Fireball','Spellscroll'],['Iceray','Spellscroll'],['Thunderstrike','Spellscroll'],['Leather','Armor'],['Iron','Armor']]).

/* Rules */
/*Basis*/
back([],_) :- !.
back([Head|[]],R) :- !,R=Head.
/*Rekurens*/
back([_|Tail],R) :- back(Tail,R1),R=R1.

/* Insert Item ke inventory*/

checkItem([N,Type,Z],Y) :- 
    (weapon([X,Type,Z]);armor([X,Type,Z]);accessory([X,Type,Z])),!,
    (retract(weapon([X,Type,Z]));retract(armor([X,Type,Z]));retract(accessory([X,Type,Z]))),
    Y is X+N,!.
checkItem([N,_,_],Y) :- 
    Y is N.

/* Insert awal pembuatan character */
insertDefault(Job) :-
    Job=swordsman,
    insert([1,'Wood','Sword'],yes),
    insert([1,'Leather','Armor'],yes),
    insert('Health',5).
insertDefault(Job) :-
    Job=archer,
    insert([1,'Short','Bow'],yes),
    insert([1,'Leather','Armor'],yes),
    insert('Health',5).
insertDefault(Job) :-
    Job=sorcerer,
    insert([1,'Fireball','Spellscroll'],yes),
    insert([1,'Leather','Armor'],yes),
    insert('Health',5).

/* Insert item pada inventory dan equip jika dibutuhkan */
insert(Item,N) :-
    Item='Health',!,
    assertz(potion('Health',N,10)).
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
    (minusStats(Type1),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]));
    write('Equiping '),printlist([Type,X])),nl,
    assertz(equip(weapon([N,Type,X]))),
    updateStats(Type).
equipItem(armor([N,Type,X])) :- 
    (retract(equip(armor([_,Type1,X]))),
    (minusStats(Type1),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]));
    write('Equiping '),printlist([Type,X])),nl,
    assertz(equip(armor([N,Type,X]))),
    updateStats(Type).
equipItem(accessory([N,Type,X])) :- 
    (retract(equip(accessory([_,Type1,X]))),
    (minusStats(Type1),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]));
    write('Equiping '),printlist([Type,X])),nl,
    assertz(equip(accessory([N,Type,X]))),
    updateStats(Type).

/* Update Stats Player */
checkStats(Type,N,Stat) :-
    (Type='Wood';Type='Short';Type='Fireball'),
    N = 10,Stat=attack,!.
checkStats(Type,N,Stat) :-
    (Type='Stone';Type='Long';Type='Iceray'),
    N = 20,Stat=attack,!.
checkStats(Type,N,Stat) :-
    (Type='Iron';Type='Cross';Type='Thunderstrike'),
    N is 40,Stat=attack,!.
checkStats(Type,N,Stat) :-
    Type='Leather',
    N is 100,Stat=defend,!.
checkStats(Type,N,Stat) :-
    Type='Iron',
    N is 500,Stat=defend,!.

minusStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=attack,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    AP1 is AP - N,
    asserta(character(Username, Job, Level, MaxHP, HP, DP, AP1, XP)).
minusStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=defend,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    DP1 is DP - N,
    asserta(character(Username, Job, Level, MaxHP, HP, DP1, AP, XP)).

updateStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=attack,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    AP1 is AP + N,
    asserta(character(Username, Job, Level, MaxHP, HP, DP, AP1, XP)).
updateStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=defend,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    DP1 is DP + N,
    asserta(character(Username, Job, Level, MaxHP, HP, DP1, AP, XP)).

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

usePot(Amount) :- 
    /*choosePotion,
    read(Type),
    Type=health,*/
    potion(N,'Health',Heal),!,
    retract(potion(N,'Health',Heal)),
    N1 is N-1,
    Amount = Heal,
    assertz(potion(N1,'Health',Heal)).
usePot(Amount) :-
    Amount = 0,
    write('You have run out of healing potion!'),fail.

/* Print List */
/*Basis*/
printlist([Head|[]]) :- !,write(Head).
/*Rekurens*/
printlist([Head|Tail]) :- write(Head), write(' '),printlist(Tail).

/*************************************************************************************/
/* Item - item yang dimiliki player akan disimpan dalam bentuk predikat dynamic*/
