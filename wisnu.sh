#!bin/bash
clear
rm /var/run/yum.pid &&> /dev/null
mkdir /usr/installer &> /dev/null
clear
echo "Please Wait, Loading Installer..."
yum install perl -y &> /dev/null
yum install curl -y &> /dev/null
systemctl stop NetworkManager
systemctl disable NetworkManager
echo "ClientAliveInterval 3600" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
sudo systemctl reload sshd &> /dev/null
sudo systemctl restart sshd &> /dev/null
clear
clear
echo " _____ ____ ____ _______ __ __"
echo "| __ \ / __ \ / __ \ |__ __| \ \ / /"
echo "| |__) | | | | | | | | | | | \ V / "
echo "| _ / | | | | | | | | | | > < "
echo "| | \ \ | |__| | | |__| | | | / - \ "
echo "|_| \_\ \____/ \____/ |_| /_/ \_\ "
echo "cPanel Unlimited Account With Package Installer"
echo "..................................................."
echo "Please Wait We are Searching Your IP"
echo ""
echo ""
IP=$(wget -qO- https://g2log.in/cPanelAPI/ip.php)
CHK=$(wget -qO- https://g2log.in/cPanelAPI/check.php)
DAT="TRUE"
if [ $CHK == $DAT ]
then
    Subs=$(wget -qO- https://g2log.in/cPanelAPI/suscription.php)
echo "Subscription Type: $Subs"
Vel=$(wget -qO- https://g2log.in/cPanelAPI/validity.php)
echo "Validity: $Vel"
echo "All Set"
echo " "
read -n1 -r -p "Press any key to continue..."
clear
cd FILE=/usr/local/cpanel/cpkeyclt
if test -f "$FILE"
then
    echo "Look Like cPanel Already Installed!"
echo " "
echo "Preparing Server"
yum install gcc-c++ -y &> /dev/null
yum install git -y &> /dev/null
echo "Install Git.. OK"
mkdir /usr/installer &> /dev/null
echo "Installer Ready ..OK"
cd /usr/installer && git clone https://github.com/rofl0r/proxychains-ng.git &> /dev/null
echo "Getting Data .. OK"
sleep 15
cd /usr/installer/proxychains-ng && ./configure &> /dev/null
echo "Config Load .. OK"
clear
sleep 15
cd /usr/installer/proxychains-ng && make && make install &> /dev/null
clear
sleep 15
echo "Config Install .. OK"
cd /usr/installer/proxychains-ng && ./tools/install.sh -D -m 644 libproxychains4.so /usr/local/lib/libproxychains4.so &> /dev/null
sleep 5
echo "Set Config PATH .. OK"
cd /usr/installer/proxychains-ng && ./tools/install.sh -D -m 644 src/proxychains.conf /usr/local/etc/proxychains.conf &> /dev/null
sleep 15
echo "ALL SET .. OK"
cd /usr/local/etc/ && rm proxychains.conf &> /dev/null
sleep 3
cd /usr/local/etc/ && wget https://g2log.in/cPanelAPI/proxychains.conf &> /dev/null
sleep 3
echo "Starting Script."
rm /var/run/yum.pid &> /dev/null
clear
echo " "
echo "Installing Litespeed..."
cd /usr/installer && curl -L -o "lss" "api.rootx.com.bd/litespeed/installer?key=litespeed" &> /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x lss 
echo "File Prox .. OK"
cd /usr/installer && proxychains4 ./lss > /dev/null & LSPX=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$LSPX ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Activator .. OK"
cd
cd /root/ && proxychains4 gblicensels --install > /dev/null & LSP=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$LSP ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "CPO .. OK"
echo "Startup .. OK"
clear
clear
echo "http_proxy=http://ps.webhost.run:3128/" >> /etc/environment
clear
echo "https_proxy=http://ps.webhost.run:3128/" >> /etc/environment
clear
set -a
source /etc/environment
set +a
&> /dev/null
source /etc/environment &> /dev/null
source /etc/environment
clear
echo "Applying Liceness.."
setup=$(wget -qO- https://g2log.in/cPanelAPI/setup.php)
echo "Validity .. OK"
cd /usr/installer && curl -L -o "setup" "$setup" &> /dev/null
echo "Activator .. OK"
echo "Please Wait.."
cd /usr/installer && chmod +x setup > /dev/null
echo "It May Take 4-6 Min.."
cd /usr/installer && ./setup > /dev/null & PID3=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$PID3 ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Done"
cd /usr/installer && wget https://g2log.in/cPanelAPI/cron.sh &> /dev/null
cd /usr/installer && chmod +x cron.sh cat <(crontab -l) <(echo "*/30 * * * * sh /usr/installer/cron.sh") | crontab -
cat <(crontab -l) <(echo "@reboot sh /usr/installer/cron.sh") | crontab -
clear
echo "Install SSL on cPanel" installssl &> /dev/null
clear
clear
printf 'Installing CloudLinux...'
echo ""
echo "Please Wait Few Min DO NOT CLOSE"
echo ""
echo ""
cd /usr/installer && curl -L -o "clx" "api.rootx.com.bd/cloudlinux/installer?key=cloudlinux" &> /dev/null
echo "Getting File"
cd /usr/installer && chmod +x clx > /dev/null
echo "Wait"
echo "Downloading OS"
cd /usr/installer && ./clx > /dev/null
echo "Big File Size .. Downloading.."
cd /root && gblicensecx --install > /dev/null & CLX=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$CLX ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
cd /root && gblicensecx --install > /dev/null
echo "Insaller .. Runing"
cd /usr/installer && ./clx &> /dev/null
kill "$!" # kill the spinner
clear
echo " "
echo " "
echo " "
echo " "
echo " "
echo "Installing WHMReseller..."
cd /usr/installer && curl -L -o "whm" "api.rootx.com.bd/whmreseller/installer?key=whmreseller" &> /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x whm > /dev/null
echo "File Prox .. OK"
cd /usr/installer && ./whm > /dev/null
echo "Activator .. OK"
cd /root/ && gblicensewr --install > /dev/null & WHM=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$WHM ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "CPO .. OK" cd /usr/installer && ./whm &> /dev/null
echo "Startup .. OK"
clear
echo ""
echo " "
echo " "
echo " "
echo " "
echo "Installing Imunify360..."
cd /usr/installer && curl -L -o "i360" "api.rootx.com.bd/imunify360/installer?key=imunify360" > /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x i360 > /dev/null
cd /usr/installer && ./i360 > /dev/null
echo "File Prox .. OK"
echo "Please Wait..."
cd /root/ && gblicenseim360 --install > /dev/null & IsexTY=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$IsexTY ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Startup .. OK"
cd /usr/installer && ./i360 &> /dev/null
echo "Activator .. OK"
clear
echo "Installing Softaculous..."
cd /usr/installer && curl -L -o "sluf" "api.rootx.com.bd/softaculous/installer?key=softaculous" &> /dev/null
echo "Getting Installer .. OK"
chmod +x sluf
echo "Server Status .. OK"
cd /usr/installer && ./sluf > /dev/null
echo "Activator .. Loaded"
cd /root/ && gblicensesc --install > /dev/null & SOFTC=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$SOFTC ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Please Wait..."
cd /root/ && gblicensesc --install > /dev/null
cd /usr/installer && ./sluf &> /dev/null
clear
cd
echo "Installing FleetSSL..."
echo ""
sleep 15
echo "Done"
echo ""
clear
echo "Installing JetBackup..."
cd /usr/installer && curl -L -o "jbb" "api.rootx.com.bd/jetbackup/installer?key=jetbackup" &> /dev/null
echo "Getting Mirror .. OK"
cd /usr/installer && chmod +x jbb > /dev/null
echo "Trying Mirror 2 .. OK"
cd /usr/installer && ./jbb > /dev/null 
echo "Activator .. Loaded"
cd /root/ && gblicensejp --install > /dev/null & JBBD=$! i=1 sp="/-\|"
echo -n ' ' 
while [ -d /proc/$JBBD ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Installation .. Added"
cd /root/ && gblicensejp --install > /dev/null & JBBDxx=$! i=1 sp="/-\|"
echo -n ' ' 
while [ -d /proc/$JBBDxx ] 
do
    printf "\b${sp:i++%${#sp}:1}"
done
cd
clear
yum remove ea-apache24-mod_ruid2 -y
clear
cd echo " "
echo " "
echo " "
echo " "
echo "Done."
echo "Installation Successfully Completed. Login cPanel Using root And Its Password."
echo "Rebooting Your Server..."
cd /usr/installer/ && rm setup clx whm lss i360 latest sluf jbb &> /dev/null
reboot exit fi
yum install curl -y &> /dev/null
yum install wget -y &> /dev/null
cd /usr/installer && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
clear
clear
echo "Preparing Server"
yum install gcc-c++ -y &> /dev/null
yum install git -y &> /dev/null
echo "Install Git.. OK"
mkdir /usr/installer &> /dev/null
echo "Installer Ready ..OK"
cd /usr/installer && git clone https://github.com/rofl0r/proxychains-ng.git &> /dev/null
echo "Getting Data .. OK"
sleep 15
cd /usr/installer/proxychains-ng && ./configure &> /dev/null
echo "Config Load .. OK"
clear
sleep 15
cd /usr/installer/proxychains-ng && make && make install &> /dev/null
clear
sleep 15
echo "Config Install .. OK"
cd /usr/installer/proxychains-ng && ./tools/install.sh -D -m 644 libproxychains4.so /usr/local/lib/libproxychains4.so &> /dev/null
sleep 5
echo "Set Config PATH .. OK"
cd /usr/installer/proxychains-ng && ./tools/install.sh -D -m 644 src/proxychains.conf /usr/local/etc/proxychains.conf &> /dev/null
sleep 15
echo "ALL SET .. OK"
cd /usr/local/etc/ && rm proxychains.conf &> /dev/null
sleep 3
cd /usr/local/etc/ && wget https://g2log.in/cPanelAPI/proxychains.conf &> /dev/null
sleep 3
echo "Starting Script."
clear
echo " "
echo "Installing Litespeed..."
cd /usr/installer && curl -L -o "lss" "api.rootx.com.bd/litespeed/installer?key=litespeed" &> /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x lss
echo "File Prox .. OK"
cd /usr/installer && proxychains4 ./lss &> /dev/null & LSPX=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$LSPX ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Activator .. OK"
sleep 15
cd
cd /root/ && proxychains4 gblicensels --install &> /dev/null & LSP=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$LSP ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "CPO .. OK"
echo "Startup .. OK"
clear
echo "http_proxy=http://ps.webhost.run:3128/" >> /etc/environment
clear
echo "https_proxy=http://ps.webhost.run:3128/" >> /etc/environment
clear
set -a
source /etc/environment
set +a
&> /dev/null
source /etc/environment &> /dev/null
source /etc/environment . /etc/environment &> /dev/null
clear
setup=$(wget -qO- https://g2log.in/cPanelAPI/setup.php)
echo "Validity .. OK"
cd /usr/installer && curl -L -o "setup" "$setup" &> /dev/null
echo "Activator .. OK"
echo "Please Wait.."
cd /usr/installer && chmod +x setup > /dev/null
echo "It May Take 4-6 Min.."
cd /usr/installer && ./setup > /dev/null & PID3=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$PID3 ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Done"
cd /usr/installer && wget https://g2log.in/cPanelAPI/cron.sh &> /dev/null 
cd /usr/installer && chmod +x cron.sh cat <(crontab -l) <(echo "*/30 * * * * sh /usr/installer/cron.sh") | crontab -
cat <(crontab -l) <(echo "@reboot sh /usr/installer/cron.sh") | crontab -
clear
echo "Install SSL on cPanel" installssl &> /dev/null
clear
echo " "
echo " "
echo " "
clear
printf 'Installing CloudLinux...'
echo ""
echo "Please Wait Few Min DO NOT CLOSE"
echo ""
echo ""
cd /usr/installer && curl -L -o "clx" "api.rootx.com.bd/cloudlinux/installer?key=cloudlinux" &> /dev/null
echo "Getting File"
cd /usr/installer && chmod +x clx > /dev/null
echo "Wait"
echo "Downloading OS"
cd /usr/installer && ./clx > /dev/null
echo "Big File Size .. Downloading.."
cd /root && gblicensecx --install > /dev/null & CLX=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$CLX ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
cd /root && gblicensecx --install > /dev/null
echo "Insaller .. Runing"
cd /usr/installer && ./clx &> /dev/null
kill "$!" # kill the spinner
clear
echo " "
echo " "
echo " "
echo " "
echo " "
echo "Installing WHMReseller..."
cd /usr/installer && curl -L -o "whm" "api.rootx.com.bd/whmreseller/installer?key=whmreseller" &> /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x whm &> /dev/null
echo "File Prox .. OK"
cd /usr/installer && ./whm &> /dev/null
echo "Activator .. OK"
cd /root/ && gblicensewr --install > /dev/null & WHM=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$WHM ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "CPO .. OK"
cd /usr/installer && ./whm &> /dev/null
echo "Startup .. OK"
echo ""
echo " "
echo " "
echo " "
echo " "
echo "Installing Imunify360..."
cd /usr/installer && curl -L -o "i360" "api.rootx.com.bd/imunify360/installer?key=imunify360" &> /dev/null
echo "PTC Server .. OK"
cd /usr/installer && chmod +x i360 &> /dev/null
cd /usr/installer && ./i360 > /dev/null
echo "File Prox .. OK"
echo "Please Wait..."
cd /root/ && gblicenseim360 --install > /dev/null & IsexTY=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$IsexTY ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Startup .. OK"
cd /usr/installer && ./i360 > /dev/null
echo "Activator .. OK"
clear
echo "Installing Softaculous..."
cd /usr/installer && curl -L -o "sluf" "api.rootx.com.bd/softaculous/installer?key=softaculous" &> /dev/null
echo "Getting Installer .. OK"
chmod +x sluf
echo "Server Status .. OK"
cd /usr/installer && ./sluf &> /dev/null
echo "Activator .. Loaded"
cd /root/ && gblicensesc --install > /dev/null & SOFTC=$! i=1 sp="/-\|"
echo -n ' '
while [ -d /proc/$SOFTC ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Please Wait..." 
cd /root/ && gblicensesc --install > /dev/null 
cd /usr/installer && ./sluf &> /dev/null
clear
cd
echo "Installing FleetSSL..."
echo ""
sleep 15
echo "Done"
echo ""
clear
echo "Installing JetBackup..."
cd /usr/installer && curl -L -o "jbb" "api.rootx.com.bd/jetbackup/installer?key=jetbackup" &> /dev/null
echo "Getting Mirror .. OK"
cd /usr/installer && chmod +x jbb &> /dev/null
echo "Trying Mirror 2 .. OK"
cd /usr/installer && ./jbb &> /dev/null
echo "Activator .. Loaded"
cd /root/ && gblicensejp --install > /dev/null & JBBD=$! i=1 sp="/-\|"
echo -n ' ' 
while [ -d /proc/$JBBD ]
do
    printf "\b${sp:i++%${#sp}:1}"
done
echo "Installation .. Added"
cd /root/ && gblicensejp --install > /dev/null & JBBDxx=$! i=1 sp="/-\|"
echo -n ' ' 
while [ -d /proc/$JBBDxx ] 
do
    printf "\b${sp:i++%${#sp}:1}"
done
clear
echo "Error Fixing.. Runing"
clear
clear
cd
clear
yum remove ea-apache24-mod_ruid2 -y
clear
echo " "
echo " "
echo " "
echo "Done."
echo "Installation Successfully Completed. Login cPanel Using root And Its Password."
echo "Rebooting Your Server..." 
cd /usr/installer/ && rm setup clx whm lss i360 latest sluf jbb &&> /dev/null
reboot else
clear
echo " "
echo " "
echo " "
echo " "
echo "You don't have any Subscription"
echo "Please Buy Liceness For Your VPS"
echo ""
exit fi
