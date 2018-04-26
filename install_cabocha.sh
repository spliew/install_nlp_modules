#!/usr/bin/env zsh

set -eu

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`
eval $set_envs_cmd

# LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" ./sub/install_tiny_svm.sh $INSTALL_DIR
# LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" ./sub/install_yamcha.sh $INSTALL_DIR
# LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" ./sub/install_crfpp.sh $INSTALL_DIR
LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" ./sub/install_cabocha.sh $INSTALL_DIR
# LDFLAGS="-L$INSTALL_DIR/lib" CPPFLAGS="-I$INSTALL_DIR/include" ./sub/install_cabocha_python.sh $INSTALL_DIR
