#!/bin/bash
git clone https://github.com/geekgit/linux_scripts
mkdir renamed
cd linux_scripts
for Script in *.sh
do
	NewName=$(echo $Script | sed 's/.sh//g')
	echo "$Script -> $NewName"
	cp $Script ./../renamed/$NewName
done
cd ./../renamed
sudo chown root:root *
sudo chmod a+rx-w *
sudo mv * /usr/local/bin
cd ..
rm -rf renamed/
rm -rf linux_scripts/
