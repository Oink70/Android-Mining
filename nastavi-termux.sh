#!/bin/sh
printf "\n\e[93m■■■ nastavljam v TERMUX ■■■\e[0m\n"

# ssh -t -i ~/.ssh/id_xxx blb@192.168.xxx.xxx -p xx22 "bash -ic './xxxter.sh'"

# vsebina xxxter
# ./start-ubuntu.sh ./xxxub.sh

cd ~/ && rm -f posodobi-ter.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi-ter.sh && chmod +x posodobi-ter.sh
cd ~/ && rm -f pool-verus-ter.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus-ter.sh && chmod +x pool-verus-ter.sh
