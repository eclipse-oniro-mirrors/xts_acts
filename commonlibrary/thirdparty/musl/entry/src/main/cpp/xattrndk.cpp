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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>
#include <sys/xattr.h>
#include <unistd.h>

#define ONEVAL 1
#define MINUSONE (-1)
#define SUCCESS 1
#define FAIL (-1)
#define NO_ERR 0
#define SIZE_THREE 3
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_0667 0667
#define PARAM_64 64

#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192

static napi_value Lgetxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);
    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);
    system("chmod 777 /data/storage/el2/base/files/test.txt");
    char buf[BUFSIZ] = {0};
    int ret = lsetxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", "dat",
                        sizeof("dat"), XATTR_CREATE);
    if (ret == NO_ERR) {
        ret = lgetxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", buf,
                        sizeof(buf));
    } else {
        ret = FAIL;
    }
    remove("/data/storage/el2/base/files/test.txt");
    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value Setxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);

    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);
    int ret = setxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", "dat",
                       sizeof("dat"), XATTR_CREATE);
    if (ret == NO_ERR) {
        ret = NO_ERR;
    } else {
        ret = FAIL;
    }
    remove("/data/storage/el2/base/files/test.txt");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);

    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);
    char buf[BUFSIZ] = {0};
    int ret = setxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", "dat",
                       sizeof("dat"), XATTR_CREATE);
    if (ret == NO_ERR) {
        ret = getxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", buf,
                       sizeof(buf));
    } else {
        ret = FAIL;
    }
    remove("/data/storage/el2/base/files/test.txt");
    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value Listxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);

    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);

    system("chmod 777 /data/storage/el2/base/files/test.txt");
    char list[BUFSIZ] = {0};
    int ret = setxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", "dat",
                       sizeof("dat"), XATTR_CREATE);
    if (ret == NO_ERR) {
        ret = listxattr("/data/storage/el2/base/files/test.txt", list, sizeof(list));
    } else {
        ret = FAIL;
    }
    remove("/data/storage/el2/base/files/test.txt");
    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value LListxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);

    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);

    system("chmod 777 /data/storage/el2/base/files/test.txt");
    char list[BUFSIZ] = {0};
    int ret = lsetxattr("/data/storage/el2/base/files/test.txt", "/data/storage/el2/base/files/user.txt", "dat",
                        sizeof("dat"), XATTR_CREATE);
    if (ret == NO_ERR) {
        ret = llistxattr("/data/storage/el2/base/files/test.txt", list, sizeof(list));
    } else {
        ret = FAIL;
    }
    remove("/data/storage/el2/base/files/test.txt");

    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value FListXAttr(napi_env env, napi_callback_info info)
{
    ssize_t size_t = PARAM_0, len = PARAM_64;
    int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    char secondParam[] = "/data/storage/el2/base/files";
    size_t = flistxattr(firstParam, secondParam, len);
    napi_value result = nullptr;
    napi_create_int32(env, size_t, &result);
    return result;
}

static napi_value Lsetxattr(napi_env env, napi_callback_info info)
{
    mode_t perms = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
    int fd = open("/data/storage/el2/base/files/test.txt", O_RDWR | O_CREAT, perms);
    char str[] = "dat";
    write(fd, str, sizeof(str));
    close(fd);
    int ret = lsetxattr("/data/storage/el2/base/files/test.txt", "user.txt", "dat", PARAM_3, XATTR_CREATE);
    napi_value result = nullptr;
    if (ret == NO_ERR) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    remove("/data/storage/el2/base/files/test.txt");
    return result;
}

static napi_value Removexattr(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    int fd = open(path, O_CREAT | O_WRONLY, PARAM_0667);
    setxattr(path, "user.foo", "bar", PARAM_4, XATTR_CREATE);
    int result = removexattr(path, "user.foo");
    napi_value ret = nullptr;
    napi_create_int32(env, result, &ret);
    close(fd);
    return ret;
}

static napi_value Lremovexattr(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    int fd = open(path, O_CREAT | O_WRONLY, PARAM_0667);
    lsetxattr(path, "user.foo", "bar", PARAM_4, XATTR_CREATE);
    int result = lremovexattr(path, "user.foo");
    napi_value ret = nullptr;
    napi_create_int32(env, result, &ret);
    close(fd);
    if (access(path, F_OK) == PARAM_0) {
        remove(path);
    }
    return ret;
}
static napi_value Fremovexattr(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    char buf[10];

    int fd = open(path, O_CREAT | O_WRONLY, PARAM_0667);

    int result = fsetxattr(fd, "user.foo", "bar", PARAM_4, PARAM_0);
    result = fgetxattr(fd, "user.foo", buf, sizeof(buf));
    result = fremovexattr(fd, "user.foo");

    napi_value ret = nullptr;
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value Fsetxattr(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";

    int fd = open(path, O_CREAT | O_WRONLY, PARAM_0667);

    int result = fsetxattr(fd, "user.foo", "bar", PARAM_4, PARAM_0);

    napi_value ret = nullptr;
    napi_create_int32(env, result, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setxattr", nullptr, Setxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removexattr", nullptr, Removexattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fremovexattr", nullptr, Fremovexattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fsetxattr", nullptr, Fsetxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgetxattr", nullptr, Lgetxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getxattr", nullptr, Getxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llistxattr", nullptr, LListxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"listxattr", nullptr, Listxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lremovexattr", nullptr, Lremovexattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removexattr", nullptr, Removexattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lsetxattr", nullptr, Lsetxattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"flistxattr", nullptr, FListXAttr, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "xattr",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
