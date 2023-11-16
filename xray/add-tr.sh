#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m           TROJAN ACCOUNT          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[40;1;37m           TROJAN ACCOUNT          \E[0m"
		echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Limit ip : " Limit
read -p "Limit bw : " bw
read -p "Limit quota : " quota
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "\e[1;32m================== [ TRJAN ] ==================\033[0m"
echo -e "Remarks  : ${user}"
echo -e "Limit ip : $Limit [ DEVIC ]"
echo -e "Limit BW : $bw [ GB ]"
echo -e "Limit qut: $quota [ GB ]"
echo -e "Expired  : $exp [ DAYS ]" | tee -a /etc/log-create-user.log
echo -e "\e[1;32m================== [ SERVC ] ==================\033[0m"
echo -e "Host/IP  : ${domain}"
echo -e "port     : 443/80"
echo -e "Key      : ${uuid}"
echo -e "Path     : /trojan-ws"
echo -e "Service  : trojan-grpc"
echo -e ""
echo -e "=========="
echo -e "WS       :"
echo -e "${trojanlink}"
echo -e "=========="
echo -e "GRPC     :"
echo -e "${trojanlink1}"
echo -e "=========="
echo -e ""
echo -e "\e[1;32m================== [THANK ] ==================\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
