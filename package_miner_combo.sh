#!/bin/bash

. ./EDITME_cgversion.sh
CGMINER_VERSION=$MINER_VERSION

. ./EDITME_bfgversion.sh
BFGMINER_VERSION=$MINER_VERSION

rm -rf output

. ./build_all_libraries.sh

MINER_VERSION=$CGMINER_VERSION
. ./build_cgminer.sh

MINER_VERSION=$BFGMINER_VERSION
. ./build_bfgminer.sh

tar -cvzf cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./packages
mv cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz packages/

rm -rf ./output