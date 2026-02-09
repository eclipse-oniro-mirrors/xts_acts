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

#include "common/napi_helper.cpp"
#include "napi/native_api.h"
#include <cstdio>
#include <cstdlib>
#include <cuchar>
#include <cwchar>
#include <js_native_api.h>
#include <node_api.h>
#include <pthread.h>
#include <utmp.h>

#define PARAM_1 1
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)

static napi_value Mbrtoc16(napi_env env, napi_callback_info info)
{
    char16_t pc16;
    char s[] = "G";
    mbstate_t ps{};
    int length;
    length = mbrtoc16(&pc16, s, MB_CUR_MAX, &ps);
    napi_value result;
    napi_create_int32(env, length, &result);
    return result;
}

static napi_value Mbrtoc32(napi_env env, napi_callback_info info)
{
    char32_t pc32;
    char s[] = "S";
    mbstate_t ps{};
    int length;
    length = mbrtoc32(&pc32, s, MB_CUR_MAX, &ps);
    napi_value result;
    napi_create_int32(env, length, &result);
    return result;
}
static napi_value C16rtomb(napi_env env, napi_callback_info info)
{
    const char16_t str[] = u"C16rtomb";
    char size[50];
    mbstate_t param{};
    size_t length;
    int num = NO_ERR;
    length = c16rtomb(size, str[num], &param);
    int resultValue = FAIL;
    if (length > NO_ERR) {
        resultValue = PARAM_1;
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value C32rtomb(napi_env env, napi_callback_info info)
{
    const char32_t str[] = U"C32rtomb";
    char size[50];
    mbstate_t param{};
    size_t length;
    int num = NO_ERR;
    length = c32rtomb(size, str[num], &param);
    int resultValue = FAIL;
    if (length > NO_ERR) {
        resultValue = PARAM_1;
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"c16rtomb", nullptr, C16rtomb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"c32rtomb", nullptr, C32rtomb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbrtoc16", nullptr, Mbrtoc16, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbrtoc32", nullptr, Mbrtoc32, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "uchar",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }