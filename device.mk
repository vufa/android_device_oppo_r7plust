$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, vendor/oppo/r7plust/r7plust-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/oppo/r7plust/overlay

LOCAL_PATH := device/oppo/r7plust

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/oppo/r7plust/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
	libxlog 

#Wifi
PRODUCT_PACKAGES += \
	libwifi-hal-mt66xx \
	lib_driver_cmd_mt66xx \
	libwpa_client \
	hostapd \
	hostapd_cli \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

# Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

#Audio
PRODUCT_PACKAGES += \
    	audio_policy.default \
    	audio_policy.stub \
    	audio.r_submix.default \
    	audio.usb.default \
    	libaudio-resampler \
    	tinymix \
    	libtinyalsa

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	$(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf


#Bluetooth
PRODUCT_PACKAGES += \
    	libbt-vendor

#Torch
PRODUCT_PACKAGES += \
	Torch 

#Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
	$(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
	$(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(LOCAL_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
	$(LOCAL_PATH)/ramdisk/init.environ.rc:root/environ.rc \
	$(LOCAL_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.trustonic.rc:root/init.trustonic.rc \
	$(LOCAL_PATH)/ramdisk/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.modem.rc:root/meta_init.modem.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc

#Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:/system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	$(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(LOCAL_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
   	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    	ro.kernel.android.checkjni=0 \
    	dalvik.vm.checkjni=false \
	ro.telephony.ril_class=MediaTekRIL \
	ro.telephony.ril.config=fakeiccid
	
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
     ro.adb.secure=0 \
     ro.secure=1 \
     ro.allow.mock.location=1 \
     ro.debuggable=1 \
     ro.zygote=zygote64_32 \
     camera.disable_zsl_mode=1 \
     ro.mount.fs=EXT4 \
     persist.service.acm.enable=0 \
     persist.sys.usb.config=mtp,mass_storage

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_r7plust
PRODUCT_DEVICE := r7lust

#Set correct memory limits
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
