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

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int POINT_COUNT_TWO = 2;

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
/**
 * @tc.name   testCanvasDrawPixelMapRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4300
 * @tc.desc   test for testCanvasDrawPixelMapRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPixelMapRectNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Obtain OH_Drawing_PixelMap from OH_Drawing_PixelMapGetFromNativePixelMap()
    // 3. Create src and dst using OH_Drawing_RectCreate
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
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
    const int rectParamCount = 5;
    float rectParams[][4] = {
        { TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1 },
        { TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1 },
        { TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1 },
        { TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_0 },
        { TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 },
    };
    for (int i = 0; i < rectParamCount; ++i) {
        OH_Drawing_Rect* src =
            OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][1], rectParams[i][2], rectParams[i][3]);
        EXPECT_NE(src, nullptr);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_Rect* dst =
            OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][1], rectParams[i][2], rectParams[i][3]);
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
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
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
    int srcRects[][4] = {
        { static_cast<int>(TEST_MATRIX_VALUE_NEG_1), static_cast<int>(TEST_MATRIX_VALUE_1),
            static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_1) },
        { static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_NEG_1),
            static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_1) },
        { static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_1),
            static_cast<int>(TEST_MATRIX_VALUE_NEG_1), static_cast<int>(TEST_MATRIX_VALUE_1) },
        { static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_1),
          static_cast<int>(TEST_MATRIX_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_NEG_1) },
        { static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100),
          static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_200) },
        { static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_200),
          static_cast<int>(TEST_CANVAS_COORD_200), static_cast<int>(TEST_CANVAS_COORD_200) },
        { static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100),
          static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100) },
        { static_cast<int>(TEST_CANVAS_COORD_200), static_cast<int>(TEST_CANVAS_COORD_200),
          static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100) },
        { static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
          static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100) },
    };
    for (int i = 0; i < TEST_SRC_RECTS_COUNT; i++) {
        OH_Drawing_Rect* src = OH_Drawing_RectCreate(srcRects[i][0], srcRects[i][1], srcRects[i][2], srcRects[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(src);
    }
}

static void TestDrawPixelMapRectWithInvalidDstRects(OH_Drawing_Canvas* canvas, OH_Drawing_PixelMap* drPixelMap,
    OH_Drawing_Rect* src, OH_Drawing_SamplingOptions* sampleOptions)
{
    float dstRects[][4] = {
        { TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE_200 },
        { TEST_RECT_SIZE, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200 },
        { TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE },
        { TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE, TEST_RECT_SIZE },
    };
    for (int i = 0; i < TEST_DST_RECTS_COUNT; i++) {
        OH_Drawing_Rect* dst = OH_Drawing_RectCreate(dstRects[i][0], dstRects[i][1], dstRects[i][2], dstRects[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(dst);
    }
}

/**
 * @tc.name   testCanvasDrawPixelMapRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4500
 * @tc.desc   test for testCanvasDrawPixelMapRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
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
    src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    TestDrawPixelMapRectWithInvalidDstRects(canvas, drPixelMap, src, sampleOptions);
    
    OH_Drawing_RectDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4600
 * @tc.desc   test for testCanvasDrawPixelMapRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(sampleOptions, nullptr);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(src1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(dst1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
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

/**
 * @tc.name   testCanvasDrawPixelMapRect4KBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4700
 * @tc.desc   test for testCanvasDrawPixelMapRect4KBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRect4KBoundary()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative4KBoundary();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(sampleOptions, nullptr);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(src1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(dst1, nullptr);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
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

/**
 * @tc.name   testCanvasDrawPixelMapRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4800
 * @tc.desc   test for testCanvasDrawPixelMapRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBackgroundNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4900
 * @tc.desc   test for testCanvasDrawBackgroundNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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

/**
 * @tc.name   testCanvasDrawBackgroundNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5000
 * @tc.desc   test for testCanvasDrawBackgroundNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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

/**
 * @tc.name   testCanvasDrawBackgroundInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5100
 * @tc.desc   test for testCanvasDrawBackgroundInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawBackgroundInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBackgroundMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5200
 * @tc.desc   test for testCanvasDrawBackgroundMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasDrawBackground(canvas, brush);
    }
    // 4. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRegionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5300
 * @tc.desc   test for testCanvasDrawRegionNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE_256, TEST_RECT_SIZE_256);
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

/**
 * @tc.name   testCanvasDrawRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5400
 * @tc.desc   test for testCanvasDrawRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE_256, TEST_RECT_SIZE_256);
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
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region2, nullptr);
    OH_Drawing_CanvasDrawRegion(canvas, region2);
    // 6. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(region2);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRegionInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5500
 * @tc.desc   test for testCanvasDrawRegionInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRegionInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5600
 * @tc.desc   test for testCanvasDrawPointsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPointsNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_Point2D creates an array of points.
    OH_Drawing_Point2D point = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D points1[1] = { point };
    // 3. OH_Drawing_CanvasDrawPoints iterates through the enum values OH_Drawing_PointMode, with count set to the
    // length of the corresponding value.
    OH_Drawing_PointMode modeArray[TEST_MIPMAP_MODE_COUNT] = { POINT_MODE_POINTS,
                                                               POINT_MODE_LINES,
                                                               POINT_MODE_POLYGON };
    for (int i = 0; i < TEST_MIPMAP_MODE_COUNT; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawPoints(canvas, modeArray[i], 1, points1);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. OH_Drawing_Point2D creates an array of multiple points.
    OH_Drawing_Point2D pointOne = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointTwo = { TEST_RECT_SIZE_200, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointThree = { TEST_RECT_SIZE_500, TEST_POINT_Y_700 };
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

/**
 * @tc.name   testCanvasDrawPointsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5700
 * @tc.desc   test for testCanvasDrawPointsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointsNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Point2D pointOne = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointTwo = { TEST_RECT_SIZE_200, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointThree = { TEST_RECT_SIZE_500, TEST_POINT_Y_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };
    OH_Drawing_Point2D pointsEmpty[0] = {};
    // 2. Pass an empty value as the first argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(nullptr, POINT_MODE_LINES, TEST_MIPMAP_MODE_COUNT, points);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Set the third argument of OH_Drawing_CanvasDrawPoints to 0.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, static_cast<int>(TEST_MATRIX_VALUE_0), points);
    // 4. Pass an empty array as the fourth argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, TEST_MIPMAP_MODE_COUNT, pointsEmpty);
    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5800
 * @tc.desc   test for testCanvasDrawPointsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointsAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Pass a negative value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointTwo = { TEST_RECT_SIZE_200, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointThree = { TEST_RECT_SIZE_500, TEST_POINT_Y_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };

    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, -1, points);
    }
    // 3. Pass a floating-point value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1.0f, points);
    // 4. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = { -TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D points1[1] = { point1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points1);
    // 5. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = { TEST_POINT_X_250, -TEST_POINT_Y_500 };
    OH_Drawing_Point2D points2[1] = { point2 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);
    // 6. Set both the x and y coordinates of the point in OH_Drawing_Point2D parameter to negative numbers in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point3 = { -TEST_POINT_X_250, -TEST_POINT_Y_500 };
    OH_Drawing_Point2D points3[1] = { point3 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points3);
    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointsMismatch
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5900
 * @tc.desc   test for testCanvasDrawPointsMismatch.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointsMismatch()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an array of OH_Drawing_Point2D with a length of 1 and pass 2 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D points1[1] = { pointOne };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, POINT_COUNT_TWO, points1);
    // 3. Pass an array of OH_Drawing_Point2D with a length of 3 and pass 1 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne1 = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointTwo1 = { TEST_RECT_SIZE_200, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointThree1 = { TEST_RECT_SIZE_500, TEST_POINT_Y_700 };
    OH_Drawing_Point2D points2[TEST_MIPMAP_MODE_COUNT] = { pointOne1, pointTwo1, pointThree1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);
    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointsMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6000
 * @tc.desc   test for testCanvasDrawPointsMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointsMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Pass an extremely large value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = { TEST_POINT_X_250, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointTwo = { TEST_RECT_SIZE_200, TEST_POINT_Y_500 };
    OH_Drawing_Point2D pointThree = { TEST_RECT_SIZE_500, TEST_POINT_Y_700 };
    OH_Drawing_Point2D points[TEST_MIPMAP_MODE_COUNT] = { pointOne, pointTwo, pointThree };
    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, INT32_MAX_VALUE, points);
    }
    // 3. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = { INT32_MAX_VALUE, TEST_POINT_Y_500 };
    OH_Drawing_Point2D points1[1] = { point1 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points1);
    // 4. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = { TEST_POINT_X_250, INT32_MAX_VALUE };
    OH_Drawing_Point2D points2[1] = { point2 };
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);
    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointsInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6100
 * @tc.desc   test for testCanvasDrawPointsInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointsInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBitmapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6200
 * @tc.desc   test for testCanvasDrawBitmapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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
            int width = TEST_RECT_SIZE_500;
            int height = TEST_RECT_SIZE_500;
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
    int width = TEST_RECT_SIZE_500;
    int height = TEST_RECT_SIZE_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = TEST_RECT_SIZE_600 * TEST_RECT_SIZE_600 * BYTES_PER_PIXEL;
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

/**
 * @tc.name   testCanvasDrawBitmapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6300
 * @tc.desc   test for testCanvasDrawBitmapNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
    int width = TEST_BITMAP_SIZE_48;
    int height = TEST_BITMAP_SIZE_48;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = width * height * BYTES_PER_PIXEL;
    void* pixels = new int[TEST_BITMAP_SIZE_47 * TEST_BITMAP_SIZE_48];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 48*47.
    width = TEST_BITMAP_SIZE_48;
    height = TEST_BITMAP_SIZE_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = width * height * BYTES_PER_PIXEL;
    pixels = new int[TEST_BITMAP_SIZE_48 * TEST_BITMAP_SIZE_47];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 9. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, allocate memory for pixels as
    // 48*48, and set rowBytes as 47.
    width = TEST_BITMAP_SIZE_48;
    height = TEST_BITMAP_SIZE_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = TEST_BITMAP_SIZE_47;
    pixels = new int[TEST_BITMAP_SIZE_48 * TEST_BITMAP_SIZE_48];
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

/**
 * @tc.name   testCanvasDrawBitmapAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6400
 * @tc.desc   test for testCanvasDrawBitmapAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, -1, 0);

    // 4. The y-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is negative.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, -1);

    // 5. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBitmapMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6500
 * @tc.desc   test for testCanvasDrawBitmapMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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

/**
 * @tc.name   testCanvasDrawBitmapInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6600
 * @tc.desc   test for testCanvasDrawBitmapInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawBitmapInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBitmapBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6700
 * @tc.desc   test for testCanvasDrawBitmapBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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

    int width = TEST_RECT_SIZE_4096;
    int height = TEST_RECT_SIZE_2160;
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
    int rowBytes = TEST_RECT_SIZE_600 * TEST_RECT_SIZE_600 * BYTES_PER_PIXEL;
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

/**
 * @tc.name   testCanvasDrawBitmapRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6800
 * @tc.desc   test for testCanvasDrawBitmapRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
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
    int width = TEST_RECT_SIZE_500;
    int height = TEST_RECT_SIZE_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = TEST_RECT_SIZE_600 * TEST_RECT_SIZE_600 * BYTES_PER_PIXEL;
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

/**
 * @tc.name   testCanvasDrawBitmapRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6900
 * @tc.desc   test for testCanvasDrawBitmapRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
static void TestDrawBitmapRectWithDifferentBitmaps(OH_Drawing_Canvas* canvas, OH_Drawing_Bitmap** bitmap,
    OH_Drawing_Rect* src, OH_Drawing_Rect* dst, OH_Drawing_SamplingOptions* options)
{
    int width = TEST_BITMAP_SIZE_48;
    int height = TEST_BITMAP_SIZE_48;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = width * height * BYTES_PER_PIXEL;
    void* pixels = new int[TEST_BITMAP_SIZE_47 * TEST_BITMAP_SIZE_48];
    OH_Drawing_BitmapDestroy(*bitmap);
    *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    OH_Drawing_CanvasDrawBitmapRect(canvas, *bitmap, src, dst, options);
    
    width = TEST_BITMAP_SIZE_48;
    height = TEST_BITMAP_SIZE_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = width * height * BYTES_PER_PIXEL;
    pixels = new int[TEST_BITMAP_SIZE_48 * TEST_BITMAP_SIZE_47];
    OH_Drawing_BitmapDestroy(*bitmap);
    *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    OH_Drawing_CanvasDrawBitmapRect(canvas, *bitmap, src, dst, options);
    
    width = TEST_BITMAP_SIZE_48;
    height = TEST_BITMAP_SIZE_48;
    imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    rowBytes = TEST_BITMAP_SIZE_47;
    pixels = new int[TEST_BITMAP_SIZE_48 * TEST_BITMAP_SIZE_48];
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
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
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
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    
    src = OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    OH_Drawing_RectDestroy(src);
}

static void TestDrawBitmapRectWithInvalidDstCoordinates(OH_Drawing_Canvas* canvas, OH_Drawing_Bitmap* bitmap,
    OH_Drawing_Rect* src, OH_Drawing_SamplingOptions* options)
{
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    
    dst = OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    
    dst = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    
    dst = OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    OH_Drawing_RectDestroy(dst);
}

/**
 * @tc.name   testCanvasDrawBitmapRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7000
 * @tc.desc   test for testCanvasDrawBitmapRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
                              TEST_NEGATIVE_OFFSET_50, TEST_NEGATIVE_OFFSET_50);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET,
                              TEST_NEGATIVE_OFFSET_50, TEST_NEGATIVE_OFFSET_50);
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

/**
 * @tc.name   testCanvasDrawBitmapRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7100
 * @tc.desc   test for testCanvasDrawBitmapRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 4. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with maximum values for the top-right
    // coordinate
    src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, FLT_MAX_VALUE);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 5. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-left
    // coordinate
    dst = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 6. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-right
    // coordinate
    dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, FLT_MAX_VALUE);
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

/**
 * @tc.name   testCanvasDrawBitmapRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7200
 * @tc.desc   test for testCanvasDrawBitmapRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawBitmapRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawBitmapRectBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7300
 * @tc.desc   test for testCanvasDrawBitmapRectBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
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
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  TEST_RECT_SIZE, TEST_RECT_SIZE);
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
    int width = TEST_RECT_SIZE_4096;
    int height = TEST_RECT_SIZE_2160;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN };
    int rowBytes = TEST_RECT_SIZE_600 * TEST_RECT_SIZE_600 * BYTES_PER_PIXEL;
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

/**
 * @tc.name   testCanvasDrawRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7400
 * @tc.desc   test for testCanvasDrawRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawRectNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7500
 * @tc.desc   test for testCanvasDrawRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRectNull()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
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
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 6. OH_Drawing_CanvasDrawRect with the second parameter OH_Drawing_Rect created with all values set to 0
    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7600
 * @tc.desc   test for testCanvasDrawRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRectAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom being negative numbers
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_RECT_SIZE, TEST_CIRCLE_RADIUS, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE, TEST_NEGATIVE_OFFSET, TEST_CIRCLE_RADIUS, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_NEGATIVE_OFFSET_50, TEST_CIRCLE_RADIUS);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_CIRCLE_RADIUS, TEST_NEGATIVE_OFFSET_50);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 4. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 5. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate greater than the
    // bottom-right coordinate
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7700
 * @tc.desc   test for testCanvasDrawRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRectMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom set to maximum values
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, FLT_MAX_VALUE, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, FLT_MAX_VALUE, TEST_RECT_SIZE_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, TEST_RECT_SIZE_200, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7800
 * @tc.desc   test for testCanvasDrawRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRectInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawCircleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7900
 * @tc.desc   test for testCanvasDrawCircleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawCircleNormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate
    OH_Drawing_Point* center = OH_Drawing_PointCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
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

/**
 * @tc.name   testCanvasDrawCircleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8000
 * @tc.desc   test for testCanvasDrawCircleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
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

/**
 * @tc.name   testCanvasDrawCircleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8100
 * @tc.desc   test for testCanvasDrawCircleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawCircleAbnormal()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter being negative
    OH_Drawing_Point* center = OH_Drawing_PointCreate(TEST_NEGATIVE_OFFSET, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 4. OH_Drawing_PointCreate with y parameter being negative
    center = OH_Drawing_PointCreate(TEST_RECT_SIZE, TEST_NEGATIVE_OFFSET);
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

/**
 * @tc.name   testCanvasDrawCircleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8200
 * @tc.desc   test for testCanvasDrawCircleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawCircleMaximum()
{
    DrawingNativeCanvasPart2TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter set to the maximum value
    OH_Drawing_Point* center = OH_Drawing_PointCreate(FLT_MAX_VALUE, TEST_RECT_SIZE);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, TEST_CIRCLE_RADIUS);
    // 4. OH_Drawing_PointCreate with y parameter set to the maximum value
    center = OH_Drawing_PointCreate(TEST_RECT_SIZE, FLT_MAX_VALUE);
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

/**
 * @tc.name   testCanvasDrawCircleInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8300
 * @tc.desc   test for testCanvasDrawCircleInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawCircleInputDestroyed()
{
    DrawingNativeCanvasPart2TestSetUp();

    DrawingNativeCanvasPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRect4ByteAlignment
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4BYTEALIGNMENT
 * @tc.desc   test for Canvas Draw PixelMap Rect 4ByteAlignment.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRect4ByteAlignment()
{
    DrawingNativeCanvasPart2TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative* pixelMap = GET_OH_PixelmapNative_4ByteAlignment();
    OH_Drawing_PixelMap* drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions* sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 2
    OH_Drawing_Rect* src1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                  FLT_MAX_VALUE, FLT_MAX_VALUE);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect* dst1 = OH_Drawing_RectCreate(FLT_MAX_VALUE, FLT_MAX_VALUE, TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
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