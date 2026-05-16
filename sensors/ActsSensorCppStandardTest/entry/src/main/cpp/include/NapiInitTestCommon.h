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
#ifndef NAPI_INIT_TEST_COMMON_H
#define NAPI_INIT_TEST_COMMON_H

#include <array>
#include "include/ActsSensorNativeTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
constexpr int ARG_INDEX = 0;
constexpr int DEFAULT_ARG = -1;
constexpr int RESULT_ERROR = -1;

using SensorTestFn = int (*)();

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
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
};

template <size_t N>
int DispatchByCaseNum(int caseNum, const std::array<SensorTestFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue);

template <typename Func>
napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_throw_error(env, nullptr, e.what());
    } catch (...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}

#endif  // NAPI_INIT_TEST_COMMON_H
