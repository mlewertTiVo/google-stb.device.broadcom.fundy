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
export LOCAL_DEVICE_PROPERTIES_LEGACY := n

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
LOCAL_DEVICE_MEDIA               := device/broadcom/fundy/media_codecs_no_legacy_enc_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/fundy/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      := device/broadcom/fundy/overlay
LOCAL_DEVICE_SEPOLICY_BLOCK      := device/broadcom/fundy/sepolicy/block
ifeq ($(LOCAL_DEVICE_FULL_TREBLE),y)
LOCAL_DEVICE_SEPOLICY_BLOCK      += device/broadcom/fundy/sepolicy/treble
endif
ifeq (${LOCAL_ARM_AARCH64_COMPAT_32_BIT},y)
export LOCAL_DEVICE_BOOT         := 67108864   # 64M
endif
export LOCAL_DEVICE_SEPOLICY_BLOCK
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_USERDATA     := 4294967296  # 4GB.
export LOCAL_DEVICE_USERDATA_FS  := f2fs
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y
export HW_ENCODER_SUPPORT        := n
export ANDROID_ENABLE_BT         := usb
export BT_RFKILL_SUPPORT         := y
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/fundy/bluetooth/vnd_fundy.txt

export V3D_VARIANT               := vc5
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/fundy/reference_build.mk
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
LOCAL_DEVICE_KERNEL_CMDLINE      := bmem=235m@1812m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=520m@1288m brcm_cma=256m@12288m
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

export LOCAL_DEVICE_RTS_MODE       := 2
export LOCAL_DEVICE_BGRCPKT_PLANES := 2
export LOCAL_DEVICE_MKBOOTIMG_ARGS := --ramdisk_offset 0x42200000

# bootloader firmware manipulation.
export LOCAL_DEVICE_SAGE_DEV_N_PROD := y
export BOLT_ZEUS_VER                := zeus51
export BOLT_IMG_SWAP_BBL            := device/broadcom/fundy/blb/zb/bbl-2.1.1-zb.bin
export BOLT_IMG_SWAP_BFW            := device/broadcom/fundy/blb/zb/bfw-2.1.3-zb.bin
export BOLT_IMG_SWAP_RD             := device/broadcom/fundy/blb/zb/rd-zb.bin

# TODO: fix up the zd|zb use case.
export LOCAL_DEVICE_PAK_BINARY   := pak.7278.zd.bin

# get sage bin's from 7278B0.
export SAGE_BL_BINARY_PATH       := vendor/broadcom/sage/7278B0/dev
export SAGE_BL_BINARY_PATH2      := vendor/broadcom/sage/7278B0
export ANDROID_SUPPORTS_RPMB     := n

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
#$(call inherit-product, build/make/target/product/product_launched_with_p.mk)
PRODUCT_SHIPPING_API_LEVEL       := 28
PRODUCT_NAME                     := fundy
PRODUCT_MODEL                    := fundy
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := fundy

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196609 \
   debug.hwui.render_dirty_regions=false \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=64m \
   ro.nx.heap.main=72m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.gfx=64m \
   ro.nx.capable.dtu=1 \
   ro.nx.dtu.pbuf0.addr=0x80000000 \
   ro.nx.dtu.pbuf0.size=0x28400000 \
   ro.nx.dtu.pbuf1.addr=0x340000000 \
   ro.nx.dtu.pbuf1.size=0x28400000 \
   ro.nx.dtu.spbuf0.addr=0xA8400000 \
   ro.nx.dtu.spbuf0.size=0x28400000 \
   ro.nx.dtu.spbuf1.addr=0x368400000 \
   ro.nx.dtu.spbuf1.size=0x28400000 \
   ro.nx.dtu.user.addr=0xD0800000 \
   ro.nx.dtu.user.size=0x17C00000 \
   \
   ro.nx.capable.cb=1 \
   ro.nx.capable.bg=1 \
   ro.sf.lcd_density=320 \
   \
   ro.nx.eth.irq_mode_mask=f:c \
   \
   ro.com.google.clientidbase=android-acme

TARGET_BOOTLOADER_BOARD_NAME  := fundy
