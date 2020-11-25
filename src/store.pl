/* Store */

/* Facts */
gold(1000).

/* Rules */
checkGold(X) :- gold(Y),\+ X>Y.

plusGold(X) :- /* Untuk menambahkan gold player */
    retract(gold(N)),
    N1 is N+X,
    asserta(gold(N1)).

minusGold(X) :- /* Untuk mengurangkan gold player */
    gold(Y),
    Y1 is Y-X,
    retract(gold(Y)),
    assertz(gold(Y1)).

randomItem(Item) :-
    itemList(I),
    length(I,X),
    random(1,X,X1),
    accessItem(I,X1,Item).

accessItem([Head|_],0,X) :- X=Head,!.
accessItem([_|Tail],I1,X) :- I is I1-1, accessItem(Tail,I,X).

shop :- /* untuk membuka menu store */
    posPlayer(Xp,Yp),
    store(Xs,Ys),
    Xp=Xs,Yp=Ys,!,
    write('1. gacha (100 Gold)\n2. Health Potion (10 Gold)\n'),
    read(X),
    (X=1, gacha);(X=2, healthPotion).
shop :-
    write('You are not in any store').

gacha :- /* Untuk random item yang didapatkan player */
    checkGold(100),!,
    minusGold(100),
    randomItem([Type,X]),
    write('You got...\n'),sleep(0.5),
    printlist([1|[Type,X]]),nl,
    checkItem([1|[Type,X]],N),
    write('Do you want to equip the item ? (yes/no)'),
    read(Op),
    insert([N|[Type,X]],Op).
gacha :- print('Insufficient amount of gold!').

healthPotion :- /* Untuk menambahkan health potion di inventory player */
    checkGold(10),
    potion('Health',X,Heal),!,
    minusGold(10),
    retract(potion('Health',X,Heal)),
    X1 is X+1,
    assertz(potion('Health',X1,Heal)).
healthPotion :-
    checkGold(10),!,
    minusGold(10),
    assertz(potion('Health',1,10)).
healthPotion :- print('Insufficient amount of gold!').
