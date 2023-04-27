#!/bin/bash

set -eu

ALGAFIELD_DEB="$(find $BASE_DIR -name "algafield_*.deb")"
NUM_RESULTS=$(echo $ALGAFIELD_DEB | wc -l | xargs)

if [[ "$NUM_RESULTS" != "1" ]]; then
  echo "Must have exactly one copy of the algafield deb package in the base directory."
  exit 1
fi

cp "$ALGAFIELD_DEB" "${ROOTFS_DIR}/tmp/algafield.deb"

on_chroot <<EOF
sudo apt install /tmp/algafield.deb
EOF
