#!/bin/bash
wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/home/username/simple.bashrc" -O "simple.bashrc"
wget --secure-protocol=TLSv1_2 --https-only "https://raw.githubusercontent.com/geekgit/linux_configs/master/home/username/bash.sh" -O "simple_bash.sh"
chmod a+rwx "simple.bashrc"
chmod a+rwx "simple_bash.sh"
cp "simple.bashrc" "/home/${USERNAME}/simple.bashrc"
cp "simple_bash.sh" "/home/${USERNAME}/simple_bash.sh"
sudo cp "simple.bashrc" "/root/simple.bashrc"
sudo cp "simple_bash.sh" "/root/simple_bash.sh"
ln -sf "/home/${USERNAME}/simple.bashrc" "/home/${USERNAME}/.bashrc"
sudo ln -sf "/root/simple.bashrc" "/root/.bashrc"
rm simple_bash.sh
rm simple.bashrc
