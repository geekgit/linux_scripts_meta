#!/bin/bash
sudo apt-get install -y git pv pip wget
wget  --secure-protocol=TLSv1_2 --https-only https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev -O screenfetch-dev
sudo cp screenfetch-dev /usr/local/bin/screenfetch-dev
sudo chown root:root /usr/local/bin/screenfetch-dev
sudo chmod a+rx-w /usr/local/bin/screenfetch-dev
rm screenfetch-dev
sudo pip install --upgrade youtube-dl
sudo pip install --upgrade speedtest-cli
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
