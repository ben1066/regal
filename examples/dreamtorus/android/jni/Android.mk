# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libminimalAndroid
LOCAL_CFLAGS    := -Werror
LOCAL_ARM_MODE  := arm

REGAL_DIR       := ../../../..
REGAL_SRC       = $(REGAL_DIR)/src/RegalIff.cpp
REGAL_SRC       += $(REGAL_DIR)/gen/Regal.cpp
REGAL_SRC       += $(REGAL_DIR)/gen/RegalEmuDispatch.cpp
REGAL_SRC       += $(REGAL_DIR)/gen/RegalErrorDispatch.cpp
REGAL_SRC       += $(REGAL_DIR)/gen/RegalLoaderDispatch.cpp
REGAL_INC       := $(REGAL_DIR)/gen $(REGAL_DIR)/src

SHARED_DIR      := ../../src

REGAL_SRC_FILES := $(wildcard $(REGAL_DIR)/src/*.cpp $(REGAL_DIR)/gen/*.cpp)

LOCAL_C_INCLUDES := $(patsubst %, $(LOCAL_PATH)/%, $(REGAL_INC) $(SHARED_DIR) )
LOCAL_SRC_FILES := $(REGAL_SRC) 
LOCAL_SRC_FILES += gl_code.cpp $(SHARED_DIR)/render.cpp
LOCAL_CFLAGS    := -DANDROID=1
LOCAL_LDLIBS    := -llog

#-lGLESv2 

include $(BUILD_SHARED_LIBRARY)

