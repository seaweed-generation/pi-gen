#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_i2c 0
EOF
