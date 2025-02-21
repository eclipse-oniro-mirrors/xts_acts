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
#include "common/native_common.h"
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <malloc.h>
#include <unistd.h>

#define SUCCESS 1
#define STRLENGTH 64
#define DEFAULT_VALUE 0
#define FAIL (-1)
#define ONE 1
#define TWO 2
#define THREE 3
#define BUFF_SIZE (20)
#define FILEFLAG (0640)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_6 6
#define SIZE_8 8
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_123 123
#define SIZE_256 256
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define SIZE_32768 32768
#define PARAM_0777 0777
extern "C" size_t __fwrite_chk(const void *buf, size_t size, size_t count, FILE *stream, size_t buf_size);
extern "C" int __open_chk(const char *, int);
extern "C" int __openat_chk(int, const char *, int);
extern "C" int __open64_chk(const char *, int);
extern "C" int __openat64_chk(int, const char *, int);

static napi_value Splice(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value = napi_get_value_int32(env, args[0], &value);
    int bytes = PARAM_0;
    if (value == ONE) {
        off_t off = PARAM_0;
        size_t len = PARAM_0;
        bytes = splice(PARAM_0, &off, PARAM_2, &off, len, PARAM_0);
    } else if (value == TWO) {
        int pipe1[PARAM_1 + PARAM_1];
        size_t len = SIZE_256;
        int flags = SPLICE_F_MORE | SPLICE_F_MOVE;
        bytes = splice(PARAM_0, nullptr, pipe1[PARAM_1], nullptr, len, flags);
    } else if (value == THREE) {
        bytes = splice(PARAM_UNNORMAL, nullptr, PARAM_UNNORMAL, nullptr, PARAM_UNNORMAL, PARAM_UNNORMAL);
    }
    napi_value result = nullptr;
    napi_create_int32(env, bytes, &result);
    return result;
}
static napi_value Tee(napi_env env, napi_callback_info info)
{
    char buf[BUFF_SIZE];
    char text[] = "Hello";
    int result;
    memset(buf, PARAM_0, sizeof(buf));
    int pipefd1[PARAM_2];
    pipe(pipefd1);
    write(pipefd1[PARAM_1], text, strlen(text));
    int pipefd2[PARAM_2];
    pipe(pipefd2);
    result = tee(pipefd1[PARAM_0], pipefd2[PARAM_1], SIZE_32768, SPLICE_F_NONBLOCK);
    close(pipefd1[PARAM_0]);
    close(pipefd1[PARAM_1]);
    close(pipefd2[PARAM_0]);
    close(pipefd2[PARAM_1]);
    napi_value resultS = nullptr;
    napi_create_int32(env, result, &resultS);
    return resultS;
}
static napi_value Vmsplice(napi_env env, napi_callback_info info)
{
    int pipeSize = PARAM_2;
    int iovLength = SIZE_6;
    int pipe_fds[pipeSize];
    pipe(pipe_fds);
    struct iovec v[pipeSize];
    char strHello[] = "hello ";
    char str_world[] = "world\n";
    v[0].iov_base = strHello;
    v[0].iov_len = iovLength;
    v[1].iov_base = str_world;
    v[1].iov_len = iovLength;
    size_t result = vmsplice(pipe_fds[PARAM_1], v, sizeof(v) / sizeof(struct iovec), PARAM_0);
    close(pipe_fds[1]);
    char buf[BUFSIZ];
    FILE *fp = fdopen(pipe_fds[PARAM_0], "r");
    fgets(buf, sizeof(buf), fp);
    fclose(fp);
    napi_value resultS = nullptr;
    napi_create_int32(env, result, &resultS);
    return resultS;
}

static napi_value Readahead(napi_env env, napi_callback_info info)
{
    int resultValue = readahead(PARAM_UNNORMAL, PARAM_0, SIZE_123);
    napi_value result = nullptr;

    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value PosixFallocate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fd = open("/data/storage/el2/base/files/fff.txt", O_CREAT | O_RDWR, PARAM_0777);
    int ret = posix_fallocate(fd, SIZE_8, SIZE_1024);
    napi_create_int32(env, ret, &result);
    close(fd);
    return result;
}

static napi_value PosixFallocate64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fd = open("/data/storage/el2/base/files/fff.txt", O_CREAT | O_RDWR, PARAM_0777);
    int ret = posix_fallocate64(fd, SIZE_8, SIZE_1024);
    napi_create_int32(env, ret, &result);
    close(fd);
    return result;
}

static napi_value NameToHandleAt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, RETURN_0, &result);
    return result;
}

