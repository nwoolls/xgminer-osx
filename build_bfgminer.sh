#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=http://luke.dashjr.org/programs/bitcoin/files/bfgminer/$BFGMINER_VERSION/bfgminer-$BFGMINER_VERSION.zip
MINER_EXE=bfgminer
MINER_VERSION=$BFGMINER_VERSION

. ./subs/build_miner.sh