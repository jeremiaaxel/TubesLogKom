/* Store */
:- include('item.pl').

/* Facts */
gold(1000).

/* Rules */
checkGold(X) :- gold(Y),\+ X>Y.

randomItem(Item) :-
    itemList(I),
    length(I,X),
    random(1,X,X1),
    accessItem(I,X1,Item).

accessItem([Head|_],0,X) :- X=Head,!.
accessItem([_|Tail],I1,X) :- I is I1-1, accessItem(Tail,I,X).

shop :- /* untuk membuka menu store */
    print('1. Gacha (100 Gold)\n2. Health Potion (10 Gold)\n'),
    read(X),
    (X=gacha, gacha;healthPotion). 

gacha :- /* Untuk random item yang didapatkan player */
    checkGold(100),!,
    minusGold(100),
    randomItem([Type,X]),
    write('You got...\n'),sleep(0.5),
    printlist([1|[Type,X]]),nl,
    checkItem([1|[Type,X]],N),
    write('Do you want to equip the item ?'),
    read(Op),
    insert([N|[Type,X]],Op). 
gacha :- print('Insufficient amount of gold!').

healthPotion :- /* Untuk menambahkan health potion di inventory player */
    checkGold(10),
    potion(health,X),!,
    minusGold(10),
    retract(potion(health,X)),
    X1 is X+1, 
    assertz(potion(health,X1)).
healthPotion :- 
    checkGold(10),!,
    minusGold(10),
    assertz(potion(health,1)). 
healthPotion :- print('Insufficient amount of gold!').

minusGold(X) :- /* Untuk mengurangkan gold player */
    gold(Y),
    Y1 is Y-X,
    retract(gold(Y)),
    assertz(gold(Y1)). 