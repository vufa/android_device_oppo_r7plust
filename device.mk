$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/oppo/r7plust/r7plust-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/oppo/r7plust/overlay

LOCAL_PATH := device/oppo/r7plust

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
    libxlog

# be a chinese
EXTENDED_FONT_FOOTPRINT := true
PRODUCT_LOCALES := zh_CN zh_HK zh_TW

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai

# init
PRODUCT_PACKAGES += \
    proj-dev-setup

# various MTK ABI fixes
# this is the approach of the cm-13.0 sprout port
PRODUCT_PACKAGES += \
    libmtkabi

# hack to fix asec on emulated sdcard
PRODUCT_PACKAGES += \
    asec_helper

# workaround proximity sensor sometimes losing calibration after making a call
PRODUCT_PACKAGES += \
    meizupshelper

# Display
PRODUCT_PACKAGES += \
    libgralloc_extra \
    libion_mtk \
    libui_ext \
    libgui_ext \
    guiext-server \
    librrc

# Lights
PRODUCT_PACKAGES += \
    lights.mt6595 \

# Audio
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio_policy.default \
    libtinycompress \
    libtinyxml \
PRODUCT_COPY_FILES += \
    device/oppo/r7plust/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/oppo/r7plust/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/oppo/r7plust/configs/audio_device.xml:system/etc/audio_device.xml \
    device/oppo/r7plust/configs/audio_policy.conf:system/etc/audio_policy.conf

# this can't be compiled right now due to ABI mismatches (MTK_Tfa98xx_SetEQ),
# and I don't feel like compiling the whole audio HAL from the source...
#    libtfa9890_interface \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Digital Restrictions Management
PRODUCT_PACKAGES += \
    libmtk_drvb \
    #libdrmmtkutil

# Wifi
 PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf
    
PRODUCT_COPY_FILES += \
    device/oppo/r7plust/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    device/oppo/r7plust/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/oppo/r7plust/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny
    
# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    audio.a2dp.default
PRODUCT_COPY_FILES += \
    device/oppo/r7plust/configs/bt_did.conf:system/etc/bluetooth/bt_did.conf

# RIL
#   
PRODUCT_PACKAGES += \
    gsm0710muxd \
    gsm0710muxdmd2 \
    mtkrildmd2 \
    mtkrild \
    mtk-ril \
    mtk-rilmd2 \
    volte_stack \
    volte_imcb \
    volte_ua \
    volte_imsm \
    libmal \
    libmal_datamngr \
    libmal_epdga \
    libmal_imsmngr \
    libmal_mdmngr \
    libmal_nwmngr \
    libmal_rds \
    libmal_rilproxy \
    libmal_simmngr \
    epdg_wod \
    mtkmal \
    charon starter stroke ipsec \
    libcharon libhydra libstrongswan libsimaka \

# IMS and VoLTE feature
#ifeq ($(strip $(MTK_IMS_SUPPORT)),yes)
    PRODUCT_PACKAGES += ImsService
#endif

# IKEv2
#ifeq ($(strip $(MTK_EPDG_SUPPORT)),yes)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/ipsec.conf:system/etc/ipsec/ipsec.conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/strongswan.conf:system/etc/ipsec/strongswan.conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/updown_script:system/etc/ipsec/updown_script
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/openssl.cnf:system/etc/ipsec/ssl/openssl.cnf

#ifeq ($(strip $(MTK_CIP_SUPPORT)),no)
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/Entrust.net_Certification_Authority_2048.cer:system/etc/ipsec/ipsec.d/cacerts/CA1.cer
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk/strongswan/epdg_conf/test2_ca.crt:system/etc/ipsec/ipsec.d/cacerts/CA1L1.crt
#endif
#endif

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml \

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

PRODUCT_PACKAGES += \
    gps.mt6595 \
    mtk_agpsd \

# Vibration
PRODUCT_PACKAGES += \
    openimmvibed \


# Keylayout
PRODUCT_COPY_FILES += \
     device/oppo/r7plust/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     device/oppo/r7plust/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
     device/oppo/r7plust/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl   

# Thermal
PRODUCT_COPY_FILES += \
     device/oppo/r7plust/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     device/oppo/r7plust/configs/thermal.conf:system/etc/.tp/thermal.conf \
     device/oppo/r7plust/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf \
     device/oppo/r7plust/configs/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
     device/oppo/r7plust/configs/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 

# Ramdisk 
PRODUCT_PACKAGES += \
     healthd \
     init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/ramdisk/fstab.charger:root/fstab.charger\
    $(LOCAL_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
    $(LOCAL_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/ramdisk/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
    $(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/ramdisk/init.mt6595.rc:root/init.mt6595.rc \
    $(LOCAL_PATH)/ramdisk/init.storage.rc:root/init.storage.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
#    $(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
#    $(LOCAL_PATH)/ramdisk/init.zygote32_64.rc:root/init.zygote32_64.rc \
#    $(LOCAL_PATH)/ramdisk/init.zygote32.rc:root/init.zygote32.rc \
#    $(LOCAL_PATH)/ramdisk/init.zygote64_32.rc:root/init.zygote64_32.rc \
#    $(LOCAL_PATH)/ramdisk/init.zygote64.rc:root/init.zygote64.rc \
#    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
#    $(LOCAL_PATH)/ramdisk/init.environ.rc.in:root/init.environ.rc.in \
#    $(LOCAL_PATH)/ramdisk/healthd:sbin/healthd \
#    $(LOCAL_PATH)/ramdisk/init:root/init \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    device/oppo/r7plust/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    device/oppo/r7plust/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Media	
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
	device/oppo/r7plust/configs/media_codecs.xml:system/etc/media_codecs.xml \
	device/oppo/r7plust/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	device/oppo/r7plust/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += \
      charger_res_images

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.hardware=mt6795 \

# NFC
#PRODUCT_PACKAGES += \
#    com.android.nfc_extras \
#    Tag
#PRODUCT_COPY_FILES += \
#    packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
#    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
#    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
#    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Ifaddrs
PRODUCT_PACKAGES += \
    libifaddrs

PRODUCT_PACKAGES += \
    Torch

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
     ro.adb.secure=0 \
     ro.secure=1 \
     ro.allow.mock.location=1 \
     ro.debuggable=1 \
     ro.zygote=zygote64_32 \
     camera.disable_zsl_mode=1 \
     ro.mount.fs=EXT4 \
     persist.service.acm.enable=0 \
     persist.sys.usb.config=mtp,mass_storage \
     persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MediaTekRIL \
    ro.telephony.ril.config=fakeiccid  \
    persist.call_recording.enabled=true \
    persist.call_recording.src=4 \
    persist.debug.wfd.enable=1

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

 PRODUCT_PACKAGES += \
    libnl_2 \
    libtinyxml

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    ext4_resize \
    resize_ext4 \
    superumount 

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)


# vim:set ai et ts=4 sw=4 sts=4 fenc=utf-8:
