/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <sys/stat.h>
#include <sys/uio.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_256 256
#define PARAM_0777 0777
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192
#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TEN 10
#define TEST_MODE 0666
static napi_value Readv(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_UNNORMAL) {
        ret = readv(PARAM_UNNORMAL, nullptr, PARAM_UNNORMAL);
    } else {
        int fd = open("/data/storage/el2/base/files/testReadv.txt", O_RDWR | O_CREAT, PARAM_0777);

        char buf1[] = "testreadv1";
        char buf2[] = "testreadv2";
        struct iovec ios[] = {{buf1, strlen(buf1)}, {buf2, strlen(buf2)}};
        ssize_t value = writev(fd, ios, sizeof(ios) / sizeof(struct iovec));
        lseek(fd, PARAM_0, SEEK_SET);
        memset(buf1, PARAM_0, sizeof(buf1));
        memset(buf2, PARAM_0, sizeof(buf2));
        value = readv(fd, ios, sizeof(ios) / sizeof(struct iovec));
        if (value == strlen(buf1) + strlen(buf2)) {
            ret = RETURN_0;
        } else {
            ret = FAIL;
        }
        close(fd);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Writev(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    ssize_t resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        resultValue = writev(PARAM_UNNORMAL, nullptr, PARAM_UNNORMAL);
    } else {
        char str0[] = "test ";
        char str1[] = "writev\n";
        struct iovec iov[PARAM_2];

        iov[PARAM_0].iov_base = str0;
        iov[PARAM_0].iov_len = strlen(str0) + PARAM_1;
        iov[PARAM_1].iov_base = str1;
        iov[PARAM_1].iov_len = strlen(str1) + PARAM_1;

        ssize_t result = writev(PARAM_1, iov, PARAM_2);
        if (result == (iov[PARAM_0].iov_len + iov[PARAM_1].iov_len)) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value PReadV(napi_env env, napi_callback_info info)
{
    off_t offset = PARAM_0;
    int ret;
    int fd = open("/data/storage/el2/base/files/testReadv.txt", O_RDWR | O_CREAT, PARAM_0777);
    char buf1[] = "testreadv1";
    char buf2[] = "testreadv2";
    struct iovec ios[] = {{buf1, strlen(buf1)}, {buf2, strlen(buf2)}};
    ssize_t value = writev(fd, ios, sizeof(ios) / sizeof(struct iovec));
    lseek(fd, PARAM_0, SEEK_SET);
    memset(buf1, PARAM_0, sizeof(buf1));
    memset(buf2, PARAM_0, sizeof(buf2));
    value = preadv(fd, ios, sizeof(ios) / sizeof(struct iovec), offset);
    if (value == strlen(buf1) + strlen(buf2)) {
        ret = RETURN_0;
    } else {
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PReadV64(napi_env env, napi_callback_info info)
{
    off_t offset = PARAM_0;
    int ret;
    int fd = open("/data/storage/el2/base/files/testReadv.txt", O_RDWR | O_CREAT, PARAM_0777);
    char buf1[] = "testreadv1";
    char buf2[] = "testreadv2";
    struct iovec ios[] = {{buf1, strlen(buf1)}, {buf2, strlen(buf2)}};
    ssize_t value = writev(fd, ios, sizeof(ios) / sizeof(struct iovec));
    lseek(fd, PARAM_0, SEEK_SET);
    memset(buf1, PARAM_0, sizeof(buf1));
    memset(buf2, PARAM_0, sizeof(buf2));
    value = preadv64(fd, ios, sizeof(ios) / sizeof(struct iovec), offset);
    if (value == strlen(buf1) + strlen(buf2)) {
        ret = RETURN_0;
    } else {
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PWriteV(napi_env env, napi_callback_info info)
{
    char tmpfile[] = "/data/storage/el2/base/files/memfd_cr02100.txt";
    char buf1[] = "preadv";
    char buf2[] = "and pwritev";
    struct iovec iov[2];

    iov[0].iov_base = buf1;
    iov[0].iov_len = sizeof(buf1) / sizeof(char);
    iov[1].iov_base = buf2;
    iov[1].iov_len = sizeof(buf2) / sizeof(char);

    int fd = open(tmpfile, O_RDWR | O_CREAT, TEST_MODE);
    int count = sizeof(iov) / sizeof(struct iovec);
    int ret = pwritev(fd, iov, count, PARAM_0);
    if (ret != PARAM_UNNORMAL) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    ret = access(tmpfile, F_OK);
    if (ret == PARAM_0) {
        ret = remove(tmpfile);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PWriteV64(napi_env env, napi_callback_info info)
{
    char tmpfile[] = "/data/storage/el2/base/files/memfd_cr02100.txt";
    char buf1[] = "preadv";
    char buf2[] = "and pwritev";
    struct iovec iov[2];

    iov[0].iov_base = buf1;
    iov[0].iov_len = sizeof(buf1) / sizeof(char);
    iov[1].iov_base = buf2;
    iov[1].iov_len = sizeof(buf2) / sizeof(char);

    int fd = open(tmpfile, O_RDWR | O_CREAT, TEST_MODE);
    int count = sizeof(iov) / sizeof(struct iovec);
    int ret = pwritev64(fd, iov, count, PARAM_0);
    if (ret != PARAM_UNNORMAL) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    ret = access(tmpfile, F_OK);
    if (ret == PARAM_0) {
        ret = remove(tmpfile);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value ProcessVmReadV(napi_env env, napi_callback_info info)
{
    int ret = PARAM_UNNORMAL;
    int bufferSize = PARAM_256;
    char src[256] = "This is process_vm_readv_0100.";
    char dst[256] = "";
    struct iovec remote, local;
    remote.iov_base = src;
    remote.iov_len = bufferSize;

    local.iov_base = dst;
    local.iov_len = bufferSize;

    int rev = process_vm_readv(getpid(), &local, PARAM_1, &remote, PARAM_1, PARAM_0);
    if (rev == sizeof(src)) {
        ret = RETURN_0;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value ProcessVmWriteV(napi_env env, napi_callback_info info)
{
    int ret = PARAM_UNNORMAL;
    char src[256] = "This is process_vm_readv_0100.";
    char dst[256] = "";
    struct iovec local = {.iov_base = src, .iov_len = sizeof(src)};
    struct iovec remote = {.iov_base = dst, .iov_len = sizeof(dst)};

    ssize_t rev = process_vm_writev(getpid(), &local, PARAM_1, &remote, PARAM_1, PARAM_0);
    if (rev == sizeof(src)) {
        ret = RETURN_0;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"readv", nullptr, Readv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"writev", nullptr, Writev, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"processVmReadV", nullptr, ProcessVmReadV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"processVmWriteV", nullptr, ProcessVmWriteV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pReadV", nullptr, PReadV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pReadV64", nullptr, PReadV64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pWriteV", nullptr, PWriteV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pWriteV64", nullptr, PWriteV64, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "uio",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
