#!/bin/bash

N_PATH=/tmp/n

mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
chmod go+rwx /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o $N_PATH
chmod +x $N_PATH
$N_PATH latest
rm $N_PATH
npm i -g npm@latest
npm i -g n yarn
