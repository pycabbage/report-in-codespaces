#!/bin/bash

TEXLIVE_VERSION=2022
TEXLIVE_ISO_URL="https://mirror.ctan.org/systems/texlive/Images/texlive${TEXLIVE_VERSION}.iso"
TEXLIVE_ISO_PATH=/tmp/texlive.iso
TEXLIVE_MOUNT_PATH=/media/texlive
TEXLIVE_PROFILE_PATH="/tmp/scripts/texlive${TEXLIVE_VERSION}.profile"

echo Getting hashes...
TEXLIVE_ISO_MD5=$(curl -kLs ${TEXLIVE_ISO_URL}.md5 | awk '{print $1}')
TEXLIVE_ISO_SHA512=$(curl -kLs ${TEXLIVE_ISO_URL}.sha512 | awk '{print $1}')

apt install aria2 p7zip-full libfontconfig1 libfontconfig-dev libfontconfig1-dev -y

# Download texlive ISO
aria2c -x16 -s16 --file-allocation=none -c -d $(dirname $TEXLIVE_ISO_PATH) -o $(basename $TEXLIVE_ISO_PATH) --checksum=md5=$TEXLIVE_ISO_MD5 --checksum=sha-512=$TEXLIVE_ISO_SHA512 "$TEXLIVE_ISO_URL"
# Mount ISO
mkdir -p $TEXLIVE_MOUNT_PATH
# mount -o ro,loop,noauto -t iso9660 $TEXLIVE_ISO_PATH $TEXLIVE_MOUNT_PATH
7z x $TEXLIVE_ISO_PATH -o${TEXLIVE_MOUNT_PATH}
# Install texlive
chmod +x ${TEXLIVE_MOUNT_PATH}/install-tl
echo I | ${TEXLIVE_MOUNT_PATH}/install-tl -no-gui -lang ja -profile ${TEXLIVE_PROFILE_PATH}

# Unmount ISO
# umount -r $MOUNT_PATH
rm -fr ${TEXLIVE_MOUNT_PATH}
# Remove ISO
rm $TEXLIVE_ISO_PATH

# tlmgr setup
TLMGR_PATH=$(ls --color=none /usr/local/texlive/*/bin/*/tlmgr|tail -n1)
$TLMGR_PATH path add
