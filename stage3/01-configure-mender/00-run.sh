#!/bin/bash -e

install -m 755 files/mender-device-identity "${ROOTFS_DIR}/usr/share/mender/identity/mender-device-identity"
install -m 644 files/artifact_info "${ROOTFS_DIR}/etc/mender/artifact_info"
