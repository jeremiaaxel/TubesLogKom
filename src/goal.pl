/* Goal State */
/* Facts */
loseFinal(boss).

/* Rules */
/* Pemain menang melawan bos */
winFinal(boss) :- enemy(_,boss,_,_,0,_,_).

goal :- winFinal(boss),
        !,
        write('██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗ ██████╗ ███╗   ██╗'),nl,
        write('╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██╔═══██╗████╗  ██║'),nl,
        write(' ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║   ██║██╔██╗ ██║'),nl,
        write('  ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║   ██║██║╚██╗██║'),nl,
        write('   ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝╚██████╔╝██║ ╚████║'),nl,
        write('   ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝'),nl,
        write('Your soul are now attached with the Dovnik, the son of Mathevik'),nl,
        write('              ...Shall began, Dragon Slayer...'),nl,
        write('              You are a hero of Willy Wangky').

/* Pemain kalah melawan bos */
goal :- character(_,_,_,_,0,_,_),!,
        lose.
