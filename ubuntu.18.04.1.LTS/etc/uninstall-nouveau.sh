#Time-stamp: <2017-06-16 00:02:45 hamada>

# ----------------------------------------
# /etc/modprobe.d/blacklist-nouveau.conf
# ----------------------------------------
echo ""                           >  ./blacklist-nouveau.conf
echo "blacklist nouveau"          >> ./blacklist-nouveau.conf
echo "blacklist lbm-nouveau"      >> ./blacklist-nouveau.conf
echo "options nouveau modeset=0"  >> ./blacklist-nouveau.conf
echo "alias nouveau off"          >> ./blacklist-nouveau.conf
echo "alias lbm-nouveau off"      >> ./blacklist-nouveau.conf
sudo mv ./blacklist-nouveau.conf /etc/modprobe.d/

# ----------------------------------------
# /etc/modprobe.d/nouveau-kms.conf
# ----------------------------------------
echo ""                           >  ./nouveau-kms.conf
echo "options nouveau modeset=0"  >> ./nouveau-kms.conf
sudo mv nouveau-kms.conf /etc/modprobe.d/

sudo update-initramfs -u

echo 'reboot now !!!!!'



