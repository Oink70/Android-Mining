#!/bin/sh


screen -X -S CCminer quit
#cp ~/ccminer/config.json ~/
cd ~/ccminer
mv ccminer ccminer3-4
wget https://github.com/BLBMS/Android-Mining/releases/download/v3.8.3-3/ccminer-3.8.3-3_ARM
mv ccminer-3.8.3-3_ARM ccminer
chmod +x ccminer
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n" 1>/dev/null 2>&1
