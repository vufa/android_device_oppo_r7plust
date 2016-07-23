# Release name
PRODUCT_RELEASE_NAME := r7plust

# Inherit some common MK stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/oppo/r7plust/full_r7plust.mk)

#sign the kernel
$(call inherit-product, $(SRC_TARGET_DIR)/product/verity.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := r7plust
PRODUCT_NAME := mk_r7plust
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := R7plust
PRODUCT_MANUFACTURER := OPPO

PRODUCT_GMS_CLIENTID_BASE := android-oppo
