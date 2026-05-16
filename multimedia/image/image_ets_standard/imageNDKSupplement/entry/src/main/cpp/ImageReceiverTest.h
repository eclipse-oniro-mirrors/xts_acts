/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#ifndef IMAGENDKSUPPLEMENT_IMAGERECEIVERNATIVE_HH
#define IMAGENDKSUPPLEMENT_IMAGERECEIVERNATIVE_HH
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OhInitReceiverOptions(napi_env env, napi_callback_info info);
napi_value OhInitReceiverOptionsGetCapacity(napi_env env, napi_callback_info info);
napi_value OhImageReceiverNativeGetSize(napi_env env, napi_callback_info info);
napi_value ImageReceiverNativeSuppTest(napi_env env, napi_callback_info info);
napi_value ImageReceiverNativeGetCapacitySuppTest(napi_env env, napi_callback_info info);
napi_value ComposeOptionsReleaseSuppTest(napi_env env, napi_callback_info info);
napi_value OHImageNativeGetComponentTypesSupp(napi_env env, napi_callback_info info);
napi_value OHPackingOptionsForSequenceGetFrameCountSupp(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
