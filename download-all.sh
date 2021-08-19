#!/bin/bash
./fix-apport.sh
./fix-apt.sh
#
sudo apt-get install -y git curl
#
LocalCommit="$(./last-commit-local.sh)"
RemoteCommit="$(./last-commit-remote.sh)"
if [ "${LocalCommit}" = "${RemoteCommit}" ];
then
	echo "Local commit == Remote commit"
else
	echo "Local commit != Remote commit"
	echo "Version mismatch!"
	UuidgenFile="$(which uuidgen)"
	if test -f "${UuidgenFile}"
	then
		CurrPath="${PWD}"
		TmpPath="${HOME}/meta_install_$(uuidgen)"
		mkdir -p "${TmpPath}"
		cd "${TmpPath}"
		git clone "https://github.com/geekgit/linux_scripts_meta"
		cd linux_scripts_meta
		./download-all.sh
		cd "${CurrPath}"
		rm -rf "${TmpPath}"
		git pull
		exit 0
	else
		exit 1
	fi	
fi

#git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get install -y git

#purge
sudo apt-get purge -y cups cups-browsed
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
./fix-main-repo.sh
sudo apt-get update
# fonts
sudo apt-get install -y fonts-takao-mincho fonts-takao-gothic fonts-takao
sudo apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core
sudo su -c 'echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections'
sudo apt-get install -y cabextract xfonts-utils update-notifier-common
env DEBIAN_FRONTEND=noninteractive sudo apt-get install -y ttf-mscorefonts-installer
# useful 
sudo apt-get install -y uuid-runtime htop git pv python-pip curl wget mtools dosfstools qemu-utils
sudo apt-get install -y exfat-fuse exfat-utils
sudo apt-get install -y sshpass
sudo apt-get install -y gucharmap
#
# iso tools
sudo apt-get install -y mdf2iso b5i2iso ccd2iso cdi2iso daa2iso nrg2iso pdi2iso iat genisoimage acetoneiso bchunk udftools brasero k3b
# cdemu
sudo add-apt-repository -y ppa:cdemu/ppa
sudo apt-get update
sudo apt-get install -y gcdemu
#
sudo apt-get install -y innoextract
#
# radio
sudo apt-get install -y qsstv ebook2cwgui fldigi gqrx-sdr
# OCR
sudo apt-get install -y cuneiform tesseract-ocr-all yagf
# 
# useful 2
sudo apt-get install -y grub-customizer mpv ffmpeg pavucontrol p7zip p7zip-full unrar vlc-bin vlc
# userful 3
sudo apt-get install -y gnome-tweaks psensor lm-sensors xsensors gddrescue
#
# nv drivers
sudo apt-get install -y libnvidia-cfg1-460
sudo apt-get install -y nvidia-driver-460
# phone
sudo apt-get install -y jmtpfs mtp-tools android-tools-fastboot android-tools-adb
#
sudo apt-get install -y easytag
#kernel
sudo apt-get install -y linux-generic linux-headers-generic linux-image-generic
# iostat
sudo apt-get install -y sysstat
#
sudo add-apt-repository -y ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install -y unetbootin
#
#web
sudo apt-get install -y mysql-server apache2 libapache2-mod-php php-mysql
sudo ./apache2.sh
#images
sudo apt-get install -y webp pngquant
#gl dev
sudo apt-get install -y libgl1-mesa-dev
#docker
sudo apt-get install -y docker-ce
sudo ./nv-docker.sh
#
wget  --secure-protocol=TLSv1_2 --https-only https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev -O screenfetch-dev
sudo cp screenfetch-dev /usr/local/bin/screenfetch-dev
sudo chown root:root /usr/local/bin/screenfetch-dev
sudo chmod a+rx-w /usr/local/bin/screenfetch-dev
rm screenfetch-dev
sudo pip install --upgrade youtube-dl
sudo pip install --upgrade speedtest-cli
sudo pip install --upgrade flexget
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
sudo geekgit-install-modem-soft
sudo geekgit-setup-rules-dynamic
./mpv.sh
./bash.sh
sudo ./no-sleep.sh
sudo ./fix-gqrx-share.sh
#
#sudo systemctl stop udisks2
#sudo systemctl disable udisks2
#sudo systemctl mask udisks2
sudo systemctl unmask udisks2
sudo systemctl enable udisks2
sudo systemctl start udisks2

#
sudo ./mnt.sh
#
geekgit-install-messenger
#
sudo geekgit-tweak-set-webp-thumbnailer
geekgit-tweak-reset-thumbnailers
#
sudo geekgit-tweak-set-applications
#
sudo ./fix-openssl.sh
# snap
sudo snap install scrcpy
sudo snap refresh
# upgrade
sudo apt-get install -y --install-recommends linux-generic-hwe-18.04 xserver-xorg-hwe-18.04
#
geekgit-kernel-dl-x86_64 4.14.217
geekgit-kernel-dl-x86_64 4.15
geekgit-kernel-dl-x86_64 4.19.171
geekgit-kernel-dl-x86_64 5.4.93
geekgit-kernel-dl-x86_64 5.10.4
