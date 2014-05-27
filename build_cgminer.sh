#!/bin/bash

. ./EDITME_versions.sh

MINER_URL=http://ck.kolivas.org/apps/cgminer/cgminer-$CGMINER_VERSION.tar.bz2
MINER_EXE=cgminer
MINER_VERSION=$CGMINER_VERSION

. ./subs/build_miner.sh