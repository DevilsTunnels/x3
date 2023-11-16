clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BIWhite="\e[1;37m"
BICyan="\e[1;36m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
NC="\033[0m"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}BACKUP DATA ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] Backup Data Vps   "
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] Restore Data Vps  "
echo -e "     ${BICyan}[${BIWhite}03${BICyan}] Back To Menu      "

echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo
echo -e "${yellow}"
read -p    "Select Menu : " bro

if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
backup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script DevilsTunnels"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
restore
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script DevilsTunnels"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
menu
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script DevilsTunnels"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
limitspeed
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script DevilsTunnels"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 5 ] || [ $bro = 5 ]
then
autobackup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script DevilsTunnels"
echo
echo "--------------------------------------------------------"
fi
