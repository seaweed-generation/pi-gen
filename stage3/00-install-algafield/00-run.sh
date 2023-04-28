#!/bin/bash

set -eu

DEB_FILENAME="$(basename $ALGAFIELD_DEB)"
TARGET_PATH="/tmp/$DEB_FILENAME"

cp "$ALGAFIELD_DEB" "${ROOTFS_DIR}${TARGET_PATH}"

on_chroot <<EOF
sudo apt install $TARGET_PATH
EOF
