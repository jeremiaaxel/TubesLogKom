/* QUEST */
:- dynamic(quest/3). /*quest(slime,goblin,wolf)*/

/*Fact*/
quest(x,y,z).
questOnGoing(player).
win(player,slime).
win(player,goblin).
win(player,wolf).
lose(player,slime).
lose(player,goblin).
lose(player,wolf).
expGain(player,exp).

/*Rules*/
/*mekanisme quest*/
questStart :- quest(x,y,z), \+questOnGoind(player).
/*quest dimulai*/

questStart :- questOnGoing(player),!, write('You are still in a quest, mortal. Are you trying multitask on them?').
/* player masih ada quest lain */

questFinish :- win(player,_enemy),expGain(player,exp),!.
/* player menyelesaikan quest */

questFinish :- lose(player,_enemy),!.
/* player kalah */

/*reward*/
reward :- questFinish, !.


