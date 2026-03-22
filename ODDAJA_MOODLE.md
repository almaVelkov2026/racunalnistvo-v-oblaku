# Oddaja vaje - Racunalnistvo v oblaku

## Osnovni podatki
- Ime in priimek: Michel Velkov
- Datum: 2026-03-22
- Predmet: Racunalnistvo v oblaku
- Repozitorij: https://github.com/almaVelkov2026/racunalnistvo-v-oblaku.git

## Cilj vaje
Cilj je bil postaviti virtualni racunalnik z Debian Linux, namestiti spletni streznik Apache2, objaviti preprosto spletno stran, vzpostaviti prenos datotek prek SSH/SCP in uporabiti Nextcloud storitve (ustvarjanje uporabnika, prijava, upload, download).

## Izvedbeni plan
1. Preverba VM in omrezja.
2. Namestitev Apache2 in SSH storitev.
3. Izdelava spletne strani z osebnimi podatki in fotografijo.
4. Prenos datotek na VM in objava v /var/www/html.
5. Preverba delovanja strani v brskalniku.
6. Namestitev in test Nextcloud.
7. Dokumentiranje dokazov in priprava oddaje.

## Izvedba po korakih

### 1) VM in omrezje
- Prijava v Debian terminal kot uporabnik michel.
- Preverba IP naslova z ukazom ip a.
- Ugotovljen VM IP: 192.168.0.167

Dokaz: vstavi sliko 02-prijava-debian.png in 03-ip-a.png

### 2) Namestitev Apache2 in SSH
- Posodobitev paketov: su -c "apt update"
- Namestitev Apache2: su -c "apt install -y apache2"
- Namestitev SSH streznika (ce je potrebno): su -c "apt install -y openssh-server"
- Preverba: su -c "systemctl status apache2"
- Omogocen samodejni zagon: su -c "systemctl enable apache2"

Dokaz: vstavi sliko 04-apache-status.png

### 3) Izdelava spletne strani
- Ustvarjena preprosta stran z vsebino:
  - ime in priimek: Michel Velkov
  - fotografija
  - crno ozadje, bel tekst

Dokaz: vstavi sliko urednika datoteke ali terminal izpisa vsebine.

### 4) Prenos datotek in objava
- Datoteke se prenesejo prek SCP v /home/michel.
- Nato se skopirajo v /var/www/html.

Primer ukazov:
- scp -r "/pot/do/splet" michel@192.168.0.167:/home/michel/
- su -c "cp -r /home/michel/splet/* /var/www/html/"

Dokaz: vstavi sliko 05-scp-prenos.png in 06-var-www-html.png

### 5) Preverba strani v brskalniku
- V brskalnik vpisan naslov: http://192.168.0.167/
- Stran se pravilno nalozi.

Dokaz: vstavi sliko 07-brskalnik-stran.png

### 6) Nextcloud (obvezno)
- Namestitev Nextcloud prek snap:
  - su -c "apt install -y snapd"
  - su -c "snap install core"
  - su -c "snap install nextcloud"
- Zaradi Apache na portu 80 je Nextcloud nastavljen na alternativni port:
  - su -c "snap set nextcloud ports.http=8080 ports.https=8443"
- Dostop za zacetno nastavitev v brskalniku:
  - http://192.168.0.167:8080
- Ustvarjen uporabnik za sebe in za kolega.
- Prijava v sistem.
- Nalozena datoteka.
- Sneta datoteka.

Dokaz: vstavi sliko 08-nextcloud-prijava.png in 09-nextcloud-upload-download.png

## Dodatne obveznosti

### AWS Free Tier
- Racun ustvarjen in aktiviran.

Dokaz: vstavi sliko 10-aws-dashboard.png

### GitHub
- Ustvarjen racun/repozitorij: almaVelkov2026/racunalnistvo-v-oblaku

Dokaz: vstavi sliko 11-github-repo.png

## 10 vprasanj iz predavanja
1. Kaj je virtualni racunalnik in zakaj ga uporabljamo?
2. Kaksna je razlika med host in guest sistemom?
3. Kaj je hipervizor in kaksna je njegova naloga?
4. Kaj pomeni ISO datoteka pri namescanju OS?
5. Kaj pomeni, da si host in guest delita CPU in RAM?
6. Kaj je lokalni IP naslov in kdaj je unikaten?
7. Zakaj potrebujemo apt update pred apt install?
8. Kako preverimo status storitve Apache2?
9. Kaj je SCP in zakaj potrebuje SSH streznik?
10. Zakaj datoteke spletne strani kopiramo v /var/www/html?

## Zakljucek
Naloga je uspesno zakljucena, ko so vse storitve delujoce (Apache2, SSH, Nextcloud), spletna stran dostopna prek IP naslova VM in so vsi dokazni screenshoti prilozeni.

## Navodilo za vstavljanje slik (tocno kam)
Slike vstavljaj takoj pod ustrezen razdelek "Dokaz". Priporocen vrstni red:
1. Pod "1) VM in omrezje": 02-prijava-debian.png, 03-ip-a.png
2. Pod "2) Namestitev Apache2 in SSH": 04-apache-status.png
3. Pod "4) Prenos datotek in objava": 05-scp-prenos.png, 06-var-www-html.png
4. Pod "5) Preverba strani v brskalniku": 07-brskalnik-stran.png
5. Pod "6) Nextcloud (obvezno)": 08-nextcloud-prijava.png, 09-nextcloud-upload-download.png
6. Pod "AWS Free Tier": 10-aws-dashboard.png
7. Pod "GitHub": 11-github-repo.png

Dodatno priporocilo:
- Vključi tudi 01-vm-nastavitve.png na zacetek dokumenta pod "Izvedbeni plan" kot dokaz konfiguracije VM.
