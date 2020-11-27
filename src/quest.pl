/* QUEST */
:- dynamic(quest1/3).
:- dynamic(quest2/3).
:- dynamic(quest3/3).
:- dynamic(win1/1).
:- dynamic(win2/1).
:- dynamic(win3/1).
:- dynamic(questOnGoing/1).

/*Rules*/
/*Mekanisme Quest*/

/* QUEST 1 */
foundQuest :- posPlayer(X,Y),quest1(X,Y),\+win1(1),\+(questOnGoing(1)),asserta(quest1(1,1,1)),sleep(0.5),
    write('Veelfdir: Ohh dear Willy Wangky\'s grandchild, could you help me for something?'),nl,sleep(0.5),
    write('[1] Alright. What could I do?'),nl,
    write('[2] I\'m in a hurry. Just do it fast.'),nl,
    write('[3] Give me some \'wares\' first before that \'helping\' thing.'),nl,sleep(0.5),
    repeat,
    write('Your option: '),read(OO),
    (
        (OO\=1);(OO\=2);(OO\=3) ->
            fail;
            !
    ),
    ((OO=1,nl,write('Veelfdir: Veelfdir: I can\'t access my bianglala as those filthy monsters has been walking around it! Please, get rid of them all'));
    (OO=2,nl,write('Veelfdir: I can\'t access my bianglala as those filthy monsters has been walking around it! Please, get rid of them all'));
    (OO=3,nl,write('Veelfdir: Why, sir? Are you running out the food or something? I have no wares left as the Willy Wangky theme park being ambushed by these monsters.'),nl,
    write('          I can\'t access my bianglala as those filthy monsters has been walking around it! Could you please get rid of them all?'))),nl,sleep(0.5),
    write('[1] Alright. I\'ll show them what fear really means.'),nl,
    write('[2] My condolences. I will show them no mercy.'),nl,
    write('[3] I think it\'s called "territory marking". By the way, I\'ll try.'),nl,
    repeat,
    write('Your option: '),read(PP),
    (
        (PP\=1);(PP\=2);(PP\=3) ->
            fail;
            !
    ),
    ((PP=1,nl,write('Veelfdir: Thank you, sir.'));
    (PP=2,nl,write('Veelfdir: Thank you, dear sir. I hope you could came back with no dirty rags.'));
    (PP=3,nl,write('Veelfdir: Thank you, sir.'))),nl,sleep(0.5),
    write('-----------------------------------------------------------'), nl,
    write('                ___                  _     _ '),nl,
    write('               / _ \\ _   _  ___  ___| |_  / |'),nl,
    write('              | | | | | | |/ _ \\/ __| __| | |'),nl,
    write('              | |_| | |_| |  __/\\__ \\ |_  | |'),nl,
    write('               \\__\\_\\\\__,_|\\___||___/\\__| |_|'),nl,nl,
    write('          Kill 1 slime, 1 goblin, and 1 wolf.'),nl,
    write('-----------------------------------------------------------'), nl,
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* Jika Quest 1 telah diselesaikan */
foundQuest :- posPlayer(X,Y),quest1(X,Y),win1(1),
    write('You\'ve done this quest.').

/* QUEST 2*/
foundQuest :- posPlayer(X,Y),quest2(X,Y),\+win2(1),\+(questOnGoing(1)),asserta(quest2(2,3,2)),sleep(0.5),
    write('Laborers  : This is the time! This theme park should came back to our hands!'),nl,sleep(0.5),
    write('          Hours by hours, carried by the courage and sacrifice of our fellows!'),nl,sleep(0.5),
    write('          The sun are watching. The spirits of our customers are stirring.'),nl,sleep(0.5),
    write('          Fight! Fight! Fight! for the landlords of Willy Wangky!'),nl,sleep(0.5),
    write('[1] Hello laborers, where are you going?'),nl,
    write('[2] *pretend not to see*'),nl,sleep(0.5),
    repeat,
    write('Your option: '),read(QQ),
    (
        (QQ\=1),(QQ\=2) ->
            fail;
            !
    ),
    ((QQ=1,nl,write('Laborers  : We are trying to accomplish your grandfather, Willy Wangky\'s goal,'),nl,
    write('            to remove impurities in this theme park. Will you join us, dear sir?'));
    (QQ=2,nl,write('Laborers  : Sunrise above, Willy Wangky\'s grandson. Are you interested to join our battle?'))),nl,sleep(0.5),
    write('[1] I will gladly join our countrymen\'s battle.'),nl,
    write('[2] Again..? Alright alright'),nl,sleep(0.5),
    repeat,
    write('Your option: '),read(RR),
    (
        (RR\=1),(RR\=2) ->
            fail;
            !
    ),
    ((RR=1,nl,write('Laborers  : Let\'s go with us then, sir.'));
    (RR=2,nl,write('Laborers  : Sounds lazy... Anyway, let\'s go.'))),nl,sleep(0.5),
    write('-----------------------------------------------------------'), nl,
    write('             ___                  _     ____ '),nl,
    write('            / _ \\ _   _  ___  ___| |_  |___ \\ '),nl,
    write('           | | | | | | |/ _ \\/ __| __|   __) |'),nl,
    write('           | |_| | |_| |  __/\\__ \\ |_   / __/ '),nl,
    write('            \\__\\_\\\\__,_|\\___||___/\\__| |_____|'),nl,nl,
    write('          Kill 2 slimes, 3 goblins, and 2 wolves'),nl,
    write('-----------------------------------------------------------'),nl,
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* Jika Quest 2 telah diselesaikan */
foundQuest :- posPlayer(X,Y),quest2(X,Y),win2(1),
    write('You\'ve done this quest.').

