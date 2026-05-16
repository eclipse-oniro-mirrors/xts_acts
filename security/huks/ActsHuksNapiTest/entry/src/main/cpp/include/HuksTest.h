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

#ifndef ACTSHUKSNAPITEST_HUKS_TEST_H
#define ACTSHUKSNAPITEST_HUKS_TEST_H

#include "napi/native_api.h"
#include <functional>

constexpr int ARG_INDEX = 0;
constexpr int DEFAULT_ARG = -1;
constexpr int RESULT_ERROR = -1;

// Helper function to safely execute NAPI operations
inline napi_value NapiTry(napi_env env, std::function<napi_value()> func)
{
    try {
        return func();
    } catch (...) {
        napi_value result;
        napi_create_int32(env, RESULT_ERROR, &result);
        return result;
    }
}

// Helper function to extract int32 value from napi_value
inline bool TryGetInt32Value(napi_env env, napi_value arg, int32_t* result)
{
    napi_valuetype valuetype;
    napi_status status = napi_typeof(env, arg, &valuetype);
    if (status != napi_ok || valuetype != napi_number) {
        return false;
    }
    
    status = napi_get_value_int32(env, arg, result);
    return (status == napi_ok);
}

// Helper function to get int32 argument
inline int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[10];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        return defaultValue;
    }
    
    int32_t value;
    return TryGetInt32Value(env, args[index], &value) ? value : defaultValue;
}

#endif // ACTSHUKSNAPITEST_HUKS_TEST_H
