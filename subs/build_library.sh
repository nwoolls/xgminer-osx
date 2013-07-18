#!/bin/bash

CACHE_FILENAME=$(basename $LIB_URL)
CACHE_ROOT=./cache
CACHE_FILEPATH=$CACHE_ROOT/$CACHE_FILENAME

BUILD_DIR=$(pwd)
OUTPUT_DIR=./output

if [ ! -f $CACHE_FILEPATH ]
then
    mkdir $CACHE_ROOT
    wget -O $CACHE_FILEPATH $LIB_URL
fi

rm -rf $LIB_DIR
mkdir $LIB_DIR

tar -xzvf $CACHE_FILEPATH -C $LIB_DIR --strip-components=1

mkdir $OUTPUT_DIR

cd $LIB_DIR

./configure --prefix=$BUILD_DIR/$OUTPUT_DIR
make
make install

cd $BUILD_DIR

rm -rf $LIB_DIR