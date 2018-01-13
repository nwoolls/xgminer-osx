#!/bin/bash

CACHE_FILENAME=$(basename $LIB_URL)
CACHE_ROOT=./cache
CACHE_FILEPATH=$CACHE_ROOT/$CACHE_FILENAME

# keep this at the top in case we cd around
BUILD_DIR=$(pwd)

if [ ! -f $CACHE_FILEPATH ]
then
    mkdir $CACHE_ROOT
    curl -L $LIB_URL -o $CACHE_FILEPATH
fi

rm -rf working
mkdir working

tar -xzvf $CACHE_FILEPATH -C working --strip-components=1

mkdir output

cd working

./configure LDFLAGS='-L/usr/local/opt/openssl/lib' CPPFLAGS='-I/usr/local/opt/openssl/include' --prefix=$BUILD_DIR/output --with-gnutls=no
make
make install

cd $BUILD_DIR

rm -rf working