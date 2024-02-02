#!/bin/bash -e

if [[ -z "$TAILSCALE_AUTH_KEY" ]]; then
  echo "TAILSCALE_KEY_KEY is not set, will need to manually run tailscale up"
else
  echo "$TAILSCALE_AUTH_KEY" > "${ROOTFS_DIR}/etc/tailscale-auth"
fi
