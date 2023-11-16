#
yellow="e\[1;33m"
NC="\033[0m"
domain=$(cat /etc/xray/domain)
tr="$(cat ~/log-install.txt | grep -w "Trojan WS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "\e[1;32m===============[ TRIALL ]===============\033[0m"
echo -e ""
echo -e "Remarks : ${user}"
echo -e "Host/IP : ${domain}"
echo -e "port    : ${tr}"
echo -e "Key     : ${uuid}"
echo -e "Path    : /trojan-ws"
echo -e "Service : trojan-grpc"
echo -e "==========="
echo -e "WS      :"
echo -e "${trojanlink}"
echo -e "==========="
echo -e "GRPC    :"
echo -e "${trojanlink1}"
echo -e "==========="
echo -e "Expired :"
echo -e "$exp"
echo -e "\e[1;32m===============[ THANK ]===============\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
