## U-boot bootloader 
- Bootloader is the one of the important pillar of the whole embedded linux thing, it is what lets you load the kernel and initial root file system to your board.
- Aside from loading the linux kernel and the root filesystem ,the bootloader have important task is to first initialise the basic as much as hardware require to load the kernel and also to pass the device tree, to the kernel which pass the information about the board to the kernel.

### steps to build the u boot
```bash 
$ sudo apt install libssl-dev device-tree-compiler swig python3-dev python3-setuptools
$ git clone git://git.denx.de/u-boot.git
$ cd u-boot
$ git checkout v2022.07

# setting the path
$ PATH=${HOME}/x-tools/arm-unknown-linux-gnueabi/bin/:$PATH
$ export CROSS_COMPILE=arm-unknown-linux-gnueabi-
$ export ARCH=arm

$ make vexpress_ca9x4_defconfig

$ scripts/config --disable ENV_IS_IN_FLASH
$ scripts/config --enable ENV_IS_IN_FAT
$ scripts/config --enable CMD_EDITENV
$ scripts/config --enable CMD_BOOTD
$ make menuconfig 

# Set Name of the block device for the environment (CONFIG_ENV_FAT_INTERFACE): mmc
# Device and partition for where to store the environment in FAT (CONFIG_ENV_FAT_DEVICE_AND_PART): 0:1

$ make -j$(nproc)

# output files 
u-boot u-boot.bin
```

## running the uboot bootloader on the qemu 
```bash
u-boot on  HEAD (e092e32) [!?] 
❯ qemu-system-arm -M vexpress-a9 -m 128M -nographic -kernel u-boot


U-Boot 2022.07-dirty (Mar 01 2026 - 19:53:21 +0530)

DRAM:  128 MiB
WARNING: Caches not enabled
Core:  19 devices, 10 uclasses, devicetree: embed
Flash: 64 MiB
MMC:   mmci@5000: 0
Loading Environment from FAT... Card did not respond to voltage select! : -110
** Bad device specification mmc 0 **
In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@3,02000000
Hit any key to stop autoboot:  0 
MMC Device 1 not found
no mmc device at slot 1
Card did not respond to voltage select! : -110
smc911x: detected LAN9118 controller
smc911x: phy initialized
smc911x: MAC 52:54:00:12:34:56
BOOTP broadcast 1
DHCP client bound to address 10.0.2.15 (4 ms)
*** Warning: no boot file name; using '0A00020F.img'
Using ethernet@3,02000000 device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename '0A00020F.img'.
smc911x: MAC 52:54:00:12:34:56

TFTP error: trying to overwrite reserved memory...
missing environment variable: pxefile_addr_r
smc911x: detected LAN9118 controller
smc911x: phy initialized
smc911x: MAC 52:54:00:12:34:56
BOOTP broadcast 1
DHCP client bound to address 10.0.2.15 (1 ms)
Using ethernet@3,02000000 device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'boot.scr.uimg'.
smc911x: MAC 52:54:00:12:34:56

TFTP error: trying to overwrite reserved memory...
smc911x: detected LAN9118 controller
smc911x: phy initialized
smc911x: MAC 52:54:00:12:34:56
BOOTP broadcast 1
DHCP client bound to address 10.0.2.15 (0 ms)
Using ethernet@3,02000000 device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'boot.scr.uimg'.
Load address: 0x60100000
Loading: *
TFTP error: 'Access violation' (2)
Not retrying...
smc911x: MAC 52:54:00:12:34:56
cp - memory copy

Usage:
cp [.b, .w, .l, .q] source target count
Wrong Image Format for bootm command
ERROR: can't get kernel image!
=> 

```
- it will let you now enter the prompts to interact with the u boot loader , type help to see the list of the commands you can use. and your output for this will be quite different than mine, and but important point for you to check , you reach to the command prompt.
- i have also added the my config file , which you can use directly to build the uboot, once your in the uboot, move the `build_uboot.sh` script and the `uboot_defconfig` config file inside the cloned u boot directory, and also provide the execute permission to script to work.

