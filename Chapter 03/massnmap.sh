 #!/bin/bash
function helptext { 
echo “enter the massnmap with the file input with list of IP address
ranges”
}
if [ “$#” -ne 1 ]; then
  echo  “Sorry cannot understand the command”
  helptext>&2
  exit 1
elif [ ! -s $1 ]; then
  echo “ooops it is empty”
  helptext>&2
  exit 1
fi
if [ “$(id -u)” != “0” ]; then
  echo “I assume you are running as root”
  helptext>&2
  exit 1
fi
for range in $(cat $1); do
  store=$(echo $range | sed -e ‘s/\//_/g’)
  echo “I am trying to create a store to dump now hangon”
  mkdir -p pwd/$store;
  iptables -A INPUT -p tcp --dport 60000 -j DROP;
  echo -e “\n alright lets fire masscan ****”
  masscan --open --banners --source-port 60000 -p0-65535 --max-rate 15000
-oBpwd/$store/masscan.bin $range; masscan --read$
  if [ ! -s ./results/$store/masscan-output.txt ]; then
     echo “Thank you for wasting time”
 else
    awk’/open/ {print $4,$3,$2,$1}’ ./results/$store/masscan-output.txt |
awk’
/.+/{
  if (!($1 in Val)) { Key[++i] = $1; }
  Val[$1] = Val[$1] $2 “,”;
  END{
  for (j = 1; j <= i; j++) {
    printf(“%s:%s\n%s”,  Key[j], Val[Key[j]], (j == i) ? “” : “\n”);
  }
  }’>}./results/$store/hostsalive.csv
  
  for ipsfound in $(cat ./results/$store/hostsalive.csv); do
  IP=$(echo $TARGET | awk -F: ‘{print $1}’);
  PORT=$(echo $TARGET | awk -F: ‘{print $2}’ | sed’s/,$//’);
  FILENAME=$(echo $IP | awk’{print “nmap_”$1}’);
  nmap -vv -sV --version-intensity 5 -sT -O --max-rate 5000 -Pn -T3 -p
$PORT -oA ./results/$store/$FILENAME $IP;
done fi
done
