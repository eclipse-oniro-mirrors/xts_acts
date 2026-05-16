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
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_47 47
#define DRAWING_NUMBER_48 48
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_250 250
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_700 700
#define DRAWING_NUMBER_565 565
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_4444 4444
#define DRAWING_NUMBER_8888 8888

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int POINT_COUNT_TWO = DRAWING_NUMBER_2;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart2TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart2TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart2Test errorCodeReset after each test case." << std::endl;
}
int TestCanvasDrawPixelMapRectNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Obtain OH_Drawing_PixelMap from OH_Drawing_PixelMapGetFromNativePixelMap()
    // 3. Create src and dst using OH_Drawing_RectCreate
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);

    // 4. Obtain OH_Drawing_PixelMap from OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    // 5. Iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct OH_Drawing_SamplingOptions for
    OH_Drawing_FilterMode filterMode[] = { FILTER_MODE_NEAREST, FILTER_MODE_LINEAR };
    OH_Drawing_MipmapMode mode[] = { MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE };
    for (int i = 0; i < TEST_FILTER_MODE_COUNT; i++) {
        for (int j = 0; j < TEST_MIPMAP_MODE_COUNT; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            // add assert
            EXPECT_NE(options, nullptr);
            OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, options);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }

    // 6. Free the memory.
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4400
 * @tc.desc   test for testCanvasDrawPixelMapRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
static void TestDrawPixelMapRectWithZeroRects(OH_Drawing_Canvas* canvas, OH_Drawing_PixelMap* drPixelMap,
    OH_Drawing_Rect* dst, OH_Drawing_SamplingOptions* sampleOptions)
{
    const int rectParamCount = DRAWING_NUMBER_5;
    float rectParams[][DRAWING_NUMBER_4] = {
        { 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1 },
        { DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1, DRAWING_NUMBER_1 },
        { DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0, DRAWING_NUMBER_1 },
        { DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, 0 },
        { 0, 0, 0, 0 },
    };
    for (int i = 0; i < rectParamCount; ++i) {
        OH_Drawing_Rect* src = OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][DRAWING_NUMBER_1],
                                                     rectParams[i][DRAWING_NUMBER_2], rectParams[i][DRAWING_NUMBER_3]);
        EXPECT_NE(src, nullptr);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_Rect* dst = OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][DRAWING_NUMBER_1],
                                                     rectParams[i][DRAWING_NUMBER_2], rectParams[i][DRAWING_NUMBER_3]);
        EXPECT_NE(dst, nullptr);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(src);
        OH_Drawing_RectDestroy(dst);
    }
}

