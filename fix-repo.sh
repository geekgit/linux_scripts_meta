#!/bin/bash
setup_repo() {
	ListName="$1"
	ListFile="${ListName}.list"
	BackupDirectory="${HOME}/sources.list.d.bak"	
	sudo chattr -i "${ListFile}"
	mkdir -p "${BackupDirectory}"	
	cat "${ListFile}" > "${BackupDirectory}/${ListFile}"
	sudo chmod u+rw "${ListFile}"
	sudo rm -f "${ListFile}"
	sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apt/sources.list.d/${ListFile}" -O "${ListFile}"
	sudo chown root:root "${ListFile}"
	sudo chmod a+r-wx "${ListFile}"
	sudo chattr +i "${ListFile}"
}
cd /etc/apt/sources.list.d/
setup_repo danielrichter2007-ubuntu-grub-customizer-bionic
setup_repo docker
setup_repo google-chrome
setup_repo graphics-drivers-ubuntu-ppa-bionic
setup_repo mc3man-ubuntu-mpv-tests-bionic
setup_repo mono-official-stable
setup_repo obsproject-ubuntu-obs-studio-bionic
setup_repo vscode
setup_repo webupd8team-ubuntu-java-bionic
sudo apt-get update
