#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/Max-Coin/cgminer/archive/master.zip
MINER_EXE=cgminer
MINER_VERSION=$MAXCGMINER_VERSION

. ./subs/build_miner.sh