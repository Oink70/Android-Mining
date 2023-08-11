#!/bin/sh
printf "\n\e[93m■■■■ pododabljam ubuntu ■■■■\e[0m\n"
apt-get -y update
apt-get -y upgrade
apt install -y libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
# original
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
# naprej
printf "\n\e[93m■■■■ zapiram miner - screen ■■■■\e[0m\n"
# screen -X -S CCminer quit
# Zapri vse screene
screen -ls | grep -o '[0-9]\+\.' | awk '{print $1}' | xargs -I {} screen -X -S {} quit
printf "\n\e[93m■■■■ prenašam novo verzijo ■■■■\e[0m\n"
cd ~/ccminer
# breišem starega
rm -f ccminer
#                                                                         <- tu zamnejaj v NOVO verzijo + spodaj v mv!!
wget -q https://github.com/BLBMS/Android-Mining/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM
mv ccminer-3.8.3-4_ARM ccminer
chmod +x ccminer
# posadabljanje start.sh
printf "\n\e[93m■■■■ posadabljam start.sh ■■■■\e[0m\n"
rm -f start.sh
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#wipe any existing (dead) screens from last session
screen -wipe 1>/dev/null 2>&1
#check if ccminer is allready running
if screen -ls | grep -i ccminer;
then
  printf "\n\e[93m■■■ CCminer is running! ■■■\e[0m\n"
else
  printf "\n\e[93m■■■ Starting CCminer! ■■■\e[0m\n"
  #exit existing screens with the name CCminer
  screen -S CCminer -X quit 1>/dev/null 2>&1
  #wipe any existing (dead) screens)
  screen -wipe 1>/dev/null 2>&1
  #create new disconnected session CCminer
  screen -dmS CCminer 1>/dev/null 2>&1
  #run the miner
  screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n" 1>/dev/null 2>&1
fi
printf "\n\e[93mss = start ccminer\n"
printf "xx = kill screen\n"
printf "sl = list screen\n"
printf "rr = show screen\n"
printf "exit: CTRL-a + d\e[0m\n"
EOF
chmod +x start.sh
printf "\n\e[93m■■■■ posodobljeno + zagon minerja ■■■■\e[0m\n"
cd ~/ccminer
./start.sh
