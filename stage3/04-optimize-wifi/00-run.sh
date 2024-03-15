#!/bin/bash -e

install -m 644 files/brcmfmac.conf "${ROOTFS_DIR}/etc/modprobe.d/"
