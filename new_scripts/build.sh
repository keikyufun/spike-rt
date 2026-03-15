#!/bin/bash

if [ "$1" = "" ]; then
    echo "no argument"
    exit 1
fi

appname=$1

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BASE_DIR=$(dirname $SCRIPT_DIR)

echo "Building $appname ..."

# asp3/Makefile を呼ぶ
make -C "$BASE_DIR/asp3" APP=$appname

# 成功したら bin を表示
if [ -f "$BASE_DIR/asp3/asp.bin" ]; then
    echo "Build success: $BASE_DIR/asp3/asp.bin"
else
    echo "Build failed."
fi
