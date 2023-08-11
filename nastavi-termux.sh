#!/bin/sh

# cd ~/ && rm -f nastavi-termux.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/nastavi-termux.sh && chmod +x nastavi-termux.sh && ./nastavi-termux.sh

printf "\n\e[93m■■■ nastavljam v TERMUX ■■■\e[0m\n"

# ssh -t -i ~/.ssh/id_xxx blb@192.168.xxx.xxx -p xx22 "bash -ic './xxxter.sh'"

# vsebina xxxter
# ./start-ubuntu.sh ./xxxub.sh

cd ~/ && rm -f restart-miner-ter.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/restart-miner-ter.sh && chmod +x restart-miner-ter.sh
cd ~/ && rm -f posodobi-ter.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi-ter.sh && chmod +x posodobi-ter.sh
cd ~/ && rm -f pool-verus-ter.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus-ter.sh && chmod +x pool-verus-ter.sh
cd ~/ && rm -f pool-luck-ter.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-luck-ter.sh && chmod +x pool-luck-ter.sh
cd ~/ && rm -f installssh.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/installssh.sh && chmod +x installssh.sh && installssh.sh
