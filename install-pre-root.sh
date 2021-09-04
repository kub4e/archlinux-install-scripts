#!/usr/bin/sh
mkfs.ext4 /dev/sda2
mkfs.fat -F32 /dev/sda1
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware efibootmgr networkmanager zsh texinfo amd-ucode sudo dhcpcd dhclient vim git man-db man-pages openssh wget
genfstab -U  /mnt >> /mnt/etc/fstab
