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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; ls)
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))

INSTALLED_RADIOIMAGE_TARGET += $(TARGET_BOOTLOADER_EMMC_INTERNAL)
$(call add-radio-file,images/NON-HLOS.bin)
$(call add-radio-file,images/rpm.mbn)
$(call add-radio-file,images/sbl1.mbn)
$(call add-radio-file,images/tz.mbn)
endif

#Create symbolic links
$(shell mkdir -p $(TARGET_OUT)/vendor/lib; \
        rm $(TARGET_OUT)/vendor/lib/libEGL_adreno.so; \
        ln -sf /system/vendor/lib/egl/libEGL_adreno.so \
        $(TARGET_OUT)/vendor/lib/libEGL_adreno.so)

$(shell mkdir -p $(TARGET_OUT)/vendor/lib64; \
        rm $(TARGET_OUT)/vendor/lib64/libEGL_adreno.so; \
        ln -sf /system/vendor/lib64/egl/libEGL_adreno.so \
        $(TARGET_OUT)/vendor/lib64/libEGL_adreno.so)
