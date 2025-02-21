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
#include <fcntl.h>
#include <sys/statfs.h>
#include <sys/vfs.h>
#include <unistd.h>

#define ONE 1
#define TWO 2
#define PATH "/data/storage/el2/base/files"
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_0777 0777

static napi_value Statfs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[0], &value);
    int int_value = PARAM_0;
    struct statfs sb;

    if (value == ONE) {
        int_value = statfs(PATH, &sb);
    } else if (value == TWO) {
        int_value = statfs(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}

static napi_value Statfs64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value = PARAM_0;
    napi_get_value_int32(env, args[0], &value);
    int int_value = PARAM_0;
    struct statfs64 sb = {PARAM_0};

    if (value == ONE) {
        int_value = statfs64(PATH, &sb);
    } else if (value == TWO) {
        int_value = statfs64(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}

static napi_value Fstatfs(napi_env env, napi_callback_info info)
{
    struct statfs st = {PARAM_0};
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatfs(fd, &st);
    close(fd);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatfs64(napi_env env, napi_callback_info info)
{
    struct statfs st = {PARAM_0};
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatfs64(fd, &st);
    close(fd);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatvfs(napi_env env, napi_callback_info info)
{
    struct statvfs sts = {PARAM_0};
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatvfs(fd, &sts);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatvfs64(napi_env env, napi_callback_info info)
{
    struct statvfs sts = {PARAM_0};
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatvfs64(fd, &sts);
    close(fd);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"statfs", nullptr, Statfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"statfs64", nullptr, Statfs64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatfs", nullptr, Fstatfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatfs64", nullptr, Fstatfs64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatvfs", nullptr, Fstatvfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatvfs64", nullptr, Fstatvfs64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "statfs",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
