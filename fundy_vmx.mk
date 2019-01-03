# Enable VMX MediaCas support
export ANDROID_SUPPORTS_MEDIACAS := y
export ANDROID_ENABLE_CAS_VMX    := y
# Enable WIFI SECDMA
export ANDROID_ENABLE_DHD_SECDMA := y

include device/broadcom/fundy/fundy.mk

PRODUCT_NAME                   := fundy_vmx
PRODUCT_MODEL                  := fundy
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := fundy

export LOCAL_DEVICE_SIGNING_PKG := fundy

# Common Verimatrix product definitions
include device/broadcom/common/cas/product_vmx.mk
