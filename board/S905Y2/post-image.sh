#!/bin/dash

# copy uboot variable file over
cp -a $BR2_EXTERNAL_CUSTOM_RADXA_ZEROW_PATH/board/S905Y2/vars.txt $BINARIES_DIR/

# Generate the uboot script
echo creating boot.scr
$HOST_DIR/bin/mkimage -C none -A arm -T script -a 0x00c00000 -e 0x00c00000 -n 'flatmax load script' -d $BR2_EXTERNAL_CUSTOM_RADXA_ZEROW_PATH/board/S905Y2/boot.cmd $BINARIES_DIR/boot.scr

# Put the device trees into the correct location
mkdir -p $BINARIES_DIR/amlogic; cp -a $BINARIES_DIR/*.dtb $BINARIES_DIR/amlogic

# Generation of the SD bootable image
$BASE_DIR/../support/scripts/genimage.sh -c $BR2_EXTERNAL_CUSTOM_RADXA_ZEROW_PATH/board/S905Y2/genimage.cfg

echo
echo
echo compilation done
echo
echo
echo
echo write your image to the sdcard, don\'t forget to change OF=/dev/sdb to your sdcard drive ...
echo use the following command ...
echo
echo 'OF=/dev/sdc; rootDrive=`mount | grep " / " | grep $OF`; if [ -z $rootDrive ]; then sudo umount $OF[123456789]; sudo dd if=output/images/sdcard.img of=$OF bs=10M; else echo you are trying to overwrite your root drive; fi'
echo
