# Koetilan palvelimen virtualisointi

Abitti-palvelimen voi pystyttää sekä varsinaista käyttöä että testikäyttöä varten käyttämällä [Virtualboxia](https://www.virtualbox.org/).

## Vaatimukset

Käytettävästä tietokoneesta on löydyttävä vähintään 4 GB keskusmuistia ja on suositeltavaa, että suorittimessa olisi ainakin kaksi ydintä. Oppilastikku vie noin 2 GB muistia, mutta koetilan palvelimen käynnistäminen edellyttää neljää gigatavua käynnistyäkseen.

### Vaaditut sovellukset

```
Virtualbox
Vagrant
```

On myös suositeltavaa ladata konfigurointia helpottava scripti [täältä](https://github.com/Aanekoskenlukio/virtual-abitti-script-ps/releases/). Klikkaa KTP.ps1-linkkiä uusimman versionumeron kohdalta.

Scripti asettaa Windowsin ympäristömuuttujat arvoihin, jotka mahdollistavat koepakettien tuonnin palvelimelle.

### Fyysiset laitteet

Virtuaalinen palvelin korvaa fyysisen palvelintietokoneen. Opettaja voi käyttää esimerkiksi työkonettaan palvelimena samalla, kun se on käynnistettynä Windowsiin. Palvelimen ollessa päällä **internet-yhteys ei kuintekaan ole käytettävissä*.

Koeverkkoa varten tarvitaan kuitenkin:

1. Wifi-reititin
2. ethernet-kaapeleita

Reititin kytketään tavalliseen tapaan ethernet-kaapelilla palvelintietokoneen verkkoporttiin.

____

## Konfigurointi

1. Lataa ja asenna [VirtualBox](https://www.virtualbox.org/wiki/Downloads) ja [Vagrant](https://www.vagrantup.com/downloads.html).
2. Luo hakemistot `ktp` ja `ktp-jako` käyttäjän kotikansioon. `C:\Users\käyttäjätunns\`
3. Lataa YTL:n luoma [Vagrantfile](http://static.abitti.fi/usbimg/qa/vagrant/Vagrantfile) ja talleta se kansioon `ktp` 
4. Sijoita lataamasi scripti (ks. vaatimukset) esimerkiksi työpöydälle.
5. Klikkaa scriptiä hiiren oikealla painikkeella ja valitse `Run in Powershell` tai vastaava suomeksi.
6. Lue [Kokemukset](https://github.com/xrtli/abitti-oppaat-wm/blob/master/koetilan%20palvelin.md#kokemuksia).

Scriptin tulisi listata hakemiston `ktp-jako` sisältö (hakemisto oletetusti tyhjä) ja jatkaa suorittamalla komento `vagrant up`. Tällöin koetilan palvelimen tulisi latautua ja Virtualbox-ikkunan avautua. 

### Verkko

**Haluan käyttää virtuaalipalvelinta, kuten fyysista palvelinta, kokeen järjestämiseen:**

1. Avaa VirtualBox
2. Klikkaa `Virtual KTP`-vaihtoehdon kohdalla oikealla hiirennäppäimellä
3. Avaa `Network`-välilehti
4. Vaihda adapterityypiksi `Bridged adapter` ja nimeksi `Intel Ethernet Connection` (Äänekosken lukio)
5. Kytke tietokoneeseen reititin
6. Nyt VirtualBox jakaa verkkoa reitittimen välityksellä. Oppilaat voivat liittyä verkkoon, kun palvelin [käynnistetään](https://github.com/xrtli/abitti-oppaat-wm/blob/master/koetilan%20palvelin.md#k%C3%A4ynnistys-konfiguroinnin-j%C3%A4lkeen).

*Bridged-tilassa virtuaalinen kone voi esimerkiksi toimia palvelimena (myös DHCP), jolloin verkkoliikenne sillataan virtuaalikoneelta fyysiseen ethernet-porttiin ja siitä reitittimeen:*

> This is for more advanced networking needs such as **network simulations and running servers in a guest**. When enabled, VirtualBox connects to one of your installed network cards and exchanges network packets directly, circumventing your host operating system's network stack. [VirtualBox Manual](https://www.virtualbox.org/manual/ch06.html)


**Haluan käyttää verkkoa VirtualBoxin sisäisesti: haluan yhdistyää virtuaalisen oppilaskoneen virtuaaliseen palvelimeen:**

Lue opas [täältä](https://github.com/xrtli/abitti-oppaat-wm/blob/master/oppilaan%20k%C3%A4ytt%C3%B6liittym%C3%A4.md#verkon-konfigurointi).

### Mahdolliset vikatilanteet

```
error: --macaddress: RTGetOpt: Command line option needs argument
```
Käynnistä koetilan palvelin scriptillä uudelleen.

```
No directory ~/ktp-jako found  //Tai vastaava virheilmoitus hakemistosta ktp-jako
```
1. Varmista, että ktp avataan scriptin avulla.
2. Varmista, että hakemisto `C:\Users\käyttäjätunnus\ktp-jako` on olemassa.
3. Tee tarvittavat muutokset scriptiin. (Ympäristomuuttujien tulee ohjata `ktp-jako`-hakemistoon.

### Pikakuvakkeiden luonti

On suositeltavaa luoda käyttöä yksinkertaistavat pikakuvakkeet virtuaalikoneen käynnistämistä ja kokeiden siirtoa varten.

**Virtuaalikone-kuvake**

1. Avaa `VirtualBox`
2. Paina hiiren oikealla painikkeella `Virtual KTP`-koneen kohdalta
3. Valitse `Create shortcut to Desktop` tai vastaava

**Koekansion kuvake**

1. Avaa `Resurssienhallinta`
2. Mene kansioon `C:\users\käyttäjätunnus\`
3. Paina kansiosta `ktp-jako` hiiren oikealla painikkeella
4. Valitse `Lähetä kohteeseen`-valikosta `Luo kuvake työpöydälle`

____

## Käynnistys konfiguroinnin jälkeen

Kun palvelin on ensimmäistä kertaa konfiguroitu, voidaan se käynnistää Virtualbox-ohjelman kautta.

1. Avaa `Virtualbox`.
2. Valitse listalta `Virtual KTP v##`.
3. Paina `Start`

On myös mahdollista (esim. jos ylläoleva ei toimi) avata palvelin scriptin avulla myös jatkossa. 

## Palvelinversion päivittäminen

Avaa scripti. Se päivittää palvelimen automaattisesti uusimpaan versioon ennen käynnistämistä.

## Kokeiden tuonti palvelimelle

1. Avaa kansio `ktp-jako`.
2. Siirrä meb-tiedosto kansioon.
3. Käynnistä virtuaalipalvelin.
4. Tuo koe tavalliseen tapaan.

## Säädä Windowsin virta-asetukset

1. Avaa Windows 10 -asetukset esimerkiksi Käynnistä-valikosta (rattaan kuva oikealla alhaalla)
2. Valitse Järjestelmä
3. Valitse Virta-välilehti
4. Vaihda kaikkiin pudotusvalikoihin `Ei koskaan`

____

# Kokemuksia

Virtuaalista palvelinta testattaessa käytännössä on huomattu seuraavaa:

0. Palvelin on toistaiseksi kyennyt hostaamaan kokeen ~20 opiskelijalle.

1. Palvelinta ei kannata *käynnistää koetilanteessa* scriptillä, sillä jos päivityksiä on saatavilla, niiden lataamiseen voi mennä tovi. Palvelin kannattaakin päivittää scriptin avulla vain silloin, kun on tiedossa, että opiskelijatikutkin ovat juuri päivitetty.

2. Kannattaa aina varmistaa, että `Virtual KTP vXX`-koneen asetuksissa on käytössä `Bridged adapter`-verkkotyyppi ja verkkolaitteeksi on valittu jokin langallinen `ethernet`-vaihtoehto. Äänekosken lukion `Dell`-kannettavissa langallinen adapteri on `Intel(R) Ethernet Controller`.

3. Usein vika **ei ole softapuolella** vaan fyysisissä laitteissa. Tarkista verkkopiuhat ja reitittimen virransaanti ennen kuin ryhdyt etsimään vikoja VirtualBoxista tai Abitista.

4. Älä anna koneen mennä lepotilaan tai edes lukittautua kokeen aikana: [säädä virransäästöasetukset kohdalleen](https://github.com/xrtli/abitti-oppaat-wm/blob/master/koetilan%20palvelin.md#s%C3%A4%C3%A4d%C3%A4-windowsin-virta-asetukset).


![](https://raw.githubusercontent.com/xrtli/abitti-oppaat-wm/master/screenshot.png)
