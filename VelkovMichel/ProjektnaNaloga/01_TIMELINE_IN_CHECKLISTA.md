# Casovni plan in checklista

## 1) Casovni plan (4 tedni)
### Teden 1: Priprava in osnova
- Uredi repozitorij in branch strategijo (`main`, `dev`).
- Pripravi osnovni GitHub Actions workflow (lint + package).
- Na EC2 pripravi release strukturo (`releases`, `current`).

Rezultat:
- pipeline tece,
- artifact se uspesno pripravi.

### Teden 2: Deploy in health check
- Implementiraj deploy skripto za EC2.
- Dodaj health check po deployu (`index.html`, `izpis.php`).
- V workflow dodaj fail condition ob neuspesnem checku.

Rezultat:
- uspesen avtomatski deploy,
- fail deployment zaznan.

### Teden 3: RDS migracija in rollback
- Dodaj migracijsko skripto za RDS (idempotentno).
- Implementiraj rollback skripto.
- Povezi rollback v workflow ob napaki.

Rezultat:
- ob napaki se izvede samodejni povratek.

### Teden 4: Utrjevanje, meritve, dokumentacija
- Izmeri cas deploya in rollbacka.
- Dodaj CloudWatch alarm (osnovni monitoring).
- Pripravi koncno porocilo in screenshot dokazila.

Rezultat:
- projekt pripravljen za demonstracijo in oddajo.

## 2) Checklista izvedbe
- [ ] GitHub repo urejen
- [ ] Secrets nastavljeni
- [ ] Workflow uspesno stece
- [ ] Deploy na EC2 deluje
- [ ] Migracija na RDS deluje
- [ ] Health check deluje
- [ ] Rollback deluje
- [ ] CloudWatch alarm dodan
- [ ] Dokumentacija dopolnjena
- [ ] Vsi obvezni screenshoti narejeni

## 3) Checklista oddaje
- [ ] Projektna specifikacija (kaj/zakaj/kako)
- [ ] Diagram arhitekture
- [ ] YAML workflow datoteka
- [ ] Bash skripte za deploy/migrate/rollback
- [ ] Dokaz uspelega deploya
- [ ] Dokaz namerne napake + rollback
- [ ] Dokaz migracije baze na RDS
- [ ] Dokaz delovanja aplikacije po rollbacku
- [ ] Kratek video ali live demo scenarij

## 4) Kaj reci pri predstavitvi (30-60 sekund)
"Cilj je bil postaviti produkcijsko bolj podoben release proces na AWS. Push na main sprozi avtomatski deploy na EC2, izvede migracijo na RDS, preveri aplikacijo in po potrebi vrne prejsnjo verzijo. S tem sem pokazal avtomatizacijo, zanesljivost in varnost, ne samo rocnega deploya."
