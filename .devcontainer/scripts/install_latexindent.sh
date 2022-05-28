#!/bin/bash

LATEXINDENT_VERSION=$(curl 'https://api.github.com/repos/cmhughes/latexindent.pl/releases/latest' -kLfs | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
LATEXINDENT_URL="https://github.com/cmhughes/latexindent.pl/releases/download/${LATEXINDENT_VERSION}/latexindent.zip"
LATEXINDENT_ZIP_PATH=/tmp/latexindent.zip

echo Y | perl $HOME/latexindent/latexindent-module-installer.pl

curl -kLsSo latexindent.zip 
