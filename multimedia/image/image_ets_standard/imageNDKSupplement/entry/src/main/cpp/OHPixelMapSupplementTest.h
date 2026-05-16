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
#ifndef IMAGENDKSUPPLEMENT__1__OHPIXELMAPSUPPLEMENTTEST_H
#define IMAGENDKSUPPLEMENT__1__OHPIXELMAPSUPPLEMENTTEST_H

#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHPixelMapTranslateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelMapRotateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeSetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeGetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetAddrSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetAddrSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeUnaccessPixelsSuppTest(napi_env env, napi_callback_info info);
napi_value CreateImageReceiverSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeAccessPixelsSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeCreateAlphaPixelmapSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeGetUniqueIdSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeIsReleasedSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeReadPixelsFromAreaSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeWritePixelsToAreaSuppTest(napi_env env, napi_callback_info info);


#ifdef __cplusplus
}
#endif
#endif