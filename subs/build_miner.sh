#!/bin/bash

CACHE_FILENAME=$MINER_EXE-$MINER_VERSION-$(basename $MINER_URL)
CACHE_ROOT=./cache
CACHE_FILEPATH=$CACHE_ROOT/$CACHE_FILENAME

# keep this at the top in case we cd around
BUILD_DIR=$(pwd)

if [ ! -f $CACHE_FILEPATH ]
then
    mkdir $CACHE_ROOT
    wget -O $CACHE_FILEPATH $MINER_URL
fi

rm -rf working
mkdir working

tar -xzvf $CACHE_FILEPATH -C working --strip-components=1

mkdir output

cd working

autoreconf -i

./configure --prefix=$BUILD_DIR/output CFLAGS="-I$BUILD_DIR/output/include" LDFLAGS="-L$BUILD_DIR/output/lib" CPPFLAGS="-I$BUILD_DIR/output/include" LIBCURL_CFLAGS="-I$BUILD_DIR/output/include/curl" LIBCURL_LIBS="-L$BUILD_DIR/output/lib -lcurl" LIBUSB_CFLAGS="-I$BUILD_DIR/output/include/libusb-1.0" LIBUSB_LIBS="-L$BUILD_DIR/output/lib -lusb-1.0" --enable-scrypt --enable-bflsc --enable-bitforce --enable-icarus --enable-modminer --enable-ztex --enable-avalon --disable-adl --enable-opencl --enable-bitfury --enable-hashfast --enable-klondike
make
make install

cd $BUILD_DIR

rm -rf working

install_name_tool \
    -change     $BUILD_DIR/output/lib/libcurl.4.dylib                   @executable_path/../lib/libcurl.4.dylib \
    -change     $BUILD_DIR/output/lib/libjansson.4.dylib                @executable_path/../lib/libjansson.4.dylib \
    -change     $BUILD_DIR/output/lib/libusb-1.0.0.dylib                @executable_path/../lib/libusb-1.0.0.dylib \
    -change     $BUILD_DIR/output/lib/libusb-1.0.2.dylib                @executable_path/../lib/libusb-1.0.2.dylib \
    -change     $BUILD_DIR/output/lib/libbase58.0.dylib                 @executable_path/../lib/libbase58.0.dylib \
    -change     $BUILD_DIR/output/lib/libblkmaker_jansson-0.1.0.dylib   @executable_path/../lib/libblkmaker_jansson-0.1.0.dylib \
    -change     $BUILD_DIR/output/lib/libblkmaker_jansson-0.1.6.dylib   @executable_path/../lib/libblkmaker_jansson-0.1.6.dylib \
    -change     $BUILD_DIR/output/lib/libblkmaker-0.1.0.dylib           @executable_path/../lib/libblkmaker-0.1.0.dylib \
    -change     $BUILD_DIR/output/lib/libblkmaker-0.1.6.dylib           @executable_path/../lib/libblkmaker-0.1.6.dylib \
    -change     $BUILD_DIR/output/lib/libmicrohttpd.10.dylib            @executable_path/../lib/libmicrohttpd.10.dylib \
    -change     $BUILD_DIR/output/lib/libevent-2.0.5.dylib              @executable_path/../lib/libevent-2.0.5.dylib \
    output/bin/$MINER_EXE

install_name_tool \
    -change     $BUILD_DIR/output/lib/libblkmaker-0.1.6.dylib           @executable_path/../lib/libblkmaker-0.1.6.dylib \
    -change     $BUILD_DIR/output/lib/libjansson.4.dylib                @executable_path/../lib/libjansson.4.dylib \
    -change     $BUILD_DIR/output/lib/libbase58.0.dylib                 @executable_path/../lib/libbase58.0.dylib \
    output/lib/libblkmaker_jansson-0.1.6.dylib

install_name_tool \
    -change     $BUILD_DIR/output/lib/libbase58.0.dylib                 @executable_path/../lib/libbase58.0.dylib \
    output/lib/libblkmaker-0.1.6.dylib

# for older builds of BFGMiner
install_name_tool \
    -change     $BUILD_DIR/output/lib/libblkmaker-0.1.0.dylib           @executable_path/../lib/libblkmaker-0.1.0.dylib \
    -change     $BUILD_DIR/output/lib/libjansson.4.dylib                @executable_path/../lib/libjansson.4.dylib \
    output/lib/libblkmaker_jansson-0.1.0.dylib
