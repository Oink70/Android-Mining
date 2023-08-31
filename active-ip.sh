#!/bin/bash

#->  cd ~/ && rm -f ~/active-ip.sh && wget -q https://raw.githubusercontent.com/BLBMS/Android-Mining/main/active-ip.sh && chmod +x active-ip.sh

left3_ip="192.168.100"
active_count=0
inactive_count=0
inactive_ips=""
echo "IP range: {110..118} 130 140 {150..154} {170..175}"
#for ip in {110..120}; do  #test
for ip in {110..118} 130 140 {150..154} {170..175}; do  #dober
    echo -n -e "\r$ip "
    if ping -c 1 -W 1 $left3_ip.$ip &>/dev/null; then
#        echo -e "\e[32mActive  : $ip \e[0m"
        ((active_count++))
    else
        echo -n "? "
        sleep 1
        if ping -c 3 -W 1 $left3_ip.$ip &>/dev/null; then
            echo -e -n "\b\b \b"
            ((active_count++))
        else
            echo -e "\e[31mInactive: $ip \e[0m"
            ((inactive_count++))
            inactive_ips+="$ip\n"
        fi
    fi
done
echo -n -e "\r--------------\n"
echo -e "\e[32mActive  : $active_count \e[0m"
echo -e "\e[31mInactive: $inactive_count \e[0m"
if [ $inactive_count -gt 0 ]; then
    echo -e "Inactive devices:\n$inactive_ips"
# na email - ne dela
#    echo -e "Neaktivne naprave:\n$inactive_ips" | mailx -s "Neaktivne naprave">
fi
