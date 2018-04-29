#!/usr/bin/env zsh
set -eu

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
set_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`

eval $set_envs_cmd
if [[ ! -e "$BUILD_DIR" ]]; then
    mkdir -p $BUILD_DIR
fi


pushd $BUILD_DIR
    if [ -e mecab-ipadic-neologd ]; then
        rm -rf ./mecab-ipadic-neologd
    fi
    git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git

    pushd mecab-ipadic-neologd
        mkdir ./build
        cp ../../res/mecab-ipadic-2.7.0-20070801.tar.gz ./build
        if [[ ! "$INSTALL_DIR/lib/mecab/dic/mecab-ipadic-neologd/" ]]; then
            mkdir -p $INSTALL_DIR/lib/mecab/dic/mecab-ipadic-neologd/
        fi
        echo "yes" | ./bin/install-mecab-ipadic-neologd -p $INSTALL_DIR/lib/mecab/dic/mecab-ipadic-neologd/ -n
    popd
popd