/* QUEST 3 */
foundQuest :- posPlayer(X,Y),quest3(X,Y),\+(questOnGoing(1)),asserta(quest3(5,6,4)),
    write('  ` : | | | |:  ||  :     `  :  |  |+|: | : : :|   .        `              .'),nl,
    write('      ` : | :|  ||  |:  :    `  |  | :| : | : |:   |  .                    :'),nl,
    write('         .\' \':  ||  |:  |  \'       ` || | : | |: : |   .  `           .   :.'),nl,
    write('                `\'  ||  |  \' |   *    ` : | | :| |*|  :   :               :|'),nl,
    write('        *    *       `  |  : :  |  .      ` \' :| | :| . : :         *   :.||'),nl,
    write('             .`            | |  |  : .:|       ` | || | : |: |          | ||'),nl,
    write('      \'          .         + `  |  :  .: .         \'| | : :| :    .   |:| ||'),nl,
    write('         .                 .    ` *|  || :       `    | | :| | :      |:| |'),nl,
    write(' .                .          .        || |.: *          | || : :     :|||'),nl,
    write('        .            .   . *    .   .  ` |||.  +        + \'| |||  .  ||`'),nl,
    write('     .             *              .     +:`|!             . ||||  :.||`'),nl,
    write(' +                      .                ..!|*          . | :`||+ |||`'),nl,
    write('     .                         +      : |||`        .| :| | | |.| ||`     .'),nl,
    write('       *     +   \'               +  :|| |`     :.+. || || | |:`|| `'),nl,
    write('                            .      .||` .    ..|| | |: \'` `| | |`  +'),nl,
    write('  .       +++                      ||        !|!: `       :| |'),nl,
    write('              +         .      .    | .      `|||.:      .||    .      .    `'),nl,
    write('          \'                           `|.   .  `:|||   + ||\'     `'),nl,
    write('  __    +      *                         `\'       `\'|.    `:'),nl,
    write('"\'  `---"""----....____,..^---`^``----.,.___          `.    `.  .    ____,.,-'),nl,
    write('    ___,--\'""`---"\'   ^  ^ ^        ^       """\'---,..___ __,..---""\''),nl,
    write('--"\'                           ^                         ``--..,__ '),nl,nl,
    write('Dovahngard : hanaca... raka... datasawala... padhajaya... nyamagabat... hanga...'),nl,sleep(0.5),
    write('Dovahngard : hanaca... raka...........'),nl,sleep(0.5),
    write('Dovahngard : ....Oh dear.... Those visions are true......I see the light of Wangkygard inside your eyes...'),nl,sleep(0.5),
    write('[1] What do you mean by that, old man?'),nl,
    write('[2] Wangkygard...um what?'),nl,
    repeat,
    write('Your option: '),read(SS),
    (
        (SS\=1),(SS\=2) ->
            fail;
            !
    ),
    ((SS=1,nl,write('Dovahngard : The prophecy...hanaca... has said that will come a man... whom descendant of the great Willy Wangky...'),nl,
    write('             ...to break all the indecency by the darkness that has been corrupting the land of Willy Wangky...'),nl,
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... dear...'));
    (SS=2,nl,write('Dovahngard : Wangkygard.....The soul who once owned this land...Now he appears, the descendant of the great Willy Wangky...'),nl,
    write('           : ...to break all the indecency by the darkness that has been corrupting the land of Willy Wangky...'),nl,sleep(0.5),
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... dear...'))),nl,sleep(0.5),
    write('[1] What should I do? I mean, all these monsters just appear with no ending sequence, old man.'),nl,
    repeat,
    write('Your option: '), read(TT),
    (
        TT \= 1 ->
            fail;
            !
    ),
    (TT=1,nl,write('Dovahngard : ...In the mean time... this old earthling just requests you to clean my Histeria from those impurities...'),nl,sleep(0.5),
    write('             ...but those living creatures will never end until you.....end the biggest impurities laid beneath this land....'),nl,
    write('             ...God give me a hope to this land as the sunrise could be seen again...')),nl,nl,sleep(0.5),
    write('-----------------------------------------------------------'), nl,nl,
    write('                ___                  _     _____ '),nl,
    write('               / _ \\ _   _  ___  ___| |_  |___ / '),nl,
    write('              | | | | | | |/ _ \\/ __| __|   |_ \\ '),nl,
    write('              | |_| | |_| |  __/\\__ \\ |_   ___) | '),nl,
    write('               \\__\\_\\__,_|\\___||___/\\__| |____/ '),nl,nl,
    write('          Kill 5 slimes, 6 goblins, and 4 wolves.'),nl,
    write('-----------------------------------------------------------'),nl,
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* kalau sudah menyelesaikan quest 3 */
foundQuest :- posPlayer(X,Y),quest3(X,Y),win3(1),
    write('You\'ve done this quest.').

/* Jika masih ada quest yang berjalan */
foundQuest :- posPlayer(X,Y),(quest1(X,Y);quest2(X,Y);quest3(X,Y)),questOnGoing(1),
    write('You are still in a quest, mortal. Finish it up first.'),!.

/* Mekanisme exp dan gold Quest */
expGoldQuest1 :- quest1(0,0,0), quest1Finish,
    character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),Exp2 is Exp + 50,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    plusGold(250),
    isLevelUp,
    !.
expGoldQuest1 :- \+quest1(0,0,0),\+quest2(_,_,_),\+quest3(_,_,_),expUp,!.

expGoldQuest2 :- quest2(0,0,0), quest2Finish,
    character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp), Exp2 is Exp + 150,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    plusGold(500),
    isLevelUp,
    !.
expGoldQuest2 :- \+quest2(0,0,0),\+quest1(_,_,_),\+quest3(_,_,_),expUp,!.

expGoldQuest3 :- quest3(0,0,0), quest3Finish,
    character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),Exp2 is Exp + 350,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    plusGold(750),
    isLevelUp,
    !.
