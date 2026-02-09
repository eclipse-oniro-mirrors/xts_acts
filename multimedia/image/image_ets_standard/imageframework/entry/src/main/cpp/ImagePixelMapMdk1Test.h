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

#ifndef IMAGE_PIXEL_MAP_MDK_ERRORCODE_TEST_H
#define IMAGE_PIXEL_MAP_MDK_ERRORCODE_TEST_H

#include <memory>
#include <string>

#include "multimedia/image_framework/image_pixel_map_mdk.h"
#include "multimedia/image_framework/image_receiver_mdk.h"
#include "napi/native_api.h"

napi_value CreatePixelMapSuccess(napi_env env, napi_callback_info info);
napi_value CreatePixelMapThirdpartSkiaError(napi_env env, napi_callback_info info);
napi_value PixelMapCreatePixelMapResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapGetBytesNumberPerRowResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapGetIsEditableResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapIsSupportAlphaResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapSetAlphaAbleResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapGetDensityResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapSetOpacityResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapScaleResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapScaleWithAntiAliasingResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapTranslateResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapRotateResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapFlipResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapCropResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapGetImageInfoResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapAccessPixelsResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapUnAccessPixelsResultSuccess(napi_env env, napi_callback_info info);
napi_value PixelMapSetDensityResultSuccess(napi_env env, napi_callback_info info);
#endif // IMAGE_PIXEL_MAP_MDK_ERRORCODE_TEST_H