/* Enemy */

/* Fakta */
dynamic(current_hp/1)

enemy_type(slime).
enemy_type(goblin).
enemy_type(wolf).
enemy_type(boss).

enemy_hp(slime, 8000).
enemy_hp(goblin, 6000).
enemy_hp(wolf, 5000).
enemy_hp(boss, 20000).

enemy_def(slime, 8000).
enemy_def(goblin, 6000).
enemy_def(wolf, 5000).
enemy_def(boss, 10000).

enemy_att(slime, 500).
enemy_att(goblin, 600).
enemy_att(wolf, 800).
enemy_att(wolf, 600).

/* Current HP */
/* current_hp([10]). */

/* Rules */
enemy(Name, Type, Level, MaxHP, HP, DP, AP) :-
    enemy_type(Type),
    enemy_hp(Type, Base_hp),
    enemy_def(Type, Base_def),
    enemy_att(Type, Base_att),
    MaxHP is Base_hp * Level,
    HP is Base_hp * Level,
    DP is Base_def * Level,
    AP is Base_att * Level,
    !.