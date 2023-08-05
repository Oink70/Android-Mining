#!/bin/sh

#  wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/popravek_delavca.sh && chmod +x popravek_delavca.sh && ./popravek_delavca.sh

echo "alias ss='~/ccminer/start.sh'" >> ~/.bashrc
echo "alias SS='ss'" >> ~/.bashrc

# nastavi force_color_prompt=yes
sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc
sed -i 's/^#force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc

__ vse v enem

#  echo alias "ss='~/ccminer/start.sh'" >> ~/.bashrc && echo "alias SS='ss'" >> ~/.bashrc && sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc && sed -i 's/^#force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc

#  nano ~/.bashrc

cd ~/
printf "\n\e[93m IME DELAVCA: \e[0m"
read delavec
printf "\n\e[93m ime delavca je: "
echo $delavec
printf "\e[0m\n"
cd ~/
rm -f *.ww worker
cat << EOF > ~/worker
EOF
echo $delavec >> ~/worker
cat << EOF > $delavec.ww
EOF
printf "\n\e[93m delavec v config.json\e[0m\n"
screen -X -S CCminer quit
delavecTO="${delavec}TO"
sed -i "0,/$delavecTO/ s//$delavec/" ~/ccminer/config.json
rm popravek_delavca.sh
cat ~/ccminer/config.json
ls
printf "%s " "Enter to continue"
read ans
~/ccminer/start.sh
