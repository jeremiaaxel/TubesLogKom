/* QUEST */
/*:- dynamic(quest/3) quest(slime,goblin,wolf)*/
:- dynamic(questOnGoing/1).
:- dynamic(quest/3).
:- dynamic(expGain/1).

/*Fact*/
map(7,4,quest).
map(8,8,quest).
map(12,14,quest).
win(2,2,2).
win(3,3,3).
win(4,4,4).

/*Rules*/
/*mekanisme quest*/
foundQuest :- map(7,4,quest),
    \+(questOnGoing(true)),
    asserta(quest(1,1,1)),
    write('.....shhhhhhhhhhhhhhhhhhhh....'),nl,
    write('Sir, my name is Ivankov, and'),nl,
    write('My farm has been burned by these brutal monsters! Please, help me.'), nl,nl,
    write('You should kill 1 slimes, 1 goblins, and 1 wolfs'),
    asserta(questOnGoing(true)),!.
foundQuest :- map(8,8,quest),
    \+(questOnGoing(true)),
    asserta(quest(2,3,2)),
    write('My dear friend! I need your help here.'),nl,
    write('This village has been terrorized! My friend lose 2 children last night.'),nl,
    write('I hope my villagers make a smiley face, again.'),nl,nl,
    write('You should kill 2 slimes, 3 goblins, and 2 wolfs'),
    asserta(questOnGoing(true)),!.
foundQuest :- map(12,14,quest),
    \+(questOnGoing(true)),
    asserta(quest(2,3,4)),
    write('Uh..oh..HELP'),nl,nl,
    write('Kill 2 slimes, 3 goblins, and 4 wolfs!'),
    asserta(questOnGoing(true)),!.

/*masih ada quest yang berjalan */
foundQuest :- questOnGoing(true),
    write('You are still in a quest, mortal. Are you trying multitask on them?'),!.



questFinish :- win(2,2,2),
    asserta(expGain(100)),
    write('You gain 100 exp!'),!.
questFinish :- win(4,4,4),
    asserta(expGain(200)),
    write('You gain 200 exp!'),!.
questFinish :- win(6,6,6),
    asserta(expGain(400)),
    write('You gain 400 exp!'),!.
