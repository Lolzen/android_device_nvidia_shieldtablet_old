#
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
#

PRODUCT_AAPT_CONFIG += xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

PRODUCT_CHARACTERISTICS := tablet
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_MODEM := icera
TARGET_TEGRA_TOUCH := raydium

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, vendor/nvidia/shield/shieldtablet.mk)

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.name

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/shieldtablet/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.tn8 \
    init.recovery.tn8.rc \
    init.tn8.rc \
    init.tn8_common.rc \
    power.tn8.rc \
    ueventd.tn8.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.opengl4.xml:system/etc/permissions/com.nvidia.feature.opengl4.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/audio/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/audio/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/audio/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/comms/gps.conf:system/etc/gps.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf


# Light
PRODUCT_PACKAGES += \
    lights.tegra

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Radio Interface
PRODUCT_PACKAGES += rild

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/twrp/librm31080.so:recovery/root/system/lib/librm31080.so \
    $(LOCAL_PATH)/twrp/ts.default.so:recovery/root/system/lib/hw/ts.default.so \
    $(LOCAL_PATH)/twrp/para_10_02_00_20.so:recovery/root/system/lib/para_10_02_00_20.so \
    $(LOCAL_PATH)/twrp/para_10_02_00_a0.so:recovery/root/system/lib/para_10_02_00_a0.so \
    $(LOCAL_PATH)/twrp/para_10_02_00_b0.so:recovery/root/system/lib/para_10_02_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_03_00_20.so:recovery/root/system/lib/para_10_03_00_20.so \
    $(LOCAL_PATH)/twrp/para_10_03_00_a0.so:recovery/root/system/lib/para_10_03_00_a0.so \
    $(LOCAL_PATH)/twrp/para_10_03_00_a0.so:recovery/root/system/lib/para_10_03_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_04_00_b0.so:recovery/root/system/lib/para_10_04_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_04_00_c0.so:recovery/root/system/lib/para_10_04_00_c0.so \
    $(LOCAL_PATH)/twrp/para_10_05_00_c0.so:recovery/root/system/lib/para_10_05_00_c0.so \
    $(LOCAL_PATH)/twrp/para_10_06_00_b0.so:recovery/root/system/lib/para_10_06_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_07_00_b0.so:recovery/root/system/lib/para_10_07_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_08_00_20.so:recovery/root/system/lib/para_10_08_00_20.so \
    $(LOCAL_PATH)/twrp/para_10_08_00_a0.so:recovery/root/system/lib/para_10_08_00_a0.so \
    $(LOCAL_PATH)/twrp/para_10_08_00_b0.so:recovery/root/system/lib/para_10_08_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_09_00_c0.so:recovery/root/system/lib/para_10_09_00_c0.so \
    $(LOCAL_PATH)/twrp/para_10_09_01_c0.so:recovery/root/system/lib/para_10_09_01_c0.so \
    $(LOCAL_PATH)/twrp/para_10_09_02_c0.so:recovery/root/system/lib/para_10_09_02_c0.so \
    $(LOCAL_PATH)/twrp/para_10_0a_00_b0.so:recovery/root/system/lib/para_10_0a_00_b0.so \
    $(LOCAL_PATH)/twrp/para_10_0b_00_a0.so:recovery/root/system/lib/para_10_0b_00_a0.so

$(call inherit-product, device/nvidia/shield-common/shield.mk)

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0
