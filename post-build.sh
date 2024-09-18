#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt

install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf

# Ensure the directory exists
mkdir -p "$TARGET_DIR/etc/systemd/system/multi-user.target.wants"

# Create symlink in the target's systemd directory
ln -sf /etc/systemd/system/eth0-up.service "$TARGET_DIR/etc/systemd/system/multi-user.target.wants/eth0-up.service"