expGoldQuest3 :- \+quest3(0,0,0),\+quest2(_,_,_),\+quest1(_,_,_),expUp,!.

/* Jika quest selesai */
quest1Finish :- write('Veelfdir: Thanks for being in my corner, sir! I can\'t say anything more.'),nl,nl,sleep(1),
    write('----------------------------------------------------------------------------------------'),nl,
    write('    ___                  _     _    ____                      _      _           _ _ '),nl,
    write('   / _ \\ _   _  ___  ___| |_  / |  / ___|___  _ __ ___  _ __ | | ___| |_ ___  __| | |'),nl,
    write('  | | | | | | |/ _ \\/ __| __| | | | |   / _ \\| \'_ ` _ \\| \'_ \\| |/ _ \\ __/ _ \\/ _` | |'),nl,
    write('  | |_| | |_| |  __/\\__ \\ |_  | | | |__| (_) | | | | | | |_) | |  __/ ||  __/ (_| |_|'),nl,
    write('   \\__\\_\\\\__,_|\\___||___/\\__| |_|  \\____\\___/|_| |_| |_| .__/|_|\\___|\\__\\___|\\__,_(_)'),nl,
    write('                                                       |_|                           '),nl,nl,
    write('                            You gain 50 exp and 250 gold!'),nl,
    write('----------------------------------------------------------------------------------------'),nl,
    retract(quest1(0,0,0)),asserta(win1(1)),retract(questOnGoing(1)),asserta(questOnGoing(0)).
