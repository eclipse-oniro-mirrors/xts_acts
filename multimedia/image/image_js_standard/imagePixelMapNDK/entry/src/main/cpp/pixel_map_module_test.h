/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef PIXEL_MAP_MODULE_TEST_H
#define PIXEL_MAP_MODULE_TEST_H

#include <memory>
#include <string>
#include <vector>
#include "napi/native_api.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/image_framework/image/pixelmap_native.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/image_framework/image/image_common.h"

class ImagePixelMapNative {
public:
    ImagePixelMapNative();
    ~ImagePixelMapNative();

    int32_t GetPixelmap(int32_t fd, int32_t pixelformat, OH_PixelmapNative **pixelmap);
    int32_t ConvertPixelmapToNapi(napi_env env, OH_PixelmapNative *pixelmap, napi_value *res);
    int32_t ConvertPixelmapFromNapi(napi_env env, napi_value source, OH_PixelmapNative **pixelmap);
    int32_t GetPixelmapPixelWidth(napi_env env, OH_PixelmapNative *PixelWidth, napi_value *Width);
    int32_t GetPixelmapPixelHeight(napi_env env, OH_PixelmapNative *PixelHeight, napi_value *Height);
    int32_t GetPixelmapPixelFormat(napi_env env, OH_PixelmapNative *PixelHeight, napi_value *pixelFormat);
    void ReleasePixelmapNative(OH_PixelmapNative *pixelmap);

private:
};
#endif // PIXEL_MAP_MODULE_TEST_H