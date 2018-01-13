#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/luke-jr/bfgminer/archive/bfgminer-$BFGMINER_VERSION.tar.gz
MINER_EXE=bfgminer
MINER_VERSION=$BFGMINER_VERSION

. ./subs/build_miner.sh