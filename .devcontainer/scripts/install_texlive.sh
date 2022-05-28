#!/bin/bash

ISO_URL="https://mirror.ctan.org/systems/texlive/Images/texlive2022.iso"
ISO_PATH=/tmp/texlive.iso
echo Getting hashes...
ISO_MD5=$(curl -kLs ${ISO_URL}.md5 | awk '{print $1}')
ISO_SHA512=$(curl -kLs ${ISO_URL}.sha512 | awk '{print $1}')
MOUNT_PATH=/media/texlive

apt install aria2 kmod -y

# Setup loop
modprobe loop
mknod /dev/loop0 -m0660 b 7 0
mknod /dev/loop1 -m0660 b 7 1
mknod /dev/loop2 -m0660 b 7 2
mknod /dev/loop3 -m0660 b 7 3
mknod /dev/loop4 -m0660 b 7 4
mknod /dev/loop5 -m0660 b 7 5
mknod /dev/loop6 -m0660 b 7 6
mknod /dev/loop7 -m0660 b 7 7
mknod /dev/loop8 -m0660 b 7 8
mknod /dev/loop9 -m0660 b 7 9
losetup -a

# Download texlive ISO
aria2c -x16 -s16 --file-allocation=none -c -d $(dirname $ISO_PATH) -o $(basename $ISO_PATH) --checksum=md5=$ISO_MD5 --checksum=sha-512=$ISO_SHA512 "$ISO_URL"
# Mount ISO
mkdir -p $MOUNT_PATH
mount -o ro,loop,noauto -t iso9660 $ISO_PATH $MOUNT_PATH
# Install texlive
echo I | ${MOUNT_PATH}/install-tl -no-gui -lang ja
# Unmount ISO
umount -r $MOUNT_PATH
# Remove ISO
rm $ISO_PATH

# tlmgr setup
TLMGR_PATH=$(ls --color=none /usr/local/texlive/*/bin/*/tlmgr|tail -n1)
$TLMGR_PATH path add
# Update all packages
$TLMGR_PATH update --self --all
