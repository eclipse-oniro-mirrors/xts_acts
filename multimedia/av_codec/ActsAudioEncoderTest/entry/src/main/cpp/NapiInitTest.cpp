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
#include "NullCheckTest.h"
#include "OhosCommonTest.h"
#include "ParamCheckTest.h"
#include "StatusCheck1Test.h"
#include "StatusCheck2Test.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
static constexpr size_t NULL_CHECK_HANDLER_COUNT = 23;
static constexpr size_t PARAM_CHECK_HANDLER_COUNT = 15;
static constexpr size_t STATUS_CHECK_HANDLER_COUNT = 68;

using AudioEncoderFn = int (*)();

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
};

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<AudioEncoderFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

static napi_value Audio_Encoder_NullCheckTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<AudioEncoderFn, NULL_CHECK_HANDLER_COUNT> handlers = {
            NULL_CHECK_001, NULL_CHECK_002, NULL_CHECK_003, NULL_CHECK_004, NULL_CHECK_005, NULL_CHECK_006,
            NULL_CHECK_007, NULL_CHECK_008, NULL_CHECK_009, NULL_CHECK_010, NULL_CHECK_011, NULL_CHECK_012,
            NULL_CHECK_013, NULL_CHECK_014, NULL_CHECK_015, NULL_CHECK_016, NULL_CHECK_017, NULL_CHECK_018,
            NULL_CHECK_019, NULL_CHECK_020, NULL_CHECK_021, NULL_CHECK_022, NULL_CHECK_023,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Audio_Encoder_ParamCheckTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<AudioEncoderFn, PARAM_CHECK_HANDLER_COUNT> handlers = {
            PARAM_CHECK_001, PARAM_CHECK_002, PARAM_CHECK_003, PARAM_CHECK_004, PARAM_CHECK_005,
            PARAM_CHECK_006, PARAM_CHECK_007, PARAM_CHECK_008, PARAM_CHECK_009, PARAM_CHECK_010,
            PARAM_CHECK_011, PARAM_CHECK_012, PARAM_CHECK_013, PARAM_CHECK_014, PARAM_CHECK_015,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Audio_Encoder_StatusCheckTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<AudioEncoderFn, STATUS_CHECK_HANDLER_COUNT> handlers = {
            STATUS_CHECK_001, STATUS_CHECK_002, STATUS_CHECK_003, STATUS_CHECK_004, STATUS_CHECK_005, STATUS_CHECK_006,
            STATUS_CHECK_007, STATUS_CHECK_008, STATUS_CHECK_009, STATUS_CHECK_010, STATUS_CHECK_011, STATUS_CHECK_012,
            STATUS_CHECK_013, STATUS_CHECK_014, STATUS_CHECK_015, STATUS_CHECK_016, STATUS_CHECK_017, STATUS_CHECK_018,
            STATUS_CHECK_019, STATUS_CHECK_020, STATUS_CHECK_021, STATUS_CHECK_022, STATUS_CHECK_023, STATUS_CHECK_024,
            STATUS_CHECK_025, STATUS_CHECK_026, STATUS_CHECK_027, STATUS_CHECK_028, STATUS_CHECK_029, STATUS_CHECK_030,
            STATUS_CHECK_031, STATUS_CHECK_032, STATUS_CHECK_033, STATUS_CHECK_034, STATUS_CHECK_035, STATUS_CHECK_036,
            STATUS_CHECK_037, STATUS_CHECK_038, STATUS_CHECK_039, STATUS_CHECK_040, STATUS_CHECK_041, STATUS_CHECK_042,
            STATUS_CHECK_043, STATUS_CHECK_044, STATUS_CHECK_045, STATUS_CHECK_046, STATUS_CHECK_047, STATUS_CHECK_048,
            STATUS_CHECK_049, STATUS_CHECK_050, STATUS_CHECK_051, STATUS_CHECK_052, STATUS_CHECK_053, STATUS_CHECK_054,
            STATUS_CHECK_055, STATUS_CHECK_056, STATUS_CHECK_057, STATUS_CHECK_058, STATUS_CHECK_059, STATUS_CHECK_060,
            STATUS_CHECK_061, STATUS_CHECK_062, STATUS_CHECK_063, STATUS_CHECK_064, STATUS_CHECK_065, STATUS_CHECK_066,
            STATUS_CHECK_067, STATUS_CHECK_068,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_audioEncoderDescriptors[] = {
    DECL_NAPI_DESC(Audio_Encoder_NullCheckTest),
    DECL_NAPI_DESC(Audio_Encoder_ParamCheckTest),
    DECL_NAPI_DESC(Audio_Encoder_StatusCheckTest),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_audioEncoderDescriptors) / sizeof(g_audioEncoderDescriptors[0]),
                           g_audioEncoderDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module audioencoderModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "audioencoder",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&audioencoderModule);
}
