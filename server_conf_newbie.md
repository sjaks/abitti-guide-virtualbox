# Yksinkertainen virtuaalipalvelimen asennusopas
[exam_server](https://github.com/xrtli/abitti-guide-virtualbox/blob/master/exam_server.md)-oppaassa on yksityiskohtaisempia ohjeita ja vinkkejä palvelimen konfigurointiin. Tätä yksinkertaistettua opasta seuraamalla opettaja voi itse konfiguroida palvelimen.

## Ensiaskeleet
1. Lataa vaaditut sovellukset: [Vagrant](https://releases.hashicorp.com/vagrant/2.0.4/vagrant_2.0.4_x86_64.msi) ja [Virtualbox](https://download.virtualbox.org/virtualbox/5.2.10/VirtualBox-5.2.10-122406-Win.exe)
2. Asenna ladatut sovellukset
3. Lataa käyttöä helpottava [scripti](https://github.com/xrtli/abitti-guide-virtualbox/releases/download/0.2.0/virtual_abitti.ps1)
4. Talleta tai siirrä scripti haluamaasi hakemistoon

## Konfigurointi
1. Klikkaa sciptistä hiiren oikealla painikkeella.
2. Valitse `Run with Powershell`
3. Odota, scripti luo tarvittavat hakemistot ja lataa konfiguraatiotiedostot

Scriptin ajamisen jälkeen tietokoneen ruudulle tulis ilmestyä ikkuna, jossa näkyy Abitti-palvelin.

### Verkon asentaminen
1. Sulje mahdollinen Abitti-palvelinikkuna
2. Avaa Virtualbox esimerkiksi kirjoittamalla `Virtualbox` Käynnistä-valikkoon
3. Klikkaa vaihtoehtoa `Virtual KTP v#` hiiren oikealla painikkeella
4. Valitse `Settings`
5. Siirry välilehdelle `Network`
6. Valitse listalta `Attached to` vaihtoehto `Bridged Adapter`
7. Valitse nimeksi `Intel(R) Ethernet Connection`* (Äänekosken lukio)
8. Avaa pudotusvalikko `Advanced`
9. Valitse listalta `Promiscuous Mode` valinta `Allow All`
10. Valitse `Ok`

Verkko on nyt onnistuneesti konfiguroitu. Jatkossa Abitti käyttää tietokoneen ethernet-porttia verkkoyhteyden jakamiseen.

## Palvelimen käynnistys
1. Avaa Virtualbox esimerkiksi kirjoittamalla `Virtualbox` Käynnistä-valikkoon
2. Klikkaa vaihtoehtoa `Virtual KTP v#` hiiren oikealla painikkeella
3. Valitse `Start`

## Palvelimen päivittäminen
Aja scripti uudelleen konfigurointi-ohjeiden mukaisesti.
