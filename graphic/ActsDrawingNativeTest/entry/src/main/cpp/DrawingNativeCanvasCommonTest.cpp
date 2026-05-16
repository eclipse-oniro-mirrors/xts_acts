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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "log_common.h"
#include <vector>

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_16 16
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_255 255
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096

using namespace std;

OH_PixelmapNative *GET_OH_PixelmapNative()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = DRAWING_NUMBER_4;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = DRAWING_NUMBER_4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = DRAWING_NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = DRAWING_NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255};
    // 16 means data length
    size_t dataLength = DRAWING_NUMBER_16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative(uint32_t width, uint32_t height)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = DRAWING_NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = DRAWING_NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255};
    // 16 means data length
    size_t dataLength = DRAWING_NUMBER_16;
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
    uint32_t width = DRAWING_NUMBER_4096;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 2160 means height
    uint32_t height = DRAWING_NUMBER_2160;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 3 means RGBA format
    int32_t pixelFormat = DRAWING_NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = DRAWING_NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255/0 means rgba data
    size_t dataLength = width * height * DRAWING_NUMBER_4;
    vector<uint8_t> data(dataLength);
    uint8_t rgbaValue[] = {DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255};

    for (size_t i = 0; i < dataLength; i += DRAWING_NUMBER_4) {
        size_t offset = i;
        data[offset] = rgbaValue[0];     // R
            data[offset + DRAWING_NUMBER_1] = rgbaValue[DRAWING_NUMBER_1];
            data[offset + DRAWING_NUMBER_2] = rgbaValue[DRAWING_NUMBER_2];
            data[offset + DRAWING_NUMBER_3] = rgbaValue[DRAWING_NUMBER_3];
    }
    // 4096 * 2160 means data length
    OH_PixelmapNative_CreatePixelmap(data.data(), dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative_4ByteAlignment()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = DRAWING_NUMBER_5;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = DRAWING_NUMBER_4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = DRAWING_NUMBER_6;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = DRAWING_NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255, DRAWING_NUMBER_255, 0, DRAWING_NUMBER_255};
    // 16 means data length
    size_t dataLength = DRAWING_NUMBER_20;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}
