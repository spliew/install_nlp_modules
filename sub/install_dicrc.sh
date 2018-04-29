#!/usr/bin/env zsh
set -eu

INSTALL_DIR=$1
DICRC=./res/mecab_dicrc.txt
if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi

for dic_dir in $INSTALL_DIR/lib/mecab/dic/*; do
    echo "$dic_dir/dicrc <- $DICRC"
    cp $DICRC $dic_dir/dicrc
done
