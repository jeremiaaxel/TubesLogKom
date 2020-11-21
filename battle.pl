/* Battle */
dynamic(isEnemyAlive/1).

/* Fakta */
isEnemyAlive(0).
isEnemyAlive(1).

isCharAlive(0).
isCharAlive(1).

/* Rules */
foundEnemy :-
    enemy(Name, Level, Type, HP, DP, AP),
    /* \+ enemy_type(boss) */
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    write('You just found an enemy!').

foundBoss :-
    enemy(Name, Level, Type, HP, DP, AP),
    /* enemy_type(boss) */
    asserta(isEnemyAlive(1)),
    asserta(isCharAlive(1)),
    write('Congratulations, you just found a BOSS enemy!').

/* Fight */
fight :-
    \+ isEnemyAlive(_),
    write('No enemy').

/* Commentary */
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
    asserta(isCharAlive(0)),
    write('You dead'), nl.
    sleep(1),
    / * ke fail state */

/* Attack */
charTurn :-
    write('Your turn!'), nl,
    write('...'), nl,
    attack.

/* Player turn but enemy is dead */
charTurn :-
    isEnemyAlive(0),
    write('You win!'), nl,
    write('...'), nl.

attack :-
    character(_, CharName, _, _, _, _, CharAttack, _, _),
    enemy(EnemyName, EnemyLevel, EnemyType, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP),
    retract(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, EnemyHP, EnemyDP, EnemyAP)),
    CharAtt is (Attack),
    NewEnemyHP is (EnemyHP-CharAtt),
    asserta(enemy(EnemyName, EnemyType, EnemyLevel, EnemyMaxHP, NewEnemyHP,EnemyDP,EnemyAP)),
    write(CharName), write(' attacks and deals '), write(CharAtt), write(' damage.'), nl,
    attackComment, !.


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