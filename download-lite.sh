#!/bin/bash
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
# linux_binary
git clone https://github.com/geekgit/linux_binary
mkdir renamed
cd linux_binary
rm -rf .git/
rm README.md
Binary=$(find . -type f 2>/dev/null)
echo "Binary: $Binary"
for BinaryPath in $Binary
do
	echo "Binary path: $BinaryPath"
	Bin=$(basename $BinaryPath)
	NewName="${Bin}"
	# prefix	
	NewName="geekgit-binary-$NewName"
	echo "$Bin -> $NewName"
	cp $BinaryPath ./../renamed/$NewName
done
cd ..
cd renamed
sudo chown root:root *
sudo chmod a+rx-w *
echo "Install new binary to /usr/local/bin"
sudo mv * /usr/local/bin
cd ..
rm -rf renamed/
rm -rf linux_binary/