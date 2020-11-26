/* Goal State */
/* Facts */
loseFinal(boss).

/* Rules */
/* Pemain menang melawan bos */
winFinal(boss) :- enemyInFight(_,_,_,EnemyType,_,_,_,_), EnemyType = your_frickin_grandpa, !.

goal :- winFinal(boss),
        !,
        write('██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗ ██████╗ ███╗   ██╗'),nl,
        write('╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██╔═══██╗████╗  ██║'),nl,
        write(' ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║   ██║██╔██╗ ██║'),nl,
        write('  ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║   ██║██║╚██╗██║'),nl,
        write('   ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║ ╚████║'),nl,
        write('   ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝'),nl,
        write('              ...Shall began, Dragon Slayer...'),nl,
        write('          You are a hero of Willy Wangky Theme Park').

/* Pemain kalah melawan bos */
goal :- character(_,_,_,_,_,0,_,_),!,
        lose.
