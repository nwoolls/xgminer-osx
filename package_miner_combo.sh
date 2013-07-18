#!/bin/bash

rm -rf output

. ./build_all_libraries.sh
. ./build_cgminer.sh
. ./build_bfgminer.sh

. ./EDITME_versions.sh

tar -cvzf cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv cgminer-$CGMINER_VERSION-osx64_and_bfgminer-$BFGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output