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
pkg install wireless-tools
