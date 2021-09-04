#!/usr/bin/sh

echo enter new root password:
passwd

echo enter username for new user:
read username
useradd -m $username
echo enter new password for $username:
passwd $username
usermod -aG wheel,audio,video,optical,storage $username
sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers

ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

echo enter hostname:
read hostname
echo $hostname > /etc/hostname
cat >> /etc/hosts<< EOF
127.0.0.1	localhost
::1		localhost
127.0.1.1	$hostname.localdomain $hostname
EOF
systemctl enable NetworkManager

pacman -S --noconfirm grub
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg


