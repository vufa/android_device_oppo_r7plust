# Release name
PRODUCT_RELEASE_NAME := r7plusm

# Inherit some common CM stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/oppo/r7plusm/device_r7plusm.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := r7plusm
PRODUCT_NAME := cm_r7plusm
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := r7plusm
PRODUCT_MANUFACTURER := OPPO
