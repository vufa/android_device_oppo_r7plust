<<<<<<< HEAD
# Copyright 2008 Texas Instruments
#
#Author(s) Mikkel Christensen (mlc@ti.com) and Ulrik Bech Hald (ubh@ti.com)

#==========================
# First SIM RIL
=======
# Copyright Statement:
#
# This software/firmware and related documentation ("MediaTek Software") are
# protected under relevant copyright laws. The information contained herein
# is confidential and proprietary to MediaTek Inc. and/or its licensors.
# Without the prior written permission of MediaTek inc. and/or its licensors,
# any reproduction, modification, use or disclosure of MediaTek Software,
# and information contained herein, in whole or in part, shall be strictly prohibited.

# MediaTek Inc. (C) 2010. All rights reserved.
#
# BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
# THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
# RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO RECEIVER ON
# AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
# NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
# SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
# SUPPLIED WITH THE MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
# THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
# THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
# CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
# SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
# STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
# CUMULATIVE LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
# AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE MEDIATEK SOFTWARE AT ISSUE,
# OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
# MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
#
# The following software/firmware and/or related documentation ("MediaTek Software")
# have been modified by MediaTek Inc. All revisions are subject to any receiver's
# applicable license agreements with MediaTek Inc.
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:= gsm0710muxd
<<<<<<< HEAD
=======
LOCAL_MULTILIB := 32
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

LOCAL_SRC_FILES:= \
	src/gsm0710muxd.c \
	src/gsm0710muxd_fc.c \

LOCAL_SHARED_LIBRARIES := \
<<<<<<< HEAD
	libcutils \
=======
	libcutils
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

LOCAL_CFLAGS := \
	-DMUX_ANDROID \
	-D__CCMNI_SUPPORT__ \
	-D__MUXD_FLOWCONTROL__ \

<<<<<<< HEAD

LOCAL_CFLAGS += -DMTK_GEMINI
=======
ifeq ($(GEMINI),yes)
	LOCAL_CFLAGS += -DMTK_GEMINI
else
    ifneq ($(MTK_SHARE_MODEM_SUPPORT),1)
   LOCAL_CFLAGS += -DMTK_GEMINI
  endif
endif

>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

ifeq ($(MTK_DT_SUPPORT),yes)
    LOCAL_CFLAGS += -DMTK_DT_SUPPORT
endif

<<<<<<< HEAD
=======

>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
ifneq ($(MTK_INTERNAL),yes)
	LOCAL_CFLAGS += -D__PRODUCTION_RELEASE__
endif

<<<<<<< HEAD
LOCAL_CFLAGS += -DMTK_RIL_MD1

LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
#LOCAL_LDLIBS := -lpthread
=======
ifeq ($(MTK_VT3G324M_SUPPORT),yes)
  LOCAL_CFLAGS += -D__ANDROID_VT_SUPPORT__
endif

LOCAL_CFLAGS += -DMTK_RIL_MD1

#LOCAL_C_INCLUDES := $(MTK_PATH_SOURCE)/hardware/ccci/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../ril/include

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 2)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_2
endif

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 3)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_3
endif

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 4)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_4
endif
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

include $(BUILD_EXECUTABLE)

#===========================
<<<<<<< HEAD
# Second SIM RIL

include $(CLEAR_VARS)

LOCAL_MODULE:= gsm0710muxdmd2
=======
include $(CLEAR_VARS)

LOCAL_MODULE:= gsm0710muxdmd2
LOCAL_MULTILIB := 32
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

LOCAL_SRC_FILES:= \
	src/gsm0710muxd.c \
	src/gsm0710muxd_fc.c \

LOCAL_SHARED_LIBRARIES := \
<<<<<<< HEAD
	libcutils \
=======
	libcutils
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

LOCAL_CFLAGS := \
	-DMUX_ANDROID \
	-D__CCMNI_SUPPORT__ \
	-D__MUXD_FLOWCONTROL__ \

<<<<<<< HEAD
LOCAL_CFLAGS += -DMTK_GEMINI
=======
ifeq ($(GEMINI),yes)
	LOCAL_CFLAGS += -DMTK_GEMINI
else
    ifneq ($(MTK_SHARE_MODEM_SUPPORT),1)
   LOCAL_CFLAGS += -DMTK_GEMINI
  endif
endif
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa

ifeq ($(MTK_DT_SUPPORT),yes)
    LOCAL_CFLAGS += -DMTK_DT_SUPPORT
endif

<<<<<<< HEAD
LOCAL_CFLAGS += -DMTK_RIL_MD2

LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
#LOCAL_LDLIBS := -lpthread

include $(BUILD_EXECUTABLE)
=======

ifneq ($(MTK_INTERNAL),yes)
	LOCAL_CFLAGS += -D__PRODUCTION_RELEASE__
endif

ifeq ($(MTK_VT3G324M_SUPPORT),yes)
  LOCAL_CFLAGS += -D__ANDROID_VT_SUPPORT__
endif

LOCAL_CFLAGS += -DMTK_RIL_MD2

#LOCAL_C_INCLUDES := $(MTK_PATH_SOURCE)/hardware/ccci/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../ril/include

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 2)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_2
endif

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 3)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_3
endif

ifeq ($(MTK_SHARE_MODEM_SUPPORT), 4)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_4
endif

include $(BUILD_EXECUTABLE)
>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
