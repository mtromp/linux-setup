# Working with Yocto Project
I will set up yocto in `${HOME}/workspace/yoctowork`. I will start with the
instructions on https://www.yoctoproject.org/docs/2.7/brief-yoctoprojectqs/brief-yoctoprojectqs.html and the pages it refers to.

## Preparing the build host
Even though this will not be a headless system, I'm installing all of the packages
anyway.

```bash
sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm
     
## Also installing tools for building the documentation
sudo apt-get install make xsltproc docbook-utils fop dblatex xmlto
```


## Clone the poky repository
I want to work with the warrior branch 2.7
```bash
git clone git://git.yoctoproject.org/poky
cd poky
git checkout -b warrior origin/warrior
```

## build core-image-sato
This version of yocto will decide how many threads to use automatically. In the
past it was important to set that up
```bash
cd ~/workspace/yoctowork/poky
source oe-init-build-env
bitbake core-image-sato  # started at 13:13
## after several hours: Finished at 15:03
runqemu qemux86

## the output:
mtromp@meerkat build (warrior) 03:09 PM$ runqemu qemux86
runqemu - INFO - Running MACHINE=qemux86 bitbake -e...
runqemu - INFO - Continuing with the following parameters:

KERNEL: [/home/mtromp/workspace/yoctowork/poky/build/tmp/deploy/images/qemux86/bzImage--5.0.19+git0+31de88e51d_00638cdd8f-r0-qemux86-20190704171245.bin]
MACHINE: [qemux86]
FSTYPE: [ext4]
ROOTFS: [/home/mtromp/workspace/yoctowork/poky/build/tmp/deploy/images/qemux86/core-image-sato-qemux86-20190704171245.rootfs.ext4]
CONFFILE: [/home/mtromp/workspace/yoctowork/poky/build/tmp/deploy/images/qemux86/core-image-sato-qemux86-20190704171245.qemuboot.conf]

runqemu - INFO - Setting up tap interface under sudo
[sudo] password for mtromp:
runqemu - INFO - Network configuration: 192.168.7.2::192.168.7.1:255.255.255.0
runqemu - INFO - Running /home/mtromp/workspace/yoctowork/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-i386 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -drive file=/home/mtromp/workspace/yoctowork/poky/build/tmp/deploy/images/qemux86/core-image-sato-qemux86-20190704171245.rootfs.ext4,if=virtio,format=raw -vga vmware -show-cursor -usb -device usb-tablet -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0   -cpu pentium2 -m 256 -serial mon:vc -serial null -kernel /home/mtromp/workspace/yoctowork/poky/build/tmp/deploy/images/qemux86/bzImage--5.0.19+git0+31de88e51d_00638cdd8f-r0-qemux86-20190704171245.bin -append 'root=/dev/vda rw highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1 '

runqemu - INFO - Cleaning up
Set 'tap0' nonpersistent

```

Once the qemu window comes up, then need to do `CTRL-ALT-G` to grab the mouse.
This machine has a gui interface for applications. I was able to run it twice
in a row.

The tmp/deploy/images/qemux86 files have time stamps of Jul 4, 2019 15:09. The
rootfs.ext4 file has the time when I last booted/ran the qemu images 15:51 or so.

## Beaglebone Black build

Following the instructions on this site: https://jumpnowtek.com/beaglebone/BeagleBone-Systems-with-Yocto.html

I am using a different window so that the oe-init-build-env from the previous
build does not have a negative impact on the beaglebone build

```bash
sudo apt install libncurses5-dev ## the only one from the list that was available
cd ~/workspace/yoctowork/poky
git clone -b warrior git://git.openembedded.org/meta-openembedded
git clone -b warrior https://github.com/meta-qt5/meta-qt5.git

cd ..  ## back to the yoctowork directory
mkdir bbb
cd bbb
git clone -b warrior git://github.com/jumpnow/meta-bbb
mkdir -p ./build/conf
source ../poky/oe-init-build-env ./build
cp ../meta-bbb/conf/local.conf.sample ./conf/local.conf
cp ../meta-bbb/conf/bblayers.conf.sample ./conf/bblayers.conf
```

I edited the files to use the correct path and to point to the tmp, downloads
and sstate-cache directories in the yoctowork/poky/build directory. Entered
hardcoded paths in both files (local.conf and bblayers.conf).

Double checked that the qemu from the sato build still worked. It did.

Realized that I had done the sourcing of the oe-init-build-env before changing
the configuration files. Exit that window and create a new one.

build the console-image `bitbake console-image` started at 19:49 finished 20:46

build the `qt5-image` started at 20:48 finished at 21:05

The build of installer-image took about a minute. qemux86 still comes up.

