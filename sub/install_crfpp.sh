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

if [[ -e "$BUILD_DIR/CRF++-0.58" ]]; then
    rm -rf "$BUILD_DIR/CRF++-0.58"
fi
tar xzvf ./res/CRF++-0.58.tar.gz -C $BUILD_DIR
patch -p0 -d ./build/CRF++-0.58 < ./res/CRF.patch
build_install_cmd=`$SCRIPTS/build_and_install_cmd.sh $BUILD_DIR/CRF++-0.58  "--with-charset=utf8 --prefix=$INSTALL_DIR"`
eval $build_install_cmd
