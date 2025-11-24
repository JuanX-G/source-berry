#! /bin/bash

set -e

./configure --with-pydebug CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"

make -j$(nproc)

