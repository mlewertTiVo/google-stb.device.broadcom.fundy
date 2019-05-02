# fundy variant with dolby ms12d support.
export LOCAL_CFG_PROFILE       := ms12d
export BDSP_MS12_SUPPORT       := D
include device/broadcom/fundy/fundy.mk

PRODUCT_NAME                   := fundy_ms12d
PRODUCT_MODEL                  := fundy_ms12d
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := fundy
