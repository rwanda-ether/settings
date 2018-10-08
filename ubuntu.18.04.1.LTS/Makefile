#Time-stamp: <2018-10-08 13:01:12 hamada>

# OS: Ubuntu 18.04.1 LTS

all:
	@echo 'make environ web3py'

install: environ web3py

web3py:
	sudo apt update
	sudo apt -y install python3-pip
	pip3 install web3

#--- NVIDIA CUDA ---
nvidia:

blacklist:
	echo ""                           > test.txt
	echo "blacklist nouveau"          >> test.txt
	echo "blacklist lbm-nouveau"      >> test.txt
	echo "options nouveau modeset=0"  >> test.txt
	echo "alias nouveau off"          >> test.txt
	echo "alias lbm-nouveau off"      >> test.txt
	sudo mv test.txt /etc/modprobe.d/blacklist-nouveau.conf
	echo ""                           > test2.txt
	echo "options nouveau modeset=0"  >> test2.txt
	sudo mv test2.txt /etc/modprobe.d/nouveau-kms.conf
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
	sudo apt update
	sudo apt -y install emacs-nox  ibus-mozc
	sudo apt -y install openssh-server sshfs
	sudo apt -y install nkf kterm screen git tree
	sudo apt -y install mplayer ffmpeg 
	sudo update-alternatives --set editor /usr/bin/emacs25
	sudo rsync -av ./etc/keyboard /etc/default/
	sudo rsync -av ./etc/bash.bashrc /etc/bash.bashrc
	sudo rsync -av ./etc/texton  /usr/local/bin/
	sudo rsync -av ./etc/textoff /usr/local/bin/
	sudo rsync -av ./etc/uninstall-nouveau.sh /usr/local/bin/
	sudo rsync -av ./etc/cuda.conf /etc/ld.so.conf.d/
	sudo rsync -av ./etc/sources.list /etc/apt/
	sudo ldconfig

