/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef IMAGE_EFFECT_SUPP_TEST_H
#define IMAGE_EFFECT_SUPP_TEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHImageEffectConfigureSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputSurfaceSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectGetInputSurfaceSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputPixelmapSupp(napi_env env, napi_callback_info info);
napi_value savePixelMapForPathSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSaveSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectEmuSupp(napi_env env, napi_callback_info info);
napi_value CreatePixelMap(napi_env env, napi_callback_info info);
napi_value CreatOutPixelMapForPathSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputPixelmapSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputUriSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputUriSupp(napi_env env, napi_callback_info info);
napi_value OIRNdkErrCodeEmuSupp(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif