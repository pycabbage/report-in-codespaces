#!/bin/bash

# Install Japanese package
apt install language-pack-ja manpages-ja manpages-ja-dev -y
# Update language
update-locale LANG=ja_JP.UTF8
# Update timezone
ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true dpkg-reconfigure --frontend noninteractive tzdata
