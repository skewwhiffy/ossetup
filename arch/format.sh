parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -17.2GiB
parted /dev/sda -- mkpart primary linux-swap -17.2GiB 100%
