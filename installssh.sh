#!/bin/bash

#  copy v TERMUX !!!  - 6x YES

#->  pkg install wget -y && cd ~/ && rm -f ~/installssh.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/installssh.sh && chmod +x installssh.sh && ~/installssh.sh

# se izvaja samo
echo -e "\n\e[93mupdate TERMUX\e[0m\n"
pkg update -y && pkg upgrade -y && pkg install openssh -y && pkg install net-tools -y && pkg install nano -y 
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
echo "■■■■ update to blb ssh ■■■■"
ssh $my_name@192.168.100.$phone_ip -p 8022
echo -e "\n\e[93mnastavljam key\e[0m\n"
cd ~/
rm -rf ~/.ssh/
mkdir ~/.ssh
chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAe7mHnisRNUXZ8u5AaeKxm7/ixbaacLWk6S6bpqlEom blb@blb
EOF
chmod 0600 ~/.ssh/authorized_keys
echo "■■■■ done ■■■■"
rm -f ~/installssh.sh
