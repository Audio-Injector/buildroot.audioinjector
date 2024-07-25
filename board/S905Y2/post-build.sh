#!/bin/dash

# Running the FIP (Firmware in Package) script
echo "Pasting the resulting u-boot.bin to the FIP directory"
#cp $BUILD_DIR/uboot-$(echo $UBOOT_CUSTOM_REPO_VERSION | tr -d '"')/u-boot.bin $BUILD_DIR/fip-$FIP_VERSION/radxa-zero/bl33.bin

#echo "Making in FIP"
#make -C $BUILD_DIR/fip-$FIP_VERSION/radxa-zero/
