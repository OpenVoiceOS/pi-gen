#!/bin/bash -e

# bash scripts
install -v -m 0644 files/.bashrc "${ROOTFS_DIR}/home/ovos/.bashrc"
install -v -m 0644 files/.bash_profile "${ROOTFS_DIR}/home/ovos/.bash_profile"
install -v -m 0644 files/.cli_login.sh "${ROOTFS_DIR}/home/ovos/.cli_login.sh"

# user level mycroft.conf
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.config"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.config/mycroft"
install -v -m 0644 files/mycroft.conf "${ROOTFS_DIR}/home/ovos/.config/mycroft/"

install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.config/systemd"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.config/systemd/user"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.config/systemd/user/ovos.service.wants"
