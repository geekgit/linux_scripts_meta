#!/bin/bash
git clone https://github.com/geekgit/linux_scripts
mkdir renamed
cd linux_scripts
Scripts=$(find . -type f 2>/dev/null | grep .sh)
echo "Scripts: $Scripts"
for ScriptPath in $Scripts
do
	echo "Script path: $ScriptPath"
	Script=$(basename $ScriptPath)
	NewName=$(echo $Script | sed 's/.sh//g')
	echo "$Script -> $NewName"
	cp $ScriptPath ./../renamed/$NewName
done
cd ./../renamed
sudo chown root:root *
sudo chmod a+rx-w *
sudo mv * /usr/local/bin
cd ..
rm -rf renamed/
rm -rf linux_scripts/
