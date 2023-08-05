#!/bin/sh
# POSODOBI fajl NOVA VERZIJA
cd ~/ccminer
rm -rf new-version.sh
echo "\e[93m■■■■ prenašam: new-version.sh ■■■■\e[0m"
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/new-version.sh
chmod +x new-version.sh
echo "\e[93m■■■■ štartam: new-version.sh ■■■■\e[0m"
./new-version.sh
