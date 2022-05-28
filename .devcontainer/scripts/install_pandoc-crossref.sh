#!/bin/bash

PANDOC_CROSSREF_VERSION=$(curl 'https://api.github.com/repos/lierdakil/pandoc-crossref/releases/latest' -kLfs | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
PANDOC_CROSSREF_PACK_URL="https://github.com/lierdakil/pandoc-crossref/releases/download/$PANDOC_CROSSREF_VERSION/pandoc-crossref-Linux.tar.xz"
PANDOC_CROSSREF_PACK_PATH=/tmp/pandoc-crossref-Linux.tar.xz
PANDOC_CROSSREF_PATH=/usr/local/bin/pandoc-crossref
PANDOC_CROSSREF_MANPAGE_PATH=/usr/local/man/man1/

curl -kLo $PANDOC_CROSSREF_PACK_PATH "$PANDOC_CROSSREF_PACK_URL"
tar Jxfv $PANDOC_CROSSREF_PACK_PATH pandoc-crossref -C $(dirname $PANDOC_CROSSREF_PATH)
tar Jxfv $PANDOC_CROSSREF_PACK_PATH pandoc-crossref.1 -C $PANDOC_CROSSREF_MANPAGE_PATH
rm $PANDOC_CROSSREF_PACK_PATH
