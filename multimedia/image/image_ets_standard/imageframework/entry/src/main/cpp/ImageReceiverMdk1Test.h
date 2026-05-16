/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#ifndef IMAGE_RECEIVER_MDK_ERRORCODE_TEST_H
#define IMAGE_RECEIVER_MDK_ERRORCODE_TEST_H

#include <memory>
#include <string>

#include "napi/native_api.h"
#include "multimedia/image_framework/image_receiver_mdk.h"
#include "multimedia/image_framework/image_pixel_map_mdk.h"

napi_value JsCreateImageReceiverMdk(napi_env env, napi_callback_info info);
napi_value JsReadLatestImage(napi_env env, napi_callback_info info);
napi_value JsOn(napi_env env, napi_callback_info info);
    
napi_value JsImageFormat(napi_env env, napi_callback_info info);
napi_value JsImageFormatBadParameter(napi_env env, napi_callback_info info);
napi_value JsImageFormatJniEnvAbnormal(napi_env env, napi_callback_info info);
napi_value JsReceiverRelease(napi_env env, napi_callback_info info);

napi_value JsImageFormatYcbcr422Sp(napi_env env, napi_callback_info info);
napi_value JsImageFormatJPEG(napi_env env, napi_callback_info info);

napi_value JsImageComponentFormatYUVY(napi_env env, napi_callback_info info);
napi_value JsImageComponentFormatYUVU(napi_env env, napi_callback_info info);
napi_value JsImageComponentFormatYUVV(napi_env env, napi_callback_info info);
napi_value JsImageComponentFormatJPEG(napi_env env, napi_callback_info info);

napi_value JsImageGetComponent(napi_env env, napi_callback_info info);
napi_value JsImageGetComponentBadParameter(napi_env env, napi_callback_info info);
napi_value JsImageGetComponentJniEnvAbnormal(napi_env env, napi_callback_info info);
napi_value JsImageClipRect(napi_env env, napi_callback_info info);
napi_value JsImageClipBadParameter(napi_env env, napi_callback_info info);
napi_value JsImageSize(napi_env env, napi_callback_info info);
napi_value JsImageSizeJniEnvAbnormal(napi_env env, napi_callback_info info);
napi_value JsImageRelease(napi_env env, napi_callback_info info);

#endif // IMAGE_RECEIVER_MDK_ERRORCODE_TEST_H