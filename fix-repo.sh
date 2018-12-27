#!/bin/bash
setup_repo() {
	ListName="$1"
	ListFile="${ListName}.list"
	BackupDirectory="${HOME}/sources.list.d.bak"	
	#sudo chattr -i "${ListFile}"
	mkdir -p "${BackupDirectory}"	
	cat "${ListFile}" > "${BackupDirectory}/${ListFile}"
	sudo chmod u+rw "${ListFile}"
	sudo rm -f "${ListFile}"
	sudo wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/etc/apt/sources.list.d/${ListFile}" -O "${ListFile}"
	sudo chown root:root "${ListFile}"
	sudo chmod a+r-wx "${ListFile}"
	#sudo chattr +i "${ListFile}"
}
cd /etc/apt/sources.list.d/
# grub customizer
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
setup_repo danielrichter2007-ubuntu-grub-customizer-bionic
#
sudo ./docker-repo.sh
setup_repo docker
#
sudo add-apt-repository -y "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
setup_repo google-chrome
#
sudo add-apt-repository -y ppa:graphics-drivers/ppa
setup_repo graphics-drivers-ubuntu-ppa-bionic
#
sudo add-apt-repository -y ppa:mc3man/mpv-tests
setup_repo mc3man-ubuntu-mpv-tests-bionic
#
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#sudo add-apt-repository -y "deb https://download.mono-project.com/repo/ubuntu stable-bionic main"
#setup_repo mono-official-stable
#
sudo add-apt-repository -y ppa:obsproject/obs-studio
setup_repo obsproject-ubuntu-obs-studio-bionic
#
#curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
setup_repo vscode
#
sudo add-apt-repository -y ppa:webupd8team/java
setup_repo webupd8team-ubuntu-java-bionic
#
sudo add-apt-repository -y ppa:cdemu/ppa
setup_repo cdemu-ubuntu-ppa-bionic
#
sudo apt-get update
