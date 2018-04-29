#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
if [[ ! -e $BUILD_DIR ]]; then
    mkdir -p $BUILD_DIR
fi

source $SCRIPTS/set_envs.sh $INSTALL_DIR
pushd $BUILD_DIR/cabocha-0.69/python
python setup.py $BUILD_DIR
python setup.py install
popd
