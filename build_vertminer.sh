#!/bin/bash

set -e

. ./EDITME_versions.sh

MINER_URL=https://github.com/Bufius/vertminer-gpu/archive/master.zip
MINER_EXE=vertminer
MINER_VERSION=$VERTMINER_VERSION

. ./subs/build_miner.sh