#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/OhGodAPet/sgminer-pascal-solo/archive/master.zip
MINER_EXE=sgminer
MINER_VERSION=$SGMINER_PASCAL_VERSION

. ./subs/build_miner.sh