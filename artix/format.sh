echo Formatting and mounting /dev/sda
totalk=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
totalm=$(($totalk / 1024))
totalg=$(($totalm / 1024))
swap=$(($totalg + 1))
echo Creating "$swap"GiB of swap

pacman -Sy --noconfirm parted
swapoff -a

parted -a optimal -s /dev/sda -- mklabel gpt
parted -a optimal -s /dev/sda -- mkpart primary 512MiB -"$swap"GiB
parted -a optimal -s /dev/sda -- mkpart primary linux-swap -"$swap"GiB 100%
parted -a optimal -s /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted -a optimal -s /dev/sda -- set 3 boot on

mkfs.ext4 -L artix /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/artix /mnt

mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

echo Disk formatted. Calling install.
./install.sh
