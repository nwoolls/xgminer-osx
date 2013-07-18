#!/bin/bash

LIB_URL=https://github.com/troydhanson/uthash/archive/master.zip
LIB_FILE=uthash.zip

BUILD_DIR=$(pwd)
OUTPUT_DIR=output

rm $LIB_FILE
rm -rf working

wget -O $LIB_FILE $LIB_URL

mkdir working
tar -xzvf $LIB_FILE -C working --strip-components=1

mkdir $OUTPUT_DIR

cp working/src/* $BUILD_DIR/$OUTPUT_DIR/include

rm $LIB_FILE
rm -rf working