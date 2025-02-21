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
#include <cstring>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <unistd.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_UNNORMAL (-1)
#define TEST_0777 0777
#define TEN 10
#define STATERROR (-100)
#define OPENERROR (-99)
#define MMAPERROR (-98)
#define TEST_SIZE 4096

int DoPlainTests(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;
    pid = fork();
    if (pid == FAIL) {
        return FAIL;
    }
    if (pid == PARAM_0) {
        _exit(fn1(arg1));
    }
    if (fn2) {
        ret = fn2(arg2);
    }
    return ret;
}

void createTwoDir()
{
    char path[] = "/data/storage/el2/base/files/mount1";
    if (access(path, PARAM_0) != PARAM_0) {
        mkdir(path, TEST_0777);
    } else {
        remove(path);
        mkdir(path, TEST_0777);
    }
    char path2[] = "/data/storage/el2/base/files/mount2";
    if (access(path2, PARAM_0) != PARAM_0) {
        mkdir(path2, TEST_0777);
    } else {
        remove(path2);
        mkdir(path2, TEST_0777);
    }
}

int Mounttest(void *testarg)
{
    int rev = FAIL;
    int retVal = FAIL;
    createTwoDir();
    const char special[] = "/data/storage/el2/base/files/mount1";
    const char target[] = "/data/storage/el2/base/files/mount2";
    rev = mount(special, target, "", PARAM_0, "");
    retVal = rev;
    if (rev == PARAM_0) {
        rev = umount(special);
    }
    return retVal;
}

static napi_value Mount(napi_env env, napi_callback_info info)
{
    void *test1 = nullptr;
    DoPlainTests(Mounttest, test1, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

int umounttest(void *testarg)
{
    int rev = FAIL;
    int retVal = FAIL;
    createTwoDir();
    const char special[] = "/data/storage/el2/base/files/mount1";
    const char target[] = "/data/storage/el2/base/files/mount2";
    rev = mount(special, target, "", PARAM_0, "");
    if (rev == PARAM_0) {
        retVal = umount(special);
    }
    return retVal;
}

static napi_value Umount(napi_env env, napi_callback_info info)
{
    void *test1 = nullptr;
    DoPlainTests(umounttest, test1, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

int umount2test(void *testarg)
{
    int rev = FAIL;
    createTwoDir();
    const char special[] = "/data/storage/el2/base/files/mount1";
    const char target[] = "/data/storage/el2/base/files/mount2";
    rev = mount(special, target, "", PARAM_0, "");
    if (rev == PARAM_0) {
        umount2(special, MNT_DETACH);
    }
    return rev;
}

static napi_value Umount2(napi_env env, napi_callback_info info)
{
    void *test1 = nullptr;
    DoPlainTests(umount2test, test1, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"mount", nullptr, Mount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount", nullptr, Umount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount2", nullptr, Umount2, nullptr, nullptr, nullptr, napi_default, nullptr},
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

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
