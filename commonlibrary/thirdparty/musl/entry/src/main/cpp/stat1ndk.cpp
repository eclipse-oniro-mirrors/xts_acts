/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/napi_helper.cpp"
#include "napi/native_api.h"
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <linux/quota.h>
#include <net/if.h>
#include <string>
#include <sys/inotify.h>
#include <sys/stat.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define ONE 1
#define TWO 2
#define SIZE_2 2
#define PATH "/data/storage/el2/base/files"
#define PARAM_777 777
#define PARAM_0777 0777
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define SUCCESS 1
#define SIZE_64 64
#define SEC_TIME 123840
#define TEST_MODE 0666
#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TEN 10
#define TEST_FIFO_MODE 0666
#define BUFSIZE 128


static napi_value Chmod(napi_env env, napi_callback_info info)
{
    int ret = chmod("teststat.txt", S_IRWXU | S_IRWXG | S_IRWXO);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatat(napi_env env, napi_callback_info info)
{
    struct stat st = {PARAM_0};
    int ret = fstatat(AT_FDCWD, "teststat.txt", &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatat64(napi_env env, napi_callback_info info)
{
    struct stat64 st = {PARAM_0};
    int ret = fstatat64(AT_FDCWD, "teststat.txt", &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Lstat(napi_env env, napi_callback_info info)
{
    struct stat statbuff;
    int32_t ret = lstat("teststat.txt", &statbuff);
    napi_value result = nullptr;
    if (ret == FAIL) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Lstat64(napi_env env, napi_callback_info info)
{
    struct stat64 statbuff;
    int32_t ret = lstat64("teststat.txt", &statbuff);
    napi_value result = nullptr;
    if (ret == FAIL) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Futimens(napi_env env, napi_callback_info info)
{
    int ret = futimens(PARAM_UNNORMAL, ((struct timespec[2]){{.tv_nsec = UTIME_NOW}, {.tv_nsec = UTIME_NOW}}));
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Umask(napi_env env, napi_callback_info info)
{
    mode_t mode = FAIL;
    mode_t ret = umask(mode);
    ret = umask(ret);
    napi_value result = nullptr;
    if (ret != mode) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"chmod", nullptr, Chmod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat", nullptr, Fstatat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat64", nullptr, Fstatat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat", nullptr, Lstat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat64", nullptr, Lstat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"futimens", nullptr, Futimens, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umask", nullptr, Umask, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "stat1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
