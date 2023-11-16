domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "[ TLS ]" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w " [ NONE TLS ]" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
bug="masukan_bug"
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
      "host": "${bug}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
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
      "host": "${bug}",
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
echo -e "\e[1;32m==============[ TRIALL ]===============\033[0m"
echo -e " "
echo -e "Remarks   : ${user}"
echo -e "Domain    : ${domain}"
echo -e "Port TLS  : 443 & 8443"
echo -e "Port W S  : 80 & 8080"
echo -e "Port GRPC : 80 , 8080 , 443"
echo -e "id        : ${uuid}"
echo -e "alterId   : 0"
echo -e "Security  : auto"
echo -e "Network   : ws"
echo -e "Path      : /vmess"
echo -e "ServicName: vmess-grpc"
echo -e " "
echo -e "=========="
echo -e "TLS      : "
echo -e "${vmesslink1}"
echo -e "=========="
echo -e "WS       : "
echo -e "${vmesslink2}"
echo -e "=========="
echo -e "GRPC     : "
echo -e "${vmesslink3}"
echo -e "=========="
echo -e "Expired  : "
echo -e "$exp"
echo -e "\e[1;32m==============[ THANKS ]===============\033[0m"
echo ""

read -n 1 -s -r -p "Press any key to back on menu"

menu
