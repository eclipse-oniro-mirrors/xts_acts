/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef LIBC_TEST_SRC_FUNCTIONALEXT_DLNS_DLNS_TEST_H
#define LIBC_TEST_SRC_FUNCTIONALEXT_DLNS_DLNS_TEST_H

static const char* PATH = "/data/tests/libc-test/src";
static const char* DLL_NAME = "libdlopen_ns_dso.so";
static const char* DLL_NAME_PATH = "/data/tests/libc-test/src/libdlopen_ns_dso.so";
static const char* ERRDLL_NAME_PATH = "/etc/test/libdlopen_ns_dso.so";
static const char* DLL_NAME2 = "libdlopen_dso.so";
static const char* DLL_NAME_PATH2 = "/data/tests/libc-test/src/libdlopen_dso.so";
static const char* ERR_PATH_NS = "src/test";

static const char* SHARED_LIB = "sharedlibtest.so";
static const char* PATH_A = "/data/tests/libc-test/src/A";
static const char* PATH_B = "/data/tests/libc-test/src/B";
static const char* PATH_C = "/data/tests/libc-test/src/C";
static const char* PATH_D = "/data/tests/libc-test/src/D";

static const char* LIB_B = "LIB_B.so";
static const char* LIB_C = "LIB_C.so";
static const char* LIB_D = "LIB_D.so";

static const char* DLL_NAME_SEP_009 = "separated_0900.so";
static const char* DLL_NAME_SET_002 = "set_lib_path_0200.so";
static const char* DLL_NAME_INH_003 = "inherit_0300.so";
static const char* DLL_NAME_INH_007 = "inherit_0700.so";
static const char* DLL_NAME_INH_008 = "inherit_0800.so";
static const char* DLL_NAME_INH_011 = "inherit_1100.so";

#if defined(MUSL_ARM)
static const char* DLL_ACE_PATH = "/system/lib/platformsdk/libace.z.so";
static const char* DLL_DYLIB_PATH = "/system/lib/libstd.dylib.so";
#else
static const char* DLL_ACE_PATH = "/system/lib64/platformsdk/libace.z.so";
static const char* DLL_DYLIB_PATH = "/system/lib64/libstd.dylib.so";
#endif

static const char* DLL_HASHSYSV_PATH = "/data/tests/libc-test/src/libdlopen_hash_sysv.so";
static const char* DLL_HASHSYSV = "libdlopen_hash_sysv.so";
static const char* DLL_FILL_RANDOM = "/data/tests/libc-test/src/libdlopen_fill_random.so";

typedef void (*TEST_FUN)(void);

static const int EOK = 0;

static const int TEST_RESULT_1 = 1;
static const int TEST_RESULT_2 = 2;
static const int TEST_RESULT_3 = 3;
static const int TEST_RESULT_4 = 4;
#endif