#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/nicehash/sgminer/archive/$SGMINER_NH_VERSION.zip
MINER_EXE=sgminer
MINER_VERSION=$SGMINER_NH_VERSION

. ./subs/build_miner.sh