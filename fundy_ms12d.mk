# fundy variant with dolby ms12d support.
export LOCAL_CFG_PROFILE       := ms12d
export BDSP_MS12_SUPPORT       := D
include device/broadcom/fundy/fundy.mk

# Disable force_eotf tweak
PRODUCT_PROPERTY_OVERRIDES := $(subst ro.nx.hwc2.tweak.force_eotf=0,,$(PRODUCT_PROPERTY_OVERRIDES))

PRODUCT_NAME                   := fundy_ms12d
PRODUCT_MODEL                  := fundy_ms12d
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := fundy
