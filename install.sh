#!/bin/sh
apt install sudo
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1ahSWlirIclBWm7bty6oj1rUKBKgzHSSel9hkB7UCrHKapGIpDrmdqCajBARcihft0ISGJgEd3OFhgPddC8w4VkOf+FmGqF1WCNBDwBgHRP3xiHTzkA20wbyhojB77ueraU/rOpkPSpRcEfNjgBi4vujnCG1LXX9ag6rPBzYiuTOc2b002BkHRO/Dk+zbKMMh2MYcEJs1Op9z3mxAn+TDuNbDKXk/+1jFmliwMiar8gJU8gXYmuZ8kYKDGEXTOlrDPRQvV+zfjwaV09UV9uLwNY83LuEjeEbwgaynw9r36yeabc+ifKJyZ30uKVq66dzXiUXQVd1myT/zz7SLpXx2EBSKRhuVSfLlqvS+aRV9riNMdL92VJEnCmjAWfkXXARlP28Nr2mjR3SIPD289F1zjgKE+dJ/UZ9L7AulmhMlAUtrAqst+i+FlE1uOqPyhQzk5RrhuBrXFwNHBgxU/W65peVDEq9bogT/lxxX2Gqn29Po2/1qmn8OG5bgoK3gwef2h4zJc9f4YQySsuRspMyUK+jhmVXXN1LJzXbS1wAZkLIoh+kdT3a+p4S3lv09RqX3sB5WAtUs8MjBbUrD5hJT//6WxaPD30I09sUXSYBHbKkXbzoqToNN8ftMeVvbGfbfVRfI31OLmAd/ZJPZ1wYBFw0Pt6XkyUMRvRdc02tesQ== gmine777x@gmail.com
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/BLBMS/Android-Mining/releases/download/v3.8.3-3/ccminer-3.8.3-3_ARM
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/config.json
mv ccminer-3.8.3-3_ARM ccminer
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit 1>/dev/null 2>&1
#wipe any existing (dead) screens)
screen -wipe 1>/dev/null 2>&1
#create new disconnected session CCminer
screen -dmS CCminer 1>/dev/null 2>&1
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n" 1>/dev/null 2>&1
printf '\nMining started.\n'
printf '===============\n'
printf '\nManual:\n'
printf 'start: ~/.ccminer/start.sh\n'
printf 'stop: screen -X -S CCminer quit\n'
printf '\nmonitor mining: screen -x CCminer\n'
printf "exit monitor: 'CTRL-a' followed by 'd'\n\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
