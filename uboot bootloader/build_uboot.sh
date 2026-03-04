#!/bin/bash

echo "building the uboot bootloader"
PATH=${HOME}/x-tools/arm-unknown-linux-gnueabi/bin/:$PATH
export CROSS_COMPILE=arm-unknown-linux-gnueabi-
export  ARCH=arm
make uboot_defconfig 

make -j$(nproc)

echo "uboot bootloader build sucessfully"
