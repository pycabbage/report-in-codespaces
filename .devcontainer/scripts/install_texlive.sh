#!/bin/bash

whoami

ISO_URL="https://mirror.ctan.org/systems/texlive/Images/texlive2022.iso"
ISO_PATH=/tmp/texlive.iso
echo Getting hashes...
ISO_MD5=$(curl -kLs ${ISO_URL}.md5 | awk '{print $1}')
ISO_SHA512=$(curl -kLs ${ISO_URL}.sha512 | awk '{print $1}')

# Check aria2c exists
if [ -n $(which aria2c) ]; then 
  apt install aria2 -y
fi

# Download texlive ISO
aria2c -x16 -s16 --file-allocation=none -c -d $(dirname $ISO_PATH) -o $(basename $ISO_PATH) --checksum=md5=$ISO_MD5 --checksum=sha-512=$ISO_SHA512 "$ISO_URL"
# Mount ISO
mkdir -p /mnt/texlive
mount -o loop -t iso9660 $ISO_PATH /mnt/texlive
# Install texlive
echo I | /mnt/texlive/install-tl -no-gui -lang ja
# Unmount ISO
umount -r /mnt/texlive
# Remove ISO
rm $ISO_PATH

# tlmgr setup
TLMGR_PATH=$(ls --color=none /usr/local/texlive/*/bin/*/tlmgr|tail -n1)
$TLMGR_PATH path add
# Update all packages
$TLMGR_PATH update --self --all
