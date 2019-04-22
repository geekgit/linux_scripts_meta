#!/bin/bash
cd /etc/apache2
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apache2/apache2.conf" -O "apache2.conf"
sudo chmod a+r-wx apache2.conf
sudo chmod u+rw-x apache2.conf
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apache2/ports.conf" -O "ports.conf"
sudo chmod a+r-wx ports.conf
sudo chmod u+rw-x ports.conf
sudo systemctl stop apache2
sudo systemctl start apache2
