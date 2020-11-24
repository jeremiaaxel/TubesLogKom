/* Axel */
/* Battle */

/* ****** dynamics ****** */
:-dynamic(isEnemyAlive/1).
:-dynamic(enemyInFight/8).
:-dynamic(turns/1).
:-dynamic(peluang/1).
:-dynamic(fighting/1).
/* ****** Fakta ****** */
isEnemyAlive(0).
isEnemyAlive(1).

/* ****** Rules ****** */
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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('You just found an enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(0)),asserta(fighting(1)).

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
    write('Congratulations, you just found a BOSS enemy!'),retract(fighting(0)),asserta(fighting(1)).

/* **** Commentary **** */
attComment :-
    enemyInFight(_, EnemyName, _, _, _, EnemyHP, _, _),
    EnemyHP > 0,
    write('Enemy health '), write(EnemyName), write(' : '), write(EnemyHP), nl,
    write('Enemy turn!'), nl,
    write('...'), nl,
    sleep(1),
    enemyTurn, !.

attComment :-
    enemyInFight(_, _, _, _, EnemyHP, _, _),
    EnemyHP =< 0,
    retract(isEnemyAlive(1)),
    asserta(isEnemyAlive(0)),
    write('You win '), nl,
    write('...'), nl,
    expUp,
    sleep(1), !.
    /* lanjut ke ? */

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
    write('You dead'), nl,
    sleep(1),
    !,
    lose.

/* **** Attack **** */
charTurn :-
    write('Your turn!'), nl,
    write('...'), nl,
    attack.

attack :-
    character(_, CharName, _, _, _, _, CharAttack, _),
    enemy(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (CharAttack*(100/100+EnemyDP)),
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
    write('Special Attack is unavailable, '), write(3 - X), write(' turns more.'), nl,
    /* gagal special attack, player turn lagi */
    !.

/* ** Special Attack available ** */
/* banyak turns >= 3, turns diset ke 0 */
specialAttack :-
    turns(X),
    X >= 3,
    retract(turns(_)),
    asserta(turns(0)),
    character(_, CharName, _, _, _, _, CharAttack, _),
    enemy(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (CharAttack * 2 * (100/100+EnemyDP)),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' uses special attack and deals '), write(CharAtt), write(' damage.'), nl,
    peluang(Prob),
    retract(peluang(_)),
    Prob2 is Prob+1,
    retract(peluang(_)),
    asserta(peluang(Prob2)),
    attackComment, !.

/* ** Enemy Turn ** */
enemyTurn :-
    enemyInFight(_, EnemyName, _, _, _, _, _, EnemyAP),
    character(Name, Job, Level, MaxHP, HP, DP, AP, Exp),
    retract(character(_, _, _, _, _, CharDP, _, _)),
    EnemyDmg is (EnemyAP*(100/100+CharDP)),
    NewCharHP is (HP - EnemyDmg),
    asserta(character(Name, Job, Level, MaxHP, NewCharHP, DP, AP, Exp)),
    write(EnemyName), write(' attacks and deals '), write(EnemyDmg), write(' damage.'), nl,
    enemyAttackComment, !.


/* **** Run **** */
/* Bisa run kalau peluang >= 5 */
/* Berhasil Run */
run :-
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P >= 5,
    write('You just successfully ran away!'),
    retract(peluang(P)),
    retract(isEnemyAlive(_)),
    retract(enemyInFight(_, _, _, _, _, _, _)),
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

