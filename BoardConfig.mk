#
# Copyright 2015 The Android Open Source Project
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

# mt6795 platform boardconfig
LOCAL_PATH := device/oppo/r7plust
-include vendor/oppo/r7plust/BoardConfigVendor.mk

# Device specific headers
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

USE_CAMERA_STUB := true



# inherit from the proprietary version

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6795
TARGET_NO_BOOTLOADER := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_FACTORYIMAGE := true

TARGET_LDPRELOAD += libxlog.so

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true

TARGET_BOOTLOADER_BOARD_NAME := mt6795

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true


BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00e88000 --tags_offset 0x0df88000 --board Bule
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/bootimg.mk

TARGET_KMODULES := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Healthd
HEALTHD_FORCE_BACKLIGHT_CONTROL := true
HEALTHD_ENABLE_TRICOLOR_LED := true
RED_LED_PATH := /sys/class/leds/red/brightness
GREEN_LED_PATH := /sys/class/leds/green/brightness
BLUE_LED_PATH := /sys/class/leds/blue/brightness

# BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

TARGET_PROVIDES_INIT_RC := true

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# FM Radio
MTK_FM_SUPPORT := yes
MTK_FM_RX_SUPPORT := yes
MTK_FM_TX_SUPPORT := yes

# RIL
#BOARD_RIL_CLASS := $(LOCAL_PATH)/ril/
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := MT6630

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true

# MTK_WLAN_SUPPORT
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# make_ext4fs requires numbers in dec format
TARGET_USERIMAGES_USE_EXT4:=true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 #16384
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 #16384
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 #2097152
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28793372672 #28118528
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

#CWM
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/root/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USERIMAGES_USE_EXT4 := true

#TWRP
DEVICE_RESOLUTION := 1080x1920
#TW_THEME := portrait_hdpi
RECOVERY_VARIANT := twrp
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_NO_REBOOT_BOOTLOADER := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := false
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := "/sys/devices/mtk-msdc.0/subsystem/drivers/leds-mt67xx/leds/lcd-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# SELinux
BOARD_SEPOLICY_DIRS := \
       $(LOCAL_PATH)/sepolicy
POLICYVERS := 29
