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

#ifndef VSYNC_FENCE_TEST_H
#define VSYNC_FENCE_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addVSyncFenceTest(std::vector<napi_property_descriptor> &descData);
napi_value OH_NativeVSync_RequestFrameSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeVSync_RequestFrameInvalue(napi_env env, napi_callback_info info);
napi_value OH_NativeVSync_DVSyncSwitchSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeVSync_DVSyncSwitchInvalue(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_IsValidTrue(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_IsValidFalse(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_WaitTrue(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_WaitFalse(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_WaitForeverTrue(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_WaitForeverFalse(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_CloseTrue(napi_env env, napi_callback_info info);
napi_value OH_NativeFence_CloseFalse(napi_env env, napi_callback_info info);
napi_value OH_NativeVSync_SetExpectedFrameRateRangeSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeVSync_SetExpectedFrameRateRangeNull(napi_env env, napi_callback_info info);

#endif //VSYNC_TEST_H
