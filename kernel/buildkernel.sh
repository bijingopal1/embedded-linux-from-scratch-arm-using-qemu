#!/bin/bash

echo "kernel build starting"
export ARCH=arm
export CROSS_COMPILE=arm-unknown-linux-gnueabi-
export PATH=~/x-tools/arm-unknown-linux-gnueabi/bin:$PATH

make mrproper
make vexpress_defconfig
scripts/config --disable GCC_PLUGINS
scripts/config --enable DEVTMPFS_MOUNT
make olddefconfig
make -j$(nproc) zImage dtbs
make -j$(nproc) modules

echo "kernel build completed"