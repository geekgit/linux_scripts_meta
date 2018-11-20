#!/bin/bash
cd /etc/apt/
sudo wget "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apt/sources.list.transip.https" -O sources.list
sudo chown root:root sources.list
sudo chmod a-wx+r sources.list

