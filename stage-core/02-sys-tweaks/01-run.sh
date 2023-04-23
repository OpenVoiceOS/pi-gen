install -v -d -m 0755 "${ROOTFS_DIR}/etc/sudoers.d"

install -v -m 0644 files/ovos-sudo "${ROOTFS_DIR}/etc/sudoers.d/ovos"

install -v -m 0644 files/media-automount@.service "${ROOTFS_DIR}/usr/lib/systemd/system/media-automount@.service"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/udev/automount.d"
install -v -m 0644 files/auto "${ROOTFS_DIR}/etc/udev/automount.d/auto"
install -v -m 0644 files/hfsplus "${ROOTFS_DIR}/etc/udev/automount.d/hfsplus"
install -v -m 0644 files/ntfs "${ROOTFS_DIR}/etc/udev/automount.d/ntfs"
install -v -m 0644 files/vfat "${ROOTFS_DIR}/etc/udev/automount.d/vfat"
install -v -m 0644 files/99-media-automount.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-media-automount.rules"
install -v -m 0755 files/media-automount "${ROOTFS_DIR}/usr/bin/media-automount"
install -v -d -m 0755 "${ROOTFS_DIR}/media"

install -v -d -m 0755 "${ROOTFS_DIR}/etc/systemd/system/system-preset"
install -v -m 0644 files/10-ovos-system.preset "${ROOTFS_DIR}/etc/systemd/system/system-preset/10-ovos-system.preset"
install -v -m 0644 files/99-ovos-default.preset "${ROOTFS_DIR}/etc/systemd/system/system-preset/99-ovos-default.preset"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/systemd/user/user-preset"
install -v -m 0644 files/10-ovos-user.preset "${ROOTFS_DIR}/etc/systemd/user/user-preset/10-ovos-user.preset"
install -v -m 0644 files/99-ovos-user-default.preset "${ROOTFS_DIR}/etc/systemd/user/user-preset/99-ovos-user-default.preset"

install -v -d -m 0755 "${ROOTFS_DIR}/tmp/mycroft"

on_chroot << EOF

chown -R ovos:ovos /tmp/

EOF
