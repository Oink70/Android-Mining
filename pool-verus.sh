#!/bin/sh

#  wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/pool-verus.sh && chmod +x pool-verus.sh && ./pool-verus.sh

# Ime vhodne datoteke
input_file="config.json"

# Ime izhodne datoteke
output_file="config-verus.json"

printf "\n\e[93m■■■ new pool: VERUS.IO ■■■\e[0m"

# Prenese datotetko s pool VERUS
cd ~/ccminer/
wget https://raw.githubusercontent.com/BLBMS/Android-Mining/main/$output_file

# Iskanje vrstice, ki se začne z "user:" in kopiranje do konca datoteke
sed -n '/^"user":/,$p' "$input_file" >> "$output_file"

echo "Nastavitve minerja so bile dodane na konec $output_file."

# Shrani obst. v pool-luck
mv -rf config.json config-luck.json

# Nastavi novo in reset minerja
#xx
cp -rf config-verus.json config.json
#ss
