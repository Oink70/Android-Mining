#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBy6kORm+ECh2Vp1j3j+3F1Yg+EXNWY07HbP7dLZd/rqtdvPz8uxqWdgKBtyeM7R9AC1MW87zuCmss8GiSp2ZBIcpnr8kdMvYuI/qvEzwfY8pjvi2k3b/EwSP2R6/NqgbHctfVv1c7wL0M7myP9Zj7ZQPx+QV9DscogEEfc968RcV9jc+AgphUXC4blBf3MykzqjCP/SmaNhESr2F/mSxYiD8Eg7tTQ64phQ1oeOMzIzjWkW+P+vLGz+zk32RwmzX5VJBLZt7QR01HkLhTVTjSjve/6vNWJHwI3yxMI5Q3TGiuEVINMJiP0sp6cr8xRe7Ix24a1ZAc3fdu0z658JXKN rsa-key-20190820
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-1/ccminer
wget https://raw.githubusercontent.com/Oink70/Android-Mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#wipe any existing (dead) screens)
screen -wipe
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line xx and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
