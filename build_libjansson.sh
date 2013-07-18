#!/bin/bash

. ./EDITME_libjansson_version.sh

LIB_URL=http://www.digip.org/jansson/releases/jansson-$LIB_VERSION.tar.gz
LIB_DIR=libjansson

. ./subs/build_library.sh