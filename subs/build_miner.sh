#!/bin/bash

CACHE_FILENAME=$(basename $MINER_URL)
CACHE_ROOT=./cache
CACHE_FILEPATH=$CACHE_ROOT/$CACHE_FILENAME

BUILD_DIR=$(pwd)
OUTPUT_DIR=./output

if [ ! -f $CACHE_FILEPATH ]
then
    mkdir $CACHE_ROOT
    wget -O $CACHE_FILEPATH $MINER_URL
fi

rm -rf working
mkdir working

tar -xzvf $CACHE_FILEPATH -C working --strip-components=1

mkdir $OUTPUT_DIR

cd working

./configure --prefix=$BUILD_DIR/$OUTPUT_DIR CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include" LDFLAGS="-L$BUILD_DIR/$OUTPUT_DIR/lib" CPPFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include" LIBCURL_CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include/curl" LIBCURL_LIBS="-L$BUILD_DIR/$OUTPUT_DIR/lib -lcurl" LIBUSB_CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include/libusb-1.0" LIBUSB_LIBS="-L$BUILD_DIR/$OUTPUT_DIR/lib -lusb-1.0" --enable-scrypt --enable-bflsc --enable-bitforce --enable-icarus --enable-modminer --enable-ztex --enable-avalon
make
make install

cd $BUILD_DIR

rm -rf working

install_name_tool -change $BUILD_DIR/$OUTPUT_DIR/lib/libcurl.4.dylib @executable_path/../lib/libcurl.4.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libjansson.4.dylib @executable_path/../lib/libjansson.4.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libusb-1.0.0.dylib @executable_path/../lib/libusb-1.0.0.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libblkmaker_jansson-0.1.0.dylib @executable_path/../lib/libblkmaker_jansson-0.1.0.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libblkmaker-0.1.0.dylib @executable_path/../lib/libblkmaker-0.1.0.dylib $OUTPUT_DIR/bin/$MINER_EXE
