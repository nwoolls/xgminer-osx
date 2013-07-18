#!/bin/bash

. ./EDITME_versions.sh
MINER_VERSION=$CGMINER_VERSION

rm -rf ./output

. ./build_all_libraries.sh
. ./build_cgminer.sh

tar -cvzf cgminer-$MINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv cgminer-$MINER_VERSION-osx64.tar.gz redist/

rm -rf ./output