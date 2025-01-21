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

#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <cstring>
#include <dirent.h>
#include <fcntl.h>
#include <ftw.h>
#include <js_native_api.h>
#include <climits>
#include <node_api.h>
#include <unistd.h>

#define TEST_FLAG_SIZE 4
#define TEST_FD_LIMIT 128
#define R_OK 4
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define ERRNO_0 0

int ftw_fn(const char *__filename, const struct stat *__status, int flag) { return PARAM_0; }
static napi_value Ftw(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        errno = ERRNO_0;
        ret = ftw(dir, ftw_fn, TEST_FD_LIMIT);
    } else {
        errno = ERRNO_0;
        char path[PATH_MAX * PARAM_2];
        memset(path, 'a', sizeof(path));
        path[PATH_MAX * PARAM_2 - PARAM_1] = PARAM_0;
        ret = ftw(path, ftw_fn, TEST_FD_LIMIT);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

int ftw64_fn(const char *__filename, const struct stat64 *__status, int flag) { return PARAM_0; }
static napi_value Ftw64(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        errno = ERRNO_0;
        ret = ftw64(dir, ftw64_fn, TEST_FD_LIMIT);
    } else {
        errno = ERRNO_0;
        char path[PATH_MAX * PARAM_2];
        memset(path, 'a', sizeof(path));
        path[PATH_MAX * PARAM_2 - PARAM_1] = PARAM_0;
        ret = ftw64(path, ftw64_fn, TEST_FD_LIMIT);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int nftw_fn(const char *__filename, const struct stat *__status, int flag, struct FTW *__info)
{
    return PARAM_0;
}
static napi_value Nftw(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        errno = ERRNO_0;
        ret = nftw(dir, nftw_fn, TEST_FD_LIMIT, FTW_PHYS);
    } else {
        errno = ERRNO_0;
        char path[PATH_MAX * PARAM_2];
        memset(path, 'a', sizeof(path));
        path[PATH_MAX * PARAM_2 - PARAM_1] = PARAM_0;
        ret = nftw(path, nftw_fn, TEST_FD_LIMIT, FTW_PHYS);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int nftw64_fn(const char *__filename, const struct stat64 *__status, int flag, struct FTW *__info)
{
    return PARAM_0;
}
static napi_value Nftw64(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        errno = ERRNO_0;
        ret = nftw64(dir, nftw64_fn, TEST_FD_LIMIT, FTW_PHYS);
    } else {
        errno = ERRNO_0;
        char path[PATH_MAX * PARAM_2];
        memset(path, 'a', sizeof(path));
        path[PATH_MAX * PARAM_2 - PARAM_1] = PARAM_0;
        ret = nftw64(path, nftw64_fn, TEST_FD_LIMIT, FTW_PHYS);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ftw", nullptr, Ftw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftw64", nullptr, Ftw64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nftw", nullptr, Nftw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nftw64", nullptr, Nftw64, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ftw1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
