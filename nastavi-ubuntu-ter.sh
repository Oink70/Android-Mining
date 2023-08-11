#!/bin/sh
printf "\n\e[93m■■■ TERMUX: nastavi UBUNTU ■■■\e[0m\n"
# ./start-ubuntu.sh ./nastavi-ubuntu.sh
./start-ubuntu.sh 'cd ~/ && rm -f nastavi-ubuntu.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/nastavi-ubuntu.sh && chmod +x nastavi-ubuntu.sh && ./nastavi-ubuntu.sh'
