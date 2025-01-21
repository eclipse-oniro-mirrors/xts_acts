/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gtest/gtest.h"
#include "image/pixelmap_native.h"

OH_PixelmapNative *GET_OH_PixelmapNative()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = 4;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = 4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = 3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = 2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}
