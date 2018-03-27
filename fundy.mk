# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97278
export BCHP_VER                  := B1
export BCHP_VER_BOLT             := b0
export PLATFORM                  := 97278
export LOCAL_PRODUCT_OUT         := fundy
export LOCAL_DEVICE_FULL_TREBLE  := y
export ANDROID_DEVICE_SUPPORTS_BP3 := y

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.fundy.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.ft.mmu.nx.rc:root/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.fundy.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:root/init.fs.rc  # verity
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.eth.gphy.rc:root/init.eth.rc   # uses 'gphy'
LOCAL_DEVICE_RCS                 += device/broadcom/fundy/rcs/init.block.rc:root/init.block.rc   # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/fundy/rcs/init.bcm.usb.rc:root/init.bcm.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.fundy.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/fundy/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/fundy/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

LOCAL_DEVICE_FSTAB               := device/broadcom/fundy/fstab/fstab.verity.ab-update.early.bp3:root/fstab.bcm
LOCAL_DEVICE_FSTAB               += device/broadcom/fundy/fstab/fstab.verity.ab-update.early.bp3:root/fstab.fundy
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/fundy/media_codecs_no_legacy_enc_audio.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:system/etc/media_profiles.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/fundy/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      := device/broadcom/fundy/overlay
LOCAL_DEVICE_SEPOLICY_BLOCK      := device/broadcom/fundy/sepolicy/block
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
LOCAL_DEVICE_SEPOLICY_BLOCK      += device/broadcom/fundy/sepolicy/treble
endif
export LOCAL_DEVICE_SEPOLICY_BLOCK
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_USERDATA     := 4294967296  # 4GB.
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export HW_ENCODER_SUPPORT        := n
export HW_WIFI_NIC_SUPPORT       := y
export BT_RFKILL_SUPPORT         := y
export V3D_VARIANT               := vc5
export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_SYSTEM_VERITY_PARTITION := /dev/block/platform/rdb/84a0200.sdhci/by-name/system
export LOCAL_DEVICE_VENDOR_VERITY_PARTITION := /dev/block/platform/rdb/84a0200.sdhci/by-name/vendor

# no legacy decoder (vp8, h263, mpeg4) in hardware t.1
export HW_HVD_REVISION           := T
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y
# dtu enabled.
export HW_DTU_SUPPORT            := y
# using bolt-b0 (7278B0) *and* bolt-b1 (7278B1).
export BOLT_IMG_TO_USE_OVERRIDE     := bolt-b1.bin
export BOLT_IMG_TO_USE_OVERRIDE_2ND := bolt-b0.bin
# vulan support.
export HW_GPU_VULKAN_SUPPORT     := y

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=1024m@1024m mem=1024m@3072m
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=240m@1808m bmem=70m@4026m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=528m@1280m brcm_cma=256m@3770m
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

export LOCAL_DEVICE_RTS_MODE       := 2
export LOCAL_DEVICE_BGRCPKT_PLANES := 3
export LOCAL_DEVICE_MKBOOTIMG_ARGS := --ramdisk_offset 0x42200000

## no bt on device
#
export BOARD_HAVE_BLUETOOTH      := false
export ANDROID_ENABLE_BT         :=
#
## no wifi.
#
export HW_WIFI_SUPPORT           := n
#
## no sage support (so no drm, no hdcp).
#
export ANDROID_SUPPORTS_WIDEVINE  := n
export ANDROID_ENABLE_HDMI_HDCP   := n
export ANDROID_SUPPORTS_PLAYREADY := n
export NEXUS_SECURITY_SUPPORT     := n
export ANDROID_SUPPORTS_RPMB      := n
export ANDROID_SUPPORTS_KEYMASTER := n
export SAGE_SUPPORT               := n

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_o_mr1.mk)
PRODUCT_NAME                     := fundy
PRODUCT_MODEL                    := fundy
PRODUCT_BRAND                    := bcm
PRODUCT_DEVICE                   := fundy

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=fundy
TARGET_BOOTLOADER_BOARD_NAME  := fundy
