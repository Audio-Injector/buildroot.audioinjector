# Installation
## Erasing MMC
First we need to delete the content of the eMMC on the radxa zero. We first install the following
```bash
sudo pip3 install pyamlboot
```
Then connect the board while pressing and holding the USB BOOT button on the back of the board (for more information check https://wiki.radxa.com/Zero/dev/maskrom). 
You can then run lsusb to confirm the device is indeed in maskrom mode:
```bash
Bus 001 Device 048: ID 1b8e:c003 Amlogic, Inc. GX-CHIP
```
After that you run
```bash
wget https://dl.radxa.com/zero/images/loader/radxa-zero-erase-emmc.bin
sudo boot-g12.py radxa-zero-erase-emmc.bin
```

in order to erase the eMMC so the board boots from the SD card.

## Building the SD card linux image
Make sure to have available the latest version of Buildroot somewhere:
```bash
git clone --depth 1 https://github.com/buildroot/buildroot.git
```

Then, within this repo you should run
```bash
./setup.zero.sh ${buildroot_repo_path}
cd ${buildroot_repo_path}
 make
```

Finally, to burn the resulting image:
```bash
sudo dd if=output/images/sdcard.img of=${path_to_your_sdcard} conv=fsync,notrunc bs=10M status=progress
```
