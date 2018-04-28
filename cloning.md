# Oppilastikun kloonaaminen levykuvaksi

Jotta oppilasnäkymä toimisi Virtualboxissa, tulee tikku kloonata virtuaaliseksi `.vhd`-tiedostoksi.

## Kloonaaminen

1. Lataa [Disk2VHD](https://docs.microsoft.com/en-us/sysinternals/downloads/disk2vhd) (Microsoft).
2. Kiinnitä Abitti-tikku koneeseen.
3. Valitse, mihin levykuva tallennetaan.
4. Rastita pois `Use Vhdx` ja `Use volume shadow copy`.
5. Rastita pois osiot, jotka eivät kuulu Abitti-tikkuun. Yleensä tikussa on neljä osiota, 2 nimetöntä ja Abitti ja EFI.
6. Paina `Create`.

Nyt voit [avata levykuvan Virtualboxissa](https://github.com/xrtli/abitti-oppaat-wm/blob/master/oppilaan%20k%C3%A4ytt%C3%B6liittym%C3%A4.md).
