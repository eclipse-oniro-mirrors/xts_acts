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

#ifndef OHIMAGEEFFECTNDK_EFFECT_FILTER_TEST_H
#define OHIMAGEEFFECTNDK_EFFECT_FILTER_TEST_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif

napi_value OHEffectBufferInfoCreate(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetAddr(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetAddr(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetEffectFormat(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetEffectFormat(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetHeight(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetHeight(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetRowSize(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetRowSize(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetWidth(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetWidth(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetTimestamp(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetTimestamp(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoRelease(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoCreate(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetFilterName(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetFilterName(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedBufferTypes(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedBufferTypes(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedFormats(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedFormats(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoRelease(napi_env env, napi_callback_info info);
napi_value OHEffectFilterCreate(napi_env env, napi_callback_info info);
napi_value OHEffectFilterSetValue(napi_env env, napi_callback_info info);
napi_value OHEffectFilterGetValue(napi_env env, napi_callback_info info);
napi_value OHEffectFilterLookupFilterInfo(napi_env env, napi_callback_info info);
napi_value OHEffectFilterLookupFilters(napi_env env, napi_callback_info info);
napi_value OHEffectFilterRegister(napi_env env, napi_callback_info info);
napi_value OHEffectFilterRelease(napi_env env, napi_callback_info info);
napi_value OHEffectFilterReleaseFilterNames(napi_env env, napi_callback_info info);

#ifdef __cplusplus
}
#endif
#endif // OHIMAGEEFFECTNDK_EFFECT_FILTER_TEST_H
