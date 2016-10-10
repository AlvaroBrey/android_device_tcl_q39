# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the hardware-specific part of the product configuration
$(call inherit-product, device/tcl/q39/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := q39
PRODUCT_NAME := cm_q39
PRODUCT_BRAND := TCL
PRODUCT_MODEL := TCL M3G
PRODUCT_MANUFACTURER := TCL

PRODUCT_GMS_CLIENTID_BASE := android-tcl

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=q39 \
	BUILD_FINGERPRINT=TCL/TCL_M3G/EVOQUE:5.1.1/LRX22G/TCL_M3G_V4.0:user/release-keys \
	PRIVATE_BUILD_DESC="q39-user 5.1.1 LRX22G TCL_M3G_SV1.6.1 release-keys"
