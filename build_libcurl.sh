#!/bin/bash

. ./EDITME_versions.sh

LIB_VERSION=$LIBCURL_VERSION
LIB_URL=http://curl.askapache.com/download/curl-$LIB_VERSION.tar.gz

. ./subs/build_library.sh