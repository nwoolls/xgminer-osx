#!/bin/bash

. ./EDITME_versions.sh
MINER_VERSION=$BFGMINER_VERSION

rm -rf ./output

. ./build_all_libraries.sh
. ./build_bfgminer.sh

tar -cvzf bfgminer-$MINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv bfgminer-$MINER_VERSION-osx64.tar.gz redist/

rm -rf ./output