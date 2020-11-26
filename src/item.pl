/* Items */

/* Facts */
:- dynamic(weapon/1).
:- dynamic(armor/1).
:- dynamic(accessory/1).
:- dynamic(potion/3).
:- dynamic(gold/1).

itemList(swordsman,[['Short','Sword'],['Falchion','Sword'],['Cutlass','Sword'],['Leather','Armor'],['Iron','Armor'],['Sacred','Ring'],['Dragonscale','Amulet'],['Wangky','Bracelet']]).
itemList(archer,[['Regular','Bow'],['Long','Bow'],['Cross','Bow'],['Leather','Armor'],['Iron','Armor'],['Sacred','Ring'],['Dragonscale','Amulet'],['Wangky','Bracelet']]).
itemList(sorcerer,[['Fireball','Spellscroll'],['Iceray','Spellscroll'],['Thunderstrike','Spellscroll'],['Leather','Armor'],['Iron','Armor'],['Sacred','Ring'],['Dragonscale','Amulet'],['Wangky','Bracelet']]).

checkStats('Short',10,attack).
checkStats('Falchion',20,attack).
checkStats('Cutlass',40,attack).

checkStats('Regular',5,attack).
checkStats('Long',15,attack).
checkStats('Cross',40,attack).

checkStats('Fireball',15,attack).
checkStats('Iceray',30,attack).
checkStats('Thunderstrike',50,attack).

checkStats('Leather',100,defend).
checkStats('Iron',500,defend).

checkStats('Sacred',250,maxhp).
checkStats('Dragonscale',250,maxhp).
checkStats('Wangky',100,maxhp).

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
    Job=swordsman,!,
    insert([1,'Short','Sword'],yes),
    insert([1,'Leather','Armor'],yes),
    insert([1,'Wangky','Bracelet'],yes),
    insert('Health',5).
insertDefault(Job) :-
    Job=archer,!,
    insert([1,'Regular','Bow'],yes),
    insert([1,'Leather','Armor'],yes),
    insert([1,'Wangky','Bracelet'],yes),
    insert('Health',5).
insertDefault(Job) :-
    Job=sorcerer,!,
    insert([1,'Fireball','Spellscroll'],yes),
    insert([1,'Leather','Armor'],yes),
    insert([1,'Wangky','Bracelet'],yes),
    insert('Health',5).

/* Insert item pada inventory dan equip jika dibutuhkan */
insert(Item,N) :-
    Item='Health',!,
    assertz(potion('Health',N,10)).
insert(Item,Equip) :- 
    back(Item,Type),
    (Type='Sword'; Type='Bow'; Type='Spellscroll'),!,
    assertz(weapon(Item)),
    Equip=yes,!,
    equipItem(weapon(Item)).
insert(Item,Equip) :- 
    back(Item,Type),
    Type='Armor',!,
    assertz(armor(Item)),
    Equip=yes,!,
    equipItem(armor(Item)).
insert(Item,Equip) :- 
    back(Item,Type),
    (Type='Ring'; Type='Amulet';Type='Bracelet'),!,
    assertz(accessory(Item)),
    Equip=yes,!,
    equipItem(accessory(Item)).

/* Equip item */
/* Untuk periksa item yang di-equip player */
:- dynamic(equip/1).

/* equip(armor([1,'Leather','Armor'])). */

equipItem(weapon([N,Type,X])) :- 
    ((retract(equip(weapon([_,Type1,X]))),(minusStats(Type1),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]))
    ;
    write('Equiping '),printlist([Type,X]))),
    assertz(equip(weapon([N,Type,X]))),
    updateStats(Type),!.
equipItem(armor([N,Type,X])) :- 
    (retract(equip(armor([_,Type1,X]))),
    (minusStats(Type1),
    write('Removing '),printlist([Type1,X]),write(' to equip '),printlist([Type,X]))
    ;
    write('Equiping '),printlist([Type,X])),
    assertz(equip(armor([N,Type,X]))),
    updateStats(Type),!.
equipItem(accessory([N,Type,X])) :- 
    write('Equiping '),printlist([Type,X]),
    assertz(equip(accessory([N,Type,X]))),
    updateStats(Type),!.

/* Update Stats Player */
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
    AP1 is AP + N, write('(Your attack increases by '), write(N),write(')\n\n'),
    asserta(character(Username, Job, Level, MaxHP, HP, DP, AP1, XP)).
updateStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=defend,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    DP1 is DP + N, write('(Your defense increases by '), write(N),write(')\n\n'),
    asserta(character(Username, Job, Level, MaxHP, HP, DP1, AP, XP)).
updateStats(Type) :-
    checkStats(Type,N,Stat),
    Stat=maxhp,
    retract(character(Username, Job, Level, MaxHP, HP, DP, AP, XP)),
    MaxHP1 is MaxHP + N, write('(Your Max HP increases by '), write(N),write(')\n\n'),
    asserta(character(Username, Job, Level, MaxHP1, HP, DP, AP, XP)).

/*************************************************************************************/
 
/* Inventory */
/* Rules */
/* Untuk print inventory player */
inventory :- 
    weapon(Item),
    printlist(Item),
    (equip(weapon(Item)),print(' (Equipped)');nl),fail.
inventory :- 
    armor(Item),
    printlist(Item),
    (equip(armor(Item)),print(' (Equipped)');nl),fail.
inventory :- 
    accessory(Item),
    printlist(Item),
    (equip(accessory(Item)),print(' (Equipped)');nl),fail.
inventory :- 
    potion(Type,N,_),
    printlist([N,Type,'potion']),
    nl,fail.
inventory.

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
    potion('Health',N,Heal),!,
    retract(potion('Health',N,Heal)),
    N1 is N-1,
    Amount = Heal,
    (N1>0, assertz(potion('Health',N1,Heal))
    ;
    N1==0),
    !.
usePot(Amount) :-
    Amount = 0,
    write('You have run out of healing potion!\n'),fail.

/* Print List */
/*Basis*/
printlist([Head|[]]) :- !,write(Head).
/*Rekurens*/
printlist([Head|Tail]) :- write(Head), write(' '),printlist(Tail).

/*************************************************************************************/
/* Item - item yang dimiliki player akan disimpan dalam bentuk predikat dynamic*/
