#!/bin/bash
wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/home/username/.config/mpv/install.sh" -O "mpv_install.sh"
chmod a+rwx "mpv_install.sh"
mkdir -p "/home/${USERNAME}/.config/mpv"
mv "mpv_install.sh" "/home/${USERNAME}/.config/mpv/install.sh"
cd /home/${USERNAME}/.config/mpv/
/home/${USERNAME}/.config/mpv/install.sh
