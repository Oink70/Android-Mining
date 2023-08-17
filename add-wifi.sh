#!/bin/sh
exit

root phone !!!

$$$$__UBUNTU - nej pravo
sudo apt-get -y install network-manager

sudo apt list network-manager

sudo systemctl start NetworkManager

nmcli device wifi list

nmcli device wifi connect "SSID" password "geslo"

$$$$__TERMUX

$ pkg update

pkg install android-tools
adb devices

#!/bin/bash
echo adb start-server
adb start-server
adb devices
echo "zaženeš z: scrcpy -d"

#!/bin/bash
read -r -n 3 -p "putty IP:" choice_ip
putty -ssh blb@192.168.100.$choice_ip -P 8022 -geometry 80x40
echo "  exit"

#!/bin/sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_blb

if ! alias | grep -q "geslo"; then
    alias geslo="./geslo.sh"
fi



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




getprop ro.product.manufacturer
getprop ro.boot.em.model
getprop ro.boot.hardware
getprop ro.soc.manufacturer
getprop ro.product.bootimage.brand
getprop ro.bootimage.build.version.release
getprop ro.bootimage.build.date
getprop ro.hardware
getprop ro.product.cpu.abilist64


