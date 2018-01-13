#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/genesismining/sgminer-gm/archive/$SGMINER_GM_VERSION.zip
MINER_EXE=sgminer
MINER_VERSION=$SGMINER_GM_VERSION

. ./subs/build_miner.sh