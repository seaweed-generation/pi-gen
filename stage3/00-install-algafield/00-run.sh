#!/bin/bash

set -eu

DEB_FILENAME="$(basename $ALGAFIELD_DEB)"
TARGET_DIR="/tmp/algafield"
TARGET_PATH="${TARGET_DIR}/${DEB_FILENAME}"

mkdir -p "${ROOTFS_DIR}${TARGET_DIR}"
cp -v "$ALGAFIELD_DEB" "${ROOTFS_DIR}${TARGET_PATH}"

on_chroot <<EOF
dpkg -I $TARGET_PATH
apt install $TARGET_PATH
EOF
