# Copyright (C) 2024 The Android Open Source Project

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),X96)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
