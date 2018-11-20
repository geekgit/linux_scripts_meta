#!/bin/bash
# root rights
#
# /var
cd /var/lib/polkit-1/localauthority/10-vendor.d/
wget  --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla" -O "com.ubuntu.desktop.pkla"
# gconf
gsettings set org.gnome.desktop.session idle-delay 0
# systemd
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
