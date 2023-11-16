domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
echo -e "\e[1;32m===========[ VLESS TRIALL ]============\033[0m"
echo -e " "
echo -e "Remarks   : ${user}"
echo -e "Domain     : ${domain}"
echo -e "port TLS    : $tls"
echo -e "none TLS  : $none,8080"
echo -e "id                 : ${uuid}"
echo -e "Encryption: none"
echo -e "Network    : ws"
echo -e "Path           : /vless"
echo -e "Path           : vless-grpc"
echo -e "MultiPath  : /worryfree , /wss , /patchMode"
echo -e " "
echo -e "=========="
echo -e "Link TLS    : ${vlesslink1}"
echo -e "=========="
echo -e "none TLS  : ${vlesslink2}"
echo -e "=========="
echo -e "GRPC         : ${vlesslink3}"
echo -e "=========="
echo -e "Expired      : $exp"
echo -e "=========="
echo ""
echo "\e[1;36mLunatic\033m[0m"

read -n 1 -s -r -p "Press Enter Back To Menu"

menu
