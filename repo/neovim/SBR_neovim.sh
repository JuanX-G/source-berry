#!/bin/bash
set -e

PREFIX="${PREFIX:-/usr}"
BUILD_TYPE="${BUILD_TYPE:-Release}"
#PLACE HOLDER
DESTDIR="./packages/bin/"

: "${CXXFLAGS:="-O2"}"
: "${LDFLAGS:=""}"

cd neovim || { echo "Source not found"; exit 1; }

make distclean || true

make -j"$(nproc)" CMAKE_BUILD_TYPE="$BUILD_TYPE" \
     CMAKE_FLAGS="-DCMAKE_CXX_FLAGS='$CXXFLAGS' \
                  -DCMAKE_C_FLAGS='$CXXFLAGS' \
                  -DCMAKE_EXE_LINKER_FLAGS='$LDFLAGS' \
                  -DCMAKE_INSTALL_PREFIX=$PREFIX"

make DESTDIR="${DESTDIR}" install

