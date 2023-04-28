#/bin/bash -e

install -v -d -m 0755 "${ROOTFS_DIR}/usr/libexec"

install -v -m 0755 files/ovos-systemd-messagebus "${ROOTFS_DIR}/usr/libexec/ovos-systemd-messagebus"

install -v -m 0644 files/ovos.service "${ROOTFS_DIR}/etc/systemd/user/ovos.service"
install -v -m 0644 files/ovos-messagebus.service "${ROOTFS_DIR}/etc/systemd/user/ovos-messagebus.service"

on_chroot << EOF

pip3 install sdnotify

pip3 install git+https://github.com/OpenVoiceOS/ovos-core
pip3 install git+https://github.com/OpenVoiceOS/ovos-messagebus

pip3 install git+https://github.com/OpenVoiceOS/ovos-cli-client

systemctl mask userconfig.service

EOF
