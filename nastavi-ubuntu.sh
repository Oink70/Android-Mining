#!/bin/sh
printf "\n\e[93m■■■ nastavljam v UBUNTU ■■■\e[0m\n"
cd ~/ && rm -f posodobi.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi.sh && chmod +x posodobi.sh
cd ~/ && rm -f restart-miner.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/restart-miner.sh && chmod +x restart-miner.sh
cd ~/ && rm -f pool-verus.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh
cd ~/ && rm -f pool-luck.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-luck.sh && chmod +x pool-luck.sh
cd ~/ && rm -f install-in-ubuntu.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/install-in-ubuntu.sh && chmod +x install-in-ubuntu.sh
printf "\n\e[93m■■■ nastavljeno v UBUNTU ■■■\e[0m\n"
cd ~/ && ./install-in-ubuntu.sh
printf "\n\e[93m■■■ inštalirano v UBUNTU ■■■\e[0m\n"
