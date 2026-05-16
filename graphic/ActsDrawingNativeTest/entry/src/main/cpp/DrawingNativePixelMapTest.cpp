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

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int COUNT_10 = 10;
constexpr int TEST_ARRAY_INDEX_0 = 0;
constexpr uint32_t TEST_PIXELMAP_WIDTH_4K = 4096;
constexpr uint32_t TEST_PIXELMAP_HEIGHT_4K = 2160;
} // namespace

// Common SetUp and TearDown functions implementation
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

/**
 * @tc.name   testPixelMapGetFromNativePixelMapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0100
 * @tc.desc   test for testPixelMapGetFromNativePixelMapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPixelMapGetFromNativePixelMapNormal()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_* pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_01000
 * @tc.desc   test for testPixelMapGetFromNativePixelMapNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPixelMapGetFromNativePixelMapNull()
{
    DrawingNativePixelMapTestSetUp();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0200
 * @tc.desc   test for testPixelMapGetFromNativePixelMapMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPixelMapGetFromNativePixelMapMultipleCalls()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_* pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap 10 times
    for (int i = TEST_ARRAY_INDEX_0; i < COUNT_10; i++) {
        OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
        EXPECT_EQ(drPixelMap, nullptr);
    }
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromNativePixelMapBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0300
 * @tc.desc   test for testPixelMapGetFromNativePixelMapBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPixelMapGetFromNativePixelMapBoundary()
{
    DrawingNativePixelMapTestSetUp();
    // todo: how to get NativePixelMap_?
    NativePixelMap_* pixelMap = nullptr;
    // 1. Call OH_Drawing_PixelMapGetFromNativePixelMap
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(pixelMap);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0400
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPixelMapGetFromOhPixelMapNativeNormal()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0500
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPixelMapGetFromOhPixelMapNativeNull()
{
    DrawingNativePixelMapTestSetUp();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative with nullptr as parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(nullptr);
    EXPECT_EQ(drPixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0600
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPixelMapGetFromOhPixelMapNativeMultipleCalls()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative 10 times
    for (int i = TEST_ARRAY_INDEX_0; i < COUNT_10; i++) {
        OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
        // add assert
        EXPECT_NE(drPixelMap, nullptr);
        OH_Drawing_PixelMapDissolve(drPixelMap);
    }
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapGetFromOhPixelMapNativeBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0700
 * @tc.desc   test for testPixelMapGetFromOhPixelMapNativeBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPixelMapGetFromOhPixelMapNativeBoundary()
{
    DrawingNativePixelMapTestSetUp();
    uint32_t width = TEST_PIXELMAP_WIDTH_4K;
    uint32_t height = TEST_PIXELMAP_HEIGHT_4K;
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative(width, height);
    // add assert
    EXPECT_EQ(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_EQ(drPixelMap, nullptr);
    // 2. Release memory
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    EXPECT_EQ(pixelMap, nullptr);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapDissolveNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0800
 * @tc.desc   test for testPixelMapDissolveNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPixelMapDissolveNormal()
{
    DrawingNativePixelMapTestSetUp();
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    // add assert
    EXPECT_NE(pixelMap, nullptr);
    // 1. Call OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    // add assert
    EXPECT_NE(drPixelMap, nullptr);
    // 2. Call OH_Drawing_PixelMapDissolve
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_PixelmapNative_Release(pixelMap);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPixelMapDissolveNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PIXEL_MAP_0900
 * @tc.desc   test for testPixelMapDissolveNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPixelMapDissolveNull()
{
    DrawingNativePixelMapTestSetUp();
    // 1. OH_Drawing_PixelMapDissolve parameter is null
    OH_Drawing_PixelMapDissolve(nullptr);
    // add assert
    EXPECT_TRUE(true);
    DrawingNativePixelMapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS