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

$(call inherit-product, device/tcl/q39/full_q39.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

PRODUCT_NAME := cm_q39
BOARD_VENDOR := tcl
PRODUCT_DEVICE := q39

PRODUCT_GMS_CLIENTID_BASE := android-micromax

TARGET_VENDOR_PRODUCT_NAME := M3G
TARGET_VENDOR_DEVICE_NAME := M3G
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=M3G PRODUCT_NAME=M3G

## Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=TCL/TCL_M3G/EVOQUE:5.1.1/LRX22G/TCL_M3G_V4.0:user/release-keys \
	PRIVATE_BUILD_DESC="q39-user 5.1.1 LRX22G TCL_M3G_SV1.6.1 release-keys"
endif
