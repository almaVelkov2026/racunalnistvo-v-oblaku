# Natančen seznam slik in kam jih prilepiš

Spodaj je priporočeni nabor slik za praktični projekt. Če želiš ostati na varni strani, uporabi vseh 6 glavnih slik. Slike lahko shraniš npr. v mapo `VelkovMichel/ProjektnaNaloga/slike/` in jih potem vstaviš v poročilo.

## Glavne slike
### 1. `01-arhitektura.png`
Kam v poročilo: razdelek 2 ali 3, takoj po opisu projekta.
Kaj naj bo na sliki: diagram z GitHub Actions, EC2, RDS in puščicami za deploy/povezavo.

### 2. `02-github-actions-success.png`
Kam v poročilo: razdelek 3, po opisu pipeline-a.
Kaj naj bo na sliki: uspešen run v GitHub Actions z jobi `test`, `package`, `deploy`.

### 3. `03-rds-settings.png`
Kam v poročilo: razdelek 3 ali 5, pri opisu baze.
Kaj naj bo na sliki: RDS instance settings ali endpoint, predvsem da se vidi `Public access = No` in endpoint.

### 4. `04-ec2-deploy-success.png`
Kam v poročilo: razdelek 4, pri opisu deploya.
Kaj naj bo na sliki: browser z delujočo aplikacijo na EC2, npr. `index.html` ali domača stran aplikacije.

### 5. `05-db-healthcheck.png`
Kam v poročilo: razdelek 4, pri health checku in testu baze.
Kaj naj bo na sliki: `izpis.php` ali izpis vsebine iz RDS po vnosu podatkov.

### 6. `06-rollback.png`
Kam v poročilo: razdelek 4 ali 6, pri rollbacku.
Kaj naj bo na sliki: GitHub Actions run, kjer je razviden fail in rollback korak, ali pa pred/po stanje aplikacije.

## Dodatne slike, če želiš več dokazil
### 7. `07-cloudwatch.png`
Kam v poročilo: razdelek 5, pri varnosti in nadzoru.
Kaj naj bo na sliki: CloudWatch alarm ali metric screenshot.

### 8. `08-security-group.png`
Kam v poročilo: razdelek 5.
Kaj naj bo na sliki: inbound pravila security group za RDS ali EC2.

## Predlagan vrstni red v poročilu
1. Slika arhitekture.
2. Slika GitHub Actions workflowa.
3. Slika RDS nastavitve.
4. Slika uspešnega deploya na EC2.
5. Slika testiranega dostopa do baze.
6. Slika rollback scenarija.

## Predlagan vrstni red datotek v mapi `slike`
- `slike/01-arhitektura.png`
- `slike/02-github-actions-success.png`
- `slike/03-rds-settings.png`
- `slike/04-ec2-deploy-success.png`
- `slike/05-db-healthcheck.png`
- `slike/06-rollback.png`
- `slike/07-cloudwatch.png` (opcijsko)
- `slike/08-security-group.png` (opcijsko)

## Kratek nasvet za screenshotanje
- Uporabi enak zoom v brskalniku.
- Na slikah naj bo vidno ime repozitorija ali URL, če gre za GitHub Actions.
- Pri RDS naj bo viden endpoint ali nastavitev `Public access`.
- Pri aplikaciji naj bo vidna vsebina strani in ne samo prazno okno.
