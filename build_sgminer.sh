#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/sgminer-dev/sgminer/archive/$SGMINER_VERSION.zip
MINER_EXE=sgminer
MINER_VERSION=$SGMINER_VERSION

. ./subs/build_miner.sh