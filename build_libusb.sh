#!/bin/bash

. ./EDITME_versions.sh
LIB_VERSION=$LIBUSB_VERSION

LIB_URL=http://downloads.sourceforge.net/libusb/libusb-$LIB_VERSION.tar.bz2
LIB_DIR=libusb

. ./subs/build_library.sh