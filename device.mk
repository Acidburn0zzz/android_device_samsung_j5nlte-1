# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/j5nlte

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Ramdisk
PRODUCT_PACKAGES += \
init.environ.rc	\
init.rilcommon.rc \
init.carrier.rc \
init.rilchip.rc \
init.qcom.rc \
init.zygote32.rc \
init.qcom.usb.rc \
fstab.qcom \
init.trace.rc \
ueventd.rc \
ueventd.qcom.rc \
init.rc \
init.target.rc \
init.usb.rc \
init.container.rc

# Dalvik VM config for 1536MB (1.5GB) RAM devices
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# Default.prop overrides to get adb working at boot   
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# Inherit from qcom-common
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)
