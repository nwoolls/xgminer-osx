#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh

./build_sgminer-pascal.sh

. ./EDITME_versions.sh

tar -cvzf sgminerpascal-$SGMINER_PASCAL_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv sgminerpascal-$SGMINER_PASCAL_VERSION-osx64.tar.gz redist/

rm -rf ./output