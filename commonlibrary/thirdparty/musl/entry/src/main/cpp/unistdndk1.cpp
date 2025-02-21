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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cstdio>
#include <cstring>
#include <cerrno>
#include <fcntl.h>
#include <ifaddrs.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <climits>
#include <net/if.h>
#include <node_api.h>
#include <cstdlib>
#include <sys/inotify.h>
#include <sys/random.h>
#include <sys/syscall.h>
#include <sys/sysinfo.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_2 2
#define MPARAM_1 (-1)

static const char *g_tempFile = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempFileContent = "This is a test";
constexpr int BUF_SIZE = 256;
constexpr size_t COUNT = 100;

extern "C" char *__getcwd_chk(char *, size_t, size_t);
static napi_value GetcwdChk_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    char buf[PATH_MAX];
    char *ret = __getcwd_chk(buf, PATH_MAX, PATH_MAX);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0 && ret != nullptr, &result);
    return result;
}

static napi_value GetcwdChk_Two(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    char *ret = __getcwd_chk(nullptr, PATH_MAX, PATH_MAX);
    napi_value result = nullptr;
    napi_create_int32(env, errno == PARAM_0 && ret != nullptr, &result);
    return result;
}

static napi_value GetcwdChk_Three(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    char buf[5];
    char *ret = __getcwd_chk(buf, PARAM_0, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, errno == EINVAL && ret == nullptr, &result);
    return result;
}

extern "C" ssize_t __pread_chk(int fd, void *buf, size_t count, off_t offset, size_t buf_size);
static napi_value PreadChk_One(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    off_t offset = PARAM_0;
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    FILE *fp = fdopen(fileDescribe, "w+");
    fputs(g_tempFileContent, fp);
    fflush(fp);
    size_t ret = __pread_chk(fileDescribe, buf, COUNT, offset, sizeof(buf));
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(g_tempFileContent), &result);
    remove(g_tempFile);
    return result;
}

static napi_value PreadChk_Two(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    off_t offset = PARAM_0;
    int ret = __pread_chk(MPARAM_1, buf, COUNT, offset, sizeof(buf));
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

extern "C" ssize_t __read_chk(int, void *, size_t, size_t);
static napi_value ReadChk_One(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    FILE *fp = fdopen(fileDescribe, "w+");
    fputs(g_tempFileContent, fp);
    fflush(fp);
    size_t ret = __read_chk(fileDescribe, buf, BUF_SIZE, sizeof(buf));
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(g_tempFileContent), &result);
    remove(g_tempFile);
    return result;
}

static napi_value ReadChk_Two(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    int ret = __read_chk(MPARAM_1, buf, BUF_SIZE, sizeof(buf));
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value PWrite_One(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    size_t ret = pwrite(fileDescribe, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(g_tempFileContent), &result);
    remove(g_tempFile);
    return result;
}

static napi_value PWrite_Two(napi_env env, napi_callback_info info)
{
    int ret = pwrite(MPARAM_1, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value PRead64_One(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    pwrite(fileDescribe, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    lseek(fileDescribe, PARAM_0, SEEK_SET);
    size_t ret = pread64(fileDescribe, buf, BUF_SIZE, PARAM_0);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(g_tempFileContent), &result);
    remove(g_tempFile);
    return result;
}

static napi_value PRead64_Two(napi_env env, napi_callback_info info)
{
    char buf[BUF_SIZE];
    int ret = pread64(MPARAM_1, buf, BUF_SIZE, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value PWrite64_One(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    size_t ret = pwrite64(fileDescribe, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(g_tempFileContent), &result);
    remove(g_tempFile);
    return result;
}

static napi_value PWrite64_Two(napi_env env, napi_callback_info info)
{
    int ret = pwrite64(MPARAM_1, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value Lseek_One(napi_env env, napi_callback_info info)
{
    int seekLen = PARAM_2;
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    pwrite(fileDescribe, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    int ret = lseek(fileDescribe, seekLen, SEEK_SET);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == seekLen, &result);
    remove(g_tempFile);
    return result;
}

static napi_value Lseek_Two(napi_env env, napi_callback_info info)
{
    int seekLen = PARAM_2;
    int ret = lseek(MPARAM_1, seekLen, SEEK_SET);
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value Lseek64_One(napi_env env, napi_callback_info info)
{
    int seekLen = PARAM_2;
    int fileDescribe = open(g_tempFile, O_CREAT | O_RDWR);
    NAPI_ASSERT(env, fileDescribe != MPARAM_1, "open Error");
    pwrite(fileDescribe, g_tempFileContent, strlen(g_tempFileContent), PARAM_0);
    int ret = lseek64(fileDescribe, seekLen, SEEK_SET);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret == seekLen, &result);
    remove(g_tempFile);
    return result;
}

static napi_value Lseek64_Two(napi_env env, napi_callback_info info)
{
    int seekLen = PARAM_2;
    int ret = lseek64(MPARAM_1, seekLen, SEEK_SET);
    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetcwdChk_One", nullptr, GetcwdChk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetcwdChk_Two", nullptr, GetcwdChk_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetcwdChk_Three", nullptr, GetcwdChk_Three, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreadChk_One", nullptr, PreadChk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreadChk_Two", nullptr, PreadChk_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReadChk_One", nullptr, ReadChk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReadChk_Two", nullptr, ReadChk_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PWrite_One", nullptr, PWrite_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PWrite_Two", nullptr, PWrite_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PWrite64_One", nullptr, PWrite64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PWrite64_Two", nullptr, PWrite64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PRead64_One", nullptr, PRead64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PRead64_Two", nullptr, PRead64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Lseek_One", nullptr, Lseek_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Lseek_Two", nullptr, Lseek_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Lseek64_One", nullptr, Lseek64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Lseek64_Two", nullptr, Lseek64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libunistdndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }