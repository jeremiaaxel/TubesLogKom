/* Axel */
/* Battle */

/* ****** dynamics ****** */
:-dynamic(isEnemyAlive/1).
:-dynamic(enemyInFight/8).
:-dynamic(turns/1).
:-dynamic(peluang/1).
:-dynamic(isRun/1).
:-dynamic(fighting/1).
/* ****** Fakta ****** */
isEnemyAlive(0).
isEnemyAlive(1).

/* ****** Rules ****** */
winX :- (enemyInFight(_,_,_,slime,_,_,_,_)).
winY :- (enemyInFight(_,_,_,goblin,_,_,_,_)).
winZ :- (enemyInFight(_,_,_,wolf,_,_,_,_)).

winQuest1 :- ((winX, quest1(X,Y,Z),X =\= 0, XNew is X-1, retract(quest1(X,Y,Z)),asserta(quest1(XNew,Y,Z)));
(winY, quest1(X,Y,Z),Y =\=0, YNew is Y-1, retract(quest1(X,Y,Z)),asserta(quest1(X,YNew,Z)));
(winZ, quest1(X,Y,Z),Z =\=0, ZNew is Z-1, retract(quest1(X,Y,Z)),asserta(quest1(X,Y,ZNew)))).
winQuest1 :- ((winX, quest1(X,Y,Z),X =:= 0);
(winY, quest1(X,Y,Z),Y =:=0);
(winZ, quest1(X,Y,Z),Z =:=0)).

winQuest2 :- ((winX, quest2(X,Y,Z),X =\= 0, XNew is X-1, retract(quest2(X,Y,Z)),asserta(quest2(XNew,Y,Z)));
(winY, quest2(X,Y,Z),Y =\= 0, YNew is Y-1, retract(quest2(X,Y,Z)),asserta(quest2(X,YNew,Z)));
(winZ, quest2(X,Y,Z),Z =\=0, ZNew is Z-1, retract(quest2(X,Y,Z)),asserta(quest2(X,Y,ZNew)))).
winQuest2 :- ((winX, quest2(X,Y,Z),X =:= 0);
(winY, quest2(X,Y,Z),Y =:=0);
(winZ, quest2(X,Y,Z),Z =:=0)).

winQuest3 :- ((winX, quest3(X,Y,Z),X =\= 0, XNew is X-1, retract(quest3(X,Y,Z)),asserta(quest3(XNew,Y,Z)));
(winY, quest3(X,Y,Z),Y =\= 0, YNew is Y-1, retract(quest3(X,Y,Z)),asserta(quest3(X,YNew,Z)));
(winZ, quest3(X,Y,Z),Z =\= 0, ZNew is Z-1, retract(quest3(X,Y,Z)),asserta(quest3(X,Y,ZNew)))).
winQuest3 :- ((winX, quest3(X,Y,Z),X =:= 0);
(winY, quest3(X,Y,Z),Y =:=0);
(winZ, quest3(X,Y,Z),Z =:=0)).

isInQuest(1) :- quest1(X,Y,Z);quest2(X,Y,Z);quest3(X,Y,Z).
isInQuest(0) :- \+quest1(X,Y,Z),\+quest2(X,Y,Z),\+quest3(X,Y,Z).

isQuestFinish :- expGoldQuest1;expGoldQuest2;expGoldQuest3.

showEnemy :-
    nl,
    fighting(1),
    enemyInFight(_, Name, Level, Type, MaxHP, HP, DP, AP),
    write(Name), nl,
    write('Level : '), write(Level), nl,
    write('Type  : '), write(Type), nl,
    write('HP    : '), write(HP), write('/'), write(MaxHP), nl,
    write('DP    : '), write(DP), nl,
    write('AP    : '), write(AP), nl,
    showBattleCommands,
    !.

showBattleCommands :-
    nl,
    write('Battle commands :'), nl,
    write('     attack        : deal basic attack'), nl,
    write('     specialAttack : deal stronger attack'), nl,
    write('     usePotion     : consume 1 healing potion'), nl,
    write('     run           : try to run away'), nl,
    !.

/* **** found enemy **** */
/* Bertemu dengan musuh yang levelnya sama dengan character */
/* 1 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 1,
    random(1, 4, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 2 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 2,
    random(1, 7, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 3 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 3,
    random(4, 10, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 4 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 4,
    random(7, 13, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 5 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 5,
    random(10, 16, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 6 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 6,
    random(13, 19, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 7 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 7,
    random(16, 22, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 8 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 8,
    random(19, 25, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 9 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 9,
    random(22, 28, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 10 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 10,
    random(25, 31, ID),
    enemy(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* *** Bosses *** */
/* Bertemu boss yang sesuai level character */

