#!/bin/bash

rm -rf ./output

./build_libcurl.sh

./build_maxcgminer.sh

. ./EDITME_versions.sh

tar -cvzf maxcgminer-$MAXCGMINER_VERSION-osx64.tar.gz -C output .
mkdir ./redist
mv maxcgminer-$MAXCGMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output