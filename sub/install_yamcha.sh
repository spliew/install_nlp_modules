#!/usr/bin/env zsh
set -eu

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
if [[ ! -e $BUILD_DIR ]]; then
    mkdir -p $BUILD_DIR
fi

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

if [[ -e "$BUILD_DIR/yamcha-0.33" ]]; then
    rm -rf "$BUILD_DIR/yamcha-0.33"
fi
tar xzvf ./res/yamcha-0.33.tar.gz -C $BUILD_DIR
patch -p0 -d ./build/yamcha-0.33 < ./res/yamcha.patch
build_install_cmd=`$SCRIPTS/build_and_install_cmd.sh $BUILD_DIR/yamcha-0.33 "--with-charset=utf8 --prefix=$INSTALL_DIR"`
eval $build_install_cmd
