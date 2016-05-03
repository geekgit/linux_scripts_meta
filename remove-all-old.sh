#!/bin/bash
git clone https://github.com/geekgit/linux_scripts
cd linux_scripts
rm -rf .git/
Scripts=$(find . -type f 2>/dev/null | grep .sh)
for ScriptPath in $Scripts
do
	Script=$(basename $ScriptPath)
	OldName=$(echo $Script | sed 's/\.sh//g')
	OldName="/usr/local/bin/$OldName"
	if [ -f "$OldName" ]; then
		echo "[git] $Script <-> [local] $OldName"
		sudo rm -i "$OldName"	
	fi
done
