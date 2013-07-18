#!/bin/bash

. ./EDITME_cgversion.sh

rm -rf ./output

. ./build_all_libraries.sh
. ./build_cgminer.sh

tar -cvzf cgminer-$MINER_VERSION-osx64.tar.gz -C output .
mkdir ./packages
mv cgminer-$MINER_VERSION-osx64.tar.gz packages/

rm -rf ./output