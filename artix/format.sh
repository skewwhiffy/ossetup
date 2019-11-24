pacman -Sy --noconfirm parted
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -16GiB
parted /dev/sda -- mkpart primary linux-swap -16GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 boot on

mkfs.ext4 -L artix /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/artix /mnt

mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2
