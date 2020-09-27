#!/bin/bash

# Migrated from customize_airootfs.sh
usermod -s /usr/bin/bash root
cp -aT /etc/skel/ /root/
chmod 750 /root
chmod 750 /etc/sudoers.d
chmod 750 /etc/polkit-1/rules.d
chgrp polkitd /etc/polkit-1/rules.d
reflector --threads 50 -l 100 -f 100 --number 20 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sc --noconfirm
rm -rf /usr/share/backgrounds/xfce

# Copy grub Vimix theme (archiso deletes /boot when making the ISO)
cp -Rf /usr/share/grub/themes/Vimix /boo/grub/themes/

# Populate Core Team keys
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate arcolinux
#pacman-key --keyserver hkps://hkps.pool.sks-keyservers.net:443 -r 74F5DE85A506BF64
#pacman-key --keyserver hkp://pool.sks-keyservers.net:80 -r 74F5DE85A506BF64
#erik
pacman-key --lsign-key 74F5DE85A506BF64
#marco
pacman-key --lsign-key F1ABB772CE9F7FC0
#john
pacman-key --lsign-key 4B1B49F7186D8731
#stephen
pacman-key --lsign-key 02D507C6EFB8CEAA
#brad
pacman-key --lsign-key 18064BF445855549
#raniel
pacman-key --lsign-key 7EC1A5550718AB89
#sudo pacman-key --refresh-keys

# Final cleanup steps
rm -f /etc/sudoers.d/g_wheel
rm -rf /usr/share/backgrounds/xfce
rm -f /etc/polkit-1/rules.d/49-nopasswd_global.rules
rm -r /etc/systemd/system/etc-pacman.d-gnupg.mount
rm /root/{.automated_script.sh,.zlogin}
rm /usr/local/bin/arcolinux-all-cores.sh
mv /etc/arcolinux-release /etc/lsb-release
pacman -R mkinitcpio-archiso --noconfirm
mv /etc/mkinitcpio.d/arcolinux /etc/mkinitcpio.d/linux.preset
rm /usr/local/bin/arcolinux-cleanup.sh
