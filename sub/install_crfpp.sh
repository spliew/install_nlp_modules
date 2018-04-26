#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

tar xzvf ./res/CRF++-0.58.tar.gz -C ./build
patch -p0 -d ./build/CRF++-0.58 < ./res/CRF.patch
build_install_cmd=`$SCRIPTS/build_and_install_cmd.sh ./build/CRF++-0.58  "--with-charset=utf8 --prefix=$INSTALL_DIR"`
eval $build_install_cmd
