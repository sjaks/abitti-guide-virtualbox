# Yksinkertainen virtuaalipalvelimen asennusopas
[exam_server](https://github.com/xrtli/abitti-guide-virtualbox/blob/master/exam_server.md)-oppaassa on yksityiskohtaisempia ohjeita ja vinkkejä palvelimen konfigurointiin. Tätä yksinkertaistettua opasta seuraamalla opettaja voi itse konfiguroida palvelimen. *exam_server.md deprecated*

## Ensiaskeleet
1. Lataa vaaditut sovellukset: [Vagrant](https://www.vagrantup.com/downloads.html) ja [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. Asenna ladatut sovellukset
3. Lataa käyttöä helpottava [scripti](https://github.com/Aanekoskenlukio/abitti-guide-virtualbox/releases/download/0.3.0/virtual_abitti.ps1)
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

*Jos kyseinen vaihtoehto puuttuu, valitse se vaihtoehto, jossa lukee joko `ethernet` tai `wired`.

Verkko on nyt onnistuneesti konfiguroitu. Jatkossa Abitti käyttää tietokoneen ethernet-porttia verkkoyhteyden jakamiseen.

## Palvelimen käynnistys
1. Avaa Virtualbox esimerkiksi kirjoittamalla `Virtualbox` Käynnistä-valikkoon
2. Klikkaa vaihtoehtoa `Virtual KTP v#` hiiren oikealla painikkeella
3. Valitse `Start`
4. Voit kytkeä tietokoneen verkkoporttiin reitittimen.
5. Palvelimen käynnistys jatkuu aikan kuten fyysisen palvelimen käynnistys.

## Palvelimen päivittäminen
Aja scripti uudelleen konfigurointi-ohjeiden mukaisesti.
