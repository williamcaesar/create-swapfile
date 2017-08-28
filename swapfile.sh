#!/bin/bash
echo "Input how much swap you want, in Gigabytes: "
read number_of_swap
number=$((number_of_swap\*1038336))
rm /swapfile
touch /swapfile
dd if=/dev/zero of=/swapfile bs=1024 count=$number
echo $number
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile          swap            swap    defaults        0 0" >> /etc/fstab
