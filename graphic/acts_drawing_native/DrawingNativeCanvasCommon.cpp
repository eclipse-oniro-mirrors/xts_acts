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

#include <vector>
#include "gtest/gtest.h"
#include "image/pixelmap_native.h"

using namespace std;

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

OH_PixelmapNative *GET_OH_PixelmapNative(
    uint32_t width, uint32_t height)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
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

OH_PixelmapNative *GET_OH_PixelmapNative4KBoundary()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4096 means width
    uint32_t width = 4096;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 2160 means height
    uint32_t height = 2160;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 3 means RGBA format
    int32_t pixelFormat = 3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = 2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255/0 means rgba data
    vector<uint8_t> data;
    uint8_t value[] = {255, 255, 0, 255};
    size_t repeatTimes = 4096 * 2160 / 4;
    uint8_t *valueData = nullptr;

    for (size_t i = 0; i < repeatTimes; ++i) {
        data.insert(data.end(), begin(value), end(value));
        valueData = data.data();
    }

    // 4096 * 2160 means data length
    size_t dataLength = 4096 * 2160;
    OH_PixelmapNative_CreatePixelmap(valueData, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative_4ByteAlignment()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = 5;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = 4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = 6;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = 2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 20;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}
