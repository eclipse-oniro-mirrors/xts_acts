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

#ifndef WEB_ERROR_CODE_WEBERRORCODELIST_H
#define WEB_ERROR_CODE_WEBERRORCODELIST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

napi_value WebNetErrorResponeseSetError(napi_env env, napi_callback_info info);
napi_value WebArkWebResponseGetError(napi_env env, napi_callback_info info);
napi_value WebArkWebConnectError(napi_env env, napi_callback_info info);
napi_value WebArkWebSSLError(napi_env env, napi_callback_info info);

#endif //WEB_ERROR_CODE_WEBERRORCODELIST_H
