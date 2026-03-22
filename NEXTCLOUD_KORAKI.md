# Nextcloud - koraki za dokoncanje

Ta korak zahteva root pravice v interaktivni seji.

## 1) Preklop v root
V terminalu zazeni:

su -

Geslo root je enako kot si ga nastavil med instalacijo.

## 2) Namestitev snapd in Nextcloud
Zazeni ukaze po vrsti:

apt update
apt install -y snapd
systemctl enable --now snapd
systemctl enable --now snapd.socket
snap install core
snap install nextcloud

Preveri:

snap list | grep nextcloud

## 3) Prvi dostop
V brskalniku na host racunalniku odpri:

http://192.168.0.167/

Ce se odpre Apache stran, za Nextcloud uporabi:

http://192.168.0.167:8080/

Ce port 8080 ni pravilen, preveri:

snap services nextcloud
snap connections nextcloud

## 4) Obvezni testi za dokaz
1. Ustvari uporabnika za sebe in kolega.
2. Prijavi se v sistem.
3. Nalozi datoteko.
4. Snemi datoteko.

## 5) Screenshoti za Moodle
- 08-nextcloud-prijava.png
- 09-nextcloud-upload-download.png

Shrani jih v mapo:

/home/michel/racunalnistvo v oblaku/dokazi
