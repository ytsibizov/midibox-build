#!/bin/bash -e

#git clone https://github.com/ytsibizov/midibox

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/opt/midibox"
install -v -o 1000 -g 1000 -m 644 "midibox/src/midibox.py" "${ROOTFS_DIR}/opt/midibox/"
install -v -o 1000 -g 1000 -m 755 "midibox/service/midibox.sh" "${ROOTFS_DIR}/opt/midibox/"
install -v -o 0 -g 0 -m 644 "midibox/service/midibox.service" "${ROOTFS_DIR}/etc/systemd/system/"

echo "Enable midibox service"

on_chroot << EOF
systemctl daemon-reload
systemctl enable midibox
EOF