/* 10 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 10,
    ID is 105,
    boss(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('So...'),retract(fighting(_)),asserta(fighting(1)),
    write('...'), nl,
    sleep(0.5),
    write('You\'ve been looking for me'), nl,
    sleep(0.5),
    write('Well... here I am...'), nl,
    showEnemy, enemyTurn, !.

foundBossFinale :-
    sleep(0.5),
    write('ID : 27112020'), nl,
    ID is 27112020,
    boss(ID, Name, Type, Level, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(peluang(0)),
    asserta(turns(0)),
    write('HELLO MY GRANDCHILD!'),retract(fighting(_)),asserta(fighting(1)), sleep(2),
    showEnemy, !.

finishFight :-
    retract(enemyInFight(_,_,_,_,_,_,_,_)),
    retract(fighting(_)),
    asserta(fighting(0)),
    retract(peluang(_)),
    retract(turns(_)),
    retract(isEnemyAlive(_)),
    !.

/* **** Commentary **** */
attackComment :-
    enemyInFight(_, EnemyName, _, _, EnemyMaxHP, EnemyHP, _, _),
    EnemyHP > 0,
    write('Enemy health '), write(EnemyName), write(' : '), write(EnemyHP), write('/'), write(EnemyMaxHP), nl,
    write('Enemy turn!'), nl,
    write('...'), nl,
    sleep(1),
    enemyTurn, !.

attackComment :-
    (enemyInFight(_, EnemyName, _, slime, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, goblin, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, wolf, EnemyMaxHP, EnemyHP, _, _)),
    EnemyHP =< 0,
    write(EnemyName), write(' health '), write(' : '), write('0/'), write(EnemyMaxHP), nl,
    write('You win '), nl,
    write('...'), nl,
    isInQuest(1),winQuest1,isQuestFinish,
    finishFight,
    sleep(1), !.

attackComment :-
    (enemyInFight(_, EnemyName, _, slime, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, goblin, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, wolf, EnemyMaxHP, EnemyHP, _, _)),
    EnemyHP =< 0,
    isInQuest(1),winQuest2,isQuestFinish,
    finishFight,
    sleep(1), !.

attackComment :-
    (enemyInFight(_, EnemyName, _, slime, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, goblin, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, wolf, EnemyMaxHP, EnemyHP, _, _)),
    EnemyHP =< 0,
    isInQuest(1),winQuest3,isQuestFinish,
    finishFight,
    sleep(1), !.

attackComment :-
    (enemyInFight(_, EnemyName, _, slime, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, goblin, EnemyMaxHP, EnemyHP, _, _);
    enemyInFight(_, EnemyName, _, wolf, EnemyMaxHP, EnemyHP, _, _)),
    EnemyHP =< 0,
    isInQuest(0),
    expUp,
    finishFight,
    sleep(1), !.

attackComment :-
    enemyInFight(ID, EnemyName, _, _, EnemyMaxHP, EnemyHP, _, _),
    ID == 27112020,
    EnemyHP =< 0,
    write(EnemyName), write(' health '), write(' : '), write('0/'), write(EnemyMaxHP), nl,
    write('You win '), nl,
    write('...'), nl,
    sleep(0.5),
    write('naruhodo...'), nl,
    sleep(0.5),
    write('I\'m '), sleep(0.3), write('really '), sleep(0.3), write('proud of you.'),
    expUp,
    goal,
    write('tes'), nl,
    finishFight,
    sleep(1), !.

attackComment :-
    enemyInFight(ID, EnemyName, _, _, EnemyMaxHP, EnemyHP, _, _),
    ID == 105,
    EnemyHP =< 0,
    write(EnemyName), write(' health '), write(' : '), write('0/'), write(EnemyMaxHP), nl,
    write('You win '), nl,
    write('...'), nl,
    write('I see..'), nl,
    sleep(0.5),
    write('you\'ve grown strong'), nl,
    sleep(0.5),
    write('But...'), nl,
    sleep(0.5),
    write('. . .'), nl,
    sleep(0.5),
    write('I\'m proud of you...'), sleep(1), write(' my grandchild.'), nl, !, sleep(1),
    finishFight,
    foundBossFinale.

isLevelUp :-
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    Exp < Level*100,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, Level, MaxHP, HP, DP, AP, Exp)), !.

isLevelUp :-
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    Exp >= Level*100,
    Exp2 is 0,
    Level2 is Level + 1,
    MaxHP2 is MaxHP + 21,
    HP2 is MaxHP2,
    AP2 is AP + 20,
    DP2 is DP + 15,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, Level2, MaxHP2, HP2, DP2, AP2, Exp2)),sleep(1),
    write('-----------------------------------------------------------'),nl,
    write('           _                   _   _   _       _ '),nl,
    write('          | |    _____   _____| | | | | |_ __ | |'),nl,
    write('          | |   / _ \\ \\ / / _ \\ | | | | | \'_ \\| |'),nl,
    write('          | |__|  __/\\ V /  __/ | | |_| | |_) |_|'),nl,
    write('          |_____\\___| \\_/ \\___|_|  \\___/| .__/(_)'),nl,
    write('                                        |_|      '),nl,
    write('                    Now you\'re level '),write(Level2),write('.'), nl,
    write('-----------------------------------------------------------').

