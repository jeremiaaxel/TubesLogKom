/* Battle */

/* ****** dynamics ****** */
dynamic(isEnemyAlive/1).
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
foundEnemy :-
    enemy(Name, Level, Type, HP, DP, AP),
    /* \+ enemy_type(boss) */
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(1, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('You just found an enemy!').

foundBoss :-
    enemy(Name, Level, Type, HP, DP, AP),
    /* enemy_type(boss) */
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    random(4, 10, P),
    asserta(peluang(P)),
    asserta(turns(0)),
    write('Congratulations, you just found a BOSS enemy!').

/* **** Fight **** */
/* harusnya engga ada, auto lawan */
fight :-
    \+ isEnemyAlive(_),
    write('No enemy').

/* **** Commentary **** */
attComment :-
    enemy(EnemyName, _, _, EnemyHP, EnemyDP, EnemyAP),
    EnemyHP > 0,
    write('Enemy health '), write(EnemyName), write(' : '), write(EnemyHP), nl,
    write('Enemy turn!'), nl,
    write('...'), nl,
    sleep(1),
    enemyTurn, !.

attComment :-
    enemy(EnemyName, _, _, EnemyHP, EnemyDP, EnemyAP),
    EnemyHP =< 0,
    retract(isEnemyAlive(1)),
    asserta(isEnemyAlive(0)),
    write('You win '), nl,
    write('...'), nl,
    sleep(1),
    /* lanjut ke ? */

enemyAttComment :-
    character(CharName, _, _, CharHP, CharDP, CharAP),
    CharHP > 0,
    write('Char health '), write(CharName), write(' : '), write(CharHP), nl,
    sleep(1),
    charTurn, !.

enemyAttComment :-
    character(CharName, _, _, CharHP, CharDP, CharAP),
    CharHP =< 0,
    retract(isCharAlive(1)),
    asserta(isCharAlive(0)),
    write('You dead'), nl.
    sleep(1),
    / * ke fail state */

/* **** Attack **** */
charTurn :-
    write('Your turn!'), nl,
    write('...'), nl,
    attack.

attack :-
    character(_, CharName, _, _, _, _, CharAttack, _, _),
    enemy(EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (Attack),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
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
    write('Special Attack is unavailable '), write(3 - X), write(' turns more.'), nl, 
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
    enemy(EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (Attack * 2), 
    /* specialAttack 2 kali attack biasa (?) */
    
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' uses special attack and deals '), write(CharAtt), write(' damage.'), nl,
    retract(peluang(_)),
    asserta(peluang(_+1)),
    attackComment, !.

/* ** Enemy Turn ** */
enemyTurn :-
    write('Enemy turn!'), nl,
    write('...'),
    enemyAttack.

enemyAttack :-
    enemy(EnemyName, _, EnemyType, _, _, _, EnemyAP),
    character(CharName, CharType, CharLevel, CharMaxHP, _, _, _, CharAttack, _, _),
    retract(character(CharName, CharType, CharLevel, CharMaxHP, CharHP, CharDP, CharAP)),
    EnemyAtt is (EnemyAP),
    NewCharHP is (CharHP-EnemyAtt),
    asserta(character(CharName, CharType, CharLevel, CharMaxHP, NewCharHP, CharDP, CharAP)),
    write(EnemyName), write(' attacks and deals '), write(EnemyAP), write(' damage.'), nl,
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
    retract(enemy(_, _, _, _, _, _, _)),
    /* ke mana (?) */
    !.

/* Gagal Run */
run :- 
    \+ isRun(_),
    isEnemyAlive(_),
    peluang(P),
    P < 5,
    write('You failed to run !'),
    /* ke turn player lagi */
    ,!.