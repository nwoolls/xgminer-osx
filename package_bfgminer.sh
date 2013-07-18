#!/bin/bash

rm -rf ./output

. ./build_all_libraries.sh
. ./build_bfgminer.sh

. ./EDITME_versions.sh

tar -cvzf bfgminer-$BFGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv bfgminer-$BFGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output