int TestCanvasDrawPixelMapRectNull()
{
    DrawingNativeCanvasPart2TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    EXPECT_NE(sampleOptions, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(nullptr, drPixelMap, src, dst, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawPixelMapRect(canvas, nullptr, src, dst, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, nullptr, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, nullptr, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, nullptr);
    OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);

    TestDrawPixelMapRectWithZeroRects(canvas, drPixelMap, dst, sampleOptions);

    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

static void TestDrawPixelMapRectWithInvalidSrcRects(OH_Drawing_Canvas* canvas, OH_Drawing_PixelMap* drPixelMap,
    OH_Drawing_Rect* dst, OH_Drawing_SamplingOptions* sampleOptions)
{
    int srcRects[][DRAWING_NUMBER_4] = {
        { static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1),
            static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1) },
        { static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1),
            static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1) },
        { static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1),
            static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1) },
        { static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1),
          static_cast<int>(DRAWING_NUMBER_1), static_cast<int>(DRAWING_NUMBER_1) },
        { static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_100),
          static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_200) },
        { static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_200),
          static_cast<int>(DRAWING_NUMBER_200), static_cast<int>(DRAWING_NUMBER_200) },
        { static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_100),
          static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_100) },
        { static_cast<int>(DRAWING_NUMBER_200), static_cast<int>(DRAWING_NUMBER_200),
          static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_100) },
        { static_cast<int>(0), static_cast<int>(0),
          static_cast<int>(DRAWING_NUMBER_100), static_cast<int>(DRAWING_NUMBER_100) },
    };
    for (int i = 0; i < TEST_SRC_RECTS_COUNT; i++) {
        OH_Drawing_Rect* src = OH_Drawing_RectCreate(srcRects[i][0], srcRects[i][DRAWING_NUMBER_1],
                                                     srcRects[i][DRAWING_NUMBER_2], srcRects[i][DRAWING_NUMBER_3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(src);
    }
}

static void TestDrawPixelMapRectWithInvalidDstRects(OH_Drawing_Canvas* canvas, OH_Drawing_PixelMap* drPixelMap,
    OH_Drawing_Rect* src, OH_Drawing_SamplingOptions* sampleOptions)
{
    float dstRects[][DRAWING_NUMBER_4] = {
        { DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200 },
        { DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200 },
        { DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100 },
        { DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100 },
    };
    for (int i = 0; i < TEST_DST_RECTS_COUNT; i++) {
        OH_Drawing_Rect* dst = OH_Drawing_RectCreate(dstRects[i][0], dstRects[i][DRAWING_NUMBER_1],
                                                     dstRects[i][DRAWING_NUMBER_2], dstRects[i][DRAWING_NUMBER_3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(dst);
    }
}

int TestCanvasDrawPixelMapRectAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    EXPECT_NE(sampleOptions, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(nullptr, drPixelMap, src, dst, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawPixelMapRect(canvas, nullptr, src, dst, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, nullptr, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, nullptr, sampleOptions);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, nullptr);
    OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);

    TestDrawPixelMapRectWithInvalidSrcRects(canvas, drPixelMap, dst, sampleOptions);
    src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    TestDrawPixelMapRectWithInvalidDstRects(canvas, drPixelMap, src, sampleOptions);

    OH_Drawing_RectDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPixelMapRectMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(sampleOptions, nullptr);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(src1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(dst1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(dst2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPixelMapRect4KBoundary()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative4KBoundary();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(sampleOptions, nullptr);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(src1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(dst1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(dst2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPixelMapRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBackgroundNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasDrawBackground(canvas, brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBackgroundNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    // 3. Pass an empty value as the first argument for OH_Drawing_CanvasDrawBackground.
    OH_Drawing_CanvasDrawBackground(nullptr, brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass an empty value as the second argument for OH_Drawing_CanvasDrawBackground.
    OH_Drawing_CanvasDrawBackground(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBackgroundInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBackgroundMultipleCalls()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    // 3. OH_Drawing_CanvasDrawBackground, 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDrawBackground(canvas, brush);
    }
    // 4. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRegionNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 3. OH_Drawing_RegionSetRect
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);

    OH_Drawing_RegionSetRect(region, rect);
    // 4. OH_Drawing_CanvasDrawRegion
    OH_Drawing_CanvasDrawRegion(canvas, region);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRegionNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 3. OH_Drawing_CanvasDrawRegion, first parameter is nullptr
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_CanvasDrawRegion(nullptr, region);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawRegion, second parameter is nullptr
    OH_Drawing_CanvasDrawRegion(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawRegion, region is empty
    OH_Drawing_Region* regionDRAWING_NUMBER_2 = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(regionDRAWING_NUMBER_2, nullptr);
    OH_Drawing_CanvasDrawRegion(canvas, regionDRAWING_NUMBER_2);
    // 6. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(regionDRAWING_NUMBER_2);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRegionInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_Point2D creates an array of points.
    OH_Drawing_Point2D point = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D points1[DRAWING_NUMBER_1] = { point };
    // 3. OH_Drawing_CanvasDrawPoints iterates through the enum values OH_Drawing_PointMode, with count set to the
    // length of the corresponding value.
    OH_Drawing_PointMode modeArray[TEST_MIPMAP_MODE_COUNT] = { POINT_MODE_POINTS,
                                                               POINT_MODE_LINES,
                                                               POINT_MODE_POLYGON };
    for (int i = 0; i < TEST_MIPMAP_MODE_COUNT; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawPoints(canvas, modeArray[i], DRAWING_NUMBER_1, points1);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. OH_Drawing_Point2D creates an array of multiple points.
    OH_Drawing_Point2D pointOne = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointTwo = { DRAWING_NUMBER_200, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointThree = { DRAWING_NUMBER_500, DRAWING_NUMBER_700 };
    OH_Drawing_Point2D points2[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };
    // 5. OH_Drawing_CanvasDrawPoints iterates through the enum values OH_Drawing_PointMode, with count set to the
    // length of the corresponding value.
    for (int i = 0; i < TEST_MIPMAP_MODE_COUNT; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawPoints(canvas, modeArray[i], TEST_MIPMAP_MODE_COUNT, points2);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Point2D pointOne = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointTwo = { DRAWING_NUMBER_200, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointThree = { DRAWING_NUMBER_500, DRAWING_NUMBER_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };
    OH_Drawing_Point2D pointsEmpty[0] = {};
    // 2. Pass an empty value as the first argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(nullptr, POINT_MODE_LINES, TEST_MIPMAP_MODE_COUNT, points);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Set the third argument of OH_Drawing_CanvasDrawPoints to 0.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, static_cast<int>(0), points);
    // 4. Pass an empty array as the fourth argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, TEST_MIPMAP_MODE_COUNT, pointsEmpty);
    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Pass a negative value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointTwo = { DRAWING_NUMBER_200, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointThree = { DRAWING_NUMBER_500, DRAWING_NUMBER_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };

    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, -DRAWING_NUMBER_1, points);
    }
    // 3. Pass a floating-point value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points);
    // 4. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = { -DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D points1[DRAWING_NUMBER_1] = { point1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points1);
    // 5. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = { DRAWING_NUMBER_250, -DRAWING_NUMBER_500 };
    OH_Drawing_Point2D points2[DRAWING_NUMBER_1] = { point2 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points2);
    // 6. Set both the x and y coordinates of the point in OH_Drawing_Point2D parameter to negative numbers in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointDRAWING_NUMBER_3 = { -DRAWING_NUMBER_250, -DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointsDRAWING_NUMBER_3[DRAWING_NUMBER_1] = { pointDRAWING_NUMBER_3 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, pointsDRAWING_NUMBER_3);
    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsMismatch()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an array of OH_Drawing_Point2D with a length of 1 and pass 2 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D points1[DRAWING_NUMBER_1] = { pointOne };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, POINT_COUNT_TWO, points1);
    // 3. Pass an array of OH_Drawing_Point2D with a length of 3 and pass 1 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne1 = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointTwo1 = { DRAWING_NUMBER_200, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointThree1 = { DRAWING_NUMBER_500, DRAWING_NUMBER_700 };
    OH_Drawing_Point2D points2[TEST_MIPMAP_MODE_COUNT] = { pointOne1, pointTwo1, pointThree1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points2);
    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Pass an extremely large value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { DRAWING_NUMBER_250, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointTwo = { DRAWING_NUMBER_200, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D pointThree = { DRAWING_NUMBER_500, DRAWING_NUMBER_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };
    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, INT32_MAX, points);
    }
    // 3. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = { INT32_MAX, DRAWING_NUMBER_500 };
    OH_Drawing_Point2D points1[DRAWING_NUMBER_1] = { point1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points1);
    // 4. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = { DRAWING_NUMBER_250, INT32_MAX };
    OH_Drawing_Point2D points2[DRAWING_NUMBER_1] = { point2 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, DRAWING_NUMBER_1, points2);
    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointsInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_BitmapCreateFromPixels, iterate through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat to
    // construct OH_Drawing_Image_Info.
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    for (int i = 0; i < TEST_COLOR_FORMAT_COUNT; i++) {
        for (int j = 0; j < TEST_ALPHA_FORMAT_COUNT; j++) {
            OH_Drawing_ErrorCodeReset();
            int width = DRAWING_NUMBER_500;
            int height = DRAWING_NUMBER_500;
            int rowBytes = width * height * BYTES_PER_PIXEL;
            OH_Drawing_Image_Info imageInfo = { width, height, formats[i], alphaFormats[j] };
            OH_Drawing_BitmapFormat cFormat{ formats[i], alphaFormats[j] };
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
            // add assert
            EXPECT_EQ(pixels, nullptr);
            bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
            // 5. OH_Drawing_CanvasDrawBitmap
            OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    // 6. OH_Drawing_BitmapCreateFromPixels, initialize the Bitmap with rowBytes greater than the image.
    int width = DRAWING_NUMBER_500;
    int height = DRAWING_NUMBER_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = DRAWING_NUMBER_600 * DRAWING_NUMBER_600 * BYTES_PER_PIXEL;
    void* pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 7. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 8. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. The first parameter in OH_Drawing_CanvasDrawBitmap is empty.
    OH_Drawing_CanvasDrawBitmap(nullptr, bitmap, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. The second parameter in OH_Drawing_CanvasDrawBitmap is empty.
    OH_Drawing_CanvasDrawBitmap(canvas, nullptr, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 47*48.
    int width = DRAWING_NUMBER_48;
    int height = DRAWING_NUMBER_48;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = width * height * BYTES_PER_PIXEL;
    void* pixels = new int[DRAWING_NUMBER_47 * DRAWING_NUMBER_48];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 48*47.
    width = DRAWING_NUMBER_48;
    height = DRAWING_NUMBER_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = width * height * BYTES_PER_PIXEL;
    pixels = new int[DRAWING_NUMBER_48 * DRAWING_NUMBER_47];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 9. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, allocate memory for pixels as
    // 48*48, and set rowBytes as 47.
    width = DRAWING_NUMBER_48;
    height = DRAWING_NUMBER_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = DRAWING_NUMBER_47;
    pixels = new int[DRAWING_NUMBER_48 * DRAWING_NUMBER_48];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 10. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 11. The third parameter in OH_Drawing_CanvasDrawBitmap is 0.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 12. The fourth parameter in OH_Drawing_CanvasDrawBitmap is 0.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 13. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. The x-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is negative.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, -DRAWING_NUMBER_1, 0);

    // 4. The y-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is negative.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, -DRAWING_NUMBER_1);

    // 5. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. The x-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is set to a very
    // large value.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, FLT_MAX_VALUE, 0);

    // 4. The y-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is set to a very
    // large value.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, FLT_MAX_VALUE);

    // 5. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapBoundary()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 4. OH_Drawing_BitmapCreateFromPixels, iterate through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat to
    // construct OH_Drawing_Image_Info.
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    int width = DRAWING_NUMBER_4096;
    int height = DRAWING_NUMBER_2160;
    for (int i = 0; i < TEST_COLOR_FORMAT_COUNT; i++) {
        for (int j = 0; j < TEST_ALPHA_FORMAT_COUNT; j++) {
            int rowBytes = width * height * BYTES_PER_PIXEL;
            OH_Drawing_Image_Info imageInfo = { width, height, formats[i], alphaFormats[j] };
            OH_Drawing_BitmapFormat cFormat{ formats[i], alphaFormats[j] };
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
            bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // 5. OH_Drawing_CanvasDrawBitmap
            OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }

    // 6. OH_Drawing_BitmapCreateFromPixels, initialize the Bitmap with rowBytes greater than the image.
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = DRAWING_NUMBER_600 * DRAWING_NUMBER_600 * BYTES_PER_PIXEL;
    void* pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 7. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 8. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapRectNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_RectCreate src and dst
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 5. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    OH_Drawing_FilterMode filterMode[] = { FILTER_MODE_NEAREST, FILTER_MODE_LINEAR };
    OH_Drawing_MipmapMode mode[] = { MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE };
    for (int i = 0; i < TEST_FILTER_MODE_COUNT; i++) {
        for (int j = 0; j < TEST_MIPMAP_MODE_COUNT; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize Bitmap with a rowBytes larger than the image
    int width = DRAWING_NUMBER_500;
    int height = DRAWING_NUMBER_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = DRAWING_NUMBER_600 * DRAWING_NUMBER_600 * BYTES_PER_PIXEL;
    void* pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    for (int i = 0; i < TEST_FILTER_MODE_COUNT; i++) {
        for (int j = 0; j < TEST_MIPMAP_MODE_COUNT; j++) {
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 9. CanvasDrawBitmapRect with src parameter set to nullptr
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, options);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 10. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_SamplingOptionsDestroy(options);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawBitmapRectWithDifferentBitmaps(OH_Drawing_Canvas* canvas, OH_Drawing_Bitmap** bitmap,
    OH_Drawing_Rect* src, OH_Drawing_Rect* dst, OH_Drawing_SamplingOptions* options)
{
    int width = DRAWING_NUMBER_48;
    int height = DRAWING_NUMBER_48;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = width * height * BYTES_PER_PIXEL;
    void* pixels = new int[DRAWING_NUMBER_47 * DRAWING_NUMBER_48];
    OH_Drawing_BitmapDestroy(*bitmap);
    *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    OH_Drawing_CanvasDrawBitmapRect(canvas, *bitmap, src, dst, options);

    width = DRAWING_NUMBER_48;
    height = DRAWING_NUMBER_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = width * height * BYTES_PER_PIXEL;
    pixels = new int[DRAWING_NUMBER_48 * DRAWING_NUMBER_47];
    OH_Drawing_BitmapDestroy(*bitmap);
    *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    OH_Drawing_CanvasDrawBitmapRect(canvas, *bitmap, src, dst, options);

    width = DRAWING_NUMBER_48;
    height = DRAWING_NUMBER_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = DRAWING_NUMBER_47;
    pixels = new int[DRAWING_NUMBER_48 * DRAWING_NUMBER_48];
    OH_Drawing_BitmapDestroy(*bitmap);
    *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    OH_Drawing_CanvasDrawBitmapRect(canvas, *bitmap, src, dst, options);
}

int TestCanvasDrawBitmapRectNull()
{
    DrawingNativeCanvasPart2TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);

    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(nullptr, bitmap, src, dst, options);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    OH_Drawing_CanvasDrawBitmapRect(canvas, nullptr, src, dst, options);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    TestDrawBitmapRectWithDifferentBitmaps(canvas, &bitmap, src, dst, options);

    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, nullptr);

    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawBitmapRectWithInvalidSrcCoordinates(OH_Drawing_Canvas* canvas, OH_Drawing_Bitmap* bitmap,
    OH_Drawing_Rect* dst, OH_Drawing_SamplingOptions* options)
{
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    src = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                              DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    OH_Drawing_RectDestroy(src);
}

static void TestDrawBitmapRectWithInvalidDstCoordinates(OH_Drawing_Canvas* canvas, OH_Drawing_Bitmap* bitmap,
    OH_Drawing_Rect* src, OH_Drawing_SamplingOptions* options)
{
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    dst = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                              DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    dst = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100,
                              DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    dst = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                              DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    OH_Drawing_RectDestroy(dst);
}

int TestCanvasDrawBitmapRectAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);

    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET,
                              TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET,
                              TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    TestDrawBitmapRectWithInvalidSrcCoordinates(canvas, bitmap, dst, options);
    TestDrawBitmapRectWithInvalidDstCoordinates(canvas, bitmap, src, options);

    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);
    DrawingNativeCanvasPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapRectMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate, OH_Drawing_SamplingOptionsCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    // 3. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with maximum values for the top-left
    // coordinate
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 4. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with maximum values for the top-right
    // coordinate
    src = OH_Drawing_RectCreate(0, 0, FLT_MAX_VALUE, FLT_MAX_VALUE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 5. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-left
    // coordinate
    dst = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 6. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-right
    // coordinate
    dst = OH_Drawing_RectCreate(0, 0, FLT_MAX_VALUE, FLT_MAX_VALUE);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawBitmapRectBoundary()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_RectCreate src and dst
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 5. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    OH_Drawing_FilterMode filterMode[] = { FILTER_MODE_NEAREST, FILTER_MODE_LINEAR };
    OH_Drawing_MipmapMode mode[] = { MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE };
    for (int i = 0; i < TEST_FILTER_MODE_COUNT; i++) {
        for (int j = 0; j < TEST_MIPMAP_MODE_COUNT; j++) {
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize Bitmap with a rowBytes larger than the image
    int width = DRAWING_NUMBER_4096;
    int height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = DRAWING_NUMBER_600 * DRAWING_NUMBER_600 * BYTES_PER_PIXEL;
    void* pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    for (int i = 0; i < TEST_FILTER_MODE_COUNT; i++) {
        for (int j = 0; j < TEST_MIPMAP_MODE_COUNT; j++) {
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 9. CanvasDrawBitmapRect with src parameter set to nullptr
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, options);
    // 10. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_SamplingOptionsDestroy(options);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRectNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRectNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawRect with the first parameter being null
    OH_Drawing_CanvasDrawRect(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawRect with the second parameter being null
    OH_Drawing_CanvasDrawRect(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawRect with the second parameter OH_Drawing_Rect created with left, top, right, bottom
    // respectively set to 0
    rect =
        OH_Drawing_RectCreate(0, DRAWING_NUMBER_200,
                              DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, 0,
                              DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                              0, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200,
                              DRAWING_NUMBER_200, 0);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 6. OH_Drawing_CanvasDrawRect with the second parameter OH_Drawing_Rect created with all values set to 0
    rect =
        OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRectAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom being negative numbers
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, DRAWING_NUMBER_100, TEST_CIRCLE_RADIUS, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, TEST_NEGATIVE_OFFSET, TEST_CIRCLE_RADIUS, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, TEST_NEGATIVE_OFFSET, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, TEST_CIRCLE_RADIUS, TEST_NEGATIVE_OFFSET);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 4. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 5. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate greater than the
    // bottom-right coordinate
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRectMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom set to maximum values
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(FLT_MAX_VALUE, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, FLT_MAX_VALUE, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, FLT_MAX_VALUE, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawCircleNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate
    OH_Drawing_Point* center = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawCircleNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate
    OH_Drawing_Point* center = OH_Drawing_PointCreate(TEST_POINT_X, TEST_POINT_Y);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle with the first parameter being null
    OH_Drawing_CanvasDrawCircle(nullptr, center, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawCircle with the second parameter being null
    OH_Drawing_CanvasDrawCircle(canvas, nullptr, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawCircle with the third parameter being 0
    OH_Drawing_CanvasDrawCircle(canvas, center, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawCircleAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter being negative
    OH_Drawing_Point* center = OH_Drawing_PointCreate(TEST_NEGATIVE_OFFSET, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 4. OH_Drawing_PointCreate with y parameter being negative
    center = OH_Drawing_PointCreate(DRAWING_NUMBER_100, TEST_NEGATIVE_OFFSET);
    // add assert
    EXPECT_NE(center, nullptr);
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 5. OH_Drawing_CanvasDrawCircle with radius parameter being negative
    OH_Drawing_CanvasDrawCircle(canvas, center, -TEST_CIRCLE_RADIUS);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawCircleMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter set to the maximum value
    OH_Drawing_Point* center = OH_Drawing_PointCreate(FLT_MAX_VALUE, DRAWING_NUMBER_100);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 4. OH_Drawing_PointCreate with y parameter set to the maximum value
    center = OH_Drawing_PointCreate(DRAWING_NUMBER_100, FLT_MAX_VALUE);
    EXPECT_NE(center, nullptr);
    // 5. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 6. OH_Drawing_CanvasDrawCircle with radius parameter set to the maximum value
    OH_Drawing_CanvasDrawCircle(canvas, center, FLT_MAX_VALUE);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawCircleInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPixelMapRect4ByteAlignment()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative_4ByteAlignment();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(0, 0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
