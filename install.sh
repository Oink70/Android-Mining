#!/bin/sh
#ne dela na vseh - zato 2x
apt install sudo
apt-get -y update
apt-get -y upgrade
apt install -y libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
#original
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
#naprej
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB-i_dont_know_what
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/BLBMS/Android-Mining/releases/download/v3.8.3-4/ccminer-3.8.3-4_ARM
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/config.json
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/posodobi.sh
mv ccminer-3.8.3-4_ARM ccminer
chmod +x ccminer
chmod +x posodobi.sh
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
# zamenjava imena delavca v .json
nano ~/ccminer/config.json
cd ~/ccminer
ls
printf "\n\e[93mss = start ccminer\n"
printf "xx = kill screen\n"
printf "sl = list screen\n"
printf "rr = show screen\e[0m\n"
