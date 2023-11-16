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

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\\E[40;1;37m      Add Xray/Vmess Account      \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
            echo -e "\\E[40;1;37m      Add Xray/Vmess Account      \E[0m"
            echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
v2ray-menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Limit ip : " Limit
read -p "Limit bw : " bw
read -p "Limit quota : " quota
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
acs=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $acs | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "\e[1;32m================== [ VMESS ] ==================\033[0m"
echo -e "Remarks  : ${user}" | tee -a /etc/log-create-user.log
echo -e "Limit dev: $Limit [ IP ]"
echo -e "Limit BW : $bw [ GB ]"
echo -e "Limit qta: $quota [ GB ]"
echo -e "Expired  : $exp [ DAYS ]" | tee -a /etc/log-create-user.log
echo -e "\e[1;32m================== [ SERVC ] ==================\033[0m"
echo -e "Domain   : ${domain}" | tee -a /etc/log-create-user.log
echo -e "TLS      : 443 & 8443" | tee -a /etc/log-create-user.log
echo -e "WS       : 80 & 8080" | tee -a /etc/log-create-user.log
echo -e "GRPC     : 443" | tee -a /etc/log-create-user.log
echo -e "id       : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "alterId  : 0" | tee -a /etc/log-create-user.log
echo -e "Security : auto" | tee -a /etc/log-create-user.log
echo -e "Network  : ws" | tee -a /etc/log-create-user.log
echo -e "Path     : /vmess" | tee -a /etc/log-create-user.log
echo -e "Service  : vmess-grpc" | tee -a /etc/log-create-user.log
echo -e ""
echo -e "=========="
echo -e "TLS       :"
echo -e "${vmesslink1}" | tee -a /etc/log-create-user.log
echo -e "=========="
echo -e "WS        :"
echo -e "${vmesslink2}" | tee -a /etc/log-create-user.log
echo -e "=========="
echo -e "GRPC      :"
echo -e "${vmesslink3}" | tee -a /etc/log-create-user.log
echo -e "=========="
echo -e ""
echo -e "\e[1;32m================== [ THANK ] ==================\033[0m"
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"

menu
