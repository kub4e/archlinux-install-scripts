#!/usr/bin/sh

timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware efibootmgr networkmanager zsh texinfo amd-ucode sudo dhcpcd dhclient vim git man-db man-pages openssh wget
genfstab -U  /mnt >> /mnt/etc/fstab
