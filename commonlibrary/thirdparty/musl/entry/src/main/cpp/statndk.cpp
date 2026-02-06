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
#include <hilog/log.h>

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
#define PARAM_3 3
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_STATNDK"

static napi_value Stat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[PARAM_0], &value);
    int intValue = PARAM_0;
    struct stat sb = {PARAM_0};
    if (value == ONE) {
        intValue = stat(PATH, &sb);
    } else if (value == TWO) {
        intValue = stat(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, intValue, &result);
    return result;
}
static napi_value Stat64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value;
    napi_get_value_int32(env, args[PARAM_0], &value);
    int intValue = PARAM_0;
    struct stat64 sb = {PARAM_0};
    if (value == ONE) {
        intValue = stat64(PATH, &sb);
    } else if (value == TWO) {
        intValue = stat64(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, intValue, &result);
    return result;
}

static napi_value Umask(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    mode_t mode = PARAM_0;
    if (valueFirst == PARAM_777) {
        mode = S_IRWXU | S_IRWXG | S_IRWXO;
    }
    mode_t umaskValue = umask(mode);
    umaskValue = umask(umaskValue);

    int toJs = FAIL;
    if (umaskValue == mode && valueFirst == PARAM_777) {
        toJs = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Utimensat(napi_env env, napi_callback_info info)
{
    int toCppResult = FAIL;
    char path[] = "/data/storage/el2/base/files/Utimensat.txt";
    int fd = open(path, O_CREAT);

    struct timespec times[] = {{.tv_nsec = UTIME_OMIT}, {.tv_nsec = UTIME_OMIT}};

    int utimensatValue = utimensat(fd, path, times, PARAM_0);
    if (utimensatValue == PARAM_0) {
        toCppResult = SUCCESS;
    }
    close(fd);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, toCppResult, &result);
    return result;
}

static napi_value FchModAt(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/modAt.txt";
    int df = open(path, O_CREAT, PARAM_0777);
    int ret = fchmodat(df, path, S_IRUSR, PARAM_0);
    close(df);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FchMod(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/mod.txt";
    int df = open(path, O_CREAT, PARAM_0777);
    int ret = fchmod(df, S_IRUSR);
    close(df);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Creat(napi_env env, napi_callback_info info)
{
    int backResult;
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backResult = creat(path, O_CREAT);
    napi_value result = nullptr;
    if (backResult != FAIL) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    remove(path);
    return result;
}

static napi_value Creat64(napi_env env, napi_callback_info info)
{
    int backResult;
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backResult = creat64(path, O_CREAT);
    napi_value result = nullptr;
    if (backResult != FAIL) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    remove(path);
    return result;
}

static napi_value Chmod(napi_env env, napi_callback_info info)
{
    int returnValue = chmod("/data/storage/el2/base/files", S_IRWXU | S_IRWXG | S_IRWXO);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fstat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64;
    size_t stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &stresult);
    struct stat sb = {PARAM_0};
    int fd = open(path, O_CREAT, PARAM_0777);
    int value = fstat(fd, &sb);
    napi_value result;
    napi_create_int32(env, value, &result);
    close(fd);
    return result;
}

static napi_value Fstat64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64;
    size_t stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &stresult);
    struct stat sb = {PARAM_0};
    int fd = open(path, O_CREAT, PARAM_0777);
    int value = fstat64(fd, &sb);
    napi_value result;
    napi_create_int32(env, value, &result);
    close(fd);
    return result;
}

static napi_value Fstatat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64;
    size_t stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &stresult);
    struct stat st = {PARAM_0};
    int fd = open(path, O_CREAT, PARAM_0777);
    int ret = fstatat(AT_FDCWD, path, &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    close(fd);
    return result;
}

static napi_value Fstatat64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64;
    size_t stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], path, length, &stresult);
    struct stat st = {PARAM_0};
    int fd = open(path, O_CREAT, PARAM_0777);
    int ret = fstatat64(AT_FDCWD, path, &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    close(fd);
    return result;
}

