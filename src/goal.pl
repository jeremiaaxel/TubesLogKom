/* Goal State */
/* Facts */
loseFinal(boss).

/* Rules */
/* Pemain menang melawan bos */
winFinal(boss) :- enemy(Name,boss,Level,MaxHP,0,DP,AP).

goal :- winFinal(boss),
        !,
        write('Your soul are now attached with the Dovnik, the son of Mathevik'),nl,
        write('Shall began, Dragon Slayer...'),nl,
        write('You are a hero of Wangardium.').

/* Pemain kalah melawan bos */
goal :- hp(characterX,0),!,write('You lose, pathetic mortal.').
