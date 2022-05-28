#!/bin/bash

ISO_URL="https://mirror.ctan.org/systems/texlive/Images/texlive2022.iso"
ISO_PATH=/tmp/texlive.iso
echo Getting hashes...
ISO_MD5=$(curl -kLs ${ISO_URL}.md5 | awk '{print $1}')
ISO_SHA512=$(curl -kLs ${ISO_URL}.sha512 | awk '{print $1}')
MOUNT_PATH=/media/texlive

apt install aria2 p7zip-full libfontconfig1 libfontconfig-dev libfontconfig1-dev -y

# Download texlive ISO
aria2c -x16 -s16 --file-allocation=none -c -d $(dirname $ISO_PATH) -o $(basename $ISO_PATH) --checksum=md5=$ISO_MD5 --checksum=sha-512=$ISO_SHA512 "$ISO_URL"
# Mount ISO
mkdir -p $MOUNT_PATH
# mount -o ro,loop,noauto -t iso9660 $ISO_PATH $MOUNT_PATH
7z x $ISO_PATH -o${MOUNT_PATH}
# Install texlive
chmod +x ${MOUNT_PATH}/install-tl
echo I | ${MOUNT_PATH}/install-tl -no-gui -lang ja
# Unmount ISO
# umount -r $MOUNT_PATH
rm -fr ${MOUNT_PATH}
# Remove ISO
rm $ISO_PATH

# tlmgr setup
TLMGR_PATH=$(ls --color=none /usr/local/texlive/*/bin/*/tlmgr|tail -n1)
$TLMGR_PATH path add
