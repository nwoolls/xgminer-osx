#!/bin/bash

. ./EDITME_versions.sh

LIB_VERSION=$LIBJANSSON_VERSION
LIB_URL=http://www.digip.org/jansson/releases/jansson-$LIB_VERSION.tar.gz

. ./subs/build_library.sh