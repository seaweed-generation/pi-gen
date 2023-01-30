#!/bin/bash

SSH_DIR="/home/${FIRST_USER_NAME}/.ssh"
SSH_ID_FILE="${SSH_DIR}/id_ed25519"

if [[ ! -d "$SSH_DIR" ]]; then
  install -v -m 0700 -o 1000 -g 1000 -d "$SSH_DIR"
fi

echo "$ALGARITHMS_DEPLOY_KEY" > "$SSH_ID_FILE"

chown 1000:1000 "$SSH_ID_FILE"
chmod 0600 "$SSH_ID_FILE"
