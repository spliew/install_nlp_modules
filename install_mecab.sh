#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi

mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

./sub/install_mecab.sh $INSTALL_DIR
./sub/install_mecab_ipadic.sh $INSTALL_DIR
./sub/install_mecab_neologd.sh $INSTALL_DIR
./sub/install_dicrc.sh $INSTALL_DIR
