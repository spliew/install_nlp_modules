#!/usr/bin/env zsh

INSTALL_DIR=$1
BUILD_DIR=./build

if [ "$INSTALL_DIR" = "" ]; then
    INSTALL_DIR=$HOME/.local
fi
mset_envs_cmd=`$SCRIPTS/set_envs_cmd.sh $INSTALL_DIR`

eval $set_envs_cmd
kdir -p $BUILD_DIR 1>/dev/null 2>/dev/null

pushd $BUILD_DIR
    if [ -e mecab-ipadic-neologd ]; then
        pushd mecab-ipadic-neologd
        git pull
        popd
    else
        git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
    fi

    pushd mecab-ipadic-neologd
        mkdir ./build
        cp ../../res/mecab-ipadic-2.7.0-20070801.tar.gz ./build
        mkdir -p $INSTALL_DIR/lib/mecab/dic/mecab-ipadic-neologd/ 1>/dev/null 2>/dev/null
        echo "yes" | ./bin/install-mecab-ipadic-neologd -p $INSTALL_DIR/lib/mecab/dic/mecab-ipadic-neologd/ -n
    popd
popd
