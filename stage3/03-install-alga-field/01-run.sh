#!/bin/bash

set -euo pipefail

cat > "${ROOTFS_DIR}/lib/systemd/system/alga-api.service" <<EOF
[Unit]
Description=REST API for managing field CLI config

[Service]
Type=simple
User=$FIRST_USER_NAME
ExecStart=/home/$FIRST_USER_NAME/.local/bin/alga api start
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

cat > "${ROOTFS_DIR}/lib/systemd/system/alga-recorder.service" <<EOF
[Unit]
Description=Runs configured recorder processes

[Service]
Type=simple
User=$FIRST_USER_NAME
ExecStart=/home/$FIRST_USER_NAME/.local/bin/alga record-configured
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

on_chroot <<EOF
cd /etc/systemd/system/multi-user.target.wants
ln -s /lib/systemd/system/alga-api.service .
ln -s /lib/systemd/system/alga-recorder.service .
EOF
