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
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <climits>
#include <node_api.h>
#include <unistd.h>

#define FAIL (-1)
#define FALSE 0
#define ERROR (-1)
#define FIVE 5
#define ONE 1
#define PATH "/data/storage/el2/base/files"
#define FILE_PATH "/data/storage/el2/base/files/testdirent.txt"
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
#define SIZE_0xFF 0xFF

#define INIT (-1)
#define SUCCESS_DIRENT 0

static napi_value Telldir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    long ret;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        ret = telldir(dir);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        ret = telldir(dir);
        free(dir);
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Readdir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    struct dirent *val;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        val = readdir(dir);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        val = readdir(dir);
        free(dir);
    }
    int ret;
    if (val == nullptr) {
        ret = FAILD;
    } else {
        ret = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ReaddirR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct dirent buf;
    struct dirent *res;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        ret = readdir_r(dir, &buf, &res);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        ret = readdir_r(dir, &buf, &res);
        free(dir);
        if (ret != PARAM_0) {
            ret = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Readdir64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    struct dirent *val;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        val = readdir64(dir);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        val = readdir64(dir);
        free(dir);
    }
    int ret;
    if (val == nullptr) {
        ret = FAILD;
    } else {
        ret = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Readdir64R(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct dirent buf;
    struct dirent *res;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        ret = readdir64_r(dir, &buf, &res);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        ret = readdir64_r(dir, &buf, &res);
        free(dir);
        if (ret != PARAM_0) {
            ret = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Rewinddir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        struct dirent *val = readdir(dir);
        char *dName = val->d_name;
        while ((val = readdir(dir)) != nullptr) {
            break;
        }
        rewinddir(dir);
        val = readdir(dir);
        ret = strcmp(dName, val->d_name);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        rewinddir(dir);
        struct dirent *val = readdir(dir);
        if (val == nullptr) {
            ret = FAILD;
        } else {
            ret = RETURN_0;
        }
        free(dir);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FdOpenDir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    DIR *fdir;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        int fd = dirfd(dir);
        fdir = fdopendir(fd);
        close(fd);
        closedir(dir);
    } else {
        fdir = fdopendir(PARAM_UNNORMAL);
    }
    int ret;
    if (fdir == nullptr) {
        ret = FAILD;
    } else {
        ret = RETURN_0;
        closedir(fdir);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CloseDir(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        ret = closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        ret = closedir(dir);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value DirFd(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        ret = dirfd(dir);
        closedir(dir);
    } else {
        DIR *dir = static_cast<DIR *>(malloc(SIZE_4096));
        memset(dir, SIZE_0xFF, SIZE_4096);
        ret = dirfd(dir);
        free(dir);
    }
    if (ret != PARAM_UNNORMAL) {
        ret = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Alphasort(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int total;
    struct dirent **namelist;
    if (param == PARAM_0) {
        int fd = open(FILE_PATH, O_CREAT);
        close(fd);
        total = scandir(PATH, &namelist, PARAM_0, alphasort);
        remove(FILE_PATH);
    } else {
        total = scandir(nullptr, &namelist, PARAM_0, alphasort);
    }
    int ret;
    if (total > PARAM_0) {
        ret = RETURN_0;
    } else {
        ret = FAILD;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Alphasort64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int total;
    struct dirent **namelist;
    if (param == PARAM_0) {
        int fd = open(FILE_PATH, O_CREAT);
        close(fd);
        total = scandir(PATH, &namelist, PARAM_0, alphasort64);
        remove(FILE_PATH);
    } else {
        total = scandir(nullptr, &namelist, PARAM_0, alphasort64);
    }
    int ret;
    if (total > PARAM_0) {
        ret = RETURN_0;
    } else {
        ret = FAILD;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getdents(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct dirent buf;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        int fd = dirfd(dir);
        ret = getdents(fd, &buf, INT_MAX);
        close(fd);
        closedir(dir);
    } else {
        ret = getdents(PARAM_UNNORMAL, &buf, INT_MAX);
    }
    if (ret > PARAM_0) {
        ret = PARAM_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getdents64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct dirent buf;
    if (param == PARAM_0) {
        DIR *dir = opendir(PATH);
        int fd = dirfd(dir);
        ret = getdents64(fd, &buf, INT_MAX);
        close(fd);
        closedir(dir);
    } else {
        ret = getdents64(PARAM_UNNORMAL, &buf, INT_MAX);
    }
    if (ret > PARAM_0) {
        ret = PARAM_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"telldir", nullptr, Telldir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir", nullptr, Readdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdirR", nullptr, ReaddirR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir64", nullptr, Readdir64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir64R", nullptr, Readdir64R, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rewinddir", nullptr, Rewinddir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdopendir", nullptr, FdOpenDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closedir", nullptr, CloseDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dirfd", nullptr, DirFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alphasort", nullptr, Alphasort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alphasort64", nullptr, Alphasort64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents", nullptr, Getdents, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents64", nullptr, Getdents64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
