#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh

./build_sgminer.sh

. ./EDITME_versions.sh

tar -cvzf sgminer-$SGMINER_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv sgminer-$SGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output