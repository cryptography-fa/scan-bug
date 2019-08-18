#!/data/data/com.termux/files/usr/bin/bash

m="\033[31;1m"
b="\033[34;1m"
h="\033[32;1m"
k="\033[33;1m"
p="\033[39;1m"
c="\033[35;1m"
pu="\033[36;1m"
clear

load(){
printf "${p}[${c}•${p}]${m}Scaning${p}"
sleep 1
printf "."
sleep 1
printf "."
sleep 1
printf "."
sleep 1 
printf ".\n"
}

banner(){ printf "${p}
${p} ██${m}╗  ${p}██${m}╗ ${p}██████${m}╗ ${p}███████${m}╗${p}████████${m}╗
${p} ██${m}║${p}  ██${m}║${p}██${m}╔═══${p}██${m}╗${p}██${m}╔════╝╚══${p}██${m}╔══╝
${p} ███████${m}║${p}██${m}║ ${p}  ██${m}║${p}███████${m}╗   ${p}██${m}║
${p} ██${m}╔══${p}██${m}║${p}██${m}║  ${p} ██${m}║╚════${p}██${m}║  ${p} ██${m}║
${p} ██${m}║${p}  ██${m}║╚${p}██████${m}╔╝${p}███████${m}║  ${p} ██${m}║
${m} ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝                  "
printf "                    ${p}CHEKER ${b}Version${m}:${pu}3.0\n"
printf "   ${b} Author${m}:${pu}Rusmana-ID\n"
printf "${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
}

search(){
printf "\n${p}[${h}•${p}]${b}INPUT BUG${m}: ${p}"
sleep 1
read scan;
load
nmap -p 80 --script dns-brute.nse $scan > x

cat x | grep $scan | awk {'print $2'} > l
rm x

cat l | grep $scan | awk {'print $1,$4'} > x
rm l

printf "${p}[${h}√${p}]${h}Success..\n"
sleep 2
printf "\n${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
printf "${p}[${h}•${p}]${b}Mulai Scan Bug${p}"
sleep 1
printf "."
sleep 1
printf "."
sleep 1
printf "."
sleep 1 
printf ".\n"
sleep 1
printf "${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
scan_bug
}

scan_bug(){
for URL in `cat x`; do
printf "${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
printf "\n${m}[${h}•${m}]${p}BUG${m}: ${p}"$URL;
printf "\n"
curl -m 10 -s -I $1 "$URL" | grep HTTP/1.1 | awk {'print "\n\033[39;1m[\033[36;1m√\033[39;1m]\033[33;1mStatus\033[31;1m:\033[32;1m " $2,$3'};
done
printf "${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
printf "\n${p}▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
printf "\n"
printf "${b}╭──${m}=>${h}>\n"
printf "${b}╰──────${m}>${p}Ulang Lagi ${pu}[${h}Y${p}/${m}T${pu}]${m}: ${p}"
read rus;
if [ $rus = Y ] || [ $rus = y ];then
bash scan.sh

elif [ $rus = T ] || [ $rus = t ];then
sleep 1
printf "Thanks You *_*\n"
exit

else 
printf "
${h}       ~ ~  ┌${p1}∩${h}┐${k}(${m}◣${p1}_${m}◢${k})${h}┌${p1}∩${h}┐  ~ ~\n"
printf "       ${p}[${m}!${p}]${m} pilihan salah ${p}[${m}!${p}]${k}\n"
sleep 1
exit
fi
}
banner
search