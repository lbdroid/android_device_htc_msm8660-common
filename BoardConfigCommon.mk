# Copyright (C) 2012 The CyanogenMod Project
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

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm8660-common/include

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Vendor
BOARD_VENDOR := htc

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DNO_QCOM_MVS
BOARD_EGL_NEEDS_LEGACY_FB := true
COMMON_GLOBAL_CFLAGS += -DHWC_REMOVE_DEPRECATED_VERSIONS=0

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_LEGACY_QCOM := true

# Scorpion optimizations
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
#TARGET_USE_SCORPION_PLD_SET := true
#TARGET_SCORPION_BIONIC_PLDOFFS := 6
#TARGET_SCORPION_BIONIC_PLDSIZE := 128

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
BOARD_LEGACY_NL80211_STA_EVENTS := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
#TARGET_QCOM_AUDIO_VARIANT := legacy
#COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DLEGACY_QCOM_VOICE
#COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
#COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
#TARGET_USES_QCOM_LPA := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm8660-common/bluetooth/vnd_msm8660.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/htc/msm8660-common/bluetooth/include
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true

# Camera
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNO_UPDATE_PREVIEW
BOARD_HAVE_HTC_FFC := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_DISABLE_ARM_PIE := true
BOARD_CAMERA_USE_MM_HEAP := true
# Camera wrapper
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_USES_LEGACY_MEDIA := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS
USE_OPENGL_RENDERER := true
#older
#TARGET_HAVE_BYPASS := false
#TARGET_USES_C2D_COMPOSITION := true
#TARGET_USES_OVERLAY := true
#TARGET_QCOM_HDMI_OUT := true
#TARGET_QCOM_HDMI_RESOLUTION_AUTO := true
#endolder
TARGET_NO_HW_VSYNC := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_PMEM := true
BOARD_EGL_CFG := device/htc/msm8660-common/configs/egl.cfg

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Filesystem
BOARD_VOLD_MAX_PARTITIONS := 36

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
DYNAMIC_SHARED_LIBV8SO := true

TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))
