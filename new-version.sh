#!/bin/sh
printf "\e[93m■■■■ pododabljam ubuntu ■■■■\e[0m"
apt-get -y update
apt-get -y upgrade
# apt install -y libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
# original
sudo apt-get -y update
sudo apt-get -y upgrade
# sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
# naprej
printf "\e[93m■■■■ zapiram miner - screen ■■■■\e[0m"
screen -X -S CCminer quit
printf "\e[93m■■■■ prenašam novo verzijo ■■■■\e[0m"
cd ~/ccminer
# breišem starega
rm -fr ccminer
#                                                                         <- tu zamnejaj v NOVO verzijo + spodaj v mv!!
wget https://github.com/BLBMS/Android-Mining/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM
mv ccminer-3.8.3-4_ARM ccminer
chmod +x ccminer
printf "\e[93m■■■■ posadabljam start.sh ■■■■\e[0m"
rm -f start.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#wipe any existing (dead) screens from last session
screen -wipe 1>/dev/null 2>&1
#check if ccminer is allready running
if screen -ls | grep -i ccminer; then echo "... CCminer is running! ..."; exit 0; fi
#exit existing screens with the name CCminer
screen -S CCminer -X quit 1>/dev/null 2>&1
#wipe any existing (dead) screens)
screen -wipe 1>/dev/null 2>&1
#create new disconnected session CCminer
screen -dmS CCminer 1>/dev/null 2>&1
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n" 1>/dev/null 2>&1
#printf '\nManual:\n'
#printf 'start       : ss  or  ~/.ccminer/start.sh\n'
#printf 'stop        : xx  or  screen -X -S CCminer quit\n'
#printf '\nmonitoring: rr  or  screen -x CCminer\n'
#printf "exit monitor: 'CTRL-a' followed by 'd'\n"
printf "\nrr = show screen\n"
printf "xx = kill screen\n"
printf "alias       : sl = list screen\n"
printf "alias       : ss = start ccminer\n"
EOF
chmod +x start.sh
printf "\e[93m■■■■ posodobljeno + zagon start.sh ■■■■\e[0m"
cd ~/ccminer
# test node ./start.sh
