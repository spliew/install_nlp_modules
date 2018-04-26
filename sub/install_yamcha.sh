#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

tar xzvf ./res/yamcha-0.33.tar.gz -C ./build
patch -p0 -d ./build/yamcha-0.33 < ./res/yamcha.patch
build_install_cmd=`$SCRIPTS/build_and_install_cmd.sh ./build/yamcha-0.33 "--with-charset=utf8 --prefix=$INSTALL_DIR"`
eval $build_install_cmd
