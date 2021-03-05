#!/bin/sh

set -e

PREFIX="$1"

[ -x "${PREFIX}/bin/openssl" ] && exit 0

VERSION=1.0.2u
SRC="https://www.openssl.org/source/old/1.0.2/openssl-${VERSION}.tar.gz"

echo "jwtb get openssl ${SRC}"
wget -O openssl.tar.gz "$SRC"
tar -xf openssl.tar.gz -C "$HOME"
cd "${HOME}/openssl-${VERSION}"
echo "jwtb - ${HOME}"
./config --prefix="$PREFIX" shared -fPIC
make
make install
