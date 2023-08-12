#!/bin/bash

#   cd ~/ && rm -f install-in-termux.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/install-in-termux.sh && chmod +x install-in-termux.sh && ./install-in-termux.sh

printf "\n\e[93m■■■■ nastavitve v TERMUX ■■■■\e[0m\n"
printf "\n\e[93m■■■■ update TERMUX ■■■■\e[0m\n"
# Instaliraj ssh - 6x YES
pkg update -y && pkg upgrade -y && pkg install wget -y && pkg install openssh -y && pkg install net-tools -y

sshd

#  Če je error - to nekam vnesi ???:
#  echo "#sshd: no hostkeys available -- exiting"

ssh-keygen -A
printf "\n\e[93m■■■■ 1 ■■■■\e[0m\n"
#  whoami
my_name=$(whoami)
printf "\n\e[93m■■■■ my_name=" $my_name " ■■■■\e[0m\n"
printf "\n\e[93m■■■■ 2 ■■■■\e[0m\n"
#  Ustvari password b-7
passwd $my_name
printf "\n\e[93m■■■■ 3 ■■■■\e[0m\n"
ifconfig
printf "\n\e[93m■■■■ 4 ■■■■\e[0m\n"



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
