/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "common_utils.h"
#include <memory>

std::string CommonUtils::GetStringArgument(napi_env env, napi_value value)
{
    std::string result;
    size_t bufferLength = 0;
    napi_status status = napi_get_value_string_utf8(env, value, nullptr, 0, &bufferLength);
    
    std::unique_ptr<char[]> buffer = std::make_unique<char[]>((bufferLength + 1) * sizeof(char));
    status = napi_get_value_string_utf8(env, value, buffer.get(), bufferLength + 1, &bufferLength);
    
    result = buffer.get();
    return result;
}