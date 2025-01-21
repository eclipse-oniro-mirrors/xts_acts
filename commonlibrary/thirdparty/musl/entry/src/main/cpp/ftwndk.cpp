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
#include <dirent.h>
#include <fcntl.h>
#include <ftw.h>
#include <js_native_api.h>
#include <node_api.h>
#include <unistd.h>

#define TEST_FLAG_SIZE 4
#define TEST_FD_LIMIT 128
#define PARAM_0666 0666
#define R_OK 4

int copytoU_device(const char *file, const struct stat *sb, int flag) { return 0; }

static napi_value Ftw(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    int returnValue = ftw("/data/storage/el2/base/files/", copytoU_device, fileDescribe);
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Ftw64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    int returnValue = ftw64("/data/storage/el2/base/files/", copytoU_device, fileDescribe);
    napi_create_int32(env, returnValue, &result);
    return result;
}
static int nftw_callback(const char *pathname, const struct stat *sb, int flag, struct FTW *ftw) { return 0; }

static napi_value Nftw(napi_env env, napi_callback_info info)
{
    int flag[TEST_FLAG_SIZE] = {FTW_PHYS, FTW_MOUNT, FTW_CHDIR, FTW_DEPTH};
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    int fp = open(path, O_CREAT, PARAM_0666);
    write(fp, "666", sizeof("666"));
    close(fp);
    int ret = nftw(path, nftw_callback, TEST_FD_LIMIT, flag[0]);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Nftw64(napi_env env, napi_callback_info info)
{
    int flag[TEST_FLAG_SIZE] = {FTW_PHYS, FTW_MOUNT, FTW_CHDIR, FTW_DEPTH};
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    int fp = open(path, O_CREAT, PARAM_0666);
    write(fp, "666", sizeof("666"));
    close(fp);
    int ret = nftw64(path, nftw_callback, TEST_FD_LIMIT, flag[0]);
    napi_value result;
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
    .nm_modname = "ftw",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
