/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ActsOpenslesPlayerNdkTest.cpp"

// 常量定义，避免魔法数字
enum PlayerFunctionCaseNum {
    PLAYER_FUNCTION_CASE_0100 = 0,
    PLAYER_FUNCTION_CASE_0200 = 1
};

enum EngineInvalidCaseNum {
    ENGINE_INVALID_CASE_0100 = 0,
    ENGINE_INVALID_CASE_0200 = 1,
    ENGINE_INVALID_CASE_0300 = 2,
    ENGINE_INVALID_CASE_0400 = 3
};

static napi_value createResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// NAPI function for PALYER_FUNCTION test cases
static napi_value openslesPlayerFunctionTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case PLAYER_FUNCTION_CASE_0100:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100();
            break;
        case PLAYER_FUNCTION_CASE_0200:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200();
            break;
        default:
            napi_throw_type_error(env, nullptr,
                "The range of case must be PLAYER_FUNCTION_CASE_0100 to PLAYER_FUNCTION_CASE_0200");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}

// NAPI function for ENGINEITF_INVALID test cases
static napi_value openslesEngineInvalidTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case ENGINE_INVALID_CASE_0100:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100();
            break;
        case ENGINE_INVALID_CASE_0200:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200();
            break;
        case ENGINE_INVALID_CASE_0300:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300();
            break;
        case ENGINE_INVALID_CASE_0400:
            result = SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400();
            break;
        default:
            napi_throw_type_error(env, nullptr,
                "The range of case must be ENGINE_INVALID_CASE_0100 to ENGINE_INVALID_CASE_0400");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"openslesPlayerFunctionTest", nullptr, openslesPlayerFunctionTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openslesEngineInvalidTest", nullptr, openslesEngineInvalidTest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "audio_cpp_standard_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
