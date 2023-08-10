#!/bin/sh

#  cd ~/ && rm -f pool-verus.sh && wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh && ./pool-verus.sh

# Kateri je novi POOL
new_file="config-verus.json"

# Prenese datotetko s pool VERUS
rm -f $new_file
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/$new_file

pool_name="${new_file#*config-}"
pool_name="${pool_name%.json}"

printf "\n\e[93m■■■ new pool: $pool_name ■■■\e[0m\n"

# Ime datoteke s staro vsebino
file="config.json"

# Iskanje datoteke s končnico .ww
ww_file=$(ls ~/*.ww 2>/dev/null | head -n 1)
#printf "\n\e[93m■■■ .ww: $ww_file ■■■\e[0m\n"

if [ -z "$ww_file" ]; then
    #echo "\n\e[93m Datoteka .ww ne obstaja.\e[0m\n"
   
    # Uporaba grep za iskanje ustreznega niza in izpis vsebine
    content=$(grep -o '4wc\..*",' "$file" | sed 's/4wc\.//;s/",//')
    #printf "\n\e[93m■■■ content: $content ■■■\e[0m\n"

    if [ "$content" = "BLB" ] || [ -z "$content" ]; then
        printf "\n\e[93m Obstoječ delavec ne obstaja.\e[0m"
        printf "\n\e[93m Ime delavca: "
        read delavec
    fi
else
    delavec=$(basename "$ww_file")
    delavec="${delavec%.ww}"
fi

echo "\n\e[93m Delavec je: $delavec \e[0m\n"

# Zapiši delavca
rm -f ~/*.ww ~/worker
cat << EOF > ~/worker
EOF
echo $delavec >> ~/worker
cat << EOF > ~/$delavec.ww
EOF

# Zapri vse screene
screen -ls | grep -o '[0-9]\+\.' | awk '{print $1}' | xargs -I {} screen -X -S {} quit

# Iskanje niza "BLB" in zamenjava z $delavec
sed -i "0,/BLB/ s//$delavec/" "$new_file"

mv -f $(basename "$new_file") ~/ccminer/config.json

# Zažene miner
~/ccminer/start.sh

# Prikaže screen
sleep 2
screen -r
