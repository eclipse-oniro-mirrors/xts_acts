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

#include "include/OhosCommonTest.h"
#include "include/DrawingNativeCanvasCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int CANVAS_SIZE_OFFSET = 90;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart4TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart4Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart4Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart4TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart4Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart4Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11400
 * @tc.desc   test for testCanvasSkewNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasSkewNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with positive skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, TEST_SKEW_VALUE_1, TEST_SKEW_VALUE_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect1);
    // 4. OH_Drawing_CanvasSkew with negative skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, -TEST_SKEW_VALUE_1, -TEST_SKEW_VALUE_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call drawing class interface
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    // 6. OH_Drawing_CanvasSkew with positive skew value on the x-axis and negative skew value on the y-axis
    OH_Drawing_CanvasSkew(canvas, TEST_SKEW_VALUE_1, -TEST_SKEW_VALUE_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Call drawing class interface
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect3);
    // 8. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11500
 * @tc.desc   test for testCanvasSkewNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSkewNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the first parameter as null
    OH_Drawing_CanvasSkew(nullptr, TEST_SKEW_VALUE_2, TEST_SKEW_VALUE_2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasSkew with the second parameter as 0
    OH_Drawing_CanvasSkew(canvas, TEST_MATRIX_VALUE_0, TEST_SKEW_VALUE_2);
    // 4. OH_Drawing_CanvasSkew with the third parameter as 0
    OH_Drawing_CanvasSkew(canvas, TEST_SKEW_VALUE_2, TEST_MATRIX_VALUE_0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSkewMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11600
 * @tc.desc   test for testCanvasSkewMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSkewMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the skew amount sx on the x-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, FLT_MAX_VALUE, TEST_MATRIX_VALUE_1);
    // 3. OH_Drawing_CanvasSkew with the skew amount sy on the y-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, TEST_MATRIX_VALUE_1, FLT_MAX_VALUE);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSkewInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11700
 * @tc.desc   test for testCanvasSkewInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSkewInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11800
 * @tc.desc   test for testCanvasSkewMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSkewMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasSkew 10 times, each time with a different skew value
    for (int i = 0; i < TEST_CANVAS_LOOP_COUNT; i++) {
        float skew = i * TEST_SKEW_INCREMENT;
        OH_Drawing_CanvasSkew(canvas, skew, skew);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11900
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasGetWidthtestCanvasGetHeightNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas using OH_Drawing_CanvasBind, and verify the canvas information by
    // calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
    EXPECT_EQ(canvasWidth, width);
    EXPECT_EQ(canvasHeight, height);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12000
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetWidthtestCanvasGetHeightNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasGetHeight with null input
    int32_t canvasHeight = OH_Drawing_CanvasGetHeight(nullptr);
    EXPECT_EQ(canvasHeight, 0);
    // 3. OH_Drawing_CanvasGetWidth with null input
    int32_t canvasWidth = OH_Drawing_CanvasGetWidth(nullptr);
    EXPECT_EQ(canvasWidth, 0);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12100
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetWidthtestCanvasGetHeightMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, static_cast<int32_t>(TEST_CANVAS_COORD_200 + CANVAS_SIZE_OFFSET));
        EXPECT_EQ(canvasHeight, static_cast<int32_t>(TEST_CANVAS_COORD_200 + CANVAS_SIZE_OFFSET));
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12200
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetWidthtestCanvasGetHeightInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12300
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12400
 * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasGetLocalClipBoundsNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasGetLocalClipBounds
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12500
 * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetLocalClipBoundsNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with the first parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasGetLocalClipBounds with the second parameter as null
    OH_Drawing_CanvasGetLocalClipBounds(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with left, top, right, bottom as 0
    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 6. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with all values as 0
    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestGetLocalClipBoundsWithNegativeCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect1);
    
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, -TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect2);
    
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              -TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect3);
    
    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, -TEST_CANVAS_COORD_100);
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect4);
    
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
}

