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
#ifndef FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H
#define FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H

#include <memory>
#include <utility>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <hilog/log.h>

#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

inline napi_property_descriptor DECLARE_NAPI_FUNCTION(const char* name, napi_callback func)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
}

namespace CameraTestUtils {
const int NAME_SIZE = 256;
const int PARAMETER_TWO = 2;

inline bool CheckArgs(napi_env env, napi_callback_info info, napi_value *args, size_t required)
{
    size_t argc = required;
    return napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok && argc >= required &&
           args[0] != nullptr && (required == 1 || args[1] != nullptr);
}

inline char* GetArgsOneParameterByStr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[PARAMETER_TWO] = {nullptr};
    if (!CheckArgs(env, info, args, 1)) {
        return nullptr;
    }
    size_t typeLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    char* param = new char[typeLen + 1];
    return napi_get_value_string_utf8(env, args[0], param, typeLen + 1, &typeLen) == napi_ok ? param : nullptr;
}

inline int32_t GetArgsOneParameterByInt(napi_env env, napi_callback_info info)
{
    napi_value args[1] = {nullptr};
    if (!CheckArgs(env, info, args, 1)) {
        return 0;
    }

    int32_t index = 0;
    return napi_get_value_int32(env, args[0], &index) == napi_ok ? index : 0;
}

inline std::pair<char*, int32_t> GetArgsTwoParameters(napi_env env, napi_callback_info info)
{
    napi_value args[PARAMETER_TWO] = {nullptr};
    if (!CheckArgs(env, info, args, PARAMETER_TWO)) { return {nullptr, 0};}

    size_t typeLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    char* param1 = new char[typeLen + 1];
    int32_t index = 0;
    bool success = napi_get_value_string_utf8(env, args[0], param1, typeLen + 1, &typeLen) == napi_ok &&
                   napi_get_value_int32(env, args[1], &index) == napi_ok;
    return success ? std::make_pair(param1, index) : std::make_pair(nullptr, 0);
}

inline std::pair<int, int> GetArgsTwoParametersByInit(napi_env env, napi_callback_info info)
{
    int32_t index0 = 0;
    int32_t index1 = 0;
    napi_value args[PARAMETER_TWO] = {nullptr};
    if (!CheckArgs(env, info, args, PARAMETER_TWO)) {
        return {index0, index1};
    }

    bool success = napi_get_value_int32(env, args[0], &index0) == napi_ok &&
                   napi_get_value_int32(env, args[1], &index1) == napi_ok;
    return success ? std::make_pair(index0, index1) : std::make_pair(index0, index1);
}

}
#endif /* FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H */
