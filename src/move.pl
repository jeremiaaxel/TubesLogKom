/* Exploration Mechanism */
/* Facts */
place(boss).
place(quest).
place(store).
place(field).
place(fence).
location(x).
location(y).
w(place,locationX,locationY).
a(place,locationX,locationY).
s(place,locationX,locationY).
d(place,locationX,locationY).

/* Rules */
w :- w(place,locationX,locationY),\+place(fence).
/*pemain berpindah 1 tile ke atas*/

a :- a(place,locationX,locationY),\+place(fence).
/*pemain berpindah 1 tile ke kiri*/

s :- s(place,locationX,locationY),\+place(fence).
/*pemain berpindah 1 tile ke bawah*/

d :- d(place,locationX,locationY),\+place(fence).
/*pemain berpindah 1 tile ke kanan*/

fence :- place(fence),write('You hit a fence. I began to lose trust in you, mortal.'),!.
/*pemain mengenai pagar*/

/*lokasi unik*/
bossLoc :- place(boss).
/*pemain berada di tile boss*/

questLoc :- place(quest).
/*pemain berada di tile quest*/

storeLoc :- place(store).
/*pemain berada di tile store*/

