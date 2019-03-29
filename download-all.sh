#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
./fix-main-repo-bionic.sh
sudo apt-get update
# useful 
sudo apt-get install -y uuid-runtime htop git pv python-pip wget mtools dosfstools qemu-utils
#
# iso tools
sudo apt-get install -y mdf2iso b5i2iso ccd2iso cdi2iso daa2iso nrg2iso pdi2iso iat genisoimage acetoneiso bchunk udftools brasero k3b
sudo apt-get install -y gcdemu
#
# radio
sudo apt-get install -y qsstv ebook2cwgui fldigi gqrx-sdr
# 
# useful 2
sudo apt-get install -y grub-customizer mpv ffmpeg pavucontrol p7zip p7zip-full unrar
#
# nv drivers
sudo apt-get install -y libnvidia-cfg1-415
sudo apt-get install -y nvidia-driver-415
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
sudo geekgit-install-modem-soft
sudo geekgit-setup-rules
./mpv.sh
./bash.sh
sudo ./no-sleep.sh
sudo ./fix-gqrx-share.sh
#
sudo systemctl stop udisks2
sudo systemctl disable udisks2
sudo systemctl mask udisks2
