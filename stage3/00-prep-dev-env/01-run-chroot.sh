#!/bin/bash -e

FIRST_USER_HOME="${ROOTFS_DIR}/home/${FIRST_USER_NAME}"
SSH_ID_FILE="${FIRST_USER_HOME}/.ssh/id_ed25519"

mkdir -p $(dirname "$SSH_ID_FILE")

echo "$ALGARITHMS_DEPLOY_KEY" > "$SSH_ID_FILE"

chown "$FIRST_USER_NAME" "$SSH_ID_FILE"
chmod 0600 "$SSH_ID_FILE"
