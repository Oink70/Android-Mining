#!/bin/sh
# start after installed Termux and Termux.boot
#
echo  "1. Instaliraj termux & termux boot"
echo  "https://f-droid.org/en/packages/com.termux/"
echo  "https://f-droid.org/en/packages/com.termux.boot/"
read -p "Press any key to continue or CTRL-C to abort"
#
# 2. Instaliraj ssh
pkg update -y && pkg upgrade -y
pkg install wget -y
pkg install openssh -y
pkg install net-tools -y
sshd
#
echo "Če je error :"
echo "#sshd: no hostkeys available -- exiting"
read -p "Press any key to continue or CTRL-C to abort"
#
#Generate hostkeys za :
ssh-keygen -A
#
# 3. Povezava ssh
# Preveri user-ja :
echo "Who I Am - mora biti root !!"
whoami
#
read -p "Press any key to continue or CTRL-C to abort"
#
#Ustvari password :
echo "Ustvari password"
passwd root
#
echo "Preveri IP :"
ifconfig

read -p "vnesi zadnji IP: " mojIP

#Poveži se z CMD :
ssh $(printf root@192.168.100.)$mojIP -p 8022

# install UBUNTU in Termux

pkg update -y && pkg install curl proot tar -y && curl https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu/ubuntu.sh | bash





cat << EOF > ~/ccminer/start.sh
#!/bin/sh
