#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mkdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

source $SCRIPTS/set_envs.sh $INSTALL_DIR
pushd ./build/cabocha-0.69/python
python setup.py build
python setup.py install
popd
