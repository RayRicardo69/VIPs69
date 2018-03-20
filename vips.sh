#!/bin/bash

cyan='\e[0;36m' 
green='\e[0;34m' 
okegreen='\033[92m' 
lightgreen='\e[1;32m' 
white='\e[1;37m' 
red='\e[1;31m' 
yellow='\e[1;33m' 
BlueF='\e[1;34m'

http(){
    read -p "  Country Code : " -e country
    read -p "  Limit : " -e limit
	A="proxybroker find --types HTTP --lvl High Anonymous --countries "$country" --limit "$limit" --outfile ./http.txt"
	$A
}
https(){
	read -p "  Country Code: " -e country
	read -p "  Limit : " -e limit
	B="proxybroker find --types HTTPS --lvl High Anonymous --countries "$country" --limit "$limit" --outfile ./https.txt"
    $B
}
socks5(){
	read -p "  Country Code : " -e country
	read -p "  Limit : " -e limit
    C="proxybroker find --types SOCKS5 --lvl High Anonymous --countries "$country" --limit "$limit" --outfile ./socks5.txt"
    $C
}
socks4(){
	read -p "  Country Code : " -e country
	read -p "  Limit : " -e limit
    D="proxybroker find --types SOCKS4 --lvl High Anonymous --countries "$country" --limit "$limit" --outfile ./socks4.txt"
    $D
}
check(){
   read -p "File : " -e check
   myArray=($(cat $check))
   total=${#myArray[*]}
   touch tempfile
   for (( i=0; i<=$(( $total -1 )); i++ ))
   do
      echo ${myArray[i]} > tempfile
	  IP=`grep -oE "\b([0-9]{1,3}\.){3}[0-9:]{1,3}\b" tempfile | sed "s~:[0-9]*~~g"`
	  echo $IP
	  if [[ "$IP" > "" ]]; then
         exe='curl http://ipinfo.io/'$IP' -s'
         GET=("$exe")
         $GET
         echo ""
         
      fi
   done
}
update(){
    run=`bash setup.sh`
    $run
}
clear

echo -e ""
echo -e $cyan"  ██╗   ██╗██╗██████╗  ██████╗ █████╗ " 
echo -e $cyan"  ██║   ██║██║██╔══██╗██╔════╝██╔══██╗"
echo -e $cyan"  ██║   ██║██║██████╔╝███████╗╚██████║"
echo -e $cyan"  ╚██╗ ██╔╝██║██╔═══╝ ██╔═══██╗╚═══██║"
echo -e $cyan"   ╚████╔╝ ██║██║     ╚██████╔╝█████╔╝"
echo -e $cyan"    ╚═══╝  ╚═╝╚═╝  V.1 ╚═════╝ ╚════╝ "
echo -e $white"  ████████████████████████████████████"
echo -e $white"  ██           PROXYs TOOL          ██"                                            
echo -e $white"  ████████████████████████████████████"
echo -e $cyan"   Coded By Ray Ricardo"
echo -e $white"  ____________________________________"
echo -e ""
echo -e $white"  ["$red"1"$white"] "$lightgreen"Search Proxy/Socks"
echo -e $white"  ["$red"2"$white"] "$lightgreen"Check Proxy/Socks"
echo -e $white"  ["$red"3"$white"] "$lightgreen"Update"
echo -e ""
echo -e $white"  ┌─["$cyan"VIPs69"$white"]──[~]─[menu]:"$white
read -p "  └─────► " -e menu
if [[ $menu = 1 ]]; then
	 echo -e $white"  ["$red"1"$white"] "$lightgreen"HTTP"
     echo -e $white"  ["$red"2"$white"] "$lightgreen"HTTPS"
     echo -e $white"  ["$red"3"$white"] "$lightgreen"Socks4"
     echo -e $white"  ["$red"4"$white"] "$lightgreen"Socks5"
     echo -e $white"  ┌─["$cyan"VIPs69"$white"]──[~]─[menu]:"$white
     read -p "  └─────► " -e menuA
     if [[ $menuA = 1 ]]; then
     	http
     	echo -e $okegreen "  Done!"
     	echo "   Saved in file http.txt"
     elif [[ $menuA = 2 ]]; then
     	https
     	echo -e $okegreen "  Done!"
        echo "   Saved in file https.txt"
     elif [[ $menuA = 3 ]]; then
     	socks4
     	echo -e $okegreen "Done!"
     	echo "   Saved in file socks4.txt"
     elif [[ $menuA = 4 ]]; then
        socks5
        echo -e $okegreen "  Done!"
        echo "   Saved in file socks5.txt"

     fi
elif [[ $menu = 2 ]]; then
 	check
elif [[ $menu = 3 ]]; then
    update
else
	echo "ERROR : Command Not Found"
fi
#grep -oE "\b([0-9]{1,3}\.){3}[0-9:]{1,3}\b" target.txt | sed "s~:[0-9]*~~g" 
