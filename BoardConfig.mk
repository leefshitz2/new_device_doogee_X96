DEVICE_PATH := device/doogee/X96

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# DEVICE PATH
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_64_BIT_BINDER := true
TARGET_USES_UEFI := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Platform
TARGET_BOOTLOADER_BOARD_NAME := s9863a1h10_go_32b
TARGET_BOARD_PLATFORM := sp9863a

# Assert
TARGET_OTA_ASSERT_DEVICE := doogee,X96

# Display
TARGET_SCREEN_DENSITY := 320

# SPRD hardware
BOARD_USES_SPRD_HARDWARE := true

# ============================================
# KERNEL (RECOVERY-AS-BOOT)
# ============================================
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := kernel

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# ============================================
# RECOVERY-AS-BOOT (RAMDISK В BOOT)
# ============================================
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TW_HAS_NO_RECOVERY_PARTITION := true

# ============================================
# SYSTEM-AS-ROOT (ДЛЯ ДИНАМИЧЕСКИХ РАЗДЕЛОВ)
# ============================================
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# ============================================
# ДИНАМИЧЕСКИЕ РАЗДЕЛЫ (SUPER)
# ============================================
TARGET_USE_DYNAMIC_PARTITIONS := true
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := doogee_dynamic_partitions
BOARD_DOOGEE_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_DOOGEE_DYNAMIC_PARTITION_LIST := system system_ext vendor product

TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# ============================================
# РАЗМЕРЫ РАЗДЕЛОВ
# ============================================
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true

# ============================================
# ФАЙЛОВЫЕ СИСТЕМЫ
# ============================================
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# ============================================
# AVB (ОТКЛЮЧАЕМ ДЛЯ TWRP)
# ============================================
BOARD_AVB_ENABLE := false

# ============================================
# METADATA ДЛЯ FBE
# ============================================
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata
BOARD_ROOT_EXTRA_FOLDERS += spl_trusty
BOARD_ROOT_EXTRA_FOLDERS += misc

# ============================================
# FSTAB
# ============================================
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# ============================================
# TWRP КОНФИГУРАЦИЯ
# ============================================
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_USB_STORAGE := true

# Тема и язык
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := ru

# Яркость экрана
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TW_SCREEN_BLANK_ON_BOOT := true

# Тачскрин (чёрный список ввода)
TW_INPUT_BLACKLIST := "hbtp_vm"

# Формат пикселей
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Инструменты
TW_USE_TOOLBOX := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_REPACKTOOLS := true

# Идентификация устройства
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEVICE_VERSION := DoogeeX96_TWRP_fixed

# SD-карта на /data/media
RECOVERY_SDCARD_ON_DATA := true

# ============================================
# ШИФРОВАНИЕ (FBE)
# ============================================
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# ============================================
# ПЕРЕЗАГРУЗКА В СИСТЕМУ
# ============================================
TW_INCLUDE_RESET_HACK := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true

# ============================================
# MTP И USB
# ============================================
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_EXCLUDE_DEFAULT_USB_INIT := false
TW_INCLUDE_USB_GADGET := true

# ============================================
# ДЕБАГ
# ============================================
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# ============================================
# ПРОЧЕЕ
# ============================================
# For cali mode use boot.img
BOARD_CALIMODE_USE_BOOTIMG := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
