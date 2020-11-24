/* Goal State */
/* Facts */
loseFinal(boss).

/* Rules */
/* Pemain menang melawan bos */
winFinal(boss) :- enemy(_,boss,_,_,0,_,_).

goal :- winFinal(boss),
        !,
        write('Your soul are now attached with the Dovnik, the son of Mathevik'),nl,
        write('Shall began, Dragon Slayer...'),nl,
        write('You are a hero of Wangardium.').

/* Pemain kalah melawan bos */
goal :- hp(characterX,0),!,
        lose.
