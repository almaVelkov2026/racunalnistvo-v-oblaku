# VM tracker - Michel Velkov

Datum zacetka: 2026-03-22

## Statusi
- NAREJENO
- V TEKU
- MANJKA

## Povzetek napredka
- Trenutni status: V TEKU
- Lastnik: Michel Velkov
- VM uporabnik: michel
- VM IP: 192.168.0.167
- GitHub repozitorij: https://github.com/almaVelkov2026/racunalnistvo-v-oblaku.git

## Kontrolni seznam
- [x] VM ustvarjen in Debian namescen
- [x] SSH dostop v VS Code deluje
- [x] Omrezje preverjeno (ip a)
- [x] Apache2 namescen
- [x] Apache2 zagnan in enabled
- [x] Preprosta spletna stran pripravljena (ime, priimek, slika, crno ozadje, bel tekst)
- [x] Datoteke prenesene v /var/www/html
- [ ] Stran dostopna iz brskalnika prek IP VM
- [x] Nextcloud namescen
- [ ] Nextcloud testiran (uporabnik, prijava, upload, download)
- [ ] AWS Free Tier racun ustvarjen
- [x] GitHub racun/repo ustvarjen
- [ ] 10 vprasanj iz predavanja pripravljenih
- [ ] Dokazi (screenshoti) vstavljeni v oddajni dokument
- [ ] Oddaja pripravljena za Moodle

## Dnevik izvedbe

### 2026-03-22
- NAREJENO: zacetek implementacije v terminalu na Debian VM.
- NAREJENO: ustvarjena mapa oddaje in datoteke dokumentacije.
- NAREJENO: preverjeno omrezje, VM IP je 192.168.0.167.
- NAREJENO: apache2 in openssh-server namescena in storitvi sta aktivni.
- NAREJENO: datoteki index.html in michel.jpg sta objavljeni v /var/www/html.
- NAREJENO: snapd je namescen kot priprava za Nextcloud.
- NAREJENO: nextcloud snap je namescen in storitve so aktivne.
- NAREJENO: nextcloud je prestavljen na port 8080 (HTTPS 8443), da Apache na portu 80 ostane za spletno stran.
- NAREJENO: ustvarjena sta Nextcloud uporabnika michel in kolega.
- V TEKU: preverba strani iz host brskalnika prek http://192.168.0.167.
- V TEKU: zacetna nastavitev Nextcloud prek brskalnika na http://192.168.0.167:8080.
- MANJKA: Nextcloud test (uporabnik, prijava, upload, download), AWS dokaz, finalna oddaja.

## Naslednji tocni koraki (za dokoncanje)
1. V host brskalniku odpri http://192.168.0.167/ in shrani 07-brskalnik-stran.png.
2. V host brskalniku odpri http://192.168.0.167:8080/index.php/login in se prijavi.
3. Izvedi test prijava, upload in download ter shrani 08-nextcloud-prijava.png in 09-nextcloud-upload-download.png.
4. Po testu spremeni privzeto geslo racuna michel.

## Evidenca dokazov (screenshoti)
Shrani v mapo: /home/michel/racunalnistvo v oblaku/dokazi

1. 01-vm-nastavitve.png - VM CPU/RAM/SSD/Network
2. 02-prijava-debian.png - prijava v sistem
3. 03-ip-a.png - ip a z vidnim lokalnim IP
4. 04-apache-status.png - systemctl status apache2
5. 05-scp-prenos.png - scp ukaz in rezultat
6. 06-var-www-html.png - datoteke v /var/www/html
7. 07-brskalnik-stran.png - stran odprta prek IP
8. 08-nextcloud-prijava.png - prijava uporabnika
9. 09-nextcloud-upload-download.png - upload + download
10. 10-aws-dashboard.png - AWS Free Tier dokaz
11. 11-github-repo.png - GitHub repo dokaz
12. 12-moodle-pripravljenost.png - finalna priprava oddaje

## Opombe
- Ta Debian nima ukaza sudo; za skrbniske ukaze uporabi su -c "ukaz".
- Po vsaki vecji spremembi dodaj vrstico v ta tracker.
