#!/bin/bash

# Final customization

# Copy grub Vimix theme (archiso deletes /boot when making the ISO)
mkdir -p /boot/grub/themes
cp -Rf /usr/share/grub/themes/Vimix /boot/grub/themes/
grub-mkconfig -o /boot/grub/grub.cfg

rm /usr/local/bin/arcolinux-customization.sh
