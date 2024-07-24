################################################################################
#
# FIP
#
################################################################################
FIP_VERSION = 3c5388e1c71cff35e78084b6dff623ff559ff81b
FIP_SITE = $(call github,radxa,fip,$(FIP_VERSION))
FIP_LICENSE = GPLv2
FIP_DEPENDENCIES = uboot

FIP_BOARD = radxa-zero 

define FIP_CONFIGURE_CMDS
	cp $(BUILD_DIR)/uboot-$(UBOOT_CUSTOM_REPO_VERSION)/u-boot.bin $(BUILD_DIR)/fip-$(FIP_VERSION)/radxa-zero/bl33.bin
endef

define FIP_BUILD_CMDS
	make -C $(BUILD_DIR)/fip-$(FIP_VERSION)/radxa-zero/
endef

$(eval $(generic-package))