expUp :-
    character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),
    enemyInFight(_, _, EnemyLevel, _, _, _, _, _),
    Exp2 is Exp + EnemyLevel*10,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    isLevelUp,
    !.


enemyAttComment :-
    character(CharName, _, _, _, CharHP, _, _, _),
    CharHP > 0,
    write('Char health '), write(CharName), write(' : '), write(CharHP), nl,
    sleep(1),
    charTurn, !.

enemyAttComment :-
    character(_, _, _, _, CharHP, _, _, _),
    CharHP =< 0,
    sleep(1),
    lose,
    !.

/* **** Attack **** */
charTurn :-
    write('Your turn!'), nl,
    write('...'), nl,
    showBattleCommands,
    !.

attack :-
    \+ fighting(_),
    write('You are not in a battle'), !.

attack :-
    fighting(_),
    character(CharName, _, _, _, _, _, CharAttack, _), !,
    enemyInFight(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemyInFight(_, _, _, _, _, _, _, _)),
    CharAtt is round(CharAttack*(100/(100+EnemyDP))),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' attacks and deals '), write(CharAtt), write(' damage.'), nl,
    turns(Turn),
    Turn2 is Turn+1,
    retract(turns(_)),
    asserta(turns(Turn2)),
    peluang(Prob),
    Prob2 is Prob+1,
    retract(peluang(_)),
    asserta(peluang(Prob2)),
    attackComment, !.

/* **** Special Attack **** */
/* ** Special Attack unavailable ** */
/* banyak turns < 3 */
specialAttack :-
    turns(X),
    X < 3,
    NeedTurns is 3 - X,
    write('Special Attack is unavailable, '), write(NeedTurns), write(' turns more.'), nl,
    /* gagal special attack, player turn lagi */
    !.

/* ** Special Attack available ** */
/* banyak turns >= 3, turns diset ke 0 */
specialAttack :-
    fighting(1),
    turns(X),
    X >= 3,
    retract(turns(_)),
    asserta(turns(0)),
    character(CharName, _, _, _, _, _, CharAttack, _), !,
    enemyInFight(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemyInFight(_, _, _, _, _, _, _, _)),
    CharAtt is round(2*CharAttack*(100/(100+EnemyDP))),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' uses special attacks and deals '), write(CharAtt), write(' damage.'), nl,
    peluang(Prob),
    Prob2 is Prob+1,
    retract(peluang(_)),
    asserta(peluang(Prob2)),
    attackComment, !.

/* ** Enemy Turn ** */
enemyTurn :-
    enemyInFight(_, EnemyName, _, _, _, _, _, EnemyAP),
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    retract(character(_, _, _, _, _, _, _, _)),
    EnemyDmg is round(EnemyAP*(100/(100+DP))),
    NewCharHP is (HP - EnemyDmg),
    asserta(character(Name, Job, Level, MaxHP, NewCharHP, DP, AP, Exp)),
    write(EnemyName), write(' attacks and deals '), write(EnemyDmg), write(' damage.'), nl,
    enemyAttComment, !.

enemyTurn :-
    enemyInFight(ID, EnemyName, _, _, _, _, _, EnemyAP),
    ID == 105,
    random(1, 6, X),
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    retract(character(_, _, _, _, _, _, _, _)),
    EnemyDmg is round(X*EnemyAP*(100/(100+DP))),
    NewCharHP is (HP - EnemyDmg),
    asserta(character(Name, Job, Level, MaxHP, NewCharHP, DP, AP, Exp)),
    write(EnemyName), write(' attacks and deals '), write(EnemyDmg), write(' damage.'), nl,
    enemyAttComment, !.

/* **** Run **** */
/* Bisa run kalau peluang >= 5 */
/* Berhasil Run */
run :-
    \+ init(_),
    write('Please start the game'), !.

run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P >= 5,
    finishFight,
    write('You just successfully ran away!'),
    !.

/* Gagal Run */
run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P < 5,
    write('You failed to run !'),
    !.

/* **** Use Potion **** */
/* Use potion normal */
usePotion :-
    usePot(Heal),
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    retract(character(_, _, _, _, _, _, _, _)),
    (
        HP+Heal>MaxHP -> NewCharHP is MaxHP;
        NewCharHP is HP+Heal

    ),
    write(Name), write(' just used a potion, heals to '), write(NewCharHP),nl,
    asserta(character(Name, Job, Level, MaxHP, NewCharHP, DP, AP, Exp)),
    enemyTurn,
    !.

usePotion.
