# Hiter zagon (copy-paste)

Ta postopek predpostavlja, da bos projekt imel v svojem GitHub repozitoriju.

## 1) Kopiranje workflow in skript v aktivni projekt
V repozitoriju ustvari strukturo:
- `.github/workflows/deploy-ec2.yml`
- `scripts/deploy_release.sh`
- `scripts/migrate_rds.sh`
- `scripts/healthcheck.sh`
- `scripts/rollback.sh`

Vsebino vzemi iz mape `VelkovMichel/ProjektnaNaloga/ci-cd-template`.

## 2) Nastavi GitHub Secrets
Nastavi naslednje:
- `EC2_HOST`
- `EC2_USER`
- `EC2_KEY`
- `APP_PATH`
- `RDS_HOST`
- `RDS_DB`
- `RDS_USER`
- `RDS_PASS`
- (opcijsko) `APP_URL`

## 3) Prvi commit za test
Naredi majhno spremembo v aplikaciji, nato:

```bash
git add .
git commit -m "Add CI/CD deploy with rollback"
git push origin main
```

## 4) Kaj preveris po prvem runu
- Workflow `deploy-ec2` je zelen.
- Na EC2 so release mape v `/var/www/releases`.
- Aplikacija je dosegljiva (`index.html`, `izpis.php`).
- V RDS je vnos v `schema_migrations`.

## 5) Test rollback scenarija
1. Namerno pokvari `izpis.php`.
2. Push na `main`.
3. Preveri, da health check pade.
4. Preveri, da se izvede `rollback.sh`.
5. Potrdi, da aplikacija spet deluje.

## 6) Kaj oddas profesorju
- Specifikacija (`00_PROJEKTNA_SPECIFIKACIJA.md`)
- Casovnica in checklista (`01_TIMELINE_IN_CHECKLISTA.md`)
- Demo scenarij (`02_DEMO_SCENARIJ.md`)
- Dokazi iz GitHub Actions + AWS (screenshoti)
