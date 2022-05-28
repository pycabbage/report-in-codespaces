#!/bin/bash

PANDOC_VERSION=$(curl 'https://api.github.com/repos/jgm/pandoc/releases/latest' -kLfs | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
PANDOC_DEB_URL=$(curl 'https://api.github.com/repos/jgm/pandoc/releases/latest' -kLfs | grep '"browser_download_url":.*'"${PANDOC_VERSION}"'.*amd64.deb' | sed -E 's/.*": ?"(.+)".*/\1/')
PANDOC_DEB_PATH=/tmp/pandoc.deb

curl -kLo $PANDOC_DEB_PATH "$PANDOC_DEB_URL"
apt -y install --no-install-recommends $PANDOC_DEB_PATH
rm $PANDOC_DEB_PATH
