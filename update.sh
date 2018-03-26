#!/bin/bash

#MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
vps="blangkon";

#if [[ $vps = "zvur" ]]; then
	#source="http://"
#else
	source="http://xhome.tech/debian7"
#fi

log=/var/log/update-script.log

#This colour
cyan='\e[0;36m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'

if [[ $USER != 'root' ]]; then
	echo -e $yellow"Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# go to root
cd

echo -e $yellow "[ ! ]  Proses Updating Script VPS .....  "
echo -e $yellow "[ ! ]  ................     Please wait  "
wget -O /usr/bin/dropmon $source/dropmon.sh >> $log 2>&1
wget -O /usr/bin/menu $source/menu.sh >> $log 2>&1
wget -O /usr/bin/user-add $source/user-add.sh >> $log 2>&1
wget -O /usr/bin/user-add-vpn $source/user-add-vpn.sh >> $log 2>&1
wget -O /usr/bin/user-add-pptp $source/user-add-pptp.sh >> $log 2>&1
wget -O /usr/bin/user-expire $source/user-expire.sh >> $log 2>&1
wget -O /usr/bin/user-gen $source/user-gen.sh >> $log 2>&1
wget -O /usr/bin/user-limit $source/user-limit.sh >> $log 2>&1
wget -O /usr/bin/user-list $source/user-list.sh >> $log 2>&1
wget -O /usr/bin/user-login $source/user-login.sh >> $log 2>&1
wget -O /usr/bin/user-active-list $source/user-active-list.sh >> $log 2>&1
wget -O /usr/bin/user-renew $source/user-renew.sh >> $log 2>&1
wget -O /usr/bin/user-del $source/user-del.sh >> $log 2>&1
wget -O /usr/bin/user-pass $source/user-pass.sh >> $log 2>&1
wget -O /usr/bin/user-expire-list $source/user-expire-list.sh >> $log 2>&1
wget -O /usr/bin/user-banned $source/user-banned.sh >> $log 2>&1
wget -O /usr/bin/unbanned-user $source/unbanned-user.sh >> $log 2>&1
wget -O /usr/bin/delete-user-expire $source/delete-user-expire.sh >> $log 2>&1

chmod +x /usr/bin/dropmon >> $log 2>&1
chmod +x /usr/bin/menu >> $log 2>&1
chmod +x /usr/bin/user-add >> $log 2>&1
chmod +x /usr/bin/user-add-vpn >> $log 2>&1
chmod +x /usr/bin/user-add-pptp >> $log 2>&1
chmod +x /usr/bin/user-expire >> $log 2>&1
chmod +x /usr/bin/user-gen >> $log 2>&1
chmod +x /usr/bin/user-limit >> $log 2>&1
chmod +x /usr/bin/user-list >> $log 2>&1
chmod +x /usr/bin/user-login >> $log 2>&1
chmod +x /usr/bin/user-active-list >> $log 2>&1
chmod +x /usr/bin/user-renew >> $log 2>&1
chmod +x /usr/bin/user-del >> $log 2>&1
chmod +x /usr/bin/user-pass >> $log 2>&1
chmod +x /usr/bin/user-expire-list >> $log 2>&1
chmod +x /usr/bin/user-banned >> $log 2>&1
chmod +x /usr/bin/unbanned-user >> $log 2>&1
chmod +x /usr/bin/delete-user-expire >> $log 2>&1
echo -e $red "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ "
echo -e $red "[ ✔ ]  Script Menu Sudah Terinstall  "
echo -e $red "Terimakasih SUdah Menggunakan Script ./ORangkuatsabahan"
rm update.sh
history -c
