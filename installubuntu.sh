#!/bin/sh
# start after installed Termux and Termux.boot
#
# 1. Instaliraj termux & termux boot
# https://f-droid.org/en/packages/com.termux/
# https://f-droid.org/en/packages/com.termux.boot/
#
# 2. Instaliraj ssh
pkg update -y && pkg upgrade -y
pkg install openssh -y
pkg install net-tools -y
sshd
#
#Če je error :
#sshd: no hostkeys available -- exiting
#
#Generate hostkeys za :
ssh-keygen -A
#
# 3. Povezava ssh
# Preveri user-ja :
echo "Who I Am - mora biti root"
whoami
#
#Ustvari password :
echo "Ustvari password"
passwd user_iz_whoami

Preveri IP :
ifconfig

Poveži se z CMD :
ssh user_iz_whoami@ip_iz_ifconfig -p 8022

cat << EOF > ~/ccminer/start.sh
#!/bin/sh
