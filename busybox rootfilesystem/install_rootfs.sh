#!/bin/bash

echo "building the tiny rootfilesystem static"
export PATH=~/x-tools/arm-unknown-linux-gnueabi/bin:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-unknown-linux-gnueabi-
make clean 

cp busyboxconfig ./.config

make oldconfig
make 
make CONFIG_PREFIX=../rootfs install
cd ../rootfs
mkdir -p rootfs/{proc,sys,dev,etc}

echo "rootfs build completed"
