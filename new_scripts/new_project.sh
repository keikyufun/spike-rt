#!/bin/bash

if [ "$1" = "" ]; then
    echo "no argument"
    exit 1
fi

appname=$1

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BASE_DIR=$(dirname $SCRIPT_DIR)

TEMPLATE_DIR=$BASE_DIR/workspace/template
APP_DIR=$BASE_DIR/workspace/$appname

if [ -e "$APP_DIR" ]; then
    echo "$appname already exists."
    exit 1
fi

mkdir -p "$APP_DIR"
cp -r "$TEMPLATE_DIR/"* "$APP_DIR/"

sed -i "s/^APP = .*/APP = $appname/" "$APP_DIR/Makefile"
