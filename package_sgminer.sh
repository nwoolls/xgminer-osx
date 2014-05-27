#!/bin/bash

rm -rf ./output

. ./build_all_libraries.sh
. ./build_sgminer.sh

. ./EDITME_versions.sh

tar -cvzf sgminer-$SGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv sgminer-$SGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output