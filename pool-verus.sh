#!/bin/sh

#  wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh && ./pool-verus.sh

# Kateri je novi POOL
new_file="config-verus.json"

# Prenese datotetko s pool VERUS
cd ~/ccminer/
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/$new_file

pool_name="${new_file#*config-}"
pool_name="${pool_name%.json}"

printf "\n\e[93m■■■ new pool: $pool_name ■■■\e[0m\n"

# Ime datoteke s staro vsebino
file="config.json"

# Uporaba grep za iskanje ustreznega niza in izpis vsebine
content=$(grep -o '4wc\..*",' "$file" | sed 's/4wc\.//;s/",//')

# Preverimo, ali je vsebina enaka nizu "BLB"
if [ "$content" = "BLB" ]; then
    echo "Vsebina je enaka nizu BLB."
    printf "\n\e[93m IME DELAVCA: \e[0m"
    read delavec
elif [ -z "$content" ]; then
    echo "Napaka: Delavec ni bil najden v datoteki $file."
    printf "\n\e[93m IME DELAVCA: \e[0m"
    read delavec
else
    echo "Najden delavec je: $content"
    delavec=$content
fi

# Zapiši delavca
cd ~/
rm -f *.ww worker
cat << EOF > ~/worker
EOF
echo $delavec >> ~/worker
cat << EOF > $delavec.ww
EOF

# Zapri vse screene
#screen -ls | grep -o '[0-9]\+\.' | awk '{print $1}' | xargs -I {} screen -X -S {} quit

# Iskanje niza "BLB" in zamenjava z vsebino iz datoteke .ww
sed -i "s/BLB/$delavec/" "$new_file"

#mv -f $new_file $file

# Zažene miner
#~/ccminer/start.sh
