#!/bin/bash

cd ~

#Factor
cp /home/user/CodeServer/ZabbixAgent2/Go/Factor/factor /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor/zabbix-agent2/etc/zabbix_agent2/plugins/
sudo chmod +x /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor/zabbix-agent2/etc/zabbix_agent2/plugins/factor

#Factor + Traffic
cp /home/user/CodeServer/ZabbixAgent2/Go/Factor/factor /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2/etc/zabbix_agent2/plugins/
cp /home/user/CodeServer/ZabbixAgent2/Go/Traffic/traffic /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2/etc/zabbix_agent2/plugins/trafficStatus
sudo chmod +x /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2/etc/zabbix_agent2/plugins/factor
sudo chmod +x /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2/etc/zabbix_agent2/plugins/trafficStatus

#Factor + Traffic 192.168.4.100, 192.168.4.20, 192.168.4.30
cp /home/user/CodeServer/ZabbixAgent2/Go/Factor/factor /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2/etc/zabbix_agent2/plugins/
cp /home/user/CodeServer/ZabbixAgent2/Go/Traffic/traffic /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2/etc/zabbix_agent2/plugins/trafficStatus
sudo chmod +x /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2/etc/zabbix_agent2/plugins/factor
sudo chmod +x /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2/etc/zabbix_agent2/plugins/trafficStatus

rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor/zabbix-agent2.deb
rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2.deb
rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2.deb

sudo chown -R root:root /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor/
sudo chown -R root:root /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/
sudo chown -R root:root /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/

#Build DEB Factor
cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor
dpkg-deb --build ./zabbix-agent2

#Build DEB Factor + Traffic
cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic
dpkg-deb --build ./zabbix-agent2

#Build DEB Factor + Traffic 192.168.4.100, 192.168.4.20, 192.168.4.30
cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk
dpkg-deb --build ./zabbix-agent2


rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Factor/zabbix-agent2.tar.gz
rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Factor/zabbix-agent2/debpkg/zabbix-agent2.deb

rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic/zabbix-agent2.tar.gz
rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic/zabbix-agent2/debpkg/zabbix-agent2.deb

rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic_Irkutsk/zabbix-agent2.tar.gz
rm -R /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic_Irkutsk/zabbix-agent2/debpkg/zabbix-agent2.deb

cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Factor/zabbix-agent2.deb /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Factor/zabbix-agent2/debpkg/
cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic/zabbix-agent2.deb /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic/zabbix-agent2/debpkg/
cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/deb/Traffic_Irkutsk/zabbix-agent2.deb /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic_Irkutsk/zabbix-agent2/debpkg/

cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Factor
./builb.sh zabbix-agent2

cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic
./builb.sh zabbix-agent2

cd /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic_Irkutsk
./builb.sh zabbix-agent2


cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Factor/zabbix-agent2.tar.gz /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/Buildes_ZabbixAgent2/zabbix-agent2-Factor.tar.gz
cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic/zabbix-agent2.tar.gz /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/Buildes_ZabbixAgent2/zabbix-agent2-Factor-Traffic.tar.gz
cp /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/targz/Traffic_Irkutsk/zabbix-agent2.tar.gz /home/user/CodeServer/ZabbixAgent2/BuildZabbixAgent2/Buildes_ZabbixAgent2/zabbix-agent2-Factor-Traffic_Irkutsk.tar.gz

cd ~
