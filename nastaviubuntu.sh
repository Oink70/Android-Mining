#!/bin/sh
rm -f ~/new-version.sh
rm -f ~/posodobi.sh
rm -f ~/ccminer/new-version.sh
rm -f ~/ccminer/posodobi.sh
cd ~/ && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi.sh && chmod +x posodobi.sh
cd ~/ && rm -f pool-verus.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh
