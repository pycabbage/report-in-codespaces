#!/bin/bash

CITEPROC_URL="https://github.com/jgm/citeproc/archive/refs/tags/0.7.tar.gz"
CITEPROC_ARCHIVE_TMPPATH="/tmp/citeproc.tar.gz"
CITEPROC_TMPPATH="/tmp/citeproc"
source /usr/local/share/.ghcup/env

apt install -y zlib1g-dev libicu-dev

curl $CITEPROC_URL -kLo $CITEPROC_ARCHIVE_TMPPATH
mkdir -p $CITEPROC_TMPPATH
tar -xzf $CITEPROC_ARCHIVE_TMPPATH -C $CITEPROC_TMPPATH --strip-components 1
cd $CITEPROC_TMPPATH

cabal freeze

cabal update
cabal configure --enable-tests --enable-benchmarks --test-show-details=direct
cabal build --dependencies-only --disable-optimization all

cabal build --disable-optimization all 2>&1 | tee build.log

cabal test --disable-optimization all

cp $(ls $CITEPROC_TMPPATH/dist-newstyle/build/*/ghc-*/citeproc-*/x/citeproc/noopt/build/citeproc/citeproc --color=none) /usr/local/bin/
