#!/bin/bash -eu

install -m 644 files/firstboot.service "${ROOTFS_DIR}/lib/systemd/system/"

on_chroot <<EOF
cd /etc/systemd/system/multi-user.target.wants
ln -s /lib/systemd/system/firstboot.service .
EOF

install -m 644 files/firstboot.sh "${ROOTFS_DIR}/boot/"
