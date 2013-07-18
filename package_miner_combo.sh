#!/bin/bash

. ./EDITME_cgminer_version.sh
CGMINER_VERSION=$MINER_VERSION

. ./EDITME_bfgminer_version.sh
BFGMINER_VERSION=$MINER_VERSION

rm -rf output

. ./build_all_libraries.sh

MINER_VERSION=$CGMINER_VERSION
. ./build_cgminer.sh

MINER_VERSION=$BFGMINER_VERSION
. ./build_bfgminer.sh

tar -cvzf cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output