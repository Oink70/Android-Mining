#!/bin/bash

#   cd ~/ && rm -f install-in-termux.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/install-in-termux.sh && chmod +x install-in-termux.sh && ./install-in-termux.sh

printf "\n\e[93m■■■■ nastavitve v TERMUX ■■■■\e[0m\n"
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
