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

#include <cerrno>
#include <climits>
#include <cstdlib>
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <node_api.h>
#include <unistd.h>
#include <hilog/log.h>

#define FAIL (-1)
#define MFAIL (-2)
#define FALSE 0
#define ERROR (-1)
#define FIVE 5
#define ONE 1
#define PATH "/data/storage/el2/base/files"
#define ONEVAL 1
#define MINUSONE (-1)
#define TWOVAL 2
#define SIXFOURVAL 64
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192

#define INIT (-1)
#define SUCCESS_DIRENT 0

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_LIBCTEST"

static napi_value Opendir(napi_env env, napi_callback_info info)
{
    DIR *dir = opendir("/data/storage/el2/base/files/test.txt");
    int ret = FAIL;
    if (!dir) {
        ret = SUCCESS_DIRENT;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Scandir64(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_2;
    napi_value result;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIXFOURVAL, stresult = PARAM_0;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));
    if (strTemp == nullptr) {
        OH_LOG_INFO(LOG_APP, "Scandir64 malloc failed");
        napi_create_int32(env, MFAIL, &result);
        return result;
    }
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    int fd = open(strTemp, O_RDWR);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    struct dirent **namelist;
    if (valueFirst == PARAM_0) {
        int total = scandir64(strTemp, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    } else {
        int total = scandir64(nullptr, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    }
    close(fd);
    return result;
}

static napi_value Scandir(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_2;
    napi_value result;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIXFOURVAL, stresult = PARAM_0;
    char *strTemp = static_cast<char *>(malloc(sizeof(char) * length));
    if (strTemp == nullptr) {
        OH_LOG_INFO(LOG_APP, "Scandir malloc failed");
        napi_create_int32(env, MFAIL, &result);
        return result;
    }
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    int fd = open(strTemp, O_RDWR);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    struct dirent **namelist;
    if (valueFirst == PARAM_0) {
        int total = scandir(strTemp, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    } else {
        int total = scandir(nullptr, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    }
    close(fd);
    return result;
}

static napi_value Seekdir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    napi_value result;
    errno = 0;
    DIR *dir = opendir("/data/storage/el2/base/files/");
    if (dir == nullptr) {
        OH_LOG_INFO(LOG_APP, "Seekdir opendir failed errno : %{public}d", errno);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    readdir(dir);
    errno = ERRON_0;
    if (valueFirst == PARAM_0) {
        seekdir(dir, TWOVAL);
    } else if (valueFirst == ONEVAL) {
        seekdir(dir, PARAM_0);
    }
    if (errno == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value Getdents(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS_DIRENT, &result);
    return result;
}

static napi_value Getdents64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS_DIRENT, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"scandir64", nullptr, Scandir64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scandir", nullptr, Scandir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seekdir", nullptr, Seekdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents", nullptr, Getdents, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents64", nullptr, Getdents64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"opendir", nullptr, Opendir, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "dirent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
