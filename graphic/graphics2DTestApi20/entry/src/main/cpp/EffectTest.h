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

#ifndef EFFECT_TEST_H
#define EFFECT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addEffectTest(std::vector<napi_property_descriptor> &descData);

napi_value OH_Filter_CreateEffectFail(napi_env env, napi_callback_info info);
napi_value OH_Filter_ReleaseFail(napi_env env, napi_callback_info info);
napi_value OH_Filter_BlurWithTileModeSuccess(napi_env env, napi_callback_info info);
napi_value OH_Filter_BlurWithTileModeFail(napi_env env, napi_callback_info info);
napi_value OH_Filter_GetEffectPixelMapFail(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_GetTransformMatrixV2Success(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_AcquireNativeWindowBufferSuccess(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_AcquireNativeWindowBufferFail(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_ReleaseNativeWindowBufferFail(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_SetDropBufferModeSuccess(napi_env env, napi_callback_info info);

#endif //EFFECT_TEST_H
