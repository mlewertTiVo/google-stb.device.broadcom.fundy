LOCAL_PATH := $(my-dir)

include $(LOCAL_PATH)/AndroidKernel.mk
include $(LOCAL_PATH)/AndroidPhony.mk

INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/dtbo.img
