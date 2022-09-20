#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/kyoto

# Bootloader
BOARD_VENDOR := motorola
TARGET_SOC := mt6853
TARGET_BOOTLOADER_BOARD_NAME := mt6853
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := kyoto

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

#minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# File systems
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := mt6853
TARGET_BOARD_PLATFORM_GPU := mali-g57mc3

# A/B
AB_OTA_UPDATER := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

# kernel / mkbootimg args
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb/mt6853.dtb
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/motorola/kyoto
TARGET_KERNEL_CONFIG := kyoto_defconfig
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Dynamic/Logical Partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 6442450944
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 12884901888

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# System as root
BOARD_ROOT_EXTRA_FOLDERS := metadata first_stage_ramdisk
BOARD_SUPPRESS_SECURE_ERASE := true

# Copying vendor and product files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product

#Android Verified Bootvx
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext productd
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# TWRP specific build flags
TW_DEVICE_VERSION := CFKod@XDA beta_1
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file"
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 40
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Touchscreen Modules
TW_LOAD_VENDOR_MODULES := "focaltech_mtk_mmi.ko mtk_tpd_mmi.ko sensors_class.ko"

TW_RECOVERY_ADDITIONAL_RELINK_VENDOR_HW_BINARY_FILES += \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/hw/android.hardware.gatekeeper@1.0-service \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/hw/android.hardware.keymaster@4.1-service.trustonic

#Libs from System & Vendor related to the Binaries  above3
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libkeymaster41.so  \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/libpuresoftkeymasterdevice.so \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw/kmsetkey.trustonic.so \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw/libMcGatekeeper.so \
    $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw/libSoftGatekeeper.so

#Recovery Mode is selected from bootloader
TW_NO_REBOOT_RECOVERY := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_IGNORE_MISC_WIPE_DATA := true
BOARD_USES_MTK_HARDWARE := true
RECOVERY_SDCARD_ON_DATA := true
TW_USES_VENDOR_LIBS := true
PRODUCT_ENFORCE_VINTF_MANIFEST := true
PRODUCT_FULL_TREBLE := true

TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP = true

# logd
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#Build Debug
BUILD_BROKEN_DUP_RULES := true
