#!/bin/bash

set -e

. ./EDITME_versions.sh

LIB_URL=https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION-stable/libevent-$LIBEVENT_VERSION-stable.tar.gz

. ./subs/build_library.sh