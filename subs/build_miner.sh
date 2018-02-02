#!/bin/bash

function patch_undefined_TIMER_ABSTIME() {
    local find_pattern="ifdef CLOCK_MONOTONIC"
    local replace_value="if defined(CLOCK_MONOTONIC) \&\& !defined(__APPLE__)"

    find . -path '*.c' -not -path '*/\.*' -type f -exec \
        gsed -i -r 's/'"$find_pattern"'/'"$replace_value"'/g' {} \;
}

function patch_undefined_inline() {
    local find_pattern="^inline "
    local replace_value="static inline "

    find . -path '*.c' -not -path '*/\.*' -type f -exec \
        gsed -i -r 's/'"$find_pattern"'/'"$replace_value"'/g' {} \;
}

function init_update_external_modules() {
    git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    while read path_key path
    do
        local url_key=$(echo $path_key | sed 's/\.path/.url/')
        local url=$(git config -f .gitmodules --get "$url_key")

        set +e
        git submodule deinit --force "$path"
        git rm --force "$path"
        set -e

        rm -rf "$BUILD_DIR/.git/modules/working/$path"
        rm -rf ./"$path"

        git submodule add --force $url ./"$path"
    done
}

CACHE_FILENAME=$MINER_EXE-$MINER_VERSION-$(basename $MINER_URL)
CACHE_ROOT=./cache
CACHE_FILEPATH=$CACHE_ROOT/$CACHE_FILENAME

# keep this at the top in case we cd around
BUILD_DIR=$(pwd)

if [ ! -f $CACHE_FILEPATH ]
then
    mkdir -p $CACHE_ROOT
    wget -O $CACHE_FILEPATH $MINER_URL
fi

rm -rf working
mkdir -p working

tar -xzvf $CACHE_FILEPATH -C working --strip-components=1

mkdir -p output

cd working

patch_undefined_TIMER_ABSTIME

patch_undefined_inline

init_update_external_modules

autoreconf -i

./configure --prefix=$BUILD_DIR/output CFLAGS="-I$BUILD_DIR/output/include" LDFLAGS="-L$BUILD_DIR/output/lib" CPPFLAGS="-I$BUILD_DIR/output/include" LIBCURL_CFLAGS="-I$BUILD_DIR/output/include/curl" LIBCURL_LIBS="-L$BUILD_DIR/output/lib -lcurl" LIBUSB_CFLAGS="-I$BUILD_DIR/output/include/libusb-1.0" LIBUSB_LIBS="-L$BUILD_DIR/output/lib -lusb-1.0" PKG_CONFIG_PATH=$BUILD_DIR/output/lib/pkgconfig --enable-scrypt --enable-keccak --enable-bflsc --enable-bitforce --enable-icarus --enable-modminer --enable-ztex --enable-avalon --disable-adl --enable-opencl --enable-bitfury --enable-hashfast --enable-klondike --enable-cointerra --enable-blockerupter --enable-hashratio --enable-avalon2 --enable-drillbit
make
make install

cd $BUILD_DIR

rm -rf working

function relink_bins() {
    local bin_path=$1
    for file_path in $bin_path ; do
        local otool_output=$(otool -LX $file_path | grep $BUILD_DIR/output/)
        if [[ -n "$otool_output" && "$otool_output" != *"not an object file"* ]]; then
            while read -r lib_line; do
                local lib_path=$(echo $lib_line | cut -f 1 -d " ")
                local lib_name=$(basename "$lib_path")
                install_name_tool \
                    -change "$lib_path" "@executable_path/../lib/$lib_name" \
                    "$file_path"
            done <<< "$otool_output"
        fi
    done
}

relink_bins "$BUILD_DIR"/output/lib/\*.dylib
relink_bins "$BUILD_DIR"/output/bin/\*
