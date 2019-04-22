#!/bin/bash
cd /etc/apache2
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apache2/apache2.conf" -O "apache2.conf"
chmod a+r-wx apache2.conf
chmod u+rw-x apache2.conf
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apache2/ports.conf" -O "ports.conf"
chmod a+r-wx ports.conf
chmod u+rw-x ports.conf