static napi_value Open(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int ret = FAIL;
    if (fd != FAIL) {
        ret = SUCCESS;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Open64(napi_env env, napi_callback_info info)
{
    int fd = open64("/data/storage/el2/base/files/test.txt", O_CREAT);
    int ret = FAIL;
    if (fd != FAIL) {
        ret = SUCCESS;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OpenByHandleAt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_1, &result);
    return result;
}

static napi_value Openat(napi_env env, napi_callback_info info)
{
    int fd;
    int dirFd = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    fd = openat(dirFd, "/data/storage/el2/base/files/test1.txt", O_CREAT | O_RDWR | O_TRUNC, FILEFLAG);
    int ret = FAIL;
    if (fd != FAIL) {
        ret = SUCCESS;
    }
    close(fd);
    close(dirFd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Openat64(napi_env env, napi_callback_info info)
{
    int fd;
    int dirFd = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    fd = openat64(dirFd, "/data/storage/el2/base/files/test2.txt", O_CREAT | O_RDWR | O_TRUNC, FILEFLAG);
    int ret = FAIL;
    if (fd != FAIL) {
        ret = SUCCESS;
    }
    close(fd);
    close(dirFd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixFadvise(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT | O_RDWR, PARAM_0777);
    int returnValue = posix_fadvise(fileDescribe, SIZE_8, SIZE_1024, POSIX_FADV_NORMAL);
    napi_create_int32(env, returnValue, &result);
    close(fileDescribe);
    return result;
}

static napi_value PosixFadvise64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT | O_RDWR, PARAM_0777);
    int returnValue = posix_fadvise64(fileDescribe, SIZE_8, SIZE_1024, POSIX_FADV_NORMAL);
    napi_create_int32(env, returnValue, &result);
    close(fileDescribe);
    return result;
}

static napi_value FalLocate(napi_env env, napi_callback_info info)
{
    int backParam, mode = PARAM_0;
    off_t offset = PARAM_0, len = PARAM_1;
    int fileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT | O_RDWR, PARAM_0777);
    backParam = fallocate(fileDescribe, mode, offset, len);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    close(fileDescribe);
    return result;
}

static napi_value FalLocate64(napi_env env, napi_callback_info info)
{
    int backParam, mode = PARAM_0;
    off_t offset = PARAM_0, len = PARAM_1;
    int fileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT | O_RDWR, PARAM_0777);
    backParam = fallocate64(fileDescribe, mode, offset, len);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    close(fileDescribe);
    return result;
}

static napi_value FcnTl(napi_env env, napi_callback_info info)
{
    int backParam;
    int fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    backParam = fcntl(fileDescribe, STDIN_FILENO, F_GETFL, PARAM_0);
    napi_value result = nullptr;
    if (backParam != fileDescribe && backParam != -1) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    close(fileDescribe);
    return result;
}

static napi_value FwriteChk(napi_env env, napi_callback_info info)
{
    const char *msg = "This is a c";
    int len = SIZE_10;
    FILE *files = fopen("/data/storage/el2/base/files/test.txt", "w");
    NAPI_ASSERT(env, files != nullptr, "FwriteChk fopen Error");
    int result = __fwrite_chk(msg, len, PARAM_0, files, strlen(msg));
    fclose(files);
    napi_value resultS = nullptr;
    napi_create_int32(env, result, &resultS);
    return resultS;
}
static napi_value OpenChk(napi_env env, napi_callback_info info)
{
    int dirFileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int fileDescribe = __open_chk("/data/storage/el2/base/files/test.txt", O_RDWR);
    int ret = FAIL;
    if (fileDescribe != FAIL) {
        ret = RETURN_0;
    }
    close(dirFileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Open64Chk(napi_env env, napi_callback_info info)
{
    int dirFileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int fileDescribe = __open64_chk("/data/storage/el2/base/files/test.txt", O_RDWR);
    int ret = FAIL;
    if (fileDescribe != FAIL) {
        ret = RETURN_0;
    }
    close(dirFileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OpenatChk(napi_env env, napi_callback_info info)
{
    int dirFileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int fileDescribe = __openat_chk(dirFileDescribe, "/data/storage/el2/base/files/test.txt", O_RDWR | O_TRUNC);
    int ret = FAIL;
    if (fileDescribe != FAIL) {
        ret = RETURN_0;
    }
    close(dirFileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Openat64Chk(napi_env env, napi_callback_info info)
{
    int dirFileDescribe = open("/data/storage/el2/base/files/test.txt", O_CREAT, PARAM_0777);
    int fileDescribe = __openat64_chk(dirFileDescribe, "/data/storage/el2/base/files/test.txt", O_RDWR);
    int ret = FAIL;
    if (fileDescribe != FAIL) {
        ret = RETURN_0;
    }
    close(dirFileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nameToHandleAt", nullptr, NameToHandleAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open", nullptr, Open, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openByHandleAt", nullptr, OpenByHandleAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openat", nullptr, Openat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open64", nullptr, Open64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openat64", nullptr, Openat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"splice", nullptr, Splice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tee", nullptr, Tee, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vmsplice", nullptr, Vmsplice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readahead", nullptr, Readahead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfallocate", nullptr, PosixFallocate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfadvise", nullptr, PosixFadvise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfadvise64", nullptr, PosixFadvise64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfallocate64", nullptr, PosixFallocate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl", nullptr, FcnTl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fallocate64", nullptr, FalLocate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fallocate", nullptr, FalLocate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwritechk", nullptr, FwriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openChk", nullptr, OpenChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open64Chk", nullptr, Open64Chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openatChk", nullptr, OpenatChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openat64Chk", nullptr, Openat64Chk, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "fcntl",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
