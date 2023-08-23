#!/bin/bash
printf "\n\e[93m■■■ TERMUX: pool-luck ■■■\e[0m\n"
./start-ubuntu.sh 'cd ~/ && rm -f ~/nastavi-ip.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/nastavi-ip.sh && chmod +x nastavi-ip.sh && ~/nastavi-ip.sh'
