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

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
	
# A/B support
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
	audio_dsp \
	system \
	bootloader \
	boot \
	cam_vpu1 \
	cam_vpu2 \
	cam_vpu3 \
	dpm \
	dtbo \
	gz \
	lk \
	logo \
	mcupm \
	md1img \
	md1img2 \
	pi_img \
	scp \
	spmfw \
	sspm \
	tee \
	tzapp \
	vbmeta \
	vbmeta_system \
	vendor_boot	

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)/

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc
