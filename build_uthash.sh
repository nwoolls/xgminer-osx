#!/bin/bash

LIB_URL=https://github.com/troydhanson/uthash/archive/master.zip
LIB_FILE=uthash.zip
LIB_DIR=uthash

BUILD_DIR=$(pwd)
OUTPUT_DIR=output

rm $LIB_FILE
rm -rf $LIB_DIR

wget -O $LIB_FILE $LIB_URL

mkdir $LIB_DIR
tar -xzvf $LIB_FILE -C $LIB_DIR --strip-components=1

mkdir $OUTPUT_DIR

cp $LIB_DIR/src/* $BUILD_DIR/$OUTPUT_DIR/include

rm $LIB_FILE
rm -rf $LIB_DIR