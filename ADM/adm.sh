#!/bin/bash
if [ $(id -u) -eq 0 ]
then
clear
else
if echo $(id) |grep sudo > /dev/null
then
clear
echo "Voce não é root"
echo "Seu usuario esta no grupo sudo"
echo -e "Para virar root execute \033[1;31msudo su\033[0m"
exit
else
clear
echo -e "nao e root"
exit
 fi
fi
clear
echo -e "\033[1;31mEsse e o Instalador \033[1;36mADM.PRO \033[1;31mScripts"
sleep 3s
echo -e "\033[1;31m
Concorda em Instalar o ADM.PRO?\033[0m"
read -p "[S/N]: " term
case $term in
(s|S)
echo -e "\033[1;34mPerfeito!"
sleep 0.5s
echo -e "\033[1;36mADM.PRO \033[1;34mSERA INSTALADO!\033[0m"
sleep 3s
;;
*)
echo -e "\033[1;31mInstalacao Cancelada pelo usuário!\033[0m"
rm -rf /root/adminst*
sleep 3s
exit
;;
esac
echo -e "\033[1;31mDigite Sua Key!\033[0m"
read -p "KEY: " key
ke1=$(echo $key | awk -F ":" '{print $1}')
ke2=$(echo $key | awk -F ":" '{print $2}')
cd /root/
wget http://admmanager.pro/instalador/$ke1/$ke2/lista -o /dev/null
if [ -e /root/lista ]; then
echo "$key" > /bin/admkey
#Lista#
touch /bin/admuninst
for lista in `cat /root/lista`
do
cd /root/
wget http://admmanager.pro/instalador/adm/$lista -o /dev/null
lst=$(echo $lista | awk -F "/" '{print $3}')
mv -f /root/$lst /bin/$lst
chmod 777 /bin/$lst
echo "$lst" >> /bin/admuninst
done
else
echo -e "\033[1;31mKey: $key Invalida!\033[0m"
rm -rf /root/lista
sleep 7s
exit
fi
while true; do
clear
echo -e "ADM.PRO \033[1;31mScripts"
sleep 1.5s
echo -e "\033[1;36mAGORA ESCOLHA QUAL SISTEMA ADM.PRO QUER?\033[0m"
echo -e "\033[1;31m| 1 |\033[1;36m ADM.PRO OPENSSH & SQUID"
echo -e "\033[1;31m| 2 |\033[1;36m ADM.PRO DROPBEAR"
echo -e "\033[1;31mESCOLHA SUA OPÇÃO!\033[0m"
read -p "OPÇÃO [1-2]: " options
echo -e "\033[1;33mINSTALANDO, AGUARDE A INSTALACAO PODE DEMORAR!\033[0m"
case $options in
1)
is="1"
break
;;
2)
is="2"
break
;;
esac
done
apt-get update -y 1>/dev/null 2>/dev/null 
apt-get upgrade -y 1>/dev/null 2>/dev/null
apt-get install zip -y 1>/dev/null 2>/dev/null
apt-get install yum -y 1>/dev/null 2>/dev/null
apt-get install figlet -y 1>/dev/null 2>/dev/null
apt-get install bc -y 1>/dev/null 2>/dev/null
apt-get install nload -y 1>/dev/null 2>/dev/null
apt-get install wget curl python python3 nano -y 1>/dev/null 2>/dev/null
mv -f /bin/ovpn /root/ovpn
mv -f /bin/adm3 /root/adm3
mv -f /bin/adm3fun /root/adm3fun
mv -f /bin/atualiz /root/atualiz
mod () {
if [ "$4" != "" ]; then
echo -e "\033[1;31mNao Ha Mais de 3 Modulos\033[0m"
else
rm -rf /root/modulo
touch /root/modulo
if [ "$1" = "1" ]; then
echo "1" >> /root/modulo
fi
if [ "$1" = "2" ]; then
echo "2" >> /root/modulo
fi
if [ "$1" = "3" ]; then
echo "3" >> /root/modulo
fi
if [ "$2" = "1" ]; then
echo "1" >> /root/modulo
fi
if [ "$2" = "2" ]; then
echo "2" >> /root/modulo
fi
if [ "$2" = "3" ]; then
echo "3" >> /root/modulo
fi
if [ "$3" = "1" ]; then
echo "1" >> /root/modulo
fi
if [ "$3" = "2" ]; then
echo "2" >> /root/modulo
fi
if [ "$3" = "3" ]; then
echo "3" >> /root/modulo
fi
 fi
}
touch /root/modulo
while true; do
clear
echo -e "\033[1;31mSELECIONE OS MODULOS DA INSTALACAO!\033[0m"
echo -e "\033[1;33m
[ \033[1;31minstalar\033[1;33m ] GERENCIAR USUARIOS (\033[1;31mComando adm\033[1;33m)
[ \033[1;31minstalar\033[1;33m ] GERENCIAR VPS (\033[1;31mComando adm2\033[1;33m)\033[0m"
ko=$(cat /root/modulo |egrep -o "1")
ko1=$(cat /root/modulo |egrep -o "2")
ko2=$(cat /root/modulo |egrep -o "3")
if [ "$ko" = "" ]; then
echo -e "\033[1;33m[ 1 ] FERRAMENTAS (\033[1;31mComando adm3\033[1;33m)\033[0m"
else
echo -e "\033[1;33m[ \033[1;31minstalar\033[1;33m ] FERRAMENTAS (\033[1;31mComando adm3\033[1;33m)\033[0m"
fi
if [ "$ko1" = "" ]; then
echo -e "\033[1;33m[ 2 ] OPENVPN (\033[1;31mComando menu\033[1;33m)\033[0m"
else
echo -e "\033[1;33m[ \033[1;31minstalar\033[1;33m ] OPENVPN (\033[1;31mComando menu\033[1;33m)\033[0m"
fi
if [ "$ko2" = "" ]; then
echo -e "\033[1;33m[ 3 ] ATUALIZACAO (\033[1;31mComando menu\033[1;33m)\033[0m"
else
echo -e "\033[1;33m[ \033[1;31minstalar\033[1;33m ] ATUALIZACAO (\033[1;31mComando menu\033[1;33m)\033[0m"
fi
echo -e "\033[1;36mSELECIONE OS MODULOS DIGITANDO AS OPÇOES:\033[1;31m
1 2 3
2 3
1 3
\033[1;36m(Para Prosseguir Digite: \033[1;31mcontinuar\033[1;36m)\033[0m"
echo ""
read -p "Opçoes: " select
case $select in
(Continuar|continuar)
break
;;
*)
mod $select
;;
esac
done
if [ "$is" = "1" ]; then
squid-inst
echo "1" > /bin/instalacao
chmod 777 /bin/instalacao
fi
if [ "$is" = "2" ]; then
dropb-inst
echo "2" > /bin/instalacao
chmod 777 /bin/instalacao
fi
if [ -d /etc/adm ]; then
echo ""
else
mkdir /etc/adm
fi
if [ -d /etc/adm/usuarios ]; then
echo ""
else
mkdir /etc/adm/usuarios
fi
if [ -d /etc/adm/modulo ]; then
echo ""
else
mkdir /etc/adm/modulo
fi
for instal in `cat /root/modulo`
do
if [ "$instal" = "1" ]; then
mv -f /root/adm3 /bin/adm3
mv -f /root/adm3fun /bin/adm3fun
fi
if [ "$instal" = "2" ]; then
mv -f /root/ovpn /bin/ovpn
fi
if [ "$instal" = "3" ]; then
mv -f /root/atualiz /bin/atualiz
fi
done
rm -rf /root/*
echo -e "\033[1;31mSEU SISTEMA ADM.PRO FOI INSTALADO COM SUCESSO!\033[0m"
echo -e "\033[1;33mCOMANDOS!\033[0m"
if [[ -e /bin/menu ]]; then
echo -e "\033[1;31mmenu\033[0m"
fi
if [[ -e /bin/adm ]]; then
echo -e "\033[1;31madm\033[0m"
fi
if [[ -e /bin/adm2 ]]; then
echo -e "\033[1;31madm2\033[0m"
fi
if [[ -e /bin/adm3 ]]; then
echo -e "\033[1;31madm3\033[0m"
fi
echo -e "\033[1;36mOBRIGADO POR UTILIZAR O ADM.PRO\033[0m"
exit