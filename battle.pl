/* Battle */
dynamic(isEnemyAlive/1).

/* Fakta */
isEnemyAlive(0).
isEnemyAlive(1).

/* Rules */
foundEnemy :-
    enemy(Name, Level, Type, HP, DP, AP),
    asserta(isEnemyAlive(1)),
    write('Selamat, Anda bertemu musuh').

/* Fight */
fight :-
    \+ isEnemyAlive(_),
    write('Ngelawan apa, Mas?').

/* Commentary */
attComment :-
    enemy(Name, _, _, EnemyHP, EnemyDP, EnemyAP),
    EnemyHP > 0,
    write('Health '), write(Name), write(' : '), write(EnemyHP), nl,
    write('Enemy turn!'), nl,
    write('...'), nl,
    sleep(1),
    enemyTurn,
    !.

/* Attack */
attack :-
    isEnemyAlive(_),
    character(_, MyName, _, _, _, _, MyElement, MyAttack, _, _),
    enemy(Name, Level, Type, HP, DP, AP),
    CharAtt is (Attack),
    NewEnemyHP is (EnemyHP-CharAtt),
    retract(enemyTokemon(EnemyName,EnemyType,EnemyMaxHealth,EnemyLevel,EnemyHealth,EnemyAttack,EnemyDefense)),
    asserta(enemyTokemon(EnemyName,EnemyType,EnemyMaxHealth,EnemyLevel,NewEnemyHealth,EnemyAttack,EnemyDefense)),
    write(MyName), write(' menggunakan attack! Dan itu super effective!'), nl,
    attackComment,!.