#!/bin/bash -e

install -d "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d"
install -m 644 files/noclear.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/noclear.conf"
install -v -m 644 files/fstab "${ROOTFS_DIR}/etc/fstab"

# Create a ramdisk
echo "tmpfs /ramdisk tmpfs rw,nodev,nosuid,mode=0777,size=20M 0 0" >> "${ROOTFS_DIR}/etc/fstab"
# TODO: setup swap space

install -v -m 0644 files/97-ovos.conf "${ROOTFS_DIR}/etc/sysctl.d/97-ovos.conf"

# Autologin ovos/$FIRST_USER_NAME to cosnole
sed -i "s|\bovos\b|${FIRST_USER_NAME}|g" files/autologin.conf
install -v -m 0644 files/autologin.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf"
# ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service

on_chroot << EOF
if ! id -u ${FIRST_USER_NAME} >/dev/null 2>&1; then
	adduser --disabled-password --gecos "" ${FIRST_USER_NAME}
fi

if [ -n "${FIRST_USER_PASS}" ]; then
	echo "${FIRST_USER_NAME}:${FIRST_USER_PASS}" | chpasswd
fi
echo "root:root" | chpasswd
EOF


