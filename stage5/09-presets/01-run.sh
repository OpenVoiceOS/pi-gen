#/bin/bash -e

install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.local"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.local/bin"

on_chroot << EOF

chown -Rf ovos:ovos /home/ovos

systemctl set-default multi-user.target

systemctl preset-all

su -c "systemctl --user preset-all" --login ovos

sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

EOF

# This is the compressed filename without .img extention
IMG_FILENAME="raspbian-ovos-dev"
# This is the end filename without the .zip extention
ARCHIVE_FILENAME="raspbian-ovos-dev"
