#
# Copyright (C) 2009 The Android Open Source Project
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

# include cicada's sensors library
common_ti_dirs := libsensors

include $(call all-named-subdir-makefiles, $(common_ti_dirs))

$(call inherit-product, build/target/product/full_base.mk)

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/lenovo/a107/init.a107.rc:root/init.target.rc \
    device/lenovo/a107/ueventd.a107.rc:root/ueventd.a107.rc


# This file is used to install modules which dont get activated by the standard module script
PRODUCT_COPY_FILES += \
    device/lenovo/a107/etc/01modules:system/etc/init.d/01modules

# Overclock script
PRODUCT_COPY_FILES += \
    device/lenovo/a107/etc/10overclock:system/etc/init.d/10overclock

# Watchdog reset
PRODUCT_COPY_FILES += \
    device/lenovo/a107/etc/99watchdog:system/etc/init.d/99watchdog

# Place prebuilt from omapzoom
PRODUCT_COPY_FILES += \
    device/lenovo/a107/prebuilt/GFX/system/lib/hw/overlay.omap3.so:/system/lib/hw/overlay.omap3.so 

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

$(call inherit-product-if-exists, vendor/lenovo/a107/a107-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/a107/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    libskiahw \
    wlan_cu \
    wlan_loader \
    libCustomWifi \
    wpa_supplicant.conf \
    dhcpcd.conf \
    lights.a107 \
    acoustics.default \
    libomap_mm_library_jni

# OMX components
PRODUCT_PACKAGES += \
    libbridge \
    cexec.out \
    libOMX_Core \
    libLCML \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libOMX.TI.WBAMR.decode \
    libOMX.TI.AAC.encode \
    libOMX.TI.G722.decode \
    libOMX.TI.MP3.decode \
    libOMX.TI.WMA.decode \
    libOMX.TI.Video.encoder \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.G729.encode \
    libOMX.TI.AAC.decode \
    libOMX.TI.VPP \
    libOMX.TI.G711.encode \
    libOMX.TI.JPEG.encoder \
    libOMX.TI.G711.decode \
    libOMX.TI.ILBC.decode \
    libOMX.TI.ILBC.encode \
    libOMX.TI.AMR.encode \
    libOMX.TI.G722.encode \
    libOMX.TI.JPEG.decoder \
    libOMX.TI.G726.encode \
    libOMX.TI.G729.decode \
    libOMX.TI.Video.Decoder \
    libOMX.TI.AMR.decode \
    libOMX.TI.G726.decode

PRODUCT_PACKAGES += \
    libreference-ril

# Use medium-density artwork where available
PRODUCT_LOCALES += mdpi

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/vold.a107.fstab:system/etc/vold.fstab

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lenovo/a107/prebuilt/keylayout/mg-capacitive.kl:system/usr/keylayout/mg-capacitive.kl \
    device/lenovo/a107/prebuilt/keylayout/mg-capacitive.kcm.bin:system/usr/keychars/mg-capacitive.kcm.bin

# Media Profile
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/lenovo/a107/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Boot files
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel #\
    $(LOCAL_BOOTLOADER):bootloader \
    $(LOCAL_2NDBOOTLOADER):2ndbootloader

# Wifi files
PRODUCT_COPY_FILES += \
    device/lenovo/a107/prebuilt/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/lenovo/a107/nvram.txt:system/vendor/firmware/nvram.txt \
    device/lenovo/a107/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd

# Gps files
PRODUCT_COPY_FILES += \
    device/lenovo/a107/glconfig.xml:system/vendor/gps/glconfig.xml \
    device/lenovo/a107/glgps:system/vendor/bin/glgps

# Other modules
PRODUCT_COPY_FILES += \
    device/lenovo/a107/prebuilt/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/lenovo/a107/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/lenovo/a107/prebuilt/modules/tun.ko:system/lib/modules/tun.ko

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=y \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.allow.mock.location=1 \
    ro.sf.lcd_density=160 \
    ro.setupwizard.enable_bypass=1 \
    ro.sf.hwrotation=270 \
    ro.setupwizard.enable_bypass=1 \
    keyguard.no_require_sim=1 \
    wifi.interface=eth0 \
    alsa.mixer.playback.master=DAC2 Analog \
    alsa.mixer.capture.master=Analog \
    dalvik.vm.heapsize=48m \
    ro.opengles.version=131072

FRAMEWORKS_BASE_SUBDIRS += \
            $(addsuffix /java, \
	    omapmmlib \
	 )

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_a107
PRODUCT_DEVICE := a107
