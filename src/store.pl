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
    assertz(gold(Y1)),
    write(Y1),write(' golds remaining.' ),nl,sleep(0.5). 

randomItem(Item) :-
    character(_, Job, _, _, _, _, _, _),
    itemList(Job,I),
    length(I,X),
    random(1,X,X1),
    accessItem(I,X1,Item).

accessItem([Head|_],0,X) :- X=Head,!.
accessItem([_|Tail],I1,X) :- I is I1-1, accessItem(Tail,I,X).

shop :- /* untuk membuka menu store */
    posPlayer(Xp,Yp),
    store(Xs,Ys),
    Xp=Xs,Yp=Ys,!,
    write('       ~~ STORE ~~       '), nl,
    write('1. gacha (400 Gold)\n2. Health Potion (10 Gold)\n3. Exit\n'),
    write('\nWhat would you like to buy? '),
    read(X),
    (X==1 -> gacha;
    X==2 -> healthPotion;
    X==3). 
shop :-
    write('You are not in any store.').

gacha :- /* Untuk random item yang didapatkan player */
    checkGold(400),!,
    minusGold(400),
    randomItem([Type,X]),
    write('You got...\n'),sleep(0.5),
    printlist([1|[Type,X]]),nl,
    checkItem([1|[Type,X]],N),
    (N=1,write('Do you want to equip the item? (yes/no) \n'),
    read(Op),
    (Op=yes -> 
        insert([N|[Type,X]],Op);
        write('Okay I will take that for 250 gold if you dont want it.'),plusGold(250))
    ;
    \+N=1,plusGold(200),
    write('You already own this, i\'m taking this for 200 gold. That\'s why you don\'t gamble kid\n'),
    insert([1|[Type,X]],no)),!. 
gacha :- \+checkGold(400),write('Insufficient amount of gold!').
gacha.

healthPotion :- /* Untuk menambahkan health potion di inventory player */
    checkGold(10),
    potion('Health',X,Heal),!,
    minusGold(10),
    retract(potion('Health',X,Heal)),
    X1 is X+1, 
    assertz(potion('Health',X1,Heal)),
    write('Acquired 1 Health Potion').
healthPotion :- 
    checkGold(10),!,
    minusGold(10),
    assertz(potion('Health',1,10)),
    write('Acquired 1 Health Potion'), !.
healthPotion :- write('Insufficient amount of gold!').
healthPotion.
