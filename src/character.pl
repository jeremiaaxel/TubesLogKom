:- dynamic(character/7).

/* Job: swordsman, archer, sorcerer */
/* character(Nama, Job, Level, MaxHP, HP, DP, AP) */
character(_, swordsman, _, 3000, 3000, 2000, 300).
character(_, archer, _, 3000, 3000, 1500, 400).
character(_, sorcerer, _, 2500, 2500, 1000, 450).

/* Attack */


/* Defense */


/* Equipment */


/* Starter Pack - dapet 5 heatlh potion */
/* Bisa naik level: status attack, defense, max hp naik */
/* level up: X xp, X growth rate */
/* Hanya dapat menggunakan equipment sesuai dengan job */


/*  */

/* Facts */
/* Rules */
defaultStat(Job,MaxHP,DP,AP) :-
    Job == swordsman,!,
    MaxHP = 3000, DP = 2000, AP = 300.
defaultStat(Job,MaxHP,DP,AP) :-
    Job == archer,!,
    MaxHP = 3000, DP = 1500, AP = 400.
defaultStat(Job,MaxHP,DP,AP) :-
    Job == sorcerer,!,
    MaxHP = 2500, DP = 1000, AP = 450.