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
#include <fcntl.h>
#include <ifaddrs.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <malloc.h>
#include <net/if.h>
#include <node_api.h>
#include <sys/inotify.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_32 32
#define SIZE_0x0 0x0
#define SIZE_4096 4096
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_0L 0L
#define SIZE_8 8
#define SIZE_8192 8192
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define TEN 10
#define STATERROR (-100)
#define OPENERROR (-99)
#define MMAPERROR (-98)
#define TEST_SIZE 4096
#define TEST_M_SIZE 1024
#define TEST_M_NEW_SIZE 2048
#define TEST_MS_SIZE 1024
#define TEST_MODE 0666
#define TEST_FLAG 0777
#include <sys/mman.h>

static napi_value MemfdCreate(napi_env env, napi_callback_info info)
{
    char tmpfile[] = "/data/storage/el2/base/files/memfd_create_0100.txt";
    int retVal = PARAM_0;
    int fd = memfd_create(tmpfile, PARAM_0);
    if (fd != PARAM_UNNORMAL) {
        size_t cnt = write(fd, tmpfile, strlen(tmpfile));
        if (cnt == strlen(tmpfile)) {
            retVal = PARAM_0;
        } else {
            retVal = FAIL;
        }
        close(fd);
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}
static napi_value Mincore(napi_env env, napi_callback_info info)
{
    struct stat st;
    int retVal = PARAM_0;
    napi_value result = nullptr;
    char tmpfile[] = "/data/storage/el2/base/files/memfd_create_0100.txt";
    int fd = open(tmpfile, O_CREAT | O_RDWR);
    if (fd == PARAM_UNNORMAL) {
        perror("open failed");
        napi_create_int32(env, OPENERROR, &result);
        return result;
    }
    void *start = mmap(nullptr, st.st_size, PROT_READ, MAP_PRIVATE, fd, PARAM_0);
    close(fd);
    if (!start) {
        napi_create_int32(env, MMAPERROR, &result);
        return result;
    }
    unsigned char vec[TEST_SIZE];
    memset(vec, SIZE_0x0, sizeof(vec));
    retVal = mincore(start, TEST_SIZE, vec);
    munmap(start, st.st_size);
    remove(tmpfile);
    napi_create_int32(env, retVal, &result);
    return result;
}

#define PAGE_SIZE 256
static napi_value Mmap(napi_env env, napi_callback_info info)
{
    char ptr[] = "/data/storage/el2/base/files/mmap0100.txt";
    int retVal = PARAM_0;
    int fd;
    void *start;
    FILE *fptr = fopen(ptr, "w+");
    struct stat statbuff;
    fwrite(ptr, sizeof(char), strlen(ptr), fptr);
    fseek(fptr, SIZE_0L, SEEK_SET);
    stat(ptr, &statbuff);
    fclose(fptr);
    fd = open(ptr, O_RDWR | O_CREAT, TEST_FLAG);
    start = mmap(nullptr, statbuff.st_size, PROT_READ, MAP_PRIVATE, fd, PARAM_0);
    if (start == MAP_FAILED) {
        retVal = FAIL;
    } else {
        retVal = PARAM_0;
    }
    munmap(start, statbuff.st_size);
    close(fd);
    remove(ptr);
    fptr = nullptr;
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

static napi_value MProtect(napi_env env, napi_callback_info info)
{
    int retVal = FAIL;
    size_t align = getpagesize();
    void *buffer = memalign(align, SIZE_8 * align);
    int ret = mprotect(buffer, getpagesize(), PROT_READ);
    retVal = ret;
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}
static napi_value MreMap(napi_env env, napi_callback_info info)
{
    int retVal = FAIL;
    char tmpfile[] = "/data/storage/el2/base/files/memfd_create_0100.txt";
    int fd = open(tmpfile, O_CREAT | O_RDWR);
    void *map = mmap(nullptr, TEST_M_SIZE, PROT_READ, MAP_SHARED, fd, PARAM_0);
    void *map_new = mremap(map, TEST_M_SIZE, TEST_M_NEW_SIZE, MREMAP_MAYMOVE);

    munmap(map_new, TEST_M_NEW_SIZE);
    close(fd);
    if (!map_new) {
        retVal = PARAM_1;
    } else {
        retVal = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}
static napi_value MSync(napi_env env, napi_callback_info info)
{
    int retVal = FAIL;
    char tmpfile[] = "/data/storage/el2/base/files/memfd_creat0100.txt";
    int fd = open(tmpfile, O_CREAT | O_RDWR);
    void *map = mmap(nullptr, TEST_MS_SIZE, PROT_READ, MAP_SHARED, fd, PARAM_0);
    int ret = msync(map, TEST_MS_SIZE, MS_ASYNC);
    munmap(map, TEST_MS_SIZE);
    close(fd);
    retVal = ret;
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

static napi_value MUnLock(napi_env env, napi_callback_info info)
{
    int retVal = FAIL;
    char *memory = static_cast<char *>(malloc(TEST_SIZE));
    memset(memory, SIZE_0x0, TEST_SIZE);
    int ret = mlock(memory, TEST_SIZE);
    ret = munlock(memory, TEST_SIZE);
    free(memory);
    memory = nullptr;
    retVal = ret;
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}

static napi_value MUnLockAll(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    char *memory = static_cast<char *>(malloc(TEST_SIZE));
    memset(memory, '\0', TEST_SIZE);
    mlockall(MCL_CURRENT);
    ret = munlockall();
    free(memory);
    memory = nullptr;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MAdvise(napi_env env, napi_callback_info info)
{
    size_t length = SIZE_4096;
    char path[] = "/data/storage/el2/base/files/memfd_creat0100.txt";
    if (access(path, F_OK) == PARAM_0) {
        remove(path);
    }
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    void *ptr = mmap(nullptr, length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PARAM_0);
    int ret = madvise(ptr, length, MADV_NORMAL);
    munmap(ptr, length);
    close(fd);
    if (access(path, F_OK) == PARAM_0) {
        remove(path);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MLock(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int change;
    size_t lenV = SIZE_32;
    char *mem = static_cast<char *>(malloc(sizeof(char) * lenV));
    int ret;
    napi_get_value_int32(env, args[0], &change);
    if (change == PARAM_0) {
        ret = mlock(mem, lenV);
        munlock(mem, lenV);
    } else {
        ret = mlock(nullptr, lenV);
    }

    free(mem);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MLock2(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int change;
    size_t lenV = SIZE_32;
    char *mem = static_cast<char *>(malloc(sizeof(char) * lenV));
    int ret;
    napi_get_value_int32(env, args[0], &change);
    if (change == PARAM_0) {
        ret = mlock2(mem, lenV, PARAM_0);
        munlock(mem, lenV);
    } else {
        ret = mlock(nullptr, lenV);
    }
    free(mem);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MLockAll(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int ret;
    ret = mlockall(MCL_FUTURE);
    munlockall();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Mmap64(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT | O_RDWR);
    void *pMap = (unsigned char *)mmap64(PARAM_0, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PARAM_0);
    napi_value result;
    if (pMap == MAP_FAILED) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    close(fd);
    return result;
}
static napi_value Munmap(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT);
    void *p = mmap(PARAM_0, value, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, fd, PARAM_0);
    napi_value result = nullptr;
    napi_create_double(env, munmap(p, value), &result);
    close(fd);
    return result;
}
static napi_value RemapFilePages(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testRemapFilePages.txt";
    char text[] = "test remap_file_pages";
    int len = strlen(text);
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    int fd = open(path, O_CREAT | O_RDWR);
    write(fd, text, len);
    lseek(fd, PARAM_0, SEEK_SET);
    char *start = static_cast<char *>(mmap(nullptr, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PARAM_0));
    if (param == PARAM_0) {
        ret = remap_file_pages(start, TEST_SIZE, PARAM_0, PARAM_1, MAP_SHARED);
    } else {
        ret = remap_file_pages(start, len, PARAM_0, PARAM_1, MAP_SHARED);
    }
    munmap(start, len);
    close(fd);
    remove(path);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"remapFilePages", nullptr, RemapFilePages, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memfdCreate", nullptr, MemfdCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mincore", nullptr, Mincore, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mmap", nullptr, Mmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mProtect", nullptr, MProtect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mreMap", nullptr, MreMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mSync", nullptr, MSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mUnLock", nullptr, MUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mUnLockAll", nullptr, MUnLockAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mAdvise", nullptr, MAdvise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mLock", nullptr, MLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mLock2", nullptr, MLock2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mLockAll", nullptr, MLockAll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"munmap", nullptr, Munmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mmap64", nullptr, Mmap64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mman",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
