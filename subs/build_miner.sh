#!/bin/bash

BUILD_DIR=$(pwd)
OUTPUT_DIR=./output

rm $MINER_FILE
rm -rf $MINER_DIR

wget -O $MINER_FILE $MINER_URL

mkdir $MINER_DIR
tar -xzvf $MINER_FILE -C $MINER_DIR --strip-components=1

mkdir $OUTPUT_DIR

cd $MINER_DIR

./configure --prefix=$BUILD_DIR/$OUTPUT_DIR CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include" LDFLAGS="-L$BUILD_DIR/$OUTPUT_DIR/lib" CPPFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include" LIBCURL_CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include/curl" LIBCURL_LIBS="-L$BUILD_DIR/$OUTPUT_DIR/lib -lcurl" LIBUSB_CFLAGS="-I$BUILD_DIR/$OUTPUT_DIR/include/libusb-1.0" LIBUSB_LIBS="-L$BUILD_DIR/$OUTPUT_DIR/lib -lusb-1.0" --enable-scrypt --enable-bflsc --enable-bitforce --enable-icarus --enable-modminer --enable-ztex --enable-avalon
make
make install

cd $BUILD_DIR

rm $MINER_FILE
rm -rf $MINER_DIR

install_name_tool -change $BUILD_DIR/$OUTPUT_DIR/lib/libcurl.4.dylib @executable_path/../lib/libcurl.4.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libjansson.4.dylib @executable_path/../lib/libjansson.4.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libusb-1.0.0.dylib @executable_path/../lib/libusb-1.0.0.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libblkmaker_jansson-0.1.0.dylib @executable_path/../lib/libblkmaker_jansson-0.1.0.dylib -change $BUILD_DIR/$OUTPUT_DIR/lib/libblkmaker-0.1.0.dylib @executable_path/../lib/libblkmaker-0.1.0.dylib $OUTPUT_DIR/bin/$MINER_EXE
