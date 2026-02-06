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

#ifndef OHIMAGEEFFECTNDK_IMAGEEFFECT_ERRORCODE_H
#define OHIMAGEEFFECTNDK_IMAGEEFFECT_ERRORCODE_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif

napi_value OHImageEffectInsertFilterByFilterEffectSuccess(napi_env env, napi_callback_info info);
napi_value OHImageEffectConfigureEffectParamError(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetInputNativeBufferErrorCode(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputNativeBufferErrorCode(napi_env env, napi_callback_info info);

napi_value OHImageEffectSetInputPictureErrorCode(napi_env env, napi_callback_info info);
napi_value OHImageEffectSetOutputPictureErrorCode(napi_env env, napi_callback_info info);
napi_value OHImageEffectStartErrorCode(napi_env env, napi_callback_info info);
napi_value OHImageEffectStopErrorCode(napi_env env, napi_callback_info info);

napi_value ImageEffectErrorCodeErrorParamInvalid(napi_env env, napi_callback_info info);
napi_value ImageEffectErrorCodeParamError(napi_env env, napi_callback_info info);
napi_value ImageEffectErrorCodeKeyError(napi_env env, napi_callback_info info);

napi_value ImageEffectDataTypeUnknown(napi_env env, napi_callback_info info);
napi_value ImageEffectBufferTypeUnknown(napi_env env, napi_callback_info info);

napi_value OHEffectFilterSetValueErrorCode(napi_env env, napi_callback_info info);
napi_value OHEffectFilterGetValueErrorCode(napi_env env, napi_callback_info info);

napi_value OHImageEffectImageEffectRegion(napi_env env, napi_callback_info info);
napi_value OHImageEffectImageEffectSize(napi_env env, napi_callback_info info);

napi_value OHEffectFilterLookupFiltersFilterNames(napi_env env, napi_callback_info info);

#ifdef __cplusplus
}
#endif
#endif // OHIMAGEEFFECTNDK_IMAGEEFFECT_ERRORCODE_H
