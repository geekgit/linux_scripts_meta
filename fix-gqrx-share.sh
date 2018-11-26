#!/bin/bash
cd /usr/share/mime/packages
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/usr/share/mime/packages/gnuradio.xml" -O "gnuradio.xml"
cat /usr/share/mime/packages/gnuradio.xml
