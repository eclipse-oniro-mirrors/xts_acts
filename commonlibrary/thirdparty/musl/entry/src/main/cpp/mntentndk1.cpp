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

#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <mntent.h>
#include <node_api.h>
#include <sys/stat.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_0777 0777
#define MPARAM_1 (-1)

static const char *TEMP_FILE = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempFileContent = "/data/storage/el2/base/files/fzl.txt none swap sw 0 0\n";

static napi_value GetMnTent(napi_env env, napi_callback_info info)
{
    struct stat statbuff;
    int fileDescribe = MPARAM_1;
    FILE *fp = nullptr;
    int ret = MPARAM_1;
    do {
        fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY, PARAM_0777);
        if (fileDescribe == MPARAM_1) {
            break;
        }
        ret = write(fileDescribe, g_tempFileContent, strlen(g_tempFileContent));
        if (ret == MPARAM_1) {
            break;
        }
        ret = fsync(fileDescribe);
        if (ret == MPARAM_1) {
            break;
        }
        close(fileDescribe);
        fileDescribe = MPARAM_1;
        ret = stat(TEMP_FILE, &statbuff);
        if (ret == MPARAM_1) {
            break;
        }
        ret = MPARAM_1;
        fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == MPARAM_1) {
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        struct mntent *m = getmntent(fp);
        if (m != nullptr) {
            ret = PARAM_0;
        }
    } while (PARAM_0);
    if (fp != nullptr) {
        endmntent(fp);
    }
    if (fileDescribe != MPARAM_1) {
        close(fileDescribe);
    }
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetMnTentR(napi_env env, napi_callback_info info)
{
    struct stat statbuff;
    int fileDescribe = MPARAM_1;
    FILE *fp = nullptr;
    int ret = MPARAM_1;
    do {
        fileDescribe = open(TEMP_FILE, O_CREAT | O_WRONLY, PARAM_0777);
        if (fileDescribe == MPARAM_1) {
            break;
        }
        ret = write(fileDescribe, g_tempFileContent, strlen(g_tempFileContent));
        if (ret == MPARAM_1) {
            break;
        }
        ret = fsync(fileDescribe);
        if (ret == MPARAM_1) {
            break;
        }
        close(fileDescribe);
        fileDescribe = MPARAM_1;
        ret = stat(TEMP_FILE, &statbuff);
        if (ret == MPARAM_1) {
            break;
        }
        ret = MPARAM_1;
        fileDescribe = open(TEMP_FILE, O_CREAT, PARAM_0777);
        if (fileDescribe == MPARAM_1) {
            break;
        }
        fp = fdopen(fileDescribe, "r");
        if (fp == nullptr) {
            break;
        }
        struct mntent mntbuf;
        char buf[1024];
        struct mntent *m = getmntent_r(fp, &mntbuf, buf, sizeof(buf));
        if (m != nullptr) {
            ret = PARAM_0;
        }
    } while (PARAM_0);
    if (fp != nullptr) {
        endmntent(fp);
    }
    if (fileDescribe != MPARAM_1) {
        close(fileDescribe);
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
        {"getMnTent", nullptr, GetMnTent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMnTentR", nullptr, GetMnTentR, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mntent1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
