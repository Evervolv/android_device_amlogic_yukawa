# Copyright (C) 2020 The LineageOS Project
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

ifneq ($(filter yukawa%, $(TARGET_DEVICE)),)

COMMON_LOGO_FILES := device/amlogic/yukawa/logo
ifeq ($(TARGET_USE_TABLET_LAUNCHER), true)
LOGO_FILES := $(COMMON_LOGO_FILES)/mobile
else
LOGO_FILES := $(COMMON_LOGO_FILES)/tv
endif

IMGPACK := $(HOST_OUT_EXECUTABLES)/res_packer$(HOST_EXECUTABLE_SUFFIX)

INSTALLED_LOGOIMAGE_TARGET := $(PRODUCT_OUT)/logo.img
$(INSTALLED_LOGOIMAGE_TARGET): $(LOCAL_INSTALLED_MODULE) | $(IMGPACK) $(MINIGZIP) $(ACP)
	@echo "generate $(INSTALLED_LOGOIMAGE_TARGET) $(COMMON_LOGO_FILES) $(LOGO_FILES)"
	$(hide) mkdir -p $(PRODUCT_OUT)/logo
	$(foreach bmpf, $(filter %.bmp, $(wildcard $(COMMON_LOGO_FILES)/* $(LOGO_FILES)/*)), \
		if [ -n "$(shell find $(bmpf) -type f -size +256k)" ]; then \
			echo "logo pic $(bmpf) >256k gziped"; \
			$(MINIGZIP) -c $(bmpf) > $(PRODUCT_OUT)/logo/$(notdir $(bmpf)); \
		else \
			$(ACP) $(bmpf) $(PRODUCT_OUT)/logo; \
		fi;)
	$(hide) $(IMGPACK) -r $(PRODUCT_OUT)/logo $(INSTALLED_LOGOIMAGE_TARGET)
	$(hide) rm -rf $(PRODUCT_OUT)/logo

include $(CLEAR_VARS)
LOCAL_MODULE := logoimage
LOCAL_LICENSE_KINDS := legacy_restricted
LOCAL_LICENSE_CONDITIONS := restricted
LOCAL_ADDITIONAL_DEPENDENCIES := $(INSTALLED_LOGOIMAGE_TARGET)
include $(BUILD_PHONY_PACKAGE)

droidcore: logoimage
$(call dist-for-goals, dist_files, $(INSTALLED_LOGOIMAGE_TARGET))

endif # TARGET_DEVICE
