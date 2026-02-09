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
#ifndef CLOUDDISKMGRNDK_UTILS_H
#define CLOUDDISKMGRNDK_UTILS_H

#include <cstring>

#include <napi/native_api.h>
#include "common/logger_common.h"

char* GetStringParam(napi_env env, napi_callback_info info, int32_t index = 0)
{
    size_t argc = index + 1;
    napi_value args[10] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 0;
    napi_status status = napi_get_value_string_utf8(env, args[index], nullptr, 0, &length);
    if (status != napi_ok) {
        LOGE("napi_value_string_utf8 failed");
        return nullptr;
    }
    char* param = new char[length + 1];
    std::fill_n(param, length + 1, 0);
    status = napi_get_value_string_utf8(env, args[index], param, length + 1, &length);
    if (status != napi_ok) {
        if (param) {
            delete[] param;
        }
        LOGE("napi_get_value_string_utf8 failed");
        return nullptr;
    }
    return param;
}

#endif