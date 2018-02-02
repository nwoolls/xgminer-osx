#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh

./build_sgminer-gm.sh

. ./EDITME_versions.sh

tar -cvzf sgminergm-$SGMINER_GM_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv sgminergm-$SGMINER_GM_VERSION-osx64.tar.gz redist/

rm -rf ./output