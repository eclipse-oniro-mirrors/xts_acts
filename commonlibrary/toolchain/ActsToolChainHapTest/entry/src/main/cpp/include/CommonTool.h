/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef COMMONTOOL_H
#define COMMONTOOL_H

#ifndef SUCCESS_CODE
#define SUCCESS_CODE 0
#endif

#include <cstdarg>
#include <cstddef>
#include <cstdint>
#include <ctime>
#include <iostream>
#include <string>
#include "napi/native_api.h"

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue);

inline int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    return GetInt32ArgImpl(env, info, index, defaultValue);
}

template <typename Func> napi_value NapiTry(napi_env env, Func&& func)
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

void OHPrintf(const char* fmt, ...);
void OHVPrintf(const char* fmt, va_list args);

int32_t SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len);

#endif // COMMON_TOOL_H