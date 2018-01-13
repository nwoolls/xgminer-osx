#!/bin/bash

set -e

rm -rf ./output

./build_libcurl.sh

./build_vertminer.sh

. ./EDITME_versions.sh

tar -cvzf vertminer-$VERTMINER_VERSION-osx64.tar.gz -C output .
mkdir -p ./redist
mv vertminer-$VERTMINER_VERSION-osx64.tar.gz redist/

rm -rf ./output