#!/bin/bash

. ./EDITME_versions.sh

MINER_URL=https://github.com/prettyhatemachine/sph-sgminer/archive/$SPHSGMINER_VERSION.zip
MINER_EXE=sgminer
MINER_VERSION=$SPHSGMINER_VERSION

. ./subs/build_miner.sh