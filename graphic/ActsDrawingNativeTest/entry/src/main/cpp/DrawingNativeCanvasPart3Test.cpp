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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int CLIP_OP_COUNT = 2;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart3TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart3Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart3Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart3TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart3Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart3Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasDrawOvalNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8400
 * @tc.desc   test for testCanvasDrawOvalNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawOvalNormal()
{
    DrawingNativeCanvasPart3TestSetUp();

    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);

    // 3. Draw oval on canvas
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawOvalNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8500
 * @tc.desc   test for testCanvasDrawOvalNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawOvalNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawOval with nullptr as the first parameter
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
                              TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    // 5. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    // 6. OH_Drawing_CanvasDrawOval with nullptr as the second parameter
    OH_Drawing_CanvasDrawOval(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawOvalWithNegativeCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_NEGATIVE_OFFSET,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_NEGATIVE_OFFSET_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_NEGATIVE_OFFSET_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    OH_Drawing_RectDestroy(rect);
}

static void TestDrawOvalWithEqualCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    
    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect4);
    
    OH_Drawing_Rect* rect5 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect5);
    
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
}

/**
 * @tc.name   testCanvasDrawOvalAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8600
 * @tc.desc   test for testCanvasDrawOvalAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawOvalAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    
    TestDrawOvalWithNegativeCoordinates(canvas);
    TestDrawOvalWithEqualCoordinates(canvas);
    
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawOvalMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8700
 * @tc.desc   test for testCanvasDrawOvalMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawOvalMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect with FLT_MAX_VALUE as the values for left, top, right, and bottom
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_MATRIX_VALUE_0,
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawOvalInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8800
 * @tc.desc   test for testCanvasDrawOvalInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawOvalInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8900
 * @tc.desc   test for testCanvasDrawArcNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawArcNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawArc with startAngle iterating over 0°, 180°, and 360°
    float startAngles[] = { TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_180, TEST_ARC_SWEEP_ANGLE_360 };
    for (float startAngle : startAngles) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawArc(canvas, rect, startAngle, TEST_ARC_SWEEP_ANGLE_90);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle iterating over 0°, 180°, and 360°
    float sweepAngles[] = { TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_180, TEST_ARC_SWEEP_ANGLE_360 };
    for (float sweepAngle : sweepAngles) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, sweepAngle);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9000
 * @tc.desc   test for testCanvasDrawArcNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawArc with nullptr as the first parameter
    OH_Drawing_CanvasDrawArc(nullptr, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0);
    OH_Drawing_CanvasDrawArc(canvas, rect2, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    OH_Drawing_CanvasDrawArc(canvas, rect3, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    // 6. OH_Drawing_CanvasDrawArc with nullptr as the second parameter
    OH_Drawing_CanvasDrawArc(canvas, nullptr, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawArcWithNegativeRectCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_NEGATIVE_OFFSET,
                              TEST_NEGATIVE_OFFSET_200, TEST_NEGATIVE_OFFSET_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    
    rect = OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_NEGATIVE_OFFSET,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_NEGATIVE_OFFSET_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_NEGATIVE_OFFSET_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
}

static void TestDrawArcWithEqualAndInvalidRectCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect2, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect3, TEST_MATRIX_VALUE_0, TEST_ARC_SWEEP_ANGLE_90);
    
    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect4, TEST_MATRIX_VALUE_0, TEST_ARC_SWEEP_ANGLE_90);
    
    OH_Drawing_Rect* rect5 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect5, TEST_MATRIX_VALUE_0, TEST_ARC_SWEEP_ANGLE_90);
    
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
}

/**
 * @tc.name   testCanvasDrawArcAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9100
 * @tc.desc   test for testCanvasDrawArcAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    
    TestDrawArcWithNegativeRectCoordinates(canvas);
    TestDrawArcWithEqualAndInvalidRectCoordinates(canvas);
    
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE_NEGATIVE_90, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_SWEEP_ANGLE_400, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_START_ANGLE_NEGATIVE_90);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_400);
    
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9200
 * @tc.desc   test for testCanvasDrawArcMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with FLT_MAX_VALUE as the values
    // for left, top, right, and bottom
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_MATRIX_VALUE_0,
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
    // 3. OH_Drawing_CanvasDrawArc with startAngle FLT_MAX_VALUE
    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, FLT_MAX_VALUE, TEST_ARC_SWEEP_ANGLE_90);
    OH_Drawing_RectDestroy(rect);
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle FLT_MAX_VALUE
    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_ARC_START_ANGLE, FLT_MAX_VALUE);
    OH_Drawing_RectDestroy(rect);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9300
 * @tc.desc   test for testCanvasDrawArcInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9400
 * @tc.desc   test for testCanvasDrawRoundRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawRoundRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);

    // 3. OH_Drawing_CanvasDrawRoundRect
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawRoundRectWithZeroCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_300);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect* roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect2);

    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_MATRIX_VALUE_0, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_RoundRect* roundRect3 = OH_Drawing_RoundRectCreate(rect3, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    EXPECT_NE(roundRect3, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect3);

    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_MATRIX_VALUE_0, TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_RoundRect* roundRect4 = OH_Drawing_RoundRectCreate(rect4, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    EXPECT_NE(roundRect4, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect4);

    OH_Drawing_Rect* rect5 =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_MATRIX_VALUE_0);
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_RoundRect* roundRect5 = OH_Drawing_RoundRectCreate(rect5, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    EXPECT_NE(roundRect5, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect5);

    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RoundRectDestroy(roundRect4);
    OH_Drawing_RoundRectDestroy(roundRect5);
}

/**
 * @tc.name   testCanvasDrawRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9500
 * @tc.desc   test for testCanvasDrawRoundRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRoundRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);

    // 3. OH_Drawing_CanvasDrawRoundRect with the first parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(nullptr, roundRect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 5. Test with zero coordinates
    TestDrawRoundRectWithZeroCoordinates(canvas);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having
    // all positions as 0
    OH_Drawing_Rect* rect6 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_RoundRect* roundRect6 = OH_Drawing_RoundRectCreate(rect6, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    // add assert
    EXPECT_NE(roundRect6, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect6);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad as 0
    OH_Drawing_Rect* rect7 =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_RoundRect* roundRect7 = OH_Drawing_RoundRectCreate(rect7, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    // add assert
    EXPECT_NE(roundRect7, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect7);

    // 8. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad as 0
    OH_Drawing_Rect* rect8 =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_RoundRect* roundRect8 = OH_Drawing_RoundRectCreate(rect8, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(roundRect8, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect8);

    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RoundRectDestroy(roundRect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RoundRectDestroy(roundRect7);
    OH_Drawing_RectDestroy(rect8);
    OH_Drawing_RoundRectDestroy(roundRect8);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawRoundRectWithNegativeCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_10, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, -TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, -TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, -TEST_CANVAS_RECT_Y2);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/**
 * @tc.name   testCanvasDrawRoundRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9600
 * @tc.desc   test for testCanvasDrawRoundRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRoundRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Test with negative coordinates
    TestDrawRoundRectWithNegativeCoordinates(canvas);

    // 3. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_CanvasDrawRoundRect creating rect with the horizontal
    // coordinate of the top-left corner equal to the horizontal coordinate of the bottom-right corner, or the vertical
    // coordinate of the top-left corner equal to the vertical coordinate of the bottom-right corner
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates equal to the bottom-right corner coordinates
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates greater than the bottom-right corner coordinates
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative xRad
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_NEG_1, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative yRad
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_NEG_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRoundRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9700
 * @tc.desc   test for testCanvasDrawRoundRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRoundRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to FLT_MAX_VALUE
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_CANVAS_RECT_Y1,
        TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, FLT_MAX_VALUE, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, FLT_MAX_VALUE, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad being
    // set to FLT_MAX_VALUE
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX_VALUE, TEST_MATRIX_VALUE_1);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad being
    // set to FLT_MAX_VALUE
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_MATRIX_VALUE_1, FLT_MAX_VALUE);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawRoundRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9800
 * @tc.desc   test for testCanvasDrawRoundRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawRoundRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawTextBlobNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9900
 * @tc.desc   test for testCanvasDrawTextBlobNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawTextBlobNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_TextBlobCreateFromText
    const char* str = "123456";

    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. OH_Drawing_CanvasDrawTextBlob
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // 4. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawTextBlobNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10000
 * @tc.desc   test for testCanvasDrawTextBlobNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawTextBlobNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_TextBlobCreateFromString
    const char* str = "123456";

    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. OH_Drawing_CanvasDrawTextBlob with the first parameter being nullptr
    OH_Drawing_CanvasDrawTextBlob(nullptr, textBlob, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawTextBlob with the second parameter being nullptr
    OH_Drawing_CanvasDrawTextBlob(canvas, nullptr, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawTextBlob with the third parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10);
    // 6. OH_Drawing_CanvasDrawTextBlob with the fourth parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0);
    // 7. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawTextBlobAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10100
 * @tc.desc   test for testCanvasDrawTextBlobAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawTextBlobAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_TextBlob from text
    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to a
    // negative value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_COORD_NEGATIVE_10, TEST_CANVAS_COORD_10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to a
    // negative value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_NEGATIVE_10);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawTextBlobMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10200
 * @tc.desc   test for testCanvasDrawTextBlobMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawTextBlobMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_TextBlob from text
    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to
    // maximum value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, FLT_MAX_VALUE, TEST_CANVAS_COORD_10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to
    // maximum value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_COORD_10, FLT_MAX_VALUE);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawTextBlobInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10300
 * @tc.desc   test for testCanvasDrawTextBlobInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawTextBlobInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10400
 * @tc.desc   test for testCanvasClipRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasClipRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with clipOp and doAntiAlias parameters, iterate through enum values
    OH_Drawing_CanvasClipOp clipOp[] = { OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < CLIP_OP_COUNT; i++) {
        for (int j = 0; j < CLIP_OP_COUNT; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipRect(canvas, rect, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10500
 * @tc.desc   test for testCanvasClipRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with the first parameter being nullptr
    OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with left, top, right, and bottom
    // values being 0
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with all values being 0
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect3, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRect with the second parameter being nullptr
    OH_Drawing_CanvasClipRect(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10600
 * @tc.desc   test for testCanvasClipRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_NEGATIVE_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_NEGATIVE_OFFSET, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_NEGATIVE_OFFSET);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the x-coordinate of the top-left corner is equal
    // to the x-coordinate of the bottom-right corner, or the y-coordinate of the top-left corner is equal to the
    // y-coordinate of the bottom-right corner
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are equal to the
    // bottom-right corner coordinates
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are greater than
    // the bottom-right corner coordinates
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10700
 * @tc.desc   test for testCanvasClipRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with extreme values for left, top, right, and bottom
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, FLT_MAX_VALUE, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, FLT_MAX_VALUE, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10800
 * @tc.desc   test for testCanvasClipRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10900
 * @tc.desc   test for testCanvasClipRoundRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasClipRoundRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with parameters clipOp and doAntiAlias, iterate through the enumeration values
    OH_Drawing_CanvasClipOp clipOp[] = { OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < CLIP_OP_COUNT; i++) {
        for (int j = 0; j < CLIP_OP_COUNT; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestClipRoundRectWithZeroRectValues(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect* roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect2 = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect2 = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect2 = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
        TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect2);
}

/**
 * @tc.name   testCanvasClipRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11000
 * @tc.desc   test for testCanvasClipRoundRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRoundRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with the first parameter being null
    OH_Drawing_CanvasClipRoundRect(nullptr, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasClipRoundRect with the second parameter being null
    OH_Drawing_CanvasClipRoundRect(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Test with various zero values in rect
    TestClipRoundRectWithZeroRectValues(canvas);
    // 7. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad set to 0
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect* roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 8. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad set to 0
    rect2 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 9. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestClipRoundRectWithNegativeValues(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_NEGATIVE_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_NEGATIVE_OFFSET, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_NEGATIVE_OFFSET);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

static void TestClipRoundRectWithEqualCoordinates(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

static void TestClipRoundRectWithInvalidRadii(OH_Drawing_Canvas* canvas)
{
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, -TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    rect = OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_NEGATIVE_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/**
 * @tc.name   testCanvasClipRoundRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11100
 * @tc.desc   test for testCanvasClipRoundRectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRoundRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    
    TestClipRoundRectWithNegativeValues(canvas);
    TestClipRoundRectWithEqualCoordinates(canvas);
    
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    
    TestClipRoundRectWithInvalidRadii(canvas);
    
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRoundRectMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11200
 * @tc.desc   test for testCanvasClipRoundRectMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRoundRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRoundRect, pass extreme values for left, top, right, and bottom when creating
    // OH_Drawing_RoundRect
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(FLT_MAX_VALUE, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, FLT_MAX_VALUE, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, FLT_MAX_VALUE, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX_VALUE for xRad when creating OH_Drawing_RoundRect
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX_VALUE, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX_VALUE for yRad when creating OH_Drawing_RoundRect
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, FLT_MAX_VALUE);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRoundRectInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11300
 * @tc.desc   test for testCanvasClipRoundRectInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRoundRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart3TestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS