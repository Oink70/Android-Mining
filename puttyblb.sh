#!/bin/bash



if [ $# -eq 1 ]; then
    choice_ip=$1
else
    read -r -n 3 -p "putty IP:" choice_ip
fi
putty -ssh blb@192.168.100.$choice_ip -P 8022 -geometry 80x40
echo "  exit"
