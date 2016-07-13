LOCAL_PATH := $(call my-dir)

<<<<<<< HEAD
=======

>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
include $(CLEAR_VARS)
LOCAL_MODULE                  := libimmvibeclient
LOCAL_MODULE_TAGS             := optional
LOCAL_SRC_FILES               := client.c api.c
LOCAL_EXPORT_C_INCLUDE_DIRS   := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES        := \
<<<<<<< HEAD
	libcutils
include $(BUILD_SHARED_LIBRARY)

=======
	libcutils \

include $(BUILD_SHARED_LIBRARY)


>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
include $(CLEAR_VARS)
LOCAL_MODULE                  := libimmvibeconnector
LOCAL_MODULE_TAGS             := optional
LOCAL_SRC_FILES               := connector.c
LOCAL_EXPORT_C_INCLUDE_DIRS   := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES              := $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES        := \
<<<<<<< HEAD
	liblog
include $(BUILD_SHARED_LIBRARY)

=======
	liblog \

include $(BUILD_SHARED_LIBRARY)


>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
include $(CLEAR_VARS)
LOCAL_MODULE                  := openimmvibed
LOCAL_MODULE_TAGS             := optional
LOCAL_SRC_FILES               := daemon.c threadqueue.c
LOCAL_C_INCLUDES              := $(LOCAL_PATH)
LOCAL_SHARED_LIBRARIES        := \
	libimmvibeclient \
<<<<<<< HEAD
	liblog
include $(BUILD_EXECUTABLE)

=======
	liblog \
	libselinux \

include $(BUILD_EXECUTABLE)


>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
include $(CLEAR_VARS)
LOCAL_MODULE                  := immvibetst
LOCAL_MODULE_TAGS             := optional
LOCAL_SRC_FILES               := tst.c
LOCAL_SHARED_LIBRARIES        := libimmvibeclient
include $(BUILD_EXECUTABLE)

<<<<<<< HEAD
=======

>>>>>>> 21440836ef59070a7f4df7ccaa54e39a50ff9faa
include $(CLEAR_VARS)
LOCAL_MODULE                  := immvibetst-connector
LOCAL_MODULE_TAGS             := optional
LOCAL_SRC_FILES               := connector-tst.c
LOCAL_SHARED_LIBRARIES        := libimmvibeconnector
include $(BUILD_EXECUTABLE)
