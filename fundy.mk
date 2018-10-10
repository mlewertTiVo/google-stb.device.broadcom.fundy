# mandatory device configuration.
ifndef LOCAL_PRODUCT_OUT
export LOCAL_PRODUCT_OUT         := fundy
endif
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97278
export BCHP_VER                  := B1
export BCHP_VER_BOLT             := b0
export PLATFORM                  := 97278
export ANDROID_DEVICE_SUPPORTS_BP3 := y
export LOCAL_DEVICE_PROPERTIES_LEGACY := n
export BOLT_BOARD_VB             := BCM97278IPA

# enable user mode 32bit with kernel mode 64bit compatible mode.
export LOCAL_ARM_AARCH64_COMPAT_32_BIT := y

# binary distribution
export BCM_DIST_FORCED_BINDIST   := y
export BCM_BINDIST_BL_ROOT       := vendor/broadcom/prebuilts/bootloaders/fundy
export BCM_BINDIST_LIBS_ROOT     := vendor/broadcom/prebuilts/nximg/4.9/fundy
export BCM_BINDIST_KNL_ROOT      := device/broadcom/fundy-kernel/4.9

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.fundy.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.ft.mmu.nx.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.fs.rc     # verity
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.eth.gphy.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.eth.rc     # uses 'gphy'
LOCAL_DEVICE_RCS                 += device/broadcom/fundy/rcs/init.block.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.block.rc       # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/fundy/rcs/init.bcm.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.bcm.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.fundy.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/fundy/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/fundy/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

LOCAL_DEVICE_FSTAB               := device/broadcom/fundy/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
LOCAL_DEVICE_FSTAB               += device/broadcom/fundy/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.fundy
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/fundy/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_RRO_OVERLAY  := device/broadcom/fundy/overlay/frameworks/base/core/res/res
LOCAL_DEVICE_SEPOLICY_BLOCK      := device/broadcom/fundy/sepolicy/block
LOCAL_DEVICE_SEPOLICY_BLOCK      += device/broadcom/fundy/sepolicy/treble
ifeq (${LOCAL_ARM_AARCH64_COMPAT_32_BIT},y)
export LOCAL_DEVICE_BOOT         := 67108864   # 64M
endif
export LOCAL_DEVICE_SEPOLICY_BLOCK
export LOCAL_DEVICE_AON_GPIO     := device/broadcom/fundy/aon_gpio.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_USERDATA_FS  := f2fs
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.p.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export ANDROID_ENABLE_BT         := usb
export BT_RFKILL_SUPPORT         := y
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/fundy/bluetooth/vnd_fundy.txt

export V3D_VARIANT               := vc5
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/fundy/reference_build.mk
export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_KMCERT_DEFAULT_DEV  := device/broadcom/common/kmgk/km.zx.bcm.generic.bin
export LOCAL_DEVICE_KMCERT_DEFAULT_PROD := device/broadcom/common/kmgk/km.zx.bcm.generic.bin

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

export LOCAL_DEVICE_BGRCPKT_PLANES := 2
export LOCAL_DEVICE_MKBOOTIMG_ARGS := --ramdisk_offset 0x42200000 --header_version 1

# bootloader firmware manipulation.
export LOCAL_DEVICE_SAGE_DEV_N_PROD ?= y
export BOLT_ZEUS_VER                := zeus51
export BOLT_IMG_SWAP_BBL            := device/broadcom/fundy/blb/zb/bbl-2.1.1-zb.bin
export BOLT_IMG_SWAP_BFW            := device/broadcom/fundy/blb/zb/bfw-2.1.5-zb.bin
export BOLT_IMG_SWAP_RD             := device/broadcom/fundy/blb/zb/rd-zb.bin

# TODO: fix up the zd|zb use case.
export LOCAL_DEVICE_PAK_BINARY_DEV  := pak.7278.zd.bin

# get sage bin's from 7278B0.
export SAGE_BL_BINARY_PATH       := vendor/broadcom/prebuilts/sage/7278B0/dev
export SAGE_BL_BINARY_PATH2      := vendor/broadcom/prebuilts/sage/7278B0

# facilitate validation of 3GB layout devices.
DEVICE_MEM_LAYOUT_3GB := n
ifneq ($(DEVICE_MEM_LAYOUT_3GB),y)
export LOCAL_DEVICE_RTS_MODE       := 2
# no encoder, but must disable support explicitely in recovery mode.
export HW_ENCODER_SUPPORT           := n
export HW_ENCODER_RECOVERY_OVERRIDE := nxmini_with_encoder.cpp
# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := bmem=235m@1812m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=520m@1288m brcm_cma=256m@12288m
else
export LOCAL_DEVICE_RTS_MODE       := 5
export HW_ENCODER_SUPPORT          := y
# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := bmem=295m@2776m bmem=64m@13248m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=640m@1288m brcm_cma=200m@12288m
endif
LOCAL_DEVICE_KERNEL_CMDLINE      += brcmv3d.ignore_cma=1
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

export LOCAL_DTBO_SUPPORT      := y
ifneq ($(wildcard device/broadcom/fundy-kernel),)
export LOCAL_DEVICE_DTBO_IMAGE := fundy-kernel/4.9/dtbo.img
else
export LOCAL_DEVICE_DTBO_IMAGE := fundy/dtbo.img
endif

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)
PRODUCT_NAME                     := fundy
PRODUCT_MODEL                    := fundy
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := fundy

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196609 \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=64m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.gfx=64m \
   ro.nx.capable.dtu=1 \
   \
   ro.nx.capable.cb=1 \
   ro.nx.capable.bg=1 \
   ro.sf.lcd_density=320 \
   ro.nx.hwc2.tweak.fbcomp=1 \
   \
   ro.nx.eth.irq_mode_mask=f:c \
   ro.nx.pm.wol.opts=fs \
   \
   ro.com.google.clientidbase=android-acme

ifneq ($(DEVICE_MEM_LAYOUT_3GB),y)
# 2gb (default) - dtu|memory layout.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nx.heap.main=72m \
   \
   ro.nx.dtu.pbuf0.addr=0x80000000 \
   ro.nx.dtu.pbuf0.size=0x28400000 \
   ro.nx.dtu.pbuf1.addr=0x340000000 \
   ro.nx.dtu.pbuf1.size=0x28400000 \
   ro.nx.dtu.spbuf0.addr=0xA8400000 \
   ro.nx.dtu.spbuf0.size=0x28400000 \
   ro.nx.dtu.spbuf1.addr=0x368400000 \
   ro.nx.dtu.spbuf1.size=0x28400000 \
   ro.nx.dtu.user.addr=0xD0800000 \
   ro.nx.dtu.user.size=0x17C00000
else
# 3gb - dtu|memory layout.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nx.heap.main=120m \
   ro.nx.enc.all=1 \
   \
   ro.nx.dtu.pbuf0.addr=0xC0000000 \
   ro.nx.dtu.pbuf0.size=0x28400000 \
   ro.nx.dtu.pbuf1.addr=0x340000000 \
   ro.nx.dtu.pbuf1.size=0x28400000 \
   ro.nx.dtu.spbuf0.addr=0x100000000 \
   ro.nx.dtu.spbuf0.size=0x28400000 \
   ro.nx.dtu.spbuf1.addr=0x380000000 \
   ro.nx.dtu.spbuf1.size=0x28400000 \
   ro.nx.dtu.user.addr=0x128400000 \
   ro.nx.dtu.user.size=0x17C00000
endif

TARGET_BOOTLOADER_BOARD_NAME  := fundy
