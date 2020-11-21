/* Goal State */
/* Facts */
win(player,boss).
lose(player,boss).

/* Rules */
/* Pemain menang melawan bos */
goal :- win(player,boss),
        !,
        write('Your soul are now attached with the Dovnik, the son of Mathevik'),nl,
        write('Shall began, Dragon Slayer...'),nl,
        write('You are a hero of Wangardium.').

/* Pemain kalah melawan bos */
goal :- lose(player,boss),!,write('You lose, pathetic mortal.').
