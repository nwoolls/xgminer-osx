#!/bin/bash

rm -rf ./output

. ./build_all_libraries.sh
. ./build_sphsgminer.sh

. ./EDITME_versions.sh

tar -cvzf sphsgminer-$SPHSGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv sphsgminer-$SPHSGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output