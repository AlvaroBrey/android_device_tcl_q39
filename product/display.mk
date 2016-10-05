# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PACKAGES += \
     libstlport 

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
