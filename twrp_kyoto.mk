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

# Release name
PRODUCT_RELEASE_NAME := kyoto

# Inherit from common AOSP
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit GSI Keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, build/make/target/product/virtual_ab_ota.mk)

# Inherit from vendor/twrp
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/kyoto/device.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/kyoto/recovery/root,recovery/root)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/kyoto/prebuilt,prebuilt)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/kyoto/prebuilt,out/target/product/kyoto/kernel/prebuilt)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := twrp_kyoto
PRODUCT_DEVICE := kyoto
PRODUCT_MODEL := motorola edge 20 lite
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
