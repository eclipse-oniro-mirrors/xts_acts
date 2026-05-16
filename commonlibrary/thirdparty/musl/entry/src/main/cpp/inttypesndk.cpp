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
#include "common/native_common.h"
#include <cinttypes>
#include <js_native_api.h>
#include <node_api.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192
#define PARAM_16 16

static napi_value Imaxabs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    int a;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &a);
    int ret = imaxabs(a);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Imaxdiv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    int aa, ba;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &aa);
    napi_get_value_int32(env, args[1], &ba);
    imaxdiv_t ret = imaxdiv(aa, ba);

    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value quot = nullptr;
    napi_value rem = nullptr;
    int a = ret.quot;
    int b = ret.rem;
    napi_create_int32(env, a, &quot);
    napi_set_named_property(env, result, "quot", quot);
    napi_create_int32(env, b, &rem);
    napi_set_named_property(env, result, "rem", rem);
    return result;
}
static napi_value Strtoimax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    char *valueFirst = NapiHelper::GetString(env, args[1]);
    int valueSecond;
    napi_get_value_int32(env, args[2], &valueSecond);

    napi_value result = nullptr;
    int strToiMaxValue = strtoimax(valueZero, &valueFirst, valueSecond);

    napi_create_int32(env, strToiMaxValue, &result);

    return result;
}

static napi_value Strtoumax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    char *valueFirst = NapiHelper::GetString(env, args[1]);
    int valueSecond;
    napi_get_value_int32(env, args[2], &valueSecond);
    int strToiMaxValue = strtoumax(valueZero, &valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, strToiMaxValue, &result);

    return result;
}

static napi_value Wcstoimax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param_int;
    napi_get_value_int32(env, args[0], &param_int);

    int resultValue;
    if (param_int == PARAM_0) {
        resultValue = wcstoimax(L"ff", nullptr, PARAM_16);
    } else {
        resultValue = wcstoimax(L"1000xyz", nullptr, param_int);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcstoumax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param_int;
    napi_get_value_int32(env, args[0], &param_int);

    int resultValue;
    if (param_int == PARAM_0) {
        resultValue = wcstoumax(L"ff", nullptr, PARAM_16);
    } else {
        resultValue = wcstoumax(L"1000xyz", nullptr, param_int);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strtoimax", nullptr, Strtoimax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoumax", nullptr, Strtoumax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoimax", nullptr, Wcstoimax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoumax", nullptr, Wcstoumax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imaxabs", nullptr, Imaxabs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imaxdiv", nullptr, Imaxdiv, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "inttypes",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
