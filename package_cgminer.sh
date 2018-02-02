#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh

./build_cgminer.sh
./build_libusb.sh

. ./EDITME_versions.sh

tar -cvzf cgminer-$CGMINER_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv cgminer-$CGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output
