pacman -Sy pacman-contrib
timedatectl set-ntp true

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rm -f /etc/pacman.d/mirrorlist.uk
cat /etc/pacman.d/mirrorlist.backup | grep -A 1 "United Kingdom" | grep "[^\-]" >> /etc/pacman.d/mirrorlist.uk

pacstrap /mnt base linux linux-firmware base-devel dhcpcd git

genfstab -U /mnt >> /mnt/etc/fstab
