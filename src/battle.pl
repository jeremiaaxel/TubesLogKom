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
showEnemy :-
    nl,
    fighting(1),
    enemyInFight(_, Name, Level, Type, MaxHP, HP, DP, AP),
    write(Name), nl,
    write('Level : '), write(Level), nl,
    write('Type : '), write(Type), nl,
    write('HP : '), write(HP), write('/'), write(MaxHP), nl,
    write('DP : '), write(DP), nl,
    write('AP : '), write(AP), nl,
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
    random(1, 3, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(1, 6, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(4, 9, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(7, 12, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(10, 15, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(13, 18, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(16, 21, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(19, 24, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(22, 27, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
    random(25, 30, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
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
/* 3 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 3,
    ID is 101,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 5 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 5,
    ID is 102,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 7 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 7,
    ID is 103,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 9 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 9,
    ID is 104,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(_)),asserta(fighting(1)),
    showEnemy, !.

/* 10 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _, _),
    CharLevel == 10,
    ID is 105,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(_)),asserta(fighting(1)),
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
    enemyInFight(_, EnemyName, _, _, EnemyMaxHP, EnemyHP, _, _),
    EnemyHP =< 0,
    write(EnemyName), write(' health '), write(' : '), write('0/'), write(EnemyMaxHP), nl,
    write('You win '), nl,
    write('...'), nl,
    expUp,
    finishFight,
    sleep(1), !.
    /* lanjut ke ? */

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
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, Level2, MaxHP, HP, DP, AP, Exp2)).

expUp :-
    character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp),
    enemyInFight(_, _, EnemyLevel, _, _, _, _, _),
    Exp2 is Exp + EnemyLevel*5,
    retract(character(_, _, _, _, _, _, _, _)),
    asserta(character(Name, Job, CharLevel, MaxHP, HP, DP, AP, Exp2)),
    isLevelUp,
    !.


enemyAttComment :-
    character(CharName, _, _, CharHP, _, _, _, _),
    CharHP > 0,
    write('Char health '), write(CharName), write(' : '), write(CharHP), nl,
    sleep(1),
    charTurn, !.

enemyAttComment :-
    character(_, _, _, CharHP, _, _, _, _),
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
    CharAtt is (CharAttack*(100/(100+EnemyDP))),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
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
    CharAtt is (2*CharAttack*(100/(100+EnemyDP))),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
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
    EnemyDmg is (EnemyAP*(100/(100+DP))),
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
    (HP + Heal < MaxHP, NewCharHP is HP + Heal;NewCharHP is MaxHP),
    write(Name), write(' just used a potion, heals to '), write(NewCharHP),
    asserta(character(Name, Job, Level, MaxHP, NewCharHP, DP, AP, Exp)),
    enemyTurn,
    !.

