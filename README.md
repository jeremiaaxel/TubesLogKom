# Tugas Besar Logika Komputasional IF2121
> Survival RPG menggunakan GNU Prolog

## Anggota Kelompok 07 Kelas 04
| NIM | Nama |
|---|---|
| 13519116 | Jeane Mikha Erwansyah |
| 13519120 | Epata Tuah |
| 13519144 | Jonathan Christhoper Jahja |
| 13519188 | Jeremia Axel Bachtera |

## Cara Menjalankan
1. Download GNU Prolog dari situs [gprolog](http://www.gprolog.org/) dan install
2. Buka program GNU Prolog
3. Pilih menu File
4. Pilih consult
5. Cari direktori file main.pl
6. Open main.pl tersebut
7. Jika sudah selesai compiling, ketik `start.` untuk memulai permainan
8. Selamat bermain!

## Command yang tersedia
1.  start    : memulai permainan
2.  map      : menunjukkan peta
3.  status   : memperlihatkan status pemain
4.  moving commands:
    - w : bergerak satu langkah ke utara
    - a : bergerak satu langkah ke barat
    - s : bergerak satu langkah ke selatan
    - d : bergerak satu langkah ke timur
5.  shop     : membuka menu shop
6.  inventory: membuka inventori pemain
7.  battle commands:
    - attack        : menyerang musuh
    - specialAttack : menyerang musuh dengan special power
    - usePotion     : menggunakan health potion untuk menaikkan HP pemain
    - run           : lari dari pertarungan
8.  teleport : teleport ke stasiun lain
9.  quest    : menunjukkan status quest yang sedang berlangsung
10. help     : menunjukkan petunjuk semua command dan legenda
11. quit     : keluar dari permainan

## Cheat
`retract(character(_,_,_,_,_,_,_,_)).`
`asserta(character(kami,kami,10,9999,9999,999999,9999,0)).`
