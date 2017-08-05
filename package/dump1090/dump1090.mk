################################################################################
#
# dump1090
#
################################################################################

DUMP1090_VERSION = b155fdb458c3241ab375d1f2b12fbb6a9f8a8a3a
DUMP1090_SITE = $(call github,mutability,dump1090,$(DUMP1090_VERSION))
DUMP1090_LICENSE = GPL-2.0+
DUMP1090_LICENSE_FILES = COPYING
DUMP1090_DEPENDENCIES = libusb librtlsdr

define DUMP1090_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define DUMP1090_INSTALL_TARGET_CMDS
		$(INSTALL) -D -m 0755 $(@D)/dump1090 $(TARGET_DIR)/usr/bin
		$(INSTALL) -D -m 0755 $(@D)/view1090 $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
