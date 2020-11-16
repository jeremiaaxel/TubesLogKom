/* Items */
/* Facts */
:- dynamic(weapon/3).
:- dynamic(armor/3).
:- dynamic(accessory/3).
:- dynamic(potion/1).

/* Item - item yang dimiliki player */
weapon(wood,sword,1).
weapon(iron,sword,2).
potion(X).

/* Rules */
/* Untuk periksa suatu item adalah equipment */
equipment(X) :- weapon(_,_,_),!.
equipment(X) :- armor(_,_,_),!.
equipment(X) :- accessory(_,_,_),!.

/* Inventory */
/* Rules */
/* Untuk print inventory player */
inventory :- weapon(Type,X,N),Type=wood,printinven([N,Type,X]).
inventory :- weapon(Type,X,N),Type=stone,printinven([N,Type,X]).
inventory :- weapon(Type,X,N),Type=iron,printinven([N,Type,X]).

/* Print Inventory */
capitalize([], []).
capitalize([H1|Tail], [H2|Tail]):- code_type(H2, to_upper(H1)).

printinven([Head|[]]) :- !,print(Head).
printinven([Head|Tail]) :- print(Head), print(' '),printinven(Tail).

/* Store */
/* Rules */
shop :- print('1. Gacha 100 Gold\n2. Potion 10 Gold'). /* untuk membuka menu store */

gacha. /* Untuk random item yang didapatkan player */

healthPotion. /* Untuk menambahkan health potion di inventory player */

