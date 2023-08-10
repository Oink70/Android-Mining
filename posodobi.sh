#!/bin/sh
#
# cd ~/ && rm -f posodobi.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi.sh && chmod +x posodobi.sh
#
# POSODOBI fajl NOVA VERZIJA
cd ~/
rm -f new-version.sh
printf "\e[93m■■■■ prenašam: new-version.sh ■■■■\e[0m\n"
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/new-version.sh
chmod +x new-version.sh
printf "\e[93m■■■■ štartam: new-version.sh ■■■■\e[0m\n"
./new-version.sh
