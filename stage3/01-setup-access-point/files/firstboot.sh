#!/bin/bash

set -eu

INITIAL_HOSTNAME="seagen-NEW"

DEVICE_ID=$(cat /dev/urandom | tr -dc A-Z0-9 | head -c 6)
NEW_HOSTNAME="seagen-${DEVICE_ID}"

echo "$DEVICE_ID" > /etc/seagen-device-id

hostnamectl set-hostname "${NEW_HOSTNAME}.local"
sed -i "s/$INITIAL_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
sed -i "s/$INITIAL_HOSTNAME/$NEW_HOSTNAME/g" /etc/hostapd/hostapd.conf
sed -i "s/$INITIAL_HOSTNAME/$NEW_HOSTNAME/g" /etc/dnsmasq.conf
