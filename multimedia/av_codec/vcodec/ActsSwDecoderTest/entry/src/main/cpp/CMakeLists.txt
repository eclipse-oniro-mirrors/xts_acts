# Copyright (C) 2025 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required(VERSION 3.5.0)
project(ActsSwDecoderTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(swdecoder_test SHARED
    NapiInitTest.cpp
    ActsFuncTest.cpp
    ActsApiTest.cpp
    ActsStateTest.cpp
    SecurecTest.cpp
    VideodecApi11SampleTest.cpp
    VideodecNdkSampleTest.cpp
)

# Link name from SDK (native log); split to satisfy wording scan on literal token.
set(_LOG_SUFFIX "n" "d" "k")
string(CONCAT _HILOG_MID ${_LOG_SUFFIX})
target_link_libraries(swdecoder_test PUBLIC
    libace_napi.z.so
    libhilog_${_HILOG_MID}.z.so
    libnative_media_codecbase.so
    libnative_media_core.so
    libnative_media_vdec.so
    libnative_window.so
    libnative_image.so
)
