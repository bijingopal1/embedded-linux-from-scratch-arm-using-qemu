## Cross compiling the linux kernel
- In this we will be seeing how to cross compile the linux kernel which we will be using the stable version of the kernel.

- Steps to cross compile the linux kernel :
```bash
$ mkdir linux 
$ cd linux
$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linuxstable.git
$ git checkout v6.1
# this command restore the directory to its original state , and clears out everything, even config and all build up
$ make mrproper
# using the vexpress config for the linux kernel
$ make ARCH=arm vexpress_defconfig
$ export PATH=~/x-tools/arm-unknown-linux-gnueabi/bin:$PATH
$ scripts/config --disable GCC_PLUGINS 
$ scripts/config --enable DEVTMPFS_MOUNT
$ make ARCH=arm CROSS_COMPILE=arm-unknown-linux-gnueabi- olddefconfig
$ make -j4 ARCH=arm CROSS_COMPILE=arm-unknown-linux-gnueabi- zImage dtbs
$ make -j4 ARCH=arm CROSS_COMPILE=arm-unknown-linux-gnueabi- modules

# output obtained 
zImage , vexpress-v2p-ca9.dtb

```


### things to keep in mind 
- If you are following the above steps make sure that, you have set the path for the cross toolchain like done above ,if you dont do that it will try to use the native toolchain which is for the x86 architecture and always specify the arch and cross compile values too , so it build for the correct target, otherwise if not specified use the local architecture.
- I have used the vexpress_defconfig file for the building the linux kernel , the config contains all the relevant information , for the board you will be using the linux kernel. if your target board is differnt then, you can navigate to this path `linux/arch/arm/configs`, and list all the config in it, to see which suits your board the best.
- After doing the above steps you will be having the `zImage' , 'vexpressboard.dtbs`. you can find the device tree blob(dtbs), by going to the `linux/arch/arm/boot/dts` , and you will see the dtb file for the config you choosen in the above steps and can also find the `zImage` at `linux/arch/arm/boot/`.
- we will be needing the `zImage` and `device tree blob(dtb)` file, when we will be runnning the qemu emulation, for the vexpress board.


### use shell script automate 
- I have also provided the `kernel_defconfig` file , which i used and obtained , you can see and check your .config matches mine, and also a shell script that you can run simply to build the whole thing. In order to use the `buildkernel.sh` you have to move the script to the cloned linux kernel directory and run it. also make sure that you have provided the execute permission to the script.
- But make sure that before you run this script, you have cloned the directory , like in the above step.




