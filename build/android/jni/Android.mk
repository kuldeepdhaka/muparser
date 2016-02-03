LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

REL_PATH:= ../../..
ABS_PATH:= $(LOCAL_PATH)/$(REL_PATH)

define all-cpp-files-under
	$(patsubst ./%, %, \
		$(shell cd $(LOCAL_PATH) ; \
			find $(1) -name "*.cpp" -and -not -name ".*") \
		)
endef

APP_ABI:= all
LOCAL_SRC_FILES:= $(call all-cpp-files-under, $(REL_PATH)/src)
LOCAL_C_INCLUDES:= $(ABS_PATH)/include
LOCAL_EXPORT_C_INCLUDES:= $(ABS_PATH)/include
LOCAL_CPP_FEATURES:= exceptions
LOCAL_MODULE:= muparser

ifeq ($(NDK_DEBUG),"1")
# debug build
LOCAL_CPPFLAGS:= -D_DEBUG
endif

include $(BUILD_SHARED_LIBRARY)
