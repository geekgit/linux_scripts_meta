#!/bin/bash
sudo mkdir -p /etc/dnscrypt-proxy
cd /etc/dnscrypt-proxy
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/dnscrypt-proxy/dnscrypt-proxy.conf" -O "dnscrypt-proxy.conf"
sudo mkdir -p /lib/systemd/system
cd /lib/systemd/system
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/lib/systemd/system/dnscrypt-proxy.service" -O "dnscrypt-proxy.service"
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/lib/systemd/system/dnscrypt-proxy.socket" -O "dnscrypt-proxy.socket"
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/lib/systemd/system/dnscrypt-proxy-resolvconf.service" -O "dnscrypt-proxy-resolvconf.service"
sudo systemctl stop dnscrypt-proxy
cd /etc
sudo chattr -i resolv.conf
sudo rm -f resolv.conf
sudo sh -c "echo 'nameserver 127.0.0.9' > /etc/resolv.conf"
sudo chmod a-w /etc/resolv.conf
sudo chattr +i resolv.conf
cat /etc/resolv.conf

