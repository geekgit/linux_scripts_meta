#!/bin/bash
cd /etc/apt/
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apt/sources.list.bionic.transip.https" -O sources.list
sudo chown root:root sources.list
sudo chmod a-wx+r sources.list

