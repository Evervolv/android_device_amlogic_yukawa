LOCAL_PATH := $(call my-dir)

##############################
include $(CLEAR_VARS)

LOCAL_MODULE := TVLauncherNoGms
LOCAL_LICENSE_KINDS := legacy_restricted
LOCAL_LICENSE_CONDITIONS := restricted
LOCAL_SRC_FILES := TVLauncherNoGms.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_REQUIRED_MODULES := privapp_whitelist_com.google.android.tvlauncher

include $(BUILD_PREBUILT)
##############################
include $(CLEAR_VARS)

LOCAL_MODULE := TVRecommendationsNoGms
LOCAL_LICENSE_KINDS := legacy_restricted
LOCAL_LICENSE_CONDITIONS := restricted
LOCAL_SRC_FILES := TVRecommendationsNoGms.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_REQUIRED_MODULES := privapp_whitelist_com.google.android.tvrecommendations

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := privapp_whitelist_com.google.android.tvlauncher
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_MODULE_STEM := com.google.android.tvlauncher.xml
LOCAL_SRC_FILES := com.google.android.tvlauncher.xml

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := privapp_whitelist_com.google.android.tvrecommendations
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_MODULE_STEM := com.google.android.tvrecommendations.xml
LOCAL_SRC_FILES := com.google.android.tvrecommendations.xml

include $(BUILD_PREBUILT)
