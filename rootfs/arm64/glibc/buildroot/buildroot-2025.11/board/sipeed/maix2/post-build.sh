#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:?missing TARGET_DIR argument}"
SRC_BUSYBOX="/home/innox/maix_ax620e_sdk/rootfs/arm64/glibc/rootfs/bin/busybox"

if [ ! -x "${SRC_BUSYBOX}" ]; then
    echo "ERROR: prebuilt busybox not found or not executable: ${SRC_BUSYBOX}" >&2
    exit 1
fi

install -D -m 0755 "${SRC_BUSYBOX}" "${TARGET_DIR}/bin/busybox"

# Provide minimum applets needed for an interactive shell.
for cmd in sh ash ls id pwd cat cp mv rm mkdir rmdir ln chmod chown chgrp sync dmesg mount umount ps kill grep sed awk vi echo uname date df free head tail sleep which test "["; do
    ln -sf /bin/busybox "${TARGET_DIR}/bin/${cmd}"
done

# Keep common /usr/bin tools available even with merged-usr layouts.
for cmd in ls id which grep sed awk vi; do
    ln -sf /bin/busybox "${TARGET_DIR}/usr/bin/${cmd}"
done
