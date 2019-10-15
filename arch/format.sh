parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -16GiB
parted /dev/sda -- mkpart primary linux-swap -16GiB 100%
