#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/lge/sdm845-common

# Inherit from common device tree
include device/lge/sdm845-common/BoardConfigCommon.mk

# A/B
AB_OTA_PARTITIONS += \
    product \
	recovery

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

include vendor/lineage/config/BoardConfigReservedSize.mk
BOARD_SUPER_PARTITION_GROUPS := lge_dynamic_partitions
BOARD_LGE_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor
BOARD_LGE_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) / 2 - 4194304) # 4MiB overhead

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.dynamic

# Treble
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
