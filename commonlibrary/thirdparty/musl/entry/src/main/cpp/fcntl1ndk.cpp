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

static napi_value Tee(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    errno = ERRON_0;
    if (param == PARAM_0) {
        char buf[BUFF_SIZE];
        char text[] = "Hello";
        memset(buf, PARAM_0, sizeof(buf));
        int pipefd1[PARAM_2];
        pipe(pipefd1);
        write(pipefd1[PARAM_1], text, strlen(text));
        int pipefd2[PARAM_2];
        pipe(pipefd2);
        ret = tee(pipefd1[PARAM_0], pipefd2[PARAM_1], SIZE_32768, SPLICE_F_NONBLOCK);
        close(pipefd1[PARAM_0]);
        close(pipefd1[PARAM_1]);
        close(pipefd2[PARAM_0]);
        close(pipefd2[PARAM_1]);
    } else {
        ret = tee(PARAM_UNNORMAL, PARAM_UNNORMAL, SIZE_32768, SPLICE_F_NONBLOCK);
    }
    if (ret > PARAM_0) {
        ret = PARAM_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vmsplice(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int pipe_size = PARAM_2;
    int iov_length = SIZE_6;
    int pipe_fds[pipe_size];
    pipe(pipe_fds);
    struct iovec v[pipe_size];
    char strHello[] = "hello ";
    char str_world[] = "world\n";
    v[0].iov_base = strHello;
    v[0].iov_len = iov_length;
    v[1].iov_base = str_world;
    v[1].iov_len = iov_length;
    size_t result;
    errno = ERRON_0;
    if (param == PARAM_0) {
        result = vmsplice(pipe_fds[PARAM_1], v, sizeof(v) / sizeof(struct iovec), PARAM_0);
    } else {
        result = vmsplice(pipe_fds[PARAM_1], v, PARAM_0, PARAM_0);
    }
    close(pipe_fds[1]);
    if (result > PARAM_0) {
        result = PARAM_0;
    } else {
        result = PARAM_UNNORMAL;
    }

    napi_value resultS = nullptr;
    napi_create_int32(env, result, &resultS);
    return resultS;
}

static napi_value Readahead(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testreadahead.txt";
    char text[] = "test readahead";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT | O_RDWR);
        write(fd, text, strlen(text));
        ret = readahead(fd, PARAM_0, strlen(text));
        close(fd);
        remove(path);
    } else {
        ret = readahead(PARAM_UNNORMAL, PARAM_0, SIZE_123);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixFallocate(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/test.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT | O_RDWR);
        ret = posix_fallocate(fd, SIZE_8, SIZE_1024);
        close(fd);
        remove(path);
    } else {
        ret = posix_fallocate(PARAM_UNNORMAL, SIZE_8, SIZE_1024);
        if (ret != PARAM_0) {
            ret = PARAM_UNNORMAL;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NameToHandleAt(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files/";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    struct file_handle tempHandle;
    tempHandle.handle_bytes = PARAM_0;
    int mountId = 0;
    int fd = 0;
    DIR *dirfp = opendir(dir);
    fd = dirfd(dirfp);

    name_to_handle_at(fd, dir, &tempHandle, &mountId, PARAM_0);
    struct file_handle *handle = (struct file_handle *)malloc(tempHandle.handle_bytes);
    handle->handle_bytes = tempHandle.handle_bytes;

    int ret = PARAM_0;
    ret = name_to_handle_at(fd, dir, handle, &mountId, PARAM_0);

    closedir(dirfp);
    free(handle);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Open(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testopen.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int fd;
    if (param == PARAM_0) {
        fd = open(path, O_CREAT | O_RDWR);
    } else {
        fd = open("/", O_CREAT | O_RDWR);
    }
    int ret;
    if (fd != FAILD) {
        close(fd);
        remove(path);
        ret = PARAM_0;
    } else {
        ret = PARAM_UNNORMAL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Open64(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testopen64.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int fd;
    if (param == PARAM_0) {
        fd = open64(path, O_CREAT | O_RDWR);
    } else {
        fd = open64("/", O_CREAT | O_RDWR);
    }
    int ret;
    if (fd != FAILD) {
        close(fd);
        remove(path);
        ret = PARAM_0;
    } else {
        ret = PARAM_UNNORMAL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OpenByHandleAt(napi_env env, napi_callback_info info)
{
    char dir[] = "/data/storage/el2/base/files/";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    struct file_handle tempHandle;
    tempHandle.handle_bytes = PARAM_0;
    int mountId = 0;
    int fd = 0;
    DIR *dirfp = opendir(dir);
    fd = dirfd(dirfp);

    name_to_handle_at(fd, dir, &tempHandle, &mountId, PARAM_0);
    struct file_handle *handle = (struct file_handle *)malloc(tempHandle.handle_bytes);
    handle->handle_bytes = tempHandle.handle_bytes;

    int ret = PARAM_0;
    ret = name_to_handle_at(fd, dir, handle, &mountId, PARAM_0);
    ret = open_by_handle_at(mountId, handle, PARAM_0);

    closedir(dirfp);
    free(handle);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixFadvise(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/test.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT | O_RDWR);
        ret = posix_fadvise(fd, SIZE_8, SIZE_1024, POSIX_FADV_NORMAL);
        close(fd);
        remove(path);
    } else {
        ret = posix_fadvise(PARAM_UNNORMAL, SIZE_8, SIZE_1024, POSIX_FADV_NORMAL);
    }
    if (ret != PARAM_0) {
        ret = PARAM_UNNORMAL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FalLocate(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testfallocate.txt";
    char text[] = "test fallocate";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT | O_RDWR);
        write(fd, text, sizeof(text));
        ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, SIZE_4096, SIZE_4096 * THREE);
        close(fd);
        remove(path);
    } else {
        ret = fallocate(PARAM_UNNORMAL, PARAM_0, PARAM_0, PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FalLocate64(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/test.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT | O_RDWR);
        ret = fallocate64(fd, FALLOC_FL_KEEP_SIZE, SIZE_4096, SIZE_4096 * THREE);
        close(fd);
        remove(path);
    } else {
        ret = fallocate64(PARAM_UNNORMAL, PARAM_0, PARAM_0, PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FcnTl(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/test.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT);
        ret = fcntl(fd, F_GETFL);
        if (ret != FAILD) {
            ret = PARAM_0;
        } else {
            ret = PARAM_UNNORMAL;
        }
        close(fd);
        remove(path);
    } else {
        ret = fcntl(PARAM_UNNORMAL, F_GETFL);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" size_t __fwrite_chk(const void *buf, size_t size, size_t count, FILE *stream, size_t buf_size);
static napi_value FwriteChk(napi_env env, napi_callback_info info)
{
    const char *TEMP_FILE = "/data/storage/el2/base/files/test.txt";
    const char *gTempFileContent = "This is a test";
    int len = strlen(gTempFileContent);
    int ret = FAILD;
    size_t writeCount = PARAM_0;
    FILE *fp = nullptr;
    do {
        int fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY);
        fp = fdopen(fileDescribe, "w");
        if (fp == nullptr) {
            break;
        }
        writeCount = __fwrite_chk(gTempFileContent, len, 1, fp, len);
        ret = writeCount == PARAM_1;
    } while (PARAM_0);
    if (fp != nullptr) {
        fclose(fp);
    }
    remove(TEMP_FILE);
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
        {"open64", nullptr, Open64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tee", nullptr, Tee, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vmsplice", nullptr, Vmsplice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readahead", nullptr, Readahead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfallocate", nullptr, PosixFallocate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixfadvise", nullptr, PosixFadvise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl", nullptr, FcnTl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fallocate64", nullptr, FalLocate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fallocate", nullptr, FalLocate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwritechk", nullptr, FwriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "fcntl1ndk",
    .nm_register_func = Init,
    .nm_modname = "libfcntl1ndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
