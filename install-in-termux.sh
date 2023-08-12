#!/bin/bash

#   pkg update -y && pkg upgrade -y && pkg install wget -y && pkg install openssh -y && pkg install net-tools -y
#   cd ~/ && rm -f install-in-termux.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/install-in-termux.sh && chmod +x install-in-termux.sh && ./install-in-termux.sh

printf "\n\e[93m■■■■ nastavitve v TERMUX ■■■■\e[0m\n"
#printf "\n\e[93mupdate TERMUX\e[0m\n"
# Instaliraj ssh - 6x YES
#pkg update -y && pkg upgrade -y && pkg install wget -y && pkg install openssh -y && pkg install net-tools -y
echo -e "\n\e[93mnastavljam SSH\e[0m\n"
# nastavi SSH
sshd
#  Če je error - to nekam vnesi ???:
#  echo "#sshd: no hostkeys available -- exiting"
ssh-keygen -A
#  whoami
my_name=$(whoami)
echo "whoami=" $my_name
#  Ustvari password
passwd $my_name
# Nastavi IP
ifconfig_out=$(ifconfig)
ip_line=$(echo "$ifconfig_out" | grep 'inet 192')
phone_ip=$(echo "$ip_line" | cut -d'.' -f4 | cut -c1-3)
echo "IP=" $phone_ip
rm -f ~/*.ip
cat << EOF > ~/$phone_ip.ip
EOF
echo $$phone_ip >> ~/$phone_ip.ip
# Nastavi SSH
ssh $my_name@192.168.100.$phone_ip -p 8022
echo -e "\n\e[93mnastavljam key\e[0m\n"
cd ~/
rm -rf ~/.ssh/
mkdir ~/.ssh
chmod 0700 ~/.ssh
cd ~/.ssh
sleep 1
cat << EOF > ~/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAe7mHnisRNUXZ8u5AaeKxm7/ixbaacLWk6S6bpqlEom blb@blb
EOF
chmod 0600 ~/.ssh/authorized_keys
ls
echo -e "\n\e[93minstall UBUNTU in Termux\e[0m\n"
pkg update -y && pkg install curl proot tar -y && curl https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu/ubuntu.sh | bash
echo -e "\n\e[93mnasrtavljam auto boot\e[0m\n"
# Auto boot ubuntu  (nano ~/.termux/termux.properties) __Zbriši # pred: # allow-external-apps = true
sed -i 's/^# allow-external-apps = true*/allow-external-apps = true/' ~/.termux/termux.properties
sed -i 's/^#allow-external-apps = true*/allow-external-apps = true/' ~/.termux/termux.properties
rm -rf ~/.termux/boot
mkdir -p ~/.termux/boot
# nastavi ~/.termux/boot/start.sh
cat << EOF > ~/.termux/boot/start.sh
#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
sshd
am startservice --user 0 -n com.termux/com.termux.app.RunCommandService \
-a com.termux.RUN_COMMAND \
--es com.termux.RUN_COMMAND_PATH '~/start-ubuntu.sh' \
--es com.termux.RUN_COMMAND_WORKDIR '/data/data/com.termux/files/home' \
--ez com.termux.RUN_COMMAND_BACKGROUND 'false' \
--es com.termux.RUN_COMMAND_SESSION_ACTION '0'
EOF
chmod +x ~/.termux/boot/start.sh
# doda na konec .bash.history
echo "./start-ubuntu.sh" >> ~/.bash.history
echo -e "\n\e[93mzaženi UBUNTU ./start-ubuntu.sh"
echo -e "\nin restart telefona\e[0m\n"
