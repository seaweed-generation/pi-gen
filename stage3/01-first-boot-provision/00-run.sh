#!/bin/bash -eu

# set up tailscale auth key for provisioning on first boot
if [[ -z "$TAILSCALE_AUTH_KEY" ]]; then
  echo "TAILSCALE_KEY_KEY is not set, will need to manually run tailscale up"
else
  echo "$TAILSCALE_AUTH_KEY" > "${ROOTFS_DIR}/etc/tailscale-auth"
fi


install -m 644 files/firstboot.service "${ROOTFS_DIR}/lib/systemd/system/"

on_chroot <<EOF
cd /etc/systemd/system/multi-user.target.wants
ln -s /lib/systemd/system/firstboot.service .
EOF

install -m 644 files/firstboot.sh "${ROOTFS_DIR}/boot/"
