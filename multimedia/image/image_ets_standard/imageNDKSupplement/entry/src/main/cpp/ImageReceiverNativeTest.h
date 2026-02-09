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
#ifndef IMAGENDKSUPPLEMENT_IMAGERECEIVERNATIVE_H
#define IMAGENDKSUPPLEMENT_IMAGERECEIVERNATIVE_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value ImageReceiverNativeReadLatestImageTest(napi_env env, napi_callback_info info);
napi_value InitImageReceiverNativeTest(napi_env env, napi_callback_info info);
napi_value OHImageClipRectTest(napi_env env, napi_callback_info info);
napi_value CreatePixelmapUsingAllocatorTest(napi_env env, napi_callback_info info);
napi_value PixelmapNativeSetMemoryNameTest(napi_env env, napi_callback_info info);
napi_value ImageSourceNativeCreatePictureTest(napi_env env, napi_callback_info info);
napi_value ImageSourceNativeCreatePictureAtIndexTest(napi_env env, napi_callback_info info);
napi_value DecodingOptionsGetDesiredColorSpaceTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
