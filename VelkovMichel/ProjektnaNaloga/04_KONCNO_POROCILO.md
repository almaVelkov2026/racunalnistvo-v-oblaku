# Praktični projekt: Avtomatski deploy spletne aplikacije na AWS

Student: Velkov Michel  
Predmet: Racunalnistvo v oblaku  
Datum: 28.4.2026

## 1) Opis projekta
Cilj projekta je bil postaviti avtomatski CI/CD proces za spletno aplikacijo na AWS. Rešitev uporablja GitHub Actions za avtomatski deploy, EC2 za poganjanje PHP aplikacije in RDS za podatkovno bazo. Glavna vrednost projekta je v tem, da se nova verzija kode ob pushu samodejno preveri, namesti, poveže z bazo, preveri z health checkom in po potrebi vrne na prejšnjo stabilno različico.

## 2) Cilji
- zmanjšati ročno delo pri izdaji nove verzije,
- zagotoviti ponovljiv deploy,
- ločiti aplikacijski strežnik in bazo,
- uporabiti managed bazo (RDS) namesto self-managed baze na EC2,
- dodati rollback mehanizem za napake pri deployu.

## 3) Izvedba
Najprej sem pripravil infrastrukturo za bazo na AWS RDS in preveril dostop med EC2 in RDS prek security groups. Nato sem pripravil GitHub Actions workflow, ki ob pushu ali ročnem zagonu izvede naslednje korake: test PHP datotek, priprava release arhiva, prenos na EC2, deploy na strežnik, migracija baze, health check in rollback ob napaki.

Za deploy sem uporabil tudi shell skripte, ki na EC2 ustvarijo release mapo, preklopijo aktivno verzijo in po potrebi obnovijo prejšnjo različico. Z migracijsko skripto sem v bazo dodal tabelo za spremljanje migracij in primer dodatnega stolpca. S tem je prikazan realen release proces, ne samo kopiranje datotek.

## 4) Rezultati
Projekt uspešno izvede avtomatski deploy iz GitHub-a na EC2 in poveže aplikacijo z RDS. Health check preveri osnovno delovanje spletnih strani, migracija baze pa se izvede v okviru deploy procesa. Ob napaki je predviden rollback na prejšnji release.

## 5) Varnost
Pri projektu sem uporabil GitHub Secrets za občutljive podatke, RDS je ostal nedostopen iz interneta, dostop do baze pa je omejen na security group aplikacijskega strežnika. To zmanjša napadalno površino in pokaže pravilnejši pristop k oblačni arhitekturi.

## 6) Zaključek
Projekt je pokazal, kako lahko tudi enostavna PHP aplikacija dobi produkcijsko bolj zrel deployment proces. Največja prednost je avtomatizacija, saj deployment ne zahteva ročnega kopiranja datotek, hkrati pa je v proces vključen tudi nadzor nad zdravjem aplikacije in možnost povratka na stabilno verzijo.

## 7) Slike, ki jih je treba prilepiti
Spodaj so natančno predlagane slike in mesto v poročilu:

### Slika 1: Arhitektura projekta
Vstavi po razdelku 1 ali 2.
Prikazati mora EC2, RDS, GitHub Actions in povezavo med njimi.

### Slika 2: GitHub Actions workflow
Vstavi v razdelek 3, takoj po opisu deploy korakov.
Prikazati mora uspešen run z jobi `test`, `package`, `deploy`.

### Slika 3: RDS nastavitev ali endpoint
Vstavi v razdelek 3 ali 5.
Prikazati mora, da je RDS ustvarjen in da je `Public access = No`.

### Slika 4: Deploy na EC2
Vstavi v razdelek 3 ali 4.
Prikazati mora, da je aplikacija po deployu dostopna na EC2.

### Slika 5: Health check / izpis podatkov iz baze
Vstavi v razdelek 4.
Prikazati mora delovanje `izpis.php` in podatke iz RDS.

### Slika 6: Rollback scenarij
Vstavi v razdelek 4 ali 6.
Prikazati mora neuspešen run in povratek na prejšnjo verzijo.

### Slika 7: CloudWatch ali monitoring dokazilo
Vstavi v razdelek 5, če ga uporabljaš.
Ni nujno, a je dober dodatek za prikaz nadzora.

## 8) Viri
- lastni zapiski iz vaj 6-8,
- AWS dokumentacija za EC2 in RDS,
- GitHub Actions dokumentacija,
- če uporabiš AI pri pisanju besedila, to omeni v virih.
