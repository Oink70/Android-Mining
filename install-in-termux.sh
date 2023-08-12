#!/bin/bash

#   cd ~/ && rm -f install-in-termux.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/install-in-termux.sh && chmod +x install-in-termux.sh && ./install-in-termux.sh

printf "\n\e[93m■■■■ nastavitve v TERMUX ■■■■\e[0m\n"
printf "\n\e[93m■■■■ update TERMUX ■■■■\e[0m\n"

# Instaliraj ssh - 6x YES
###   pkg update -y && pkg upgrade -y && pkg install wget -y && pkg install openssh -y && pkg install net-tools -y

sshd

#  Če je error - to nekam vnesi ???:
#  echo "#sshd: no hostkeys available -- exiting"

ssh-keygen -A
#  whoami
my_name=$(whoami)
echo "whoami=" $my_name
#  Ustvari password
passwd $my_name
# Izvedi ukaz ifconfig in shranimo izhod v spremenljivko output
ifconfig_out=$(ifconfig)
# Poišči vrstico z 'inet 192' za mrežno povezavo (wlan0)
ip_line=$(echo "$ifconfig_out" | grep 'inet 192')
# Uporabi cut za izluščenje prvega dela zadnjega IP naslova (152)
phone_ip=$(echo "$ip_line" | cut -d'.' -f4 | cut -c1-3)
# Izpiši zadnji del IP naslova
echo "IP=" $phone_ip
# Nastavi SSH
ssh $my_name@192.168.100.$phone_ip -p 8022
printf "\n\e[93mnastavljam keys\e[0m\n"
rm -r ~/.ssh/
mkdir ~/.ssh
chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAe7mHnisRNUXZ8u5AaeKxm7/ixbaacLWk6S6bpqlEom blb@blb
EOF
chmod 0600 ~/.ssh/authorized_keys
echo -e "\n\e[93mnastavljeno\e[0m\n"

exit

    
    

    

    
    
    ssh u0_a@192.168.100. -p 8022

    __install UBUNTU in Termux

    pkg update -y && pkg install curl proot tar -y && curl https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu/ubuntu.sh | bash

    __Auto boot ubuntu  (nano ~/.termux/termux.properties) __Zbriši # pred: # allow-external-apps = true

    sed -i 's/^# allow-external-apps = true*/allow-external-apps = true/' ~/.termux/termux.properties_copy

    mkdir -p ~/.termux/boot && nano ~/.termux/boot/start.sh

    __vsebina (kopiraj pol/pol):

    #!/data/data/com.termux/files/usr/bin/sh
    termux-wake-lock
    sshd
    am startservice --user 0 -n com.termux/com.termux.app.RunCommandService \
    -a com.termux.RUN_COMMAND \

    --es com.termux.RUN_COMMAND_PATH '~/start-ubuntu.sh' \
    --es com.termux.RUN_COMMAND_WORKDIR '/data/data/com.termux/files/home' \
    --ez com.termux.RUN_COMMAND_BACKGROUND 'false' \
    --es com.termux.RUN_COMMAND_SESSION_ACTION '0'

    __Naj bo datoteka izvršljiva :
    chmod +x ~/.termux/boot/start.sh




#  cd ~/ && rm -f ~/ter-ub.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/ter-ub.sh && chmod +x ter-ub.sh && ~/ter-ub.sh

#printf "\n\e[93m■■■■ test ■■■■\e[0m\n"
# ------ 
#./start-ubuntu.sh
#sleep 12

#!/bin/sh
#ls
#printf "\n\e[93m■■■■ ubuntu ■■■■\e[0m\n"
#sl
