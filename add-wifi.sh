#!/bin/sh
exit

$$$$__UBUNTU - nej pravo
sudo apt-get -y install network-manager

sudo apt list network-manager

sudo systemctl start NetworkManager

nmcli device wifi list

nmcli device wifi connect "SSID" password "geslo"

$$$$__TERMUX

$ pkg update

??? pkg install networkmanager 

$ wpa_supplicant
The program wpa_supplicant is not installed. Install it by executing:
pkg install wpa-supplicant, after running pkg install root-repo

$ iwconfig
The program iwconfig is not installed. Install it by executing:

$$$ pkg install wireless-tools

wireless-tools vsebujejo več ukazov za upravljanje brezžičnih omrežij v Linuxu. Nekateri pogosti ukazi vključujejo:

___ iwconfig: Ta ukaz prikazuje in omogoča konfiguracijo brezžičnih vmesnikov. Uporabite ga lahko za ogled informacij o omrežjih, povezovanje z omrežji in konfiguracijo varnostnih ključev.

___ iwlist: Ta ukaz omogoča iskanje razpoložljivih brezžičnih omrežij v bližini. Lahko prikaže seznam vseh omrežij, vključno z informacijami o njihovih SSID-ih, frekvencah in moči signala.

___ iwpriv: Ta ukaz omogoča upravljanje s posebnimi nastavitvami brezžičnih omrežij, ki jih ne morete nastaviti s iwconfig.

___ iw: To je novejši ukaz, ki združuje funkcionalnosti iwconfig in iwlist. Omogoča bolj napredno upravljanje in konfiguracijo brezžičnih vmesnikov.

The program iw is not installed. Install it by executing:
pkg install iw


___ iwgetid: Ta ukaz prikazuje SSID trenutno povezanega brezžičnega omrežja.

___ iwspy: Ta ukaz omogoča spremljanje in analizo kakovosti signala med brezžičnimi napravami.

Pomembno je vedeti, da so se nekateri od teh ukazov v zadnjem času razvijali in nadomeščeni z novimi orodji za upravljanje brezžičnih omrežij, kot je iw. Za podrobnejše informacije o ukazih in njihovi uporabi lahko vedno preverite njihovo dokumentacijo z ukazi man <ime_ukaza> ali --help.






getprop
  ro.product.manufacturer]
getprop ro.product.model
  ro.boot.em.model
  ro.hardware  
  ro.product.bootimage.brand
  ro.product.cpu.abilist64]
  ro.boot.hardware
  ro.bootimage.build.date
  ro.bootimage.build.version.release
  ro.soc.manufacturer
  
  
