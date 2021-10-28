#!/bin/bash

#[[ -n $(which qemu-system-x86_64 2>/dev/null) ]]  || { echo "QEMU not found. Run setup.sh"; exit; }
[[ -n $(which qemu-system-x86_64 2>/dev/null) ]]  || { sudo apt update; sudo apt install qemu-kvm -y; }
[[ ! -f ubuntu-16.04.7-server-amd64.iso ]] && wget https://releases.ubuntu.com/16.04/ubuntu-16.04.7-server-amd64.iso
[[ ! -f disk.img ]] && qemu-img create -f qcow2 disk.img 300G
[[ ! -f OVMF_CODE.fd ]] && wget https://github.com/foxlet/macOS-Simple-KVM/raw/master/firmware/OVMF_CODE.fd
[[ ! -f OVMF_VARS-1024x768.fd ]] && wget https://github.com/foxlet/macOS-Simple-KVM/raw/master/firmware/OVMF_VARS-1024x768.fd

qemu-system-x86_64 \
 -m 8G \
 -vga qxl \
 -usb -device usb-kbd -device usb-tablet \
 -netdev user,id=net0 \
 -device vmxnet3,netdev=net0,id=net0,mac=52:54:00:09:49:17 \
 -drive id=sda,if=virtio,format=qcow2,file=disk.img \
 -cdrom ubuntu-16.04.7-server-amd64.iso \
 -drive if=pflash,format=raw,readonly,file="OVMF_CODE.fd" \
 -drive if=pflash,format=raw,file="OVMF_VARS-1024x768.fd" \
 -boot menu=on \
 -machine q35 \
 -cpu max
