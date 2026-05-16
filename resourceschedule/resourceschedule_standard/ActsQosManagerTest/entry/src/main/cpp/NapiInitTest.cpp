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
#include <array>
#include "include/OhosCommonTest.h"
#include "include/QosCapiTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

using QosTestFn = int (*)();

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
};

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<QosTestFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

// OHOS QoS Thread QoS Test
static napi_value ThreadQoSTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::QosManager::SetThreadQoSNdkTest();
                break;
            case CASE_NUM_1:
                result = Acts::QosManager::ResetThreadQoSNdkTest();
                break;
            case CASE_NUM_2:
                result = Acts::QosManager::GetThreadQoSNdkTest();
                break;
            case CASE_NUM_3:
                result = Acts::QosManager::ThreadQoSNdkTest();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS QoS Gewu API Test
static napi_value GewuApiTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::QosManager::GewuCreateSessionTest();
                break;
            case CASE_NUM_1:
                result = Acts::QosManager::GewuSubmitRequestTest();
                break;
            case CASE_NUM_2:
                result = Acts::QosManager::GewuAbortRequestTest();
                break;
            case CASE_NUM_3:
                result = Acts::QosManager::GewuDestroySessionTest();
                break;
            case CASE_NUM_4:
                result = Acts::QosManager::GewuErrorCodeTest();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ThreadQoSTest", nullptr, ThreadQoSTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GewuApiTest", nullptr, GewuApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "qosmanagerops",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
