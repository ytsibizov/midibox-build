#!/bin/bash -e

rm -rf midibox
git clone https://github.com/ytsibizov/midibox

install -v -o 0 -g 0 -d "${ROOTFS_DIR}/opt/midibox"
install -v -o 0 -g 0 -m 644 "midibox/src/midibox.py" "${ROOTFS_DIR}/opt/midibox/"
install -v -o 0 -g 0 -m 755 "midibox/service/midibox.sh" "${ROOTFS_DIR}/opt/midibox/"
install -v -o 0 -g 0 -m 644 "midibox/service/midibox.service" "${ROOTFS_DIR}/etc/systemd/system/"

echo "Enable midibox service"

on_chroot << EOF
systemctl daemon-reload
systemctl enable bluetooth
systemctl enable hciuart
systemctl enable midibox
EOF

