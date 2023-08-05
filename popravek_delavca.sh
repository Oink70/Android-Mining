#!/bin/sh

echo "alias ss='~/ccminer/start.sh'" >> ~/.bashrc
echo "alias SS='ss'" >> ~/.bashrc

# nastavi force_color_prompt=yes
sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc
sed -i 's/^#force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc

__ vse v enem

#  echo alias "ss='~/ccminer/start.sh'" >> ~/.bashrc && echo "alias SS='ss'" >> ~/.bashrc && sed -i 's/^# force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc && sed -i 's/^#force_color_prompt=yes*/force_color_prompt=yes/' ~/.bashrc

#  nano ~/.bashrc

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
printf "\n\e[93m delavec v config.json\e[0m"
sed -i "0,/$delavecTO/ s//$delavec/" ~/ccminer/config.json
cat ~/ccminer/config.json
