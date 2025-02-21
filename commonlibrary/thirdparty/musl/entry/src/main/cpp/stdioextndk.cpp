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
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <semaphore.h>
#include <stdio_ext.h>
#include <sys/eventfd.h>
#include <unistd.h>

#define ERRORNUMBER 0
#define SUCCESSRET 1
#define PARAM_0 0
#define PARAM_5 5
#define INIT (-1)
#define SUCCESS 0

static napi_value Flushlbf(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    errno = ERRORNUMBER;
    _flushlbf();
    int returnValue = ERRORNUMBER;
    if (errno == ERRORNUMBER) {
        returnValue = SUCCESSRET;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Flbf(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    errno = ERRORNUMBER;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    __flbf(file);
    int returnValue = ERRORNUMBER;
    if (errno == ERRORNUMBER) {
        returnValue = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fwriting(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __fwriting(file);
    int backInfo = ERRORNUMBER;
    if (returnValue == ERRORNUMBER) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Fpending(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __fpending(file);
    int backInfo = ERRORNUMBER;
    if (returnValue != PARAM_0) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value FBufSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __fbufsize(file);
    int backInfo = ERRORNUMBER;
    if (returnValue != PARAM_0) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Fpurge(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    __fpurge(file);
    int backInfo = ERRORNUMBER;
    if (errno == ERRORNUMBER) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Freadable(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __freadable(file);
    int backInfo = ERRORNUMBER;
    if (returnValue != ERRORNUMBER) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Freading(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __freading(file);
    int backInfo = ERRORNUMBER;
    if (returnValue != ERRORNUMBER) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Fseterr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Fsetlocking(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Fwritable(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    FILE *file = fopen("/data/storage/el2/base/files/fzl.txt", "a+");
    int returnValue = __fwritable(file);
    int backInfo = ERRORNUMBER;
    if (returnValue != ERRORNUMBER) {
        backInfo = SUCCESSRET;
    }
    close(fileDescribe);
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value DPrintf(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    int backParam = INIT;
    fopen(path, mode);
    napi_value result = nullptr;
    backParam = dprintf(SUCCESS, path);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FEof_unlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    int backParam = INIT;
    FILE *stream = fopen(path, mode);
    backParam = feof_unlocked(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FError_unlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    int fileDescribe = SUCCESS;
    FILE *stream = fopen(path, mode);
    napi_value result = nullptr;
    if (stream != nullptr) {
        fileDescribe = ferror_unlocked(stream);
        napi_create_int32(env, fileDescribe, &result);
    }
    napi_create_int32(env, fileDescribe, &result);
    return result;
}

static napi_value FFlush_unlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    napi_value result = nullptr;
    int fileDescribe = SUCCESS;
    fileDescribe = fflush_unlocked(stream);
    napi_create_int32(env, fileDescribe, &result);
    return result;
}

static napi_value FGetC_unlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    napi_value result = nullptr;
    int fileDescribe;
    fileDescribe = fgetc_unlocked(stream);
    napi_create_int32(env, fileDescribe, &result);
    return result;
}

static napi_value FGetLn(napi_env env, napi_callback_info info)
{
    int backResult = INIT;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    char *getResult = nullptr;
    size_t size_t1 = PARAM_0;
    FILE *stream = fopen(path, mode);
    napi_value result = nullptr;
    getResult = fgetln(stream, &size_t1);
    if (getResult != nullptr) {
        getResult = SUCCESS;
    }
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value FGetS_unlocked(napi_env env, napi_callback_info info)
{
    int backResult = INIT;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    char *getResult = nullptr;
    char *gets = nullptr;
    FILE *stream = fopen(path, mode);
    int fileDescribe = PARAM_0;
    napi_value result = nullptr;
    getResult = fgets_unlocked(gets, fileDescribe, stream);
    if (getResult != nullptr) {
        getResult = SUCCESS;
    }
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value FileNo_unlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    int backResult;
    napi_value result = nullptr;
    backResult = fileno_unlocked(stream);
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value FClose(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = fclose(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FMemOpen(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    void *buf = nullptr;
    size_t size = PARAM_5;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    fopen(path, mode);
    FILE *newStreeam = nullptr;
    newStreeam = fmemopen(buf, size, mode);
    if (newStreeam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FlockFile(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    fpos_t pos;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    flockfile(stream);
    backParam = fgetpos(stream, &pos);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FileNo(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = fileno(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FError(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = ferror(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGets(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    char *getResult = nullptr;
    char str[256];
    const char *path = "hidumper -s 1201";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    fprintf(stream, "Hello, world!\n");
    getResult = fgets(str, sizeof(str), stream);
    if (getResult == nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGetPos64(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    fpos_t pos;
    backParam = fgetpos64(stream, &pos);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGetPos(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    fpos_t pos;
    backParam = fgetpos(stream, &pos);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGetC(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    fprintf(stream, "Hello, world!\n");
    int backParam = INIT;
    backParam = fgetc(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FFlush(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = fflush(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FdOpen(napi_env env, napi_callback_info info)
{
    int backResult;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    int fileDescribe = open(path, O_CREAT);
    FILE *stream = fdopen(fileDescribe, mode);
    backResult = fclose(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"flushLbf", nullptr, Flushlbf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWriting", nullptr, Fwriting, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fPending", nullptr, Fpending, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fPurge", nullptr, Fpurge, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReadable", nullptr, Freadable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fReading", nullptr, Freading, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fSetErr", nullptr, Fseterr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fSetLocking", nullptr, Fsetlocking, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fWritable", nullptr, Fwritable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fLbf", nullptr, Flbf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fBufSize", nullptr, FBufSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fclose", nullptr, FClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmemopen", nullptr, FMemOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"flockfile", nullptr, FlockFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fileno", nullptr, FileNo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ferror", nullptr, FError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgets", nullptr, FGets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetpos", nullptr, FGetPos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetpos64", nullptr, FGetPos64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetc", nullptr, FGetC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fflush", nullptr, FFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdopen", nullptr, FdOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fileno_unlocked", nullptr, FileNo_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgets_unlocked", nullptr, FGetS_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetln", nullptr, FGetLn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetc_unlocked", nullptr, FGetC_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fflush_unlocked", nullptr, FFlush_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ferror_unlocked", nullptr, FError_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"feof_unlocked", nullptr, FEof_unlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dprintf", nullptr, DPrintf, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libstdioextndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }