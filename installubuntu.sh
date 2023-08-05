#!/bin/sh
# ZA PRENOS
# wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/installubuntu.sh && chmod +x installubuntu.sh
#
#exit
printf "\n\e[93m!! start after installed Termux and UBUNTU is started !!\e[0m\n"
printf "%s " "Enter to continue or CTRL-C to abort"
read ans
#read -rsn1 -p "Enter to continue or CTRL-C to abort" - dela v /bash

printf "\n\e[93m■■■■ spreminjam ~/.bashrc ■■■■\e[0m\n"

sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc
sed -i 's/^#force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc

echo "" >> ~/.bashrc
echo "#__________MOJE_________" >> ~/.bashrc
echo 'bash -c "sleep 3 && ./ccminer/start.sh" && screen -r' >> ~/.bashrc
echo "alias ss='~/ccminer/start.sh'" >> ~/.bashrc
echo "alias xx='screen -X -S CCminer quit && screen -ls'" >> ~/.bashrc
echo "alias sl='screen -ls'" >> ~/.bashrc
echo "alias rr='screen -x CCminer'" >> ~/.bashrc
echo "alias SS='ss'" >> ~/.bashrc
echo "alias XX='xx'" >> ~/.bashrc
echo "alias SL='sl'" >> ~/.bashrc
echo "alias RR='rr'" >> ~/.bashrc

printf "\n\e[93m■■■■ spreminjeno ■■■■\e[0m\n"

