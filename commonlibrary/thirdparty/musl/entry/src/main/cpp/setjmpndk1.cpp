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
#include <csetjmp>
#include <cstdio>
#include <cstdlib>
#include <js_native_api.h>
#include <node_api.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define ONEVAL 1
#define MINUSONE (-1)

static int count = PARAM_0;
static napi_value Longjmp(napi_env env, napi_callback_info info)
{
    jmp_buf jmp;
    count = PARAM_0;
    int ret = setjmp(jmp);
    if (count == PARAM_0) {
        count = PARAM_1;
        longjmp(jmp, PARAM_1);
    }
    count = PARAM_0;
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value _Longjmp(napi_env env, napi_callback_info info)
{
    jmp_buf jmp;
    count = PARAM_0;
    int ret = _setjmp(jmp);
    if (count == PARAM_0) {
        count = PARAM_1;
        _longjmp(jmp, PARAM_1);
    }
    count = PARAM_0;
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value _Setjmp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    jmp_buf jmp;
    count = PARAM_0;
    int ret = _setjmp(jmp);
    if (count == PARAM_0 && ret != PARAM_0) {
        count = PARAM_0;
        napi_create_int32(env, PARAM_UNNORMAL, &result);
        return result;
    }
    if (count == PARAM_1 && ret == PARAM_0) {
        count = PARAM_0;
        napi_create_int32(env, PARAM_UNNORMAL, &result);
        return result;
    }
    if (count == PARAM_0) {
        count = PARAM_1;
        _longjmp(jmp, PARAM_1);
    }
    count = PARAM_0;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"longjmp", nullptr, Longjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"_longjmp", nullptr, _Longjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"_setjmp", nullptr, _Setjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "setjmpndk1",
    .nm_register_func = Init,
    .nm_modname = "setjmpndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
