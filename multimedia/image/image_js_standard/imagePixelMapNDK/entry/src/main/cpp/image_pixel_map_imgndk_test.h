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

#ifndef RESOURCE_MANAGER_ADDON_H
#define RESOURCE_MANAGER_ADDON_H

#include <memory>
#include <string>

#include "napi/native_api.h"
#include "multimedia/image_framework/image_pixel_map_mdk.h"
#include "multimedia/image_framework/image_pixel_map_napi.h"

class ImagePixelMapNDKTest {
public:
    static napi_value Init(napi_env env, napi_value exports);
    static napi_value CreatePixelMap(napi_env env, napi_callback_info info);
    static napi_value CreateAlphaPixelMap(napi_env env, napi_callback_info info);
    static napi_value InitNativePixelMap(napi_env env, napi_callback_info info);
    static napi_value GetBytesNumberPerRow(napi_env env, napi_callback_info info);
    static napi_value GetIsEditable(napi_env env, napi_callback_info info);
    static napi_value IsSupportAlpha(napi_env env, napi_callback_info info);
    static napi_value SetAlphaAble(napi_env env, napi_callback_info info);
    static napi_value GetDensity(napi_env env, napi_callback_info info);
    static napi_value SetDensity(napi_env env, napi_callback_info info);
    static napi_value SetOpacity(napi_env env, napi_callback_info info);
    static napi_value Scale(napi_env env, napi_callback_info info);
    static napi_value Translate(napi_env env, napi_callback_info info);
    static napi_value Rotate(napi_env env, napi_callback_info info);
    static napi_value Flip(napi_env env, napi_callback_info info);
    static napi_value Crop(napi_env env, napi_callback_info info);
    static napi_value GetImageInfo(napi_env env, napi_callback_info info);
    static napi_value AccessPixels(napi_env env, napi_callback_info info);
    static napi_value UnAccessPixels(napi_env env, napi_callback_info info);
private:
};
#endif