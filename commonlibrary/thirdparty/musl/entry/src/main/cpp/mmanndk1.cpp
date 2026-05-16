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
#include <node_api.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#define MPARAM_1 (-1)
#define PARAM_0 0
#define PARAM_0777 0777

static const char *g_tempFile = "/data/storage/el2/base/files/fzl.txt";
static const char *g_tempFileContent = "This is a test";

static napi_value Mmap(napi_env env, napi_callback_info info)
{
    struct stat statbuff;
    int fileDescribe = MPARAM_1;
    void *start = MAP_FAILED;
    int ret = MPARAM_1;
    do {
        fileDescribe = open(g_tempFile, O_CREAT | O_WRONLY, PARAM_0777);
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
        ret = stat(g_tempFile, &statbuff);
        if (ret == MPARAM_1) {
            break;
        }
        ret = MPARAM_1;
        fileDescribe = open(g_tempFile, O_CREAT | O_RDWR, PARAM_0777);
        if (fileDescribe == MPARAM_1) {
            break;
        }
        start = mmap(nullptr, statbuff.st_size, PROT_READ, MAP_PRIVATE, fileDescribe, PARAM_0);
        if (start == MAP_FAILED) {
            break;
        }
        ret = PARAM_0;
    } while (PARAM_0);
    if (start != MAP_FAILED) {
        munmap(start, statbuff.st_size);
    }
    if (fileDescribe != MPARAM_1) {
        close(fileDescribe);
    }
    remove(g_tempFile);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"mmap", nullptr, Mmap, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mman1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
