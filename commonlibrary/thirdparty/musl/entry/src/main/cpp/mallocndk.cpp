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

#include "malloc.h"
#include "napi/native_api.h"
#include <cerrno>
#include <cstdlib>
#include <js_native_api_types.h>
#include <unistd.h>

#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TEN 10
#define TEST_MODE 0666
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_64 64
#define PARAM_10 10
#define PARAM_8 8
#define PARAM_256 256
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0

static napi_value Malloc(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int ret = PARAM_UNNORMAL;
    size_t memsize = PARAM_64;
    int *memory = static_cast<int*>(malloc(memsize));
    if (memory == nullptr) {
        ret = PARAM_UNNORMAL;
    } else {
        ret = PARAM_0;
        free(memory);
        memory = nullptr;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MallocUsableSize(napi_env env, napi_callback_info info)
{
    int mallocSize = PARAM_256;
    void *p = malloc(mallocSize);
    size_t ret = malloc_usable_size(p);
    free(p);
    if (ret == mallocSize) {
        ret = PARAM_0;
    } else {
        ret = PARAM_UNNORMAL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Memalign(napi_env env, napi_callback_info info)
{
    int align = getpagesize();
    int ret = FAIL;
    void *buff = (void *)memalign(align, PARAM_8 * align);
    if (buff != nullptr) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    free(buff);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    buff = nullptr;
    return result;
}
static napi_value Mallopt(napi_env env, napi_callback_info info)
{
    int ret = mallopt(PARAM_0, PARAM_10);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"malloc", nullptr, Malloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mallocUsableSize", nullptr, MallocUsableSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memalign", nullptr, Memalign, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mallopt", nullptr, Mallopt, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "mallocndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
