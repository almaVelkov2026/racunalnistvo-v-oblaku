# Projektna naloga: Avtomatski deploy aplikacije na AWS z rollback mehanizmom

Student: Velkov Michel  
Predmet: Racunalnistvo v oblaku  
Datum: 23.4.2026

## 1) Naslov projekta
Avtomatski deploy spletne aplikacije (EC2 + RDS) z varnim rollout/rollback postopkom preko GitHub Actions.

## 2) Kaj (opis projekta)
Projekt implementira CI/CD cevovod, ki ob spremembi kode samodejno:
- preveri aplikacijo,
- pripravi release paket,
- namesti novo verzijo na EC2,
- izvede migracijo baze na RDS,
- preveri zdravje aplikacije,
- po potrebi avtomatsko vrne prejsnjo delujoco verzijo.

Aplikacija ostane enostavna (PHP + Apache), fokus naloge pa je na avtomatizaciji, zanesljivosti in varnosti deploy procesa.

## 3) Zakaj (utemeljitev)
Projekt neposredno nadgradi znanje iz vaj 1-8:
- Vaja 6-7: aplikacija na EC2, osnovni deploy, DB integracija,
- Vaja 8: prehod na RDS in varnost z uporabo private subnet + security groups.

Dodatna vrednost projekta:
- zmanjsanje rocnega dela pri izdajah,
- hitrejsi in ponovljiv deployment,
- manjsa verjetnost izpada zaradi rollback mehanizma,
- realen DevOps primer, primerljiv s prakso v podjetjih.

## 4) Kako (tehnicni pristop)
### 4.1 Arhitektura
- GitHub repozitorij (source + workflow)
- GitHub Actions (CI/CD)
- EC2 (web app)
- RDS MySQL/MariaDB (managed baza)
- CloudWatch alarm za osnovni nadzor dosegljivosti

### 4.2 Tok deploya
1. Push na vejo `main` sprozi workflow.
2. CI korak preveri sintakso PHP datotek.
3. Ustvari se release artifact (`release.tar.gz`).
4. Artifact se prenese na EC2.
5. Na EC2 se ustvari nov release imenik (`/var/www/releases/<release_id>`).
6. Posodobi se povezava `current` in deploya vsebina v aktivno web mapo.
7. Izvede se DB migracija na RDS.
8. Health check (HTTP + app endpoint).
9. Ob napaki rollback na prejsnji release.

### 4.3 Varnost
- GitHub Secrets za vse obcutljive podatke (SSH key, DB gesla).
- RDS ostane nedostopen z interneta (`Public access = No`).
- Dostop na port 3306 dovoljen samo iz EC2 security group.
- Brez hardcode-anih gesel v repozitoriju.

## 5) Funkcionalne zahteve
Projekt mora omogocati:
- avtomatski deploy po push-u,
- avtomatsko migracijo baze,
- avtomatski health check,
- avtomatski rollback ob neuspesnem deployu,
- revizijsko sled (workflow logi + release mape).

## 6) Nefunkcionalne zahteve
Ciljne meritve:
- cas deploya <= 5 min,
- cas rollbacka <= 1 min,
- 100% ponovljivost na isti infrastrukturi,
- brez nedelujocih endpointov po uspelem deployu.

## 7) Obseg projekta
### Vkljuceno
- CI/CD pipeline (GitHub Actions)
- Deploy skripte na EC2
- DB migracijska skripta za RDS
- Rollback logika
- Dokumentacija + demonstracija

### Izkljuceno
- Kubernetes/EKS
- Blue/Green na vec instance nivoju
- Kompleksni load testi

## 8) Koncni artefakti za oddajo
- projektna dokumentacija,
- `.github/workflows/deploy-ec2.yml`,
- deploy/migrate/healthcheck/rollback skripte,
- dokazila (screenshoti):
  - uspesen deploy,
  - namerna napaka + avtomatski rollback,
  - zapis migracije baze,
  - delujoca aplikacija po deployu.

## 9) Merila uspesnosti
Projekt je uspesen, ce:
- se nova verzija samodejno deploya iz GitHub-a,
- se ob napaki verzija samodejno povrne,
- aplikacija po rollbacku ostane dosegljiva,
- je razvidna varna uporaba RDS in skrivnosti.

## 10) Kratek pitch za profesorja
"Naloga ni samo avtomatski upload datotek, ampak celoten kontroliran release proces: preverjanje, deployment, migracija baze, health check, rollback in varna konfiguracija preko AWS RDS ter GitHub Secrets."
