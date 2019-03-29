#!/bin/bash
setup_mnt_script() {
	ScriptName="$1"
	FullName="${ScriptName}.sh"
	sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/mnt/${ScriptName}.sh" -O "${FullName}"
	sudo chown root:root "${FullName}"
	sudo chmod a-rwx "${FullName}"
	sudo chmod u+rwx "${FullName}"
}
cd /mnt
setup_mnt_script "mount-sda1-ntfs"
setup_mnt_script "mount-sdb1-fat32-rus"
setup_mnt_script "mount-sdb1-fat32"
setup_mnt_script "mount-sdb1-ntfs"
setup_mnt_script "unmount-sda1"
setup_mnt_script "unmount-sdb1"

