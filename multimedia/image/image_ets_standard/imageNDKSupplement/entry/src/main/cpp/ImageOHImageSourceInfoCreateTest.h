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
#ifndef IMAGENDKSUPPLEMENT_IMAGEOHIMAGESOURCEINFOCREATETEST_H
#define IMAGENDKSUPPLEMENT_IMAGEOHIMAGESOURCEINFOCREATETEST_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif
napi_value OHImageSourceInfoCreateTest(napi_env env, napi_callback_info info);
napi_value OHImageNativeGetFormatTest(napi_env env, napi_callback_info info);
napi_value OHImageNativeGetBufferDataTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeWritePixelsTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeReadPixelsTest(napi_env env, napi_callback_info info);
napi_value OHImageNativeGetBufferDataValueTest(napi_env env, napi_callback_info info);
napi_value OHImageNativeGetColorSpaceTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
