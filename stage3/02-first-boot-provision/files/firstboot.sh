#!/bin/bash

set -eu

if [[ -f /etc/tailscale-auth ]]; then
  TAILSCALE_AUTH_KEY="$(cat /etc/tailscale-auth)"
  tailscale up --authkey "$TAILSCALE_AUTH_KEY"
  rm /etc/tailscale-auth
fi
