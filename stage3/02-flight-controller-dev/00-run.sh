#!/bin/bash

set -eu

install -m 644 files/99-pixhawk.rules "${ROOTFS_DIR}/etc/udev/rules.d/"
