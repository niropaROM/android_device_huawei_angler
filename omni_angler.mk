# Inherit omni-specific board config
include device/huawei/angler/BoardConfigOmni.mk

# Inherit base AOSP device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Bootanimation
TARGET_BOOTANIMATION_SIZE := 960x640

# TWRP
PRODUCT_COPY_FILES += \
    device/huawei/angler/twrp.fstab:recovery/root/etc/twrp.fstab

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.HAL3.enabled=1 \
    persist.camera.cpp.duplication=false

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Override product naming for Omni
PRODUCT_NAME := omni_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MTC20L/3230295:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MTC20L 3230295 release-keys"
    BUILD_ID=MTC20L
