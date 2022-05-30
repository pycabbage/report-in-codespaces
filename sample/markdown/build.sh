#!/bin/sh

pandoc -d default.yml -M "crossrefYaml=$CODESPACE_VSCODE_FOLDER/crossref_config.yaml" $*
