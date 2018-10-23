#Time-stamp: <Tue Oct 23 12:27:50 JST 2018 hamada>

# OS: Ubuntu 18.04.1 LTS

all:
	@echo 'make environ web3py'

install: environ web3py geth

web3py:
	sudo apt update
	sudo apt -y install python3-pip
	pip3 install web3

geth:
	sudo apt-get install software-properties-common
	sudo add-apt-repository -y ppa:ethereum/ethereum
	sudo apt-get update
	sudo apt-get install ethereum

#--- NVIDIA CUDA ---
nvidia:

blacklist:
	echo ""                           > blacklist-nouveau.conf
	echo "blacklist nouveau"          >> blacklist-nouveau.conf
	echo "blacklist lbm-nouveau"      >> blacklist-nouveau.conf
	echo "options nouveau modeset=0"  >> blacklist-nouveau.conf
	echo "alias nouveau off"          >> blacklist-nouveau.conf
	echo "alias lbm-nouveau off"      >> blacklist-nouveau.conf
	sudo mv blacklist-nouveau.conf /etc/modprobe.d/blacklist-nouveau.conf
	echo ""                           > nouveau-kms.conf
	echo "options nouveau modeset=0"  >> nouveau-kms.conf
	sudo mv nouveau-kms.conf /etc/modprobe.d/nouveau-kms.conf
	sudo update-initramfs -u

texton:
	sudo grep -l 'quiet splash' /etc/default/grub | sudo xargs sed -i.bak -e 's/quiet splash/quiet text/g'
	sudo update-grub
	sudo systemctl set-default multi-user.target
	sudo reboot

textoff:
	sudo grep -l 'quiet text' /etc/default/grub | sudo xargs sed -i.bak -e 's/quiet text/quiet splash/g'
	sudo update-grub
	sudo systemctl set-default graphical.target
	sudo reboot

environ:
	rsync -av ./etc/emacs/.emacs* ~/
	rsync -av ./etc/.twmrc  ~/
	rsync -av ./etc/.screenrc  ~/
	rsync -av ./etc/bash.bashrc.home ~/.bashrc
	mkdir -p ~/bin; rsync -av ./etc/start-geth.py ~/bin/
	sudo apt update
	sudo apt -y install emacs-nox  ibus-mozc
	sudo apt -y install openssh-server sshfs
	sudo apt -y install nkf kterm screen git tree
	sudo apt -y install mplayer ffmpeg 
	sudo apt -y install build-essential golang
	sudo update-alternatives --set editor /usr/bin/emacs25
	sudo rsync -av ./etc/keyboard /etc/default/
	sudo rsync -av ./etc/bash.bashrc /etc/bash.bashrc
	sudo rsync -av ./etc/texton  /usr/local/bin/
	sudo rsync -av ./etc/textoff /usr/local/bin/
	sudo rsync -av ./etc/uninstall-nouveau.sh /usr/local/bin/
	sudo rsync -av ./etc/cuda.conf /etc/ld.so.conf.d/
	sudo rsync -av ./etc/sources.list /etc/apt/
	sudo ldconfig

