/* QUEST */
/*:- dynamic(quest/3) quest(slime,goblin,wolf)*/
:- dynamic(questOnGoing/1).
:- dynamic(quest/3).
:- dynamic(expGain/1).
:- dynamic(options/1).

/*Rules*/
/*mekanisme quest*/
/* QUEST 1 */
foundQuest :- posPlayer(X,Y),quest1(X,Y),\+(questOnGoing(1)),asserta(quest(1,1,1)),
    write('Veelfdir: Ohh dear Willy Wangky\'s grandson, can you help me for something?'),nl,
    write('Choose your dialogue option with command \'1\', \'2\', or \'3\'.'),nl,
    write('Options: i.   Alright. What can I do?'),nl,
    write('         ii.  I\'m in a hurry. Just do it fast.'),nl,
    write('         iii. Give me some \'wares\' first before that \'helping\' thing.'),
    asserta(options(1)), asserta(questOnGoing(1)).

foundQuest :- posPlayer(X,Y),quest2(X,Y),\+(questOnGoing(1)),asserta(quest(2,3,2)),
    write('Laborers  : This is the time! This theme park should came back to our hands!'),nl,
    write('          Hours by hours, carried by the courage and sacrifice of our fellows!'),nl,
    write('          The sun are watching. The spirits of our customers are stirring.'),nl,
    write('          Fight! Fight! Fight! for the landlords of Willy Wangky!'),nl,
    write('Options: i.  Hello laborers, where are you going?'),nl,
    write('         ii. *pretend not to see*'),nl,
    asserta(options(1)),asserta(questOnGoing(1)).

foundQuest :- posPlayer(X,Y),quest3(X,Y),\+(questOnGoing(1)),asserta(quest(5,6,4)),
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
    write('Options: i.  What do you mean by that, old man?'),nl,
    write('         ii. Wangkygard...um what?'),
    asserta(options(1)),asserta(questOnGoing(1)).

/* Jika masih ada quest yang berjalan */
foundQuest :- posPlayer(X,Y),(quest1(X,Y);quest2(X,Y);quest3(X,Y)),questOnGoing(1),
    write('You are still in a quest, mortal. Finish it up first.'),!.


opt :- posPlayer(X,Y),quest1(X,Y),questOnGoing(1),quest(1,1,1),options(1),
    write('Options: i.   Alright. I\'ll show them this great Wangky Grandson wkwk.'),nl,
    write('         ii.  My condolences. I will show them no mercy.'),nl,
    write('         iii. Ahh they are just a bunch of dog yet you can\'t get rid of them. Alright alright.'),
    retract(options(1)),asserta(options(2)).

opt :- posPlayer(X,Y),quest2(X,Y),questOnGoing(1),quest(2,3,2),options(1),
    write('Choose your dialogue option with command \'1\', \'2\'.'),nl,
    write('Options: i.  I will gladly join our countrymen\'s battle.'),nl,
    write('         ii. Alright alright'),
    retract(options(1)),asserta(options(2)).

i :- quest(1,1,1), options(1),!,
    write('Veelfdir: My bianglala has been burned by those filthy monsters! Please, get rid of them all'), opt.
i :- quest(1,1,1),options(2),!,
    write('Veelfdir: Thank you, sir.'),nl,nl,
    write('##############QUEST 1##############'),nl,
    write('Kill 1 slime, 1 goblin, and 1 wolf.'),
    retract(options(2)).
i :- quest(2,3,2),options(1),!,
    write('Laborers  : We are trying to accomplish your grandfather, Willy Wangky\'s goal,'),nl,
    write('            to remove the impurities in this theme park. Will you join us, dear sir?'),opt.
i :- quest(2,3,2),options(2),!,
    write('Laborers  : Let\'s go with us then, sir.'),nl,
    write('##############QUEST 2##############'),nl,
    write('Kill 2 slimes, 3 goblins, 2 wolves'),
    retract(options(2)).
i :- quest(5,6,4),options(1),!,
    write('Dovahngard : The prophecy...hanaca... has said that will come a man... whom descendant of the great Willy Wangky...'),nl,
    write('             ...to break all the indecency by the darkness that has been corrupting the land of Willy Wangky...'),nl,
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... sir...'),nl,sleep(0.5),
    write('Options: i. What should I do? I mean, all these monsters just appear with no ending sequence, old man.'),
    retract(options(1)),asserta(options(2)).
i :- quest(5,6,4),options(2),!,
    write('Dovahngard : ...In the mean time... this old earthling just requests you to clean my Histeria from those impurities...'),nl,sleep(0.5),
    write('             ...but those things will never end until you.....end the biggest impurities laid beneath this land....'),nl,
    write('             ...God give me a hope to this land as the sunrise could be seen again...'),nl,sleep(0.5),
    write('##############QUEST 3##############'),nl,
    write('Kill 5 slimes, 6 goblins, and 4 wolves.').

ii :- quest(1,1,1), options(1),!,
    write('Veelfdir: My farm has been burned by those filthy monsters! Please, get rid of them all'), opt.
ii :- quest(1,1,1),options(2),!,
    write('Veelfdir: Thank you, dear sir. I hope you could came back with no dirty rags.'),nl,nl,
    write('##############QUEST 1##############'),nl,
    write('Kill 1 slime, 1 goblin, and 1 wolf.'),
    retract(options(2)).
ii :- quest(2,3,2),options(1),!,
    write('Laborers  : Sunrise above, Willy Wangky\'s grandson. Are you interested to join our battle?'),opt.
ii :- quest(2,3,2),options(2),!,
    write('Laborers  : Sounds lazy... Anyway, let\'s go.'),nl,
    write('##############QUEST 2##############'),nl,
    write('Kill 2 slimes, 3 goblins, and 2 wolves'),
    retract(options(2)).
ii :- quest(5,6,4),options(1),!,
    write('Dovahngard : Wangkygard.....The soul who once own this land...Now he appears, the descendant of the great Willy Wangky...'),nl,
    write('           : ...to break all the indecency by the darkness that has been corrupting the land of Willy Wangky...'),nl,sleep(0.5),
    write('Dovahngard : ...I believe you are the one who could end the misery on this land... sir...'),nl,sleep(0.5),
    write('Options: [1] What should I do? I mean, all these monsters just appear with no ending sequence, old man.'),
    retract(options(1)),asserta(options(2)).

iii :- quest(1,1,1), options(1),!,
    write('Veelfdir: And I oop...What happened that you make the darkness led behind your cruel words, sir?'),nl,
    write('          I have no wares left. My farm has been burned by those filthy monsters!'), opt.
iii :- quest(1,1,1),options(2),!,
    write('Veelfdir: *silent*'),nl,nl,
    write('##############QUEST 1##############'),nl,
    write('Kill 1 slime, 1 goblin, and 1 wolf.'),
    retract(options(2)).


questFinish :- win(2,2,2),
    asserta(expGain(100)),
    write('You gain 100 exp!'),!.
questFinish :- win(4,4,4),
    asserta(expGain(200)),
    write('You gain 200 exp!'),!.
questFinish :- win(6,6,6),
    asserta(expGain(400)),
    write('You gain 400 exp!'),!.
