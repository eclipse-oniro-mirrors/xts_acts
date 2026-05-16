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
#include <vector>

using namespace std;
using namespace OHOS::Rosen::Drawing;

OH_PixelmapNative* GET_OH_PixelmapNative()
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapNative* pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    uint32_t width = TEST_PIXELMAP_SIZE_SMALL;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    uint32_t height = TEST_PIXELMAP_SIZE_SMALL;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    int32_t pixelFormat = TEST_PIXELMAP_FORMAT_RGBA;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    int32_t alphaType = TEST_PIXELMAP_ALPHA_PREMUL;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    uint8_t data[] = { TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE };
    size_t dataLength = TEST_PIXELMAP_DATA_LENGTH_16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative* GET_OH_PixelmapNative(uint32_t width, uint32_t height)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapNative* pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    int32_t pixelFormat = TEST_PIXELMAP_FORMAT_RGBA;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    int32_t alphaType = TEST_PIXELMAP_ALPHA_PREMUL;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    uint8_t data[] = { TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE };
    size_t dataLength = TEST_PIXELMAP_DATA_LENGTH_16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative* GET_OH_PixelmapNative4KBoundary()
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapNative* pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    uint32_t width = static_cast<uint32_t>(TEST_PIXELMAP_4K_WIDTH);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    uint32_t height = static_cast<uint32_t>(TEST_PIXELMAP_4K_HEIGHT);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    int32_t pixelFormat = TEST_PIXELMAP_FORMAT_RGBA;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    int32_t alphaType = TEST_PIXELMAP_ALPHA_PREMUL;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);

    const size_t pixelCount = width * height;
    const size_t totalBytes = pixelCount * TEST_PIXELMAP_REPEAT_DIVISOR;
    std::vector<uint8_t> data(totalBytes, 0);

    const uint8_t rgbaValue[] = { TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE };
    for (size_t i = 0; i < pixelCount; ++i) {
        size_t offset = i * TEST_OFFSET_NUMER_4;
        data[offset] = rgbaValue[0];                                         // R
        data[offset + TEST_OFFSET_NUMER_1] = rgbaValue[TEST_OFFSET_NUMER_1]; // G
        data[offset + TEST_OFFSET_NUMER_2] = rgbaValue[TEST_OFFSET_NUMER_2]; // B
        data[offset + TEST_OFFSET_NUMER_3] = rgbaValue[TEST_OFFSET_NUMER_3]; // A
    }
    uint8_t* valueData = data.data();
    OH_PixelmapNative_CreatePixelmap(valueData, totalBytes, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative* GET_OH_PixelmapNative_4ByteAlignment()
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapNative* pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    uint32_t width = TEST_PIXELMAP_WIDTH_5;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    uint32_t height = TEST_PIXELMAP_HEIGHT_4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    int32_t pixelFormat = TEST_PIXELMAP_FORMAT_6;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    int32_t alphaType = TEST_PIXELMAP_ALPHA_PREMUL;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    uint8_t data[] = { TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE,
                       TEST_PIXELMAP_COLOR_VALUE, TEST_PIXELMAP_COLOR_VALUE, 0, TEST_PIXELMAP_COLOR_VALUE };
    size_t dataLength = TEST_PIXELMAP_DATA_LENGTH_20;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}
