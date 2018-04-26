#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

tar -jxvf ./res/cabocha-0.69.tar.bz2 -C ./build/
build_install_cmd=`LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" $SCRIPTS/build_and_install_cmd.sh ./build/cabocha-0.69 "--with-charset=utf8 --enable-utf8-only --prefix=$INSTALL_DIR"`
eval $build_install_cmd
