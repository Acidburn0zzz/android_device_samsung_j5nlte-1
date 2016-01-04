# Copyright (C) 2011 The Android Open-Source Project
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
#
# config.mk
#
# Product-specific compile-time definitions.
#

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/j5nlte

# Asserts
TARGET_OTA_ASSERT_DEVICE := j5lte,j5ltexx,j5nlte,j5nltexx,j500f,J500F,j500fn,J500FN

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Architecture
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

# Bootloader
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Ramdisk
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET :=0x00008000
TARGET_KERNEL_SOURCE := kernel/samsung/j5nlte
TARGET_KERNEL_CONFIG := cyanogenmod_j5nlte_defconfig
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000

# Partition Info
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2181038080
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1860648960
BOARD_CACHEIMAGE_PARTITION_SIZE := 202375168
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true

# QCOM
TARGET_USES_QCOM_BSP := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
PROTOBUF_SUPPORTED := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/j5nlte/ril/

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_USES_MMC_UTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NEW_ION_HEAP := true
TW_TARGET_USES_QCOM_BSP := true
TW_BRIGHTNESS_PATH := "/sys/devices/soc.0/1a00000.qcom\x2cmdss_mdp/qcom\x2cmdss_fb_primary.135/leds/lcd-backlight/brightness"
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/storage/extSdCard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_MTP_DEVICE := /dev/usb_mtp_gadget
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
