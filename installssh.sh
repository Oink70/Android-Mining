#!/bin/sh



printf "\n\e[93m■■■■ update to blb ssh ■■■■\e[0m\n"
# ------ SSH
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
fi

#cat << EOF > ~/.ssh/authorized_keys
#ssh-rsa AAAAB-i_dont_know_what
#EOF
#chmod 0600 ~/.ssh/authorized_keys
