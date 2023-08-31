#!/bin/bash

#->  cd ~/ && rm -f ~/puttyblb.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/puttyblb.sh && chmod +x puttyblb.sh

if [ $# -eq 1 ]; then
    choice=$1
else
    read -r -n 3 -p "putty IP ali ime:" choice
fi
if [[ $choice =~ ^[0-9]+$ ]]; then
    ip=$choice
    device=$(grep -w "$ip" spisek | cut -f 2)
else
    ip=$(grep -F "$choice" spisek | awk -F'\t' '{print $1}')
    device=$choice
fi
if [[ -z "$ip" ]] || [[ -z "$device" ]]; then
    echo "Naprave $device$ip ni v 'spisek'."
    exit 1
else
    echo "Zagon PuTTY za napravo: $device / 192.168.100.$ip"
    putty -ssh blb@192.168.100.$ip -P 8022 -geometry 80x40
    echo "  exit"
fi
