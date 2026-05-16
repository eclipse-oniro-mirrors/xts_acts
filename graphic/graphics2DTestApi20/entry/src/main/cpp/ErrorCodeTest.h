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

#ifndef ERROR_CODE_TEST_H
#define ERROR_CODE_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addErrorCodeTest(std::vector<napi_property_descriptor> &descData);
napi_value OH_OHNativeErrorCodeOK(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeInvalid(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BufferErrorCodeOK(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeBufferInvalid(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeBufferSupport(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BufferHDIError(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeImageSupport(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeImageNoBuffer(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_ErrCodeBUFFER_STATE_INVALID(napi_env env, napi_callback_info info);
napi_value OH_NativeImage_ErrCodeBUFFER_NOT_IN_CACHE(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeVSyncOk(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeVSyncInvalid(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeWindowOk(napi_env env, napi_callback_info info);
napi_value OH_OHNativeErrorCodeWindowInvalid(napi_env env, napi_callback_info info);
napi_value OH_NativeErrorCodeWindowUNKNOW(napi_env env, napi_callback_info info);
napi_value OH_Drawing_DrawingErrorCodeSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_LineTypographyGetLineBreakInvalue(napi_env env, napi_callback_info info);
napi_value OH_Drawing_LineTypographyCreateLineInvalue(napi_env env, napi_callback_info info);
napi_value EffectTileModeREPEATSuccess(napi_env env, napi_callback_info info);
napi_value EffectTileModeMIRRORSuccess(napi_env env, napi_callback_info info);
napi_value EffectTileModeDECALSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_SamplingOptionsCopySuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_SamplingOptionsCopyInvalue(napi_env env, napi_callback_info info);
#endif //ERROR_CODE_TEST_H
