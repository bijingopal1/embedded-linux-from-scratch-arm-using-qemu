## Root file system 
- Any linux distribution requires a root filesystem, if you dont provide any kind of root files system , your will see the kernel panic and print error and stop there.
- You requires a basic root file system to boot fully , and get the command prompt shell, then there you can populate the root filesystem with the various kind of the scripts to start up other programs and configure the network interfaces and user permissions. without the rootfilesystem there will be no user space and no applications you can run.

## steps to make a tiny rootfilesystem
```bash

$ git clone https://git.busybox.net/busybox
$ cd busybox/
$ git checkout 1_37_stable

$ export PATH=~/x-tools/arm-unknown-linux-gnueabi/bin:$PATH

$ make menuconfig 
# in the menuconfig you have to do this things, make sure that your build is static , that requires no library or depenedencies, and standalone.
# other thing you have to do , is to choose the install directory, where you write the path where you want the busybox to install the filesystem 

# this will output a package busybox in your current directory 
$ make 

# run this to install the file system to the choosen directory in menuconfig. or by default it install the filesystem in the same directory with name __install.
$ make install

```
- By following the above steps you can have a basic root filesystem.
 
## using script to build the same.
- To build the rootfs by the script, you have to move both the config file and the script to the busbox directory where you cloned the busybox.
- provide the execution permission by running the chmod +x script_name , you can see the new directory be added outside the current folder of the busybox.