static void TestGetLocalClipBoundsWithEqualAndInvalidCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect5 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect5);
    
    OH_Drawing_Rect* rect6 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect6);
    
    OH_Drawing_Rect* rect7 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect7);
    
    OH_Drawing_Rect* rect8 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect8);
    
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RectDestroy(rect8);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12600
 * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetLocalClipBoundsAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    
    TestGetLocalClipBoundsWithNegativeCoordinates(canvas);
    TestGetLocalClipBoundsWithEqualAndInvalidCoordinates(canvas);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12700
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetLocalClipBoundsMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = 200;
        uint32_t height = 200;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12800
 * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetLocalClipBoundsInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12900
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetLocalClipBoundsMultipleCallsBoundary()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    uint32_t width = 4096;
    uint32_t height = 2160;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13000
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_Matrix* totalMatrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    EXPECT_NE(totalMatrix, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasConcatMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13100
 * @tc.desc   test for testCanvasConcatMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasConcatMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasConcatMatrix with the first parameter as null
    OH_Drawing_CanvasConcatMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasConcatMatrix with the second parameter as null
    OH_Drawing_CanvasConcatMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetTotalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13200
 * @tc.desc   test for testCanvasGetTotalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetTotalMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. OH_Drawing_CanvasGetTotalMatrix with the first parameter as null
    OH_Drawing_CanvasGetTotalMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasGetTotalMatrix with the second parameter as null
    OH_Drawing_CanvasGetTotalMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestMatrixOperationsOnCanvas(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreateScale(TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10,
                                                              TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10);
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix* totalMatrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);

    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCreateRotation(TEST_ARC_SWEEP_ANGLE_180, TEST_SKEW_VALUE_1,
        TEST_SKEW_VALUE_1);
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix* totalMatrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix2, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);

    OH_Drawing_Matrix* matrix3 = OH_Drawing_MatrixCreateTranslation(TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10);
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix* totalMatrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix3, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);

    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_MatrixDestroy(totalMatrix2);
    OH_Drawing_MatrixDestroy(totalMatrix3);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13300
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreateScale(TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10,
                                                              TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10);
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix* totalMatrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCreateRotation(TEST_ARC_SWEEP_ANGLE_180, TEST_SKEW_VALUE_1,
        TEST_SKEW_VALUE_1);
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix* totalMatrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix2, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
    
    OH_Drawing_Matrix* matrix3 = OH_Drawing_MatrixCreateTranslation(TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10);
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix* totalMatrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix3, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        TestMatrixOperationsOnCanvas(canvas);
    }
    
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    }
    
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_MatrixDestroy(totalMatrix2);
    OH_Drawing_MatrixDestroy(totalMatrix3);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13400
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawShadowNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13500
 * @tc.desc   test for testCanvasDrawShadowNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawShadowNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, iterate through the OH_Drawing_CanvasShadowFlags enumeration values
    OH_Drawing_CanvasShadowFlags flags[] = {
        SHADOW_FLAGS_NONE,
        SHADOW_FLAGS_TRANSPARENT_OCCLUDER,
        SHADOW_FLAGS_GEOMETRIC_ONLY,
        SHADOW_FLAGS_ALL,
    };
    OH_Drawing_Point3D p1{ TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point3D p2{ TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10 };
    for (int i = 0; i < TEST_ALPHA_FORMAT_COUNT; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                    TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, flags[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawShadowNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13600
 * @tc.desc   test for testCanvasDrawShadowNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawShadowNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow with the first parameter as null
    OH_Drawing_Point3D p1{ TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point3D p2{ TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10 };
    OH_Drawing_CanvasDrawShadow(nullptr, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawShadow with the second parameter as null
    OH_Drawing_CanvasDrawShadow(canvas, nullptr, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawShadow with the third parameter as null
    // Unable to test, compilation error
    // 6. OH_Drawing_CanvasDrawShadow with the fourth parameter as null
    // Unable to test, compilation error
    // 7. OH_Drawing_CanvasDrawShadow with the fifth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_0,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 8. OH_Drawing_CanvasDrawShadow with the sixth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_MATRIX_VALUE_0, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 9. OH_Drawing_CanvasDrawShadow with the seventh parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_MATRIX_VALUE_0, SHADOW_FLAGS_ALL);
    // 10. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawShadowAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13700
 * @tc.desc   test for testCanvasDrawShadowAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawShadowAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, the third parameter planeParams x, y, z are set to negative values
    OH_Drawing_Point3D p1{ TEST_MATRIX_VALUE_NEG_1, TEST_MATRIX_VALUE_NEG_1, TEST_MATRIX_VALUE_NEG_1 };
    OH_Drawing_Point3D p2{ TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10 };
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, the fourth parameter devLightPos x, y, z are set to negative values
    OH_Drawing_Point3D p3{ TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point3D p4{ TEST_ARC_START_ANGLE_NEGATIVE, TEST_ARC_START_ANGLE_NEGATIVE,
        TEST_ARC_START_ANGLE_NEGATIVE };
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, the fifth parameter lightRadius is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, TEST_CANVAS_COORD_NEGATIVE_10,
                                TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, the sixth parameter ambientColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, TEST_MATRIX_VALUE_10,
                                -TEST_COLOR_BLACK_OPAQUE, TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, the seventh parameter spotColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_BLACK_OPAQUE, -TEST_COLOR_BLACK_OPAQUE, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawShadowMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13800
 * @tc.desc   test for testCanvasDrawShadowMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawShadowMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point3D p1{ TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1 };
    OH_Drawing_Point3D p2{ TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10, TEST_MATRIX_VALUE_10 };
    // 3. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the planeParams parameter to maximum values
    p1 = { FLT_MAX_VALUE, FLT_MAX_VALUE, FLT_MAX_VALUE };
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_WHITE_OPAQUE, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the devLightPos parameter to maximum values
    p1 = { 1.0, 1.0, 1.0 };
    p2 = { FLT_MAX_VALUE, FLT_MAX_VALUE, FLT_MAX_VALUE };
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_WHITE_OPAQUE, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, set the lightRadius parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, FLT_MAX_VALUE,
                                TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_WHITE_OPAQUE, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, set the ambientColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_WHITE_OPAQUE, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, set the spotColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, TEST_MATRIX_VALUE_10,
                                TEST_COLOR_WHITE_OPAQUE, TEST_COLOR_WHITE_OPAQUE, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawShadowInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13900
 * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawShadowInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14000
 * @tc.desc   test for testCanvasClearNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasClearNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear, covering the minimum value 0x00000000 and the maximum value 0xFFFFFFFF for color
    OH_Drawing_CanvasClear(canvas, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14100
 * @tc.desc   test for testCanvasClearNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClearNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the first parameter as null
    OH_Drawing_CanvasClear(nullptr, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14200
 * @tc.desc   test for testCanvasClearAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClearAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to a negative value
    OH_Drawing_CanvasClear(canvas, TEST_PIXELMAP_NEGATIVE_1);
    // 3. OH_Drawing_CanvasClear with the parameter color set to a floating-point value
    // compile error, ignore
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14300
 * @tc.desc   test for testCanvasClearMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClearMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasClear 10 times, each time with a different color
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasClear(canvas, TEST_COLOR_INCREMENT + i * TEST_MATRIX_VALUE_10);
    }
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14400
 * @tc.desc   test for testCanvasClearInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClearInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClearMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14500
 * @tc.desc   test for testCanvasClearMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClearMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to the maximum value
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14600
 * @tc.desc   test for testCanvasSetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasSetMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix and use OH_Drawing_MatrixGetValue to get the matrix information
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14700
 * @tc.desc   test for testCanvasSetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSetMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. OH_Drawing_CanvasSetMatrix with the first parameter as null
    OH_Drawing_CanvasSetMatrix(nullptr, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasSetMatrix with the second parameter as null
    OH_Drawing_CanvasSetMatrix(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testCanvasSetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14800
 * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSetMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, and after each call, call OH_Drawing_MatrixGetValue to get the
    // matrix information
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        float val = OH_Drawing_MatrixGetValue(matrix, 0);
        EXPECT_EQ(val, 1);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSetMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14900
 * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSetMatrixInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasResetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15000
 * @tc.desc   test for testCanvasResetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasResetMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasResetMatrix
    OH_Drawing_CanvasResetMatrix(canvas);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasResetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15100
 * @tc.desc   test for testCanvasResetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasResetMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasResetMatrix with a null parameter
    OH_Drawing_CanvasResetMatrix(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    
    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasResetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15200
 * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasResetMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, call OH_Drawing_CanvasResetMatrix 10 times, and get matrix
    // information using OH_Drawing_MatrixGetValue
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
    }
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasResetMatrix(canvas);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Call OH_Drawing_CanvasSetMatrix, OH_Drawing_CanvasResetMatrix, and get matrix information using
    // OH_Drawing_MatrixGetValue
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    OH_Drawing_CanvasResetMatrix(canvas);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, 1);
    // 5. Repeat steps 4 for 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        OH_Drawing_CanvasResetMatrix(canvas);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1);
    }
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawImageRectWithSrcNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15300
 * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawImageRectWithSrcNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_ImageCreate to create an image object
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    // 3. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    // 5. Call OH_Drawing_SamplingOptionsCreate to create a sampling options object
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    // 6. Call OH_Drawing_CanvasDrawImageRectWithSrc with the sixth parameter iterating through the enumeration
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, options, FAST_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawImageRectWithSrcNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15400
 * @tc.desc   test for testCanvasDrawImageRectWithSrcNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawImageRectWithSrcNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // 1. Call OH_Drawing_CanvasDrawImageRectWithSrc with the first parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(nullptr, image, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasDrawImageRectWithSrc with the second parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, nullptr, rect, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasDrawImageRectWithSrc with the third parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, nullptr, rect2, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_CanvasDrawImageRectWithSrc with the fourth parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, nullptr, options, STRICT_SRC_RECT_CONSTRAINT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_CanvasDrawImageRectWithSrc with the fifth parameter being nullptr
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas, image, rect, rect2, nullptr, STRICT_SRC_RECT_CONSTRAINT);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawImageRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15500
 * @tc.desc   test for testCanvasDrawImageRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawImageRectNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object using OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create an image object using OH_Drawing_ImageCreate
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 3. Create a rectangle object using OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Create a sampling options object using OH_Drawing_SamplingOptionsCreate
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(options, nullptr);
    // 5. Call OH_Drawing_CanvasDrawImageRect
    OH_Drawing_CanvasDrawImageRect(canvas, image, rect, options);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawImageRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15600
 * @tc.desc   test for testCanvasDrawImageRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawImageRectNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
                                                                           OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    // add assert
    EXPECT_NE(options, nullptr);
    // 1. Call OH_Drawing_CanvasDrawImageRect with the first parameter as null
    OH_Drawing_CanvasDrawImageRect(nullptr, image, rect, options);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasDrawImageRect with the second parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, nullptr, rect, options);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasDrawImageRect with the third parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, image, nullptr, options);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_CanvasDrawImageRect with the fourth parameter as null
    OH_Drawing_CanvasDrawImageRect(canvas, image, rect, nullptr);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart4TestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS