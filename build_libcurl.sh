#!/bin/bash

. ./EDITME_libcurl_version.sh

LIB_URL=http://curl.askapache.com/download/curl-$LIB_VERSION.tar.gz
LIB_DIR=libcurl

. ./subs/build_library.sh