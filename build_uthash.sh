#!/bin/bash

set -e

. ./EDITME_versions.sh

LIB_URL=https://github.com/troydhanson/uthash/archive/v$LIBUTHASH_VERSION.zip
LIB_FILE=uthash.zip

# keep this at the top in case we cd around
BUILD_DIR=$(pwd)

rm -f $LIB_FILE
rm -rf working

wget -O $LIB_FILE $LIB_URL

mkdir -p working
tar -xzvf $LIB_FILE -C working --strip-components=1

mkdir -p output

cp working/src/* $BUILD_DIR/output/include

rm $LIB_FILE
rm -rf working