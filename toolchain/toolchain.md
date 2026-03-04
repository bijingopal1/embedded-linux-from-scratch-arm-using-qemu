## Toolchain
- For building or cross compiling the bootloader,kernel and busybox rootfilesystem, we will be needing a toolchain for that.
we cant use the native toolchain to compile the codes,package and binaries that  will be running on your target, as both are different 
architecture, the gcc toolchain on your laptop is for the x86 architecture , while your target can be a microcontroller arm cortex M series, or the soc based on the arm cortex A series, which can either run the linux operating system or no os at all. Coming 
to the point , in this i ll be showing you how can you build a cross-toolchain from scratch and for that we will be using the 
`croostool-ng` toolchain. 
- Steps you need to take in order to build a toolchain:
### Target Architecture 
- A standard toolchain consists of the following things:
1. binutils : it contains the tools for compiler, readelf , linker and assemble etc many more.
2. GNU compiler collection(gcc) : contains the compiler for the C, and it converts your human readable code to the machine level.
3. C library : This is what lets your code or application in the user space to talk to the kernel or the low level, via the application programming interface(API).
and there are differnt type of the C standard library.
   - Several C standard libraries are available: glibc, uClibc, musl, klibc, newlib..., all these libraries are as per the demands, you wan the standard where resources arent constraints you use the glibc , uclibc is for the embedded system and is lightweight etc.
- in this you have to decide what architecture your toolchain you are using for, like in this im using the arm.

### Architecture tuple
- It is a hyphen seperated label that describes the target system for which we are cross compiling or building software.
**Format / Parts:**

```
<architecture>[-<vendor>]-<OS>-<ABI/C library>

```

| Part | Description | Examples |
| --- | --- | --- |
| **Architecture** | CPU type | `arm`, `riscv`, `mips64el` |
| **Vendor** | Optional, free-form label | `vendor`, `none` |
| **OS** | Operating system (or none for bare metal) | `linux`, `none` |
| **ABI/C library** | Binary interface / C library rules | `gnu`, `gnueabihf`, `eabihf` |

**Examples:**

- `arm-linux-gnueabihf` → ARM CPU, Linux OS, GNU hard-float ABI
- `arm-vendor-none-eabihf` → ARM CPU, bare metal, embedded ABI

### Crosstoolng installation
```bash
# installing the dependencies required for building a cross toolchain
$ sudo apt-get install autoconf automake bison bzip2 cmake \
flex g++ gawk gcc gettext git gperf help2man libncurses5-dev \
libstdc++6 libtool libtool-bin make patch python3-dev rsync \
texinfo unzip wget xz-utils


$ git clone https://github.com/crosstool-ng/crosstool-ng.git
$ cd crosstool-ng
$ git checkout crosstool-ng-1.22.0
$ ./bootstrap
$ ./configure --enable-local
$ make
$ make install

# prints the all architecture tuples
$./ct-ng list-samples 
$./ct-ng distclean
$./ct-ng arm-unknown-linux-gnueabi
$./ct-ng menuconfig

# go to path and misc options, and disable the render toolchain read only, by pressing space
$./ct-ng build
# it may take 1 hour or above to build the toolchain
```
- after running the above code it may take as long as 1 hour or 1h 30 mins to build the whole toolchain , and the toolchain will be installed in the ~/x-tools/arm-unknown-linux-gnueabi.

### cross compiling a hello world program 
```bash 
# i assume you know the c, to write a simple hello world program
$ nano hello.c
# setting the local path for the toolchain so when we compile the above program it dont use the native toolchain
$ export PATH=~/x-tools/arm-unknown-linux-gnueabi/bin:$PATH
# print the above directory path for the toolchain to confirm
$ which arm-unknown-linux-gnueabi-gcc
# checking the version 
$ arm-unknown-linux-gnueabi-gcc -v
$ arm-unknown-linux-gnueabi-gcc hello.c -o hello
$ file hello 
# above command will print the architecure and other information.
```
### static compiling 
```bash
arm-unknown-linux-gnueabi-gcc -static hello.c -o hellostatic
```
- the command above cross compile the hello.c statically ,so your output binary is independent of any dependencies ,but if you compare the size with the previous one it will be massive.

