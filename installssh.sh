#!/bin/sh

#  cd ~/ && rm -f installssh.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/installssh.sh && chmod +x installssh.sh && ./installssh.sh

printf "\n\e[93m■■■■ update to blb ssh ■■■■\e[0m\n"
# ------ SSH
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
fi
rm -f ~/.ssh/authorized_keys
cat << EOF > ~/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAe7mHnisRNUXZ8u5AaeKxm7/ixbaacLWk6S6bpqlEom blb@blb
EOF
chmod 0600 ~/.ssh/authorized_keys
printf "\n\e[93m■■■■ done ■■■■\e[0m\n"
rm -f installssh.sh
