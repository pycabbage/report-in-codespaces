#!/bin/bash

GHC_XDG_BASE=/usr/local/share
GHCUP_INSTALL_BASE_PREFIX=$GHC_XDG_BASE

apt install -y build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=yes BOOTSTRAP_HASKELL_ADJUST_BASHRC=yes GHCUP_INSTALL_BASE_PREFIX=$GHC_XDG_BASE sh
# BOOTSTRAP_HASKELL_CABAL_VERSION=3.2 BOOTSTRAP_HASKELL_GHC_VERSION=9.2.2

source $GHC_XDG_BASE/.ghcup/env
