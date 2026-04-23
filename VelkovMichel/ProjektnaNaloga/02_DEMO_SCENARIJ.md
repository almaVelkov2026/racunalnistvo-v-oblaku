# Demo scenarij za predstavitev

## 1) Predpogoji
- Delujoca EC2 web instanca (Apache/PHP)
- Delujoc RDS (MySQL/MariaDB)
- Nastavljeni GitHub Secrets
- Projekt push-an v GitHub

## 2) Scenarij A: uspesen deploy
1. Prikazi trenutno verzijo aplikacije.
2. Spremeni manjso stvar (npr. naslov strani).
3. Commit + push na `main`.
4. V GitHub Actions prikazi korake:
   - test,
   - package,
   - deploy,
   - migrate,
   - health check.
5. Osvezi stran na EC2 in potrdi novo verzijo.

Kaj dokazujes:
- avtomatski in ponovljiv deployment.

## 3) Scenarij B: napaka in rollback
1. Naredi namensko napako (npr. pokvari `izpis.php`).
2. Commit + push na `main`.
3. Prikazi, da health check pade.
4. Prikazi, da se sprozi rollback korak.
5. Potrdi, da aplikacija po rollbacku ponovno deluje.

Kaj dokazujes:
- odpornost na napake,
- varna vrnitev na stabilno verzijo.

## 4) Scenarij C: migracija baze
1. Dodaj enostavno migracijo (npr. nov stolpec).
2. Push na `main`.
3. Prikazi log migracije in rezultat v RDS.

Kaj dokazujes:
- kontrolirano upravljanje sheme baze v release procesu.

## 5) Dokazi, ki jih shranis
- Workflow run uspesen
- Workflow run neuspesen + rollback
- EC2 aplikacija pred/po deploy
- RDS tabela pred/po migraciji
- CloudWatch alarm ali metric screenshot

## 6) Pogosta vprasanja profesorja in hitri odgovori
Q: Zakaj je to vec kot navaden deploy?  
A: Ker vsebuje tudi preverjanje, migracijo baze, health check in rollback.

Q: Zakaj je varno?  
A: Ker so skrivnosti v GitHub Secrets, RDS ni javen, dostop je omejen z SG pravili.

Q: Kaj je glavna korist?  
A: Manj rocnega dela, hitrejsi release in manj izpadov ob napakah.