static napi_value Futimens(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/utime.txt", O_CREAT, PARAM_0777);
    int ret = futimens(fd, ((struct timespec[PARAM_2]){{.tv_nsec = UTIME_OMIT}, {.tv_nsec = UTIME_OMIT}}));
    napi_value result;
    napi_create_int32(env, ret, &result);
    close(fd);
    remove("/data/storage/el2/base/files/utime.txt");
    return result;
}
static napi_value MkFifoAt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int ret, name;
    napi_get_value_int32(env, args[PARAM_0], &name);
    size_t length = SIZE_64;
    size_t strResult = PARAM_0;
    char path[length];
    napi_get_value_string_utf8(env, args[PARAM_1], path, length, &strResult);
    errno = 0;
    ret = mkfifoat(name, path, S_IFIFO | TEST_FIFO_MODE);
    if (ret != 0) {
        if (ret == -1 && errno == EACCES) {
            ret = 0;
        }
    }
    unlink(path);
    remove(path);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkNodAt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int ret = 0;
    int dirfd = 0;
    int mode = 0;
    napi_get_value_int32(env, args[PARAM_0], &dirfd);
    size_t length = SIZE_64;
    size_t strResult = PARAM_0;
    char path[length];
    napi_get_value_string_utf8(env, args[PARAM_1], path, length, &strResult);
    napi_get_value_int32(env, args[PARAM_2], &mode);
    dev_t st_dev = PARAM_0;
    errno = 0;
    ret = mknodat(dirfd, path, mode, st_dev);
    if (ret != 0) {
        if (ret == -1 && (errno == EACCES || errno == EPERM || errno == EEXIST)) {
            ret = 0;
        }
    } else {
        struct stat newFifo = {PARAM_0};
        errno = 0;
        ret = stat(path, &newFifo);
        if (errno == EACCES) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    unlink(path);
    return result;
}

static napi_value MkNod(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64;
    size_t strResult = PARAM_0;
    char pathname[PATH_MAX];
    napi_get_value_string_utf8(env, args[PARAM_0], pathname, length, &strResult);
    int mode = PARAM_0;
    napi_get_value_int32(env, args[PARAM_1], &mode);
    int ret = PARAM_0;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkDir(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    char path[] = "/data/storage/el2/base/files/mkdir1";
    if (access(path, F_OK) != PARAM_0) {
        ret = mkdir(path, S_IRWXG);
        remove(path);
    } else {
        remove(path);
        ret = mkdir(path, S_IRWXG);
        remove(path);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkDirAt(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    char path[] = "/data/storage/el2/base/files/mkdirat1";
    ret = mkdirat(PARAM_0, path, S_IRWXG);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkFiFo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = BUFSIZE;
    char path[BUFSIZE] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], path, lenV, &lenA);
    int ret = PARAM_0;
    unlink(path);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Lstat(napi_env env, napi_callback_info info)
{
    struct stat statbuff;
    int32_t ret = lstat("/etc/passwd", &statbuff);
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
    struct stat statbuff;
    int32_t ret = lstat64("/etc/passwd", &statbuff);
    napi_value result = nullptr;
    if (ret == FAIL) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"stat", nullptr, Stat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stat64", nullptr, Stat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umask", nullptr, Umask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"utimensat", nullptr, Utimensat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchmodat", nullptr, FchModAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchmod", nullptr, FchMod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"creat", nullptr, Creat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"creat64", nullptr, Creat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chmod", nullptr, Chmod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstat", nullptr, Fstat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstat64", nullptr, Fstat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat", nullptr, Fstatat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat64", nullptr, Fstatat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"futimens", nullptr, Futimens, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkFifoAt", nullptr, MkFifoAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkNodAt", nullptr, MkNodAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkNod", nullptr, MkNod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkDir", nullptr, MkDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkDirAt", nullptr, MkDirAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat", nullptr, Lstat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat64", nullptr, Lstat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkFiFo", nullptr, MkFiFo, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "stat",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
