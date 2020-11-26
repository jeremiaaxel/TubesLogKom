/* QUEST */
:- dynamic(quest1/3).
:- dynamic(quest2/3).
:- dynamic(quest3/3).
:- dynamic(win1/1).
:- dynamic(win2/1).
:- dynamic(win3/1).

/*Rules*/
/*mekanisme quest*/

/* QUEST 1 */
foundQuest :- posPlayer(X,Y),quest1(X,Y),\+win1(1),\+(questOnGoing(1)),asserta(quest1(1,1,1)),
    write('Veelfdir: Ohh dear Willy Wangky\'s grandson, can you help me for something?'),nl,sleep(0.5),
    write('[1] Alright. What can I do?'),nl,
    write('[2] I\'m in a hurry. Just do it fast.'),nl,
    write('[3] Give me some \'wares\' first before that \'helping\' thing.'),nl,
    repeat,
    write('Your option: '),read(OO),
    (
        (OO\=1);(OO\=2);(OO\=3) ->
            fail;
            !
    ),
    ((OO=1,nl,write('Veelfdir: My bianglala has been burned by those filthy monsters! Please, get rid of them all'));
    (OO=2,nl,write('Veelfdir: My farm has been burned by those filthy monsters! Please, get rid of them all'));
    (OO=3,nl,write('Veelfdir: And I oop...What happened that you make the darkness led behind your cruel words, sir?'),nl,
    write('          I have no wares left. My farm has been burned by those filthy monsters!'))),nl,sleep(0.5),
    write('[1] Alright. I\'ll show them this great Wangky Grandson wkwk.'),nl,
    write('[2] My condolences. I will show them no mercy.'),nl,
    write('[3] Ahh they are just a bunch of dog yet you can\'t get rid of them. Alright alright.'),nl,
    repeat,
    write('Your option: '),read(PP),
    (
        (PP\=1);(PP\=2);(PP\=3) ->
            fail;
            !
    ),
    ((PP=1,nl,write('Veelfdir: Thank you, sir.'));
    (PP=2,nl,write('Veelfdir: Thank you, dear sir. I hope you could came back with no dirty rags.'));
    (PP=3,nl,write('Veelfdir: *silent*'))),nl,sleep(0.5),
    write('############# QUEST 1 #############'),nl,
    write('Kill 1 slime, 1 goblin, and 1 wolf.'),
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* kalau sudah menyelesaikan quest 1 */
foundQuest :- posPlayer(X,Y),quest1(X,Y),\+win1(1),
    write('You\'ve done this quest.').

/* QUEST 2*/
foundQuest :- posPlayer(X,Y),quest2(X,Y),\+win2(1),\+(questOnGoing(1)),asserta(quest2(2,3,2)),
    write('Laborers  : This is the time! This theme park should came back to our hands!'),nl,
    write('          Hours by hours, carried by the courage and sacrifice of our fellows!'),nl,
    write('          The sun are watching. The spirits of our customers are stirring.'),nl,sleep(0.5),
    write('          Fight! Fight! Fight! for the landlords of Willy Wangky!'),nl,sleep(0.5),
    write('[1] Hello laborers, where are you going?'),nl,
    write('[2] *pretend not to see*'),nl,
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
    write('[2] Alright alright'),nl,
    repeat,
    write('Your option: '),read(RR),
    (
        (RR\=1),(RR\=2) ->
            fail;
            !
    ),
    ((RR=1,nl,write('Laborers  : Let\'s go with us then, sir.'));
    (RR=2,nl,write('Laborers  : Sounds lazy... Anyway, let\'s go.'))),nl,sleep(0.5),
    write('############# QUEST 2 #############'),nl,
    write('Kill 2 slimes, 3 goblins, 2 wolves'),
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* kalau sudah menyelesaikan quest 1 */
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
    write('--"\'                           ^                         ``--..,__ D. Rice'),nl,nl,
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
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... sir...'));
    (SS=2,nl,write('Dovahngard : Wangkygard.....The soul who once own this land...Now he appears, the descendant of the great Willy Wangky...'),nl,
    write('           : ...to break all the indecency by the darkness that has been corrupting the land of Willy Wangky...'),nl,sleep(0.5),
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... sir...'))),nl,sleep(0.5),
    write('[1] What should I do? I mean, all these monsters just appear with no ending sequence, old man.'),nl,
    repeat,
    write('Your option: '), read(TT),
    (
        TT \= 1 ->
            fail;
            !
    ),
    (TT=1,nl,write('Dovahngard : ...In the mean time... this old earthling just requests you to clean my Histeria from those impurities...'),nl,sleep(0.5),
    write('             ...but those things will never end until you.....end the biggest impurities laid beneath this land....'),nl,
    write('             ...God give me a hope to this land as the sunrise could be seen again...')),nl,nl,sleep(0.5),
    write('############# QUEST 3 #############'),nl,
    write('Kill 5 slimes, 6 goblins, and 4 wolves.'),
    retract(questOnGoing(0)),
    asserta(questOnGoing(1)).

/* kalau sudah menyelesaikan quest 1 */
foundQuest :- posPlayer(X,Y),quest2(X,Y),win3(1),
    write('You\'ve done this quest.').

/* Jika masih ada quest yang berjalan */
foundQuest :- posPlayer(X,Y),(quest1(X,Y);quest2(X,Y);quest3(X,Y)),questOnGoing(1),
    write('You are still in a quest, mortal. Finish it up first.'),!.

/* Mekanisme exp Quest */
expGoldQuest1 :- character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),
    quest1(0,0,0), quest1Finish, Exp2 is Exp+100, plusGold(250),
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    isLevelUp,
    !.
expGoldQuest1 :- \+quest1(0,0,0),!.
expGoldQuest2 :- character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),
    quest2(0,0,0), quest2Finish, Exp2 is Exp+300, plusGold(500),
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    isLevelUp,
    !.
expGoldQuest2 :- \+quest2(0,0,0),!.
expGoldQuest3 :- character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),
    quest3(0,0,0), quest3Finish, Exp2 is Exp+500, plusGold(800),
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    isLevelUp,
    !. 
expGoldQuest3 :- \+quest3(0,0,0),!.

/* Jika quest selesai */
quest1Finish :- write('Quest 1 Finished. You gain 100 exp!'),retract(quest1(0,0,0)),asserta(win1(1)).
quest2Finish :- write('Quest 2 Finished. You gain 300 exp!'),retract(quest2(0,0,0)),asserta(win2(1)).
quest3Finish :- write('Quest 3 Finished. You gain 500 exp!'),retract(quest3(0,0,0)),asserta(win3(1)).


