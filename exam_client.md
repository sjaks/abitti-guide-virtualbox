# Oppilaan käyttöliittymän simulointi Virtualboxilla

## Vaatimukset

On suositeltavaa, että käytettävässä tietokoneessa olisi ainakin 2 GB keskusmuistia. Jos samalla tietokoneella luodaan myös virtuaalinen ktp (kuten [täällä](https://github.com/xrtli/abitti-oppaat-wm/blob/master/koetilan%20palvelin.md)), tulisi koneessa olla ainakin 8 GB muistia.

### Vaaditut sovellukset

```
Virtualbox
```
Oppilastikun kopintia varten tarvitaan myös sovellus, jolla voi kloonata USB-median `.vhd`-muotoon. [Kloonaaminen](https://github.com/xrtli/abitti-oppaat-wm/blob/master/tikun%20kloonaaminen.md).

## Konfigurointi

0. Sinulla tulee olla [virtuaalinen kovalevyklooni](https://github.com/xrtli/abitti-oppaat-wm/blob/master/tikun%20kloonaaminen.md) oppilastikusta `.vhd`.
1. Avaa `Virtualbox`.
2. Luo uusi virtuaalikone painamalla `New`.
3. Nimeä kone (esim. `Oppilastikku`) ja valitse tyypiksi `Linux` ja versioksi `Debian (64-bit)`.
4. Valitse muistin koko. Suositeltava määrä on `2048 MB`.
5. Valitse `Do not add a virtual hard disk` ja paina `Continue`.
6. Klikkaa uuden virtuaalikoneen kohdalta hiiren oikealla painikkeella ja valitse `Settings`.
7. Avaa välilehti `Storage`.
8. Klikkaa alhaalla olevaa korppuikonia, jonka päällä on vihreä plusmerkki.
9. Valitse `Add Hard Disk`.
10. Valitse `Choose existing disk`.
11. Etsi ja valitse levykuva ja paina `Avaa`.
12. Valitse `Ok`.

Tämän jälkeen oppilasnäkymän tulisi avautua valitsemalla oppilasnäkymän virtuaalikoneen kohdalta `Start`.

### Verkon konfigurointi

Jotta oppilaskone ottaisi yhteyttä virtuaaliseen palvelimeen samalla tietokoneella, tulee niiden olla samassa verkossa, jossa ei ole DHCP-palvelinta.

Tee samat askeleet kummallakin virtuaalikoneella - oppilastikulla ja ktp:llä:

1. Klikkaa virtuaalikoneen kohdalta oikealla hiiren näppäimellä.
2. Avaa `Settings`.
3. Avaa `Network`-välilehti.
4. Valitse listalta `Internal network` ja avaa `Advanced`-pudotusvalikko.
5. Paina mieleesi verkon nimi. Varmista, että kummankin koneen verkon nimi on sama. (esim. `intnet`)
6. Valitse `Promiscuous Mode`-valikosta `Allow WMs`.
7. Valitse `Ok`.

Nyt koneet ovat samassa verkossa ja ktp toimii verkon DHCP-palvelimena.

![](https://raw.githubusercontent.com/xrtli/abitti-oppaat-wm/master/jDvrgC7.png)