quest2Finish :- write('Laborers: So glad you\'re in our team.'),nl,nl,sleep(1),
    write('----------------------------------------------------------------------------------------'),nl,
    write('   ___                  _     ____     ____                      _      _           _ _ '),nl,
    write('  / _ \\ _   _  ___  ___| |_  |___ \\   / ___|___  _ __ ___  _ __ | | ___| |_ ___  __| | |'),nl,
    write(' | | | | | | |/ _ \\/ __| __|   __) | | |   / _ \\| \'_ ` _ \\| \'_ \\| |/ _ \\ __/ _ \\/ _` | |'),nl,
    write(' | |_| | |_| |  __/\\__ \\ |_   / __/  | |__| (_) | | | | | | |_) | |  __/ ||  __/ (_| |_|'),nl,
    write('  \\__\\_\\\\__,_|\\___||___/\\__| |_____|  \\____\\___/|_| |_| |_| .__/|_|\\___|\\__\\___|\\__,_(_)'),nl,
    write('                                                          |_|                           '),nl,nl,
    write('                            You gain 150 exp and 500 gold!'),nl,
    write('----------------------------------------------------------------------------------------'),nl,
    retract(quest2(0,0,0)),asserta(win2(1)),retract(questOnGoing(1)),asserta(questOnGoing(0)).
quest3Finish :-
    write('Dovahngard: ...How did we get so lucky...? ...You\'re the child of prophecy...for REAL!...'),nl,nl,sleep(1),
    write('----------------------------------------------------------------------------------------'),nl,
    write('   ___                  _     _____    ____                      _      _           _ _ '),nl,
    write('  / _ \\ _   _  ___  ___| |_  |___ /   / ___|___  _ __ ___  _ __ | | ___| |_ ___  __| | |'),nl,
    write(' | | | | | | |/ _ \\/ __| __|   |_ \\  | |   / _ \\| \'_ ` _ \\| \'_ \\| |/ _ \\ __/ _ \\/ _` | |'),nl,
    write(' | |_| | |_| |  __/\\__ \\ |_   ___) | | |__| (_) | | | | | | |_) | |  __/ ||  __/ (_| |_|'),nl,
    write('  \\__\\_\\\\__,_|\\___||___/\\__| |____/   \\____\\___/|_| |_| |_| .__/|_|\\___|\\__\\___|\\__,_(_)'),nl,
    write('                                                          |_|                           '),nl,nl,
    write('                            You gain 350 exp and 750 gold!'),nl,
    write('----------------------------------------------------------------------------------------'),nl,
    retract(quest3(0,0,0)),asserta(win3(1)),retract(questOnGoing(1)),asserta(questOnGoing(0)).

quest :-
    init(_),
    write('------------------------- QUEST --------------------------'), nl,
    write('Quest 1 (100 exp) '),
    (
        win1(X), X = 1 -> write('<=<   completed   >=>'),nl;
        questOnGoing(1), quest1(A,B,C), A >= 0,!,B >= 0,!,C >= 0,!,A =< 1,!,B =< 1,!,C =< 1,! ->
            (
                write('<=<  in progress  >=>'),nl,
                write('   '),
                write(A), write(' slime(s), '),
                write(B), write(' goblins(s), '),
                write(C), write(' wolf(s) left'),nl
            );
        write('<=< yet 2 be done >=>'),nl
    ),nl,
    write('Quest 2 (200 exp) '),
    (
        win2(X), X = 1 -> write('<=<   completed   >=>'),nl;
        questOnGoing(1), quest2(A,B,C), A >= 0,!,B >= 0,!,C >= 0,!,A =< 2,!,B =< 3,!,C =< 2,! ->
            (
                write('<=<  in progress  >=>'),nl,
                write('   '),
                write(A), write(' slime(s), '),
                write(B), write(' goblins(s), '),
                write(C), write(' wolf(s) left'),nl
            );
        write('<=< yet 2 be done >=>'),nl
    ),nl,
    write('Quest 3 (500 exp) '),
    (
        win3(X), X = 1 -> write('<=<   completed   >=>'),nl;
        questOnGoing(1), quest3(A,B,C), A >= 0,!,B >= 0,!,C >= 0,!,A =< 5,!,B =< 6,!,C =< 4,! ->
            (
                write('<=<  in progress  >=>'),nl,
                write('   '),
                write(A), write(' slime(s), '),
                write(B), write(' goblins(s), '),
                write(C), write(' wolf(s) left'),nl
            );
        write('<=< yet 2 be done >=>'),nl
    ),
    write('----------------------------------------------------------'), nl,!.

quest :-
    \+init(_),
    write('Please start the game first!').
