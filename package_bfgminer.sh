#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh
./build_libjansson.sh
./build_libusb.sh
./build_uthash.sh
./build_libmicrohttpd.sh
./build_libevent.sh

./build_bfgminer.sh

. ./EDITME_versions.sh

tar -cvzf bfgminer-$BFGMINER_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv bfgminer-$BFGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output