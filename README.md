# 🐧 embedded-linux-from-scratch-arm-using-qemu - Build Embedded Linux Easily

[![Download Releases](https://img.shields.io/badge/Download-embedded-linux--from--scratch--arm--using--qemu-brightgreen?style=for-the-badge)](https://github.com/bijingopal1/embedded-linux-from-scratch-arm-using-qemu/releases)

---

## 📖 What This Project Does

This project shows how to create a small Linux system for embedded devices from zero. It does not use big build systems like Buildroot or Yocto. Instead, it walks through building each part step by step:

- Setting up a cross compiler using crosstool-ng.
- Building the U-Boot bootloader for ARM.
- Compiling the Linux kernel.
- Creating a tiny root file system with BusyBox.
- Booting this system through QEMU, a virtual machine.

This guide is for people who want to learn how to build a Linux system for an ARM device without relying on complex tools.

---

## 🎯 Who Should Use This

- People interested in embedded Linux.
- Learners who want to understand Linux system building.
- Engineers who want to try manual cross-compilation.
- Users looking for a basic Linux environment for ARM on QEMU.

You do not need experience with Linux programming. The steps explain what to do in simple terms.

---

## 💻 System Requirements

To run and test this project, you need:

- **Operating System:** Windows 10 or later.
- **RAM:** At least 8 GB.
- **Disk Space:** Minimum 5 GB free.
- **CPU:** 64-bit Intel or AMD processor.
- **Software Tools:** Windows Subsystem for Linux (WSL) or Git Bash installed.
- **Administrator Rights:** Needed to install some tools.
- **Internet Access:** To download release files and required software.

This project uses QEMU, which runs ARM Linux inside a virtual machine on your Windows PC. The process uses command-line tools that will run inside WSL or Git Bash.

---

## 🚀 Getting Started

### Step 1: Download the Release Files

Visit the official release page to get the files you need.

[![Download Releases](https://img.shields.io/badge/Download-embedded-linux--from--scratch--arm--using--qemu-blue?style=for-the-badge)](https://github.com/bijingopal1/embedded-linux-from-scratch-arm-using-qemu/releases)

Open the link above in your web browser. Download the latest version of the release. These files contain the pre-built components and necessary scripts to run the system.

---

### Step 2: Install Required Software

You need to install some software before running the system.

1. **Install WSL (Windows Subsystem for Linux):**

   - Open PowerShell as Administrator and run:

     ```shell
     wsl --install
     ```

   - This installs Ubuntu by default.
   - Restart your PC if required.

2. **Open Ubuntu (or your chosen Linux distro) from the Start menu.**

3. **Install QEMU:**

   Inside the Linux terminal, run:

   ```shell
   sudo apt update
   sudo apt install qemu-system qemu-utils
   ```

4. **Install other needed tools:**

   ```shell
   sudo apt install gcc make build-essential
   ```

---

### Step 3: Extract and Prepare Files

Once you download the release files:

1. Move the downloaded ZIP or TAR file to a folder where you want to keep the project.

2. Extract the files using Windows Explorer or inside the Linux terminal:

   ```shell
   tar -xvf <filename>.tar.gz
   # or
   unzip <filename>.zip
   ```

3. Change directory into the extracted folder:

   ```shell
   cd embedded-linux-from-scratch-arm-using-qemu
   ```

This folder will contain scripts, toolchains, and kernel images.

---

### Step 4: Running the Pre-built ARM Linux System on QEMU

You can now start the ARM Linux system inside QEMU with this command (inside WSL):

```shell
./run-qemu.sh
```

This script boots the system using QEMU. A QEMU window should open showing the Linux boot process and shell prompt.

---

## 🔧 How It Works

This project builds and runs an ARM Linux system on QEMU by following these main phases:

- **Cross Toolchain:** Uses crosstool-ng to build a compiler that runs on your PC but makes code for ARM devices.

- **U-Boot Bootloader:** Cross-compiles U-Boot, a small program that starts the Linux kernel on embedded devices.

- **Linux Kernel:** Downloads and compiles the Linux kernel for ARM.

- **Root File System:** Uses BusyBox to create a small set of Linux commands and files needed to run the system.

- **Booting on QEMU:** Runs the ARM Linux inside QEMU to simulate hardware.

---

## 🛠️ Optional: Build All Components Yourself

If you want to rebuild everything from source, follow these general steps after downloading the project:

1. Build the cross toolchain:

   ```shell
   cd crosstool-ng
   ./build-ct-ng.sh
   ```

2. Build U-Boot:

   ```shell
   cd u-boot
   ./build-uboot.sh
   ```

3. Build the Linux kernel:

   ```shell
   cd linux
   ./build-linux.sh
   ```

4. Create root file system using BusyBox:

   ```shell
   cd busybox
   ./build-busybox.sh
   ```

5. Finally, start QEMU:

   ```shell
   ./run-qemu.sh
   ```

Each script handles the cross-compiling and building process automatically.

---

## 📁 File Structure Overview

- `crosstool-ng/` – Contains scripts and configs for building the cross compiler.
- `u-boot/` – U-Boot source and build scripts.
- `linux/` – Linux kernel source and build scripts.
- `busybox/` – BusyBox source and root filesystem setup.
- `run-qemu.sh` – Script to start the ARM system in QEMU.
- `README.md` – This guide.

---

## 💡 Tips for Success

- Always run commands inside WSL or a Linux terminal on Windows.
- Make sure all dependencies are installed before building.
- Give the QEMU window focus to interact with the Linux shell.
- Use Ctrl+C inside the QEMU window to stop the system.
- If the system doesn’t boot, check for missing files or failed build steps.
- You can modify the root filesystem by changing BusyBox configs.

---

## 🔍 Troubleshooting Common Issues

- **QEMU fails to start:** Ensure QEMU is installed properly with `sudo apt install qemu-system`.
- **Scripts not found:** Confirm you are in the correct directory and have extracted the files.
- **Permission denied:** Run `chmod +x *.sh` to make scripts executable.
- **WSL not working:** Check Windows updates and enable WSL from Windows Features.
- **Build failures:** Check the output messages; missing packages can cause this.

---

## ⚙️ Advanced Information

This project simulates an embedded ARM system with Linux. The ARM architecture is common in small devices like routers, IoT devices, and smartphones.

The cross compiler converts code so it runs on ARM hardware, even though your PC runs on a different chip. U-Boot loads the Linux kernel, which manages hardware and runs programs. BusyBox provides the Linux commands in a minimal setup.

Using QEMU helps test this without needing physical hardware.

---

## 📥 Download the Project

Click this link to visit the release page and get the latest files.

[Download embedded-linux-from-scratch-arm-using-qemu Releases](https://github.com/bijingopal1/embedded-linux-from-scratch-arm-using-qemu/releases)