#!/bin/bash

GOLANG_VERSION=1.4.3
GOLANG_ARCHIVE=go$GOLANG_VERSION.src.tar.gz
GOLANG_DOWNLOAD_URL=https://golang.org/dl/$GOLANG_ARCHIVE
GOLANG_DOWNLOAD_SHA1=486db10dc571a55c8d795365070f66d343458c48
GOPATH=/go

set -e

curl -fsL "$GOLANG_DOWNLOAD_URL" -o $GOLANG_ARCHIVE

echo "$GOLANG_DOWNLOAD_SHA1  $GOLANG_ARCHIVE" | sha1sum -c -
tar -C /usr/src -xzf $GOLANG_ARCHIVE
rm $GOLANG_ARCHIVE
cd /usr/src/go/src && ./make.bash --no-clean 2>&1

mkdir -p "$GOPATH/src" "$GOPATH/bin"
chmod -R 777 "$GOPATH"
