#!/bin/bash

[[ -n $(which qemu-system-x86_64 2>/dev/null) ]]  || { echo "QEMU not found. Run setup.sh"; exit; }
[[ ! -f ubuntu-16.04.7-server-amd64.iso ]] && wget https://releases.ubuntu.com/16.04/ubuntu-16.04.7-server-amd64.iso
[[ ! -f disk.img ]] && qemu-img create -f qcow2 disk.img 300G

qemu-system-x86_64 \
 -m 8G
 -cdrom ubuntu-16.04.7-server-amd64.iso \
 -hda disk.img \
 -vga qxl \
 -usb -device usb-kbd -device usb-tablet \
 -netdev user,id=net0 \
 -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:0e:0d:20 \
 -device ich9-ahci,id=sata \
 -L pc-bios
