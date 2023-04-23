#!/bin/bash -e

echo "${TARGET_HOSTNAME}" > "${ROOTFS_DIR}/etc/hostname"
echo "127.0.1.1		${TARGET_HOSTNAME}" >> "${ROOTFS_DIR}/etc/hosts"

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_net_names 1
EOF

# NetworkManager
install -v -d -m 0755 "${ROOTFS_DIR}/etc/NetworkManager"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/NetworkManager/conf.d"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/NetworkManager/system-connections"
install -v -m 0644 files/NetworkManager.conf "${ROOTFS_DIR}/etc/NetworkManager/NetworkManager.conf"

install -v -d -m 0755 "${ROOTFS_DIR}/etc/polkit-1"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/polkit-1/rules.d"
install -v -m 0644 files/50-org.freedesktop.NetworkManager.rules "${ROOTFS_DIR}/etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules"

# balena stuff
install -v -m 0755 files/wifi-connect.bin "${ROOTFS_DIR}/usr/local/sbin/wifi-connect"
cp -rv files/wifi-connect "${ROOTFS_DIR}/usr/local/share/"

on_chroot <<EOF

chmod -R a+r /usr/local/share/wifi-connect

EOF
