/* Goal State */
/* Facts */
loseFinal(boss).

/* Rules */
/* Pemain menang melawan bos */
winFinal(boss) :- enemyInFight(_,_,_,EnemyType,_,_,_,_), EnemyType = your_frickin_grandpa, !.

goal :- winFinal(boss),
        !,
        write('  __  __   ______   __  __       __     __   ______   __   __    '),nl,
        write(' /\\ \\_\\ \\ /\\  __ \\ /\\ \\/\\ \\     /\\ \\  _ \\ \\ /\\  __ \\ /\\ "-.\\ \\   '),nl,
        write(' \\ \\____ \\\\ \\ \\/\\ \\\\ \\ \\_\\ \\    \\ \\ \\/ ".\\ \\\\ \\ \\/\\ \\\\ \\ \\-.  \\  '),nl,
        write('  \\/\\_____\\\\ \\_____\\\\ \\_____\\    \\ \\__/".~\\_\\\\ \\_____\\\\ \\_\\\\"\\_\\ '),nl,
        write('   \\/_____/ \\/_____/ \\/_____/     \\/_/   \\/_/ \\/_____/ \\/_/ \\/_/ '),nl,
        write('              ...Shall began, Dragon Slayer...'),nl,
        write('          You are a hero of Willy Wangky Theme Park').

/* Pemain kalah melawan bos */
goal :- character(_,_,_,_,_,0,_,_),!,
        lose.
