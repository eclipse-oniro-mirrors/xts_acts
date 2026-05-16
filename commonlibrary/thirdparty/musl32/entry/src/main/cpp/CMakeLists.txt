# Copyright (c) 2024 Huawei Device Co., Ltd.
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
# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(musl32)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -g3 -Wunused-variable -Wunused-command-line-argument")
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../../..)
set(src_sec
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memset_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/gets_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/scanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/securecutil.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/snprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strtok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsnprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcstok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wscanf_s.c
)

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src
                    ${OPENHARMONY_ROOT_PATH}/third_party/node/src
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/include)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")

add_library(aeabindk32 SHARED aeabindk32.cpp ${src_sec})
add_library(fnmatchndk32 SHARED fnmatchndk32.cpp ${src_sec})
add_library(fnmatchndk132 SHARED fnmatchndk132.cpp ${src_sec})
add_library(fnmatch1ndk32 SHARED fnmatch1ndk32.cpp ${src_sec})
add_library(otherstestndk32 SHARED otherstestndk32.cpp ${src_sec})
add_library(signalndk32 SHARED signalndk32.cpp ${src_sec})
add_library(timendk32 SHARED timendk32.cpp ${src_sec})
add_library(timexndk32 SHARED timexndk32.cpp ${src_sec})
add_library(localendk32 SHARED localendk32.cpp ${src_sec})

target_link_libraries(aeabindk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fnmatchndk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fnmatchndk132 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fnmatch1ndk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(otherstestndk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(signalndk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timendk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timexndk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(localendk32 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
