#!/bin/sh
# ZA PRENOS
# wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/installubuntu.sh && chmod +x installubuntu.sh
#
#exit
printf "\n\e[93m!! start after installed Termux and UBUNTU is started !!\e[0m\n"
printf "%s " "Enter to continue or CTRL-C to abort"
read ans
#read -rsn1 -p "Enter to continue or CTRL-C to abort" - dela v /bash

printf "\n\e[93m■■■■ spreminjam ~/.bashrc  1  ■■■■\e[0m\n"

sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc1

echo '#' >> ~/.bashrc1
echo '#__________MOJE_________' >> ~/.bashrc1
echo 'bash -c "sleep 3 && ./ccminer/start.sh" && screen -r' >> ~/.bashrc1
echo 'alias rr='screen -x CCminer'' >> ~/.bashrc1
echo 'alias xx='screen -X -S CCminer quit && screen -ls'' >> ~/.bashrc1
echo 'alias sl='screen -ls'' >> ~/.bashrc1
echo 'alias ss='~/ccminer/start.sh'' >> ~/.bashrc1
echo 'alias XX='xx'' >> ~/.bashrc1
echo 'alias RR='rr'' >> ~/.bashrc1
echo 'alias SL='sl'' >> ~/.bashrc1
echo 'alias SS='ss'' >> ~/.bashrc1
