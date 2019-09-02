#!/bin/bash
cd /etc/ssl
sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/ssl/openssl.cnf" -O "openssl.cnf"
