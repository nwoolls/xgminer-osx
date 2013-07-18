#!/bin/bash

BUILD_DIR=$(pwd)
OUTPUT_DIR=./output

rm $LIB_FILE
rm -rf $LIB_DIR

wget -O $LIB_FILE $LIB_URL

mkdir $LIB_DIR
tar -xzvf $LIB_FILE -C $LIB_DIR --strip-components=1

mkdir $OUTPUT_DIR

cd $LIB_DIR

./configure --prefix=$BUILD_DIR/$OUTPUT_DIR
make
make install

cd $BUILD_DIR

rm $LIB_FILE
rm -rf $LIB_DIR