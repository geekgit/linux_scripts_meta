#!/bin/bash
CurrPath="${PWD}"
TmpPath="${HOME}/etc_apt_sources_$(uuidgen)"
mkdir -p "${TmpPath}"
cd "${TmpPath}"
wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apt/sources.template.https" -O sources.list
cat sources.list
Template="000template000"
Distr=$(cat /etc/lsb-release | grep "DISTRIB_CODENAME" | awk -F= '{print $2}')
echo "Distr: ${Distr}"
ReplaceVal="s|${Template}|${Distr}|"
sed -i "${ReplaceVal}" sources.list
cat sources.list
sudo cp sources.list /etc/apt/sources.list
cd "${CurrPath}"
rm -rf "${TmpPath}"
