#
# Copyright (C) 2021 The Evervolv Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Build type
ifeq ($(PRODUCT_IS_ATV), true)
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_tv.mk)

TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920
else
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_full_tablet_wifionly.mk)

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
endif

# Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=adt3 \
    PRIVATE_BUILD_DESC="adt3-user 13 TTT1.230205.001 9565391 release-keys"

BUILD_FINGERPRINT := ADT-3/adt3/adt3:13/TTT1.230205.001/9565391:user/release-keys
