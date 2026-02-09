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
 
#ifndef IMAGENDKSUPPLEMENT__1__OHEFFECTFILTERINFOSUPPLEMENTTEST_H
#define IMAGENDKSUPPLEMENT__1__OHEFFECTFILTERINFOSUPPLEMENTTEST_H

#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHEffectFilterInfoSetFilterNameSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetFilterNameSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedBufferTypesSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedBufferTypesSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedFormatsSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedFormatsSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoReleaseSupplementTest(napi_env env, napi_callback_info info);

#ifdef __cplusplus
}
#endif
#endif