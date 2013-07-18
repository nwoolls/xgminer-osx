#!/bin/bash

. ./EDITME_bfgversion.sh

rm -rf ./output

. ./build_all_libraries.sh
. ./build_bfgminer.sh

tar -cvzf bfgminer-$MINER_VERSION-osx64.tar.gz -C output .
mkdir ./packages
mv bfgminer-$MINER_VERSION-osx64.tar.gz packages/

rm -rf ./output