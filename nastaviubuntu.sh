#!/bin/sh
printf "\n\e[93m■■■ nastavljam v UBUNTU ■■■\e[0m\n"
rm -f ~/new-version.sh
rm -f ~/posodobi.sh
rm -f ~/ccminer/new-version.sh
rm -f ~/ccminer/posodobi.sh
cd ~/ && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi.sh && chmod +x posodobi.sh
cd ~/ && rm -f pool-verus.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh
cd ~/ && rm -f pool-luck.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-luck.sh && chmod +x pool-luck.sh
