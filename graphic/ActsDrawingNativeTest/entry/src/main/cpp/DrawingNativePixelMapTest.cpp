/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativePixelMapTest.h"
#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_10 10


#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_2160 2160

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativePixelMapTestSetUp()
{
    std::cout << "DrawingNativePixelMapTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePixelMapTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePixelMapTestTearDown()
{
    std::cout << "DrawingNativePixelMapTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePixelMapTest errorCodeReset after each test case." << std::endl;
}

int TestPixelMapGetFromNativePixelMapNormal()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromNativePixelMapNull()
{
    DrawingNativePixelMapTestSetUp();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromNativePixelMapMultipleCalls()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
        EXPECT_EQ(drPixelMap, nullptr);
    }
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromNativePixelMapBoundary()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_ *pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromOhPixelMapNativeNormal()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromOhPixelMapNativeNull()
{
    DrawingNativePixelMapTestSetUp();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative with nullptr as parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromOhPixelMapNativeMultipleCalls()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
        // add assert
        EXPECT_NE(drPixelMap, nullptr);
        OH_Drawing_PixelMapDissolve(drPixelMap);
    }
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapGetFromOhPixelMapNativeBoundary()
{
    DrawingNativePixelMapTestSetUp();
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative(width, height);
    // add assert
    EXPECT_EQ(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_EQ(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    EXPECT_EQ(pixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapDissolveNormal()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    // add assert
    EXPECT_NE(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Call OH_Drawing_PixelMapDissolve
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPixelMapDissolveNull()
{
    DrawingNativePixelMapTestSetUp();
    // 1. OH_Drawing_PixelMapDissolve parameter is null
    OH_Drawing_PixelMap *pixelMap = nullptr;
    OH_Drawing_PixelMapDissolve(nullptr);
    EXPECT_EQ(pixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS