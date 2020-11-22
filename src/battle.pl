/* Axel */
/* Battle */

/* ****** dynamics ****** */
dynamic(isEnemyAlive/1).
dynamic(enemyInFight/8).
dynamic(isCharAlive/1).
dynamic(turns/1).
dynamic(peluang/1).

/* ****** Fakta ****** */
isEnemyAlive(0).
isEnemyAlive(1).

isCharAlive(0).
isCharAlive(1).

/* ****** Rules ****** */
/* **** found enemy **** */
/* Bertemu dengan musuh yang levelnya sama dengan character */
/* 1 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 1,
    random(11, 13, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 2 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 2,
    random(21, 23, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 3 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 3,
    random(31, 33, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 4 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 4,
    random(41, 43, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 5 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 5,
    random(51, 53, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 6 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 6,
    random(61, 63, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 7 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 7,
    random(71, 73, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 8 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 8,
    random(81, 83, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 9 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 9,
    random(91, 93, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* 10 */
foundEnemy :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 10,
    random(101, 103, ID),
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

/* *** Bosses *** */
/* Bertemu boss yang sesuai level character */
/* 3 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 3,
    ID is 34,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

/* 5 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 5,
    ID is 54,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

/* 7 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 7,
    ID is 74,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

/* 9 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 9,
    ID is 94,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

/* 10 */
foundBoss :-
    character(_, _, CharLevel, _, _, _, _),
    CharLevel == 10,
    ID is 104,
    enemy(ID, Name, Level, Type, HP, DP, AP),
    MaxHP is HP,
    asserta(enemyInFight(ID, Name, Level, Type, MaxHP, HP, DP, AP)),
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 6, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

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
    sleep(1), !.
    /* lanjut ke ? */

enemyAttComment :-
    character(CharName, _, _, CharHP, _, _),
    CharHP > 0,
    write('Char health '), write(CharName), write(' : '), write(CharHP), nl,
    sleep(1),
    charTurn, !.

enemyAttComment :-
    character(_, _, _, CharHP, _, _),
    CharHP =< 0,
    retract(isCharAlive(1)),
    asserta(isCharAlive(0)),
    write('You dead'), nl.
    sleep(1),
    /* ke fail state */
    !.

/* **** Attack **** */
charTurn :-
    write('Your turn!'), nl,
    write('...'), nl,
    attack.

attack :-
    character(_, CharName, _, _, _, _, CharAttack, _, _),
    enemy(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (CharAttack),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' attacks and deals '), write(CharAtt), write(' damage.'), nl,
    asserta(turns(_+1)),
    asserta(peluang(_+1)),
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
    character(_, CharName, _, _, _, _, CharAttack, _, _),
    enemy(ID, EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (CharAttack * 2), 
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemyInFight(ID, EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' uses special attack and deals '), write(CharAtt), write(' damage.'), nl,
    retract(peluang(_)),
    asserta(peluang(_+1)),
    attackComment, !.

/* ** Enemy Turn ** */
enemyTurn :-
    enemyInFight(_, EnemyName, _, _, _, _, _, EnemyAP),
    character(_, _, _, _, CharHP, CharDP, _),
    retract(character(_, _, _, _, CharHP, CharDP, _)),
    EnemyDmg is (EnemyAP),
    NewCharHP is (CharHP-EnemyDmg),
    asserta(character(_, _, _, _, _, NewCharHP, CharDP, _)),
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
usePot :-
    character(CharName, _, _, _, CharHP, _, _),
    retract(character(CharName, _, _, CharMaxHP, CharHP, _, _)),
    potion(PotType, PotionHeal),
    PotType == 'Healing',
    CharHP + PotionHeal =< CharMaxHP,
    NewCharHP is CharHP + PotionHeal,
    asserta(character(CharName, _, _, _, NewCharHP, _, _)),
    write(CharName), write(' just used a potion, heals '), write(PotionHeal),
    enemyTurn,
    !. 

/* Use potion lebih dari MaxHP */
usePot :-
    character(CharName, _, _, _, CharHP, _, _),
    retract(character(CharName, _, _, CharMaxHP, CharHP, _, _)),
    potion(PotType, PotionHeal),
    PotType == 'Healing',
    CharHP + PotionHeal >= CharMaxHP,
    NewCharHP is CharMaxHP,
    asserta(character(CharName, _, _, _, NewCharHP, _, _)),
    write(CharName), write(' just used a potion, heals '), write(CharMaxHP - PotionHeal),
    enemyTurn,
    !. 