#!/bin/bash
printf "\n\e[93m■■■ UBUNTU: restart miner ■■■\e[0m\n"
# ustavi vse screene in ponovno zažene miner
cd ~/ && screen -ls | grep -o '[0-9]\+\.' | awk '{print $1}' | xargs -I {} screen -X -S {} quit
~/ccminer/start.sh'
