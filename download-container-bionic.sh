#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
./fix-main-repo-bionic.sh
sudo apt-get update
sudo apt-get install -y uuid-runtime htop git pv python-pip curl wget mtools dosfstools qemu-utils
git clone https://github.com/geekgit/linux_scripts
mkdir renamed
cd linux_scripts
rm -rf .git/
Scripts=$(find . -type f 2>/dev/null | grep .sh)
echo "Scripts: $Scripts"
for ScriptPath in $Scripts
do
	echo "Script path: $ScriptPath"
	Script=$(basename $ScriptPath)
	NewName=$(echo $Script | sed 's/\.sh//g')
	# prefix	
	NewName="geekgit-$NewName"
	echo "$Script -> $NewName"
	cp $ScriptPath ./../renamed/$NewName
done
echo "Clean /usr/local/bin..."
cd ..
./remove-all.sh
cd renamed
sudo chown root:root *
sudo chmod a+rx-w *
echo "Install new scripts to /usr/local/bin"
sudo mv * /usr/local/bin
cd ..
rm -rf renamed/
rm -rf linux_scripts/
# disable git hooks
geekgit-tweak-disable-git-hooks