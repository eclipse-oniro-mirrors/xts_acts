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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_360 360
#define DRAWING_NUMBER_370 370
#define DRAWING_NUMBER_123456 123456

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestCanvasDrawOvalNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestCanvasDrawOvalNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawOval with nullptr as the first parameter
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, 0, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200, 0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    // 5. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
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

int TestCanvasDrawOvalAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect with left, top, right, and bottom values as negative numbers
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(-DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, -DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, -DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, -DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Create OH_Drawing_Rect with the horizontal coordinate of the top-left corner equal to the horizontal
    // coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner equal to the vertical
    // coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    // 4. Create OH_Drawing_Rect with the top-left corner coordinates equal to the bottom-right corner coordinates
    OH_Drawing_Rect *rect4 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect4);
    // 5. Create OH_Drawing_Rect with the top-left corner coordinates greater than the bottom-right corner coordinates
    OH_Drawing_Rect *rect5 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect5);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawOvalMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect with FLT_MAX as the values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 0, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, FLT_MAX, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, 0, FLT_MAX, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(0, 0, 0, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawOvalInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawArcNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawArc with startAngle iterating over 0°, 180°, and 360°
    float startAngles[] = {0.0f, 180.0f, 360.0f};
    for (float startAngle : startAngles) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawArc(canvas, rect, startAngle, 90.0f);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle iterating over 0°, 180°, and 360°
    float sweepAngles[] = {0.0f, 180.0f, 360.0f};
    for (float sweepAngle : sweepAngles) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, sweepAngle);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawArcNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawArc with nullptr as the first parameter
    OH_Drawing_CanvasDrawArc(nullptr, rect, 0.0f, 90.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0, DRAWING_NUMBER_200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with all 0 values
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
    OH_Drawing_CanvasDrawArc(canvas, rect3, 0.0f, 90.0f);
    // 6. OH_Drawing_CanvasDrawArc with nullptr as the second parameter
    OH_Drawing_CanvasDrawArc(canvas, nullptr, 0.0f, 90.0f);
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

int TestCanvasDrawArcAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(-DRAWING_NUMBER_100, -DRAWING_NUMBER_100, -DRAWING_NUMBER_200, -DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(-DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, -DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, -DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200, -DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    // 3. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the horizontal coordinate of the top-left corner
    // equal to the horizontal coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner
    // equal to the vertical coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect3, 0.0f, 90.0f);
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates equal to the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect4 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect4, 0.0f, 90.0f);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates greater than the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect5 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect5, 0.0f, 90.0f);
    // 6. OH_Drawing_CanvasDrawArc with negative startAngle
    OH_Drawing_CanvasDrawArc(canvas, rect, -90.0f, 90.0f);
    // 7. OH_Drawing_CanvasDrawArc with startAngle greater than 360°
    OH_Drawing_CanvasDrawArc(canvas, rect, 400.0f, 90.0f);
    // 8. OH_Drawing_CanvasDrawArc with negative sweepAngle
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, -90.0f);
    // 9. OH_Drawing_CanvasDrawArc with sweepAngle greater than 360°
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 400.0f);
    // 10. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawArcMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with FLT_MAX as the values for left, top, right, and
    // bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 0, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, FLT_MAX, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, 0, FLT_MAX, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(0, 0, 0, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    OH_Drawing_RectDestroy(rect);
    // 3. OH_Drawing_CanvasDrawArc with startAngle FLT_MAX
    rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, FLT_MAX, 90.0f);
    OH_Drawing_RectDestroy(rect);
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle FLT_MAX
    rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, FLT_MAX);
    OH_Drawing_RectDestroy(rect);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawArcInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRoundRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
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

void CanvasDrawRoundRectNull(OH_Drawing_Canvas *canvas, OH_Drawing_Rect *rect, OH_Drawing_RoundRect *roundRect)
{
    // 2. OH_Drawing_RoundRectCreate
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasDrawRoundRect with the first parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(nullptr, roundRect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter being nullptr
    OH_Drawing_CanvasDrawRoundRect(canvas, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having 0
    rect = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, 0, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, 0);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having
    rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad as 0
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 8. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad as 0
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 0.0f);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
}

int TestCanvasDrawRoundRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = nullptr;
    OH_Drawing_RoundRect *roundRect = nullptr;
    CanvasDrawRoundRectNull(canvas, rect, roundRect);
    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRoundRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, -DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, -DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, -DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 3. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_CanvasDrawRoundRect creating rect with the horizontal
    // coordinate of the top-left corner equal to the horizontal coordinate of the bottom-right corner, or the vertical
    // coordinate of the top-left corner equal to the vertical coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    rect = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 4. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates equal to the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 5. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates greater than the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative xRad
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, -1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative yRad
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, -1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRoundRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to FLT_MAX
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, FLT_MAX, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, FLT_MAX);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawRoundRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawTextBlobNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_TextBlobCreateFromText
    const char *str = "123456";

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. OH_Drawing_CanvasDrawTextBlob
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawTextBlobNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_TextBlobCreateFromString
    const char *str = "123456";

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. OH_Drawing_CanvasDrawTextBlob with the first parameter being nullptr
    OH_Drawing_CanvasDrawTextBlob(nullptr, textBlob, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawTextBlob with the second parameter being nullptr
    OH_Drawing_CanvasDrawTextBlob(canvas, nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawTextBlob with the third parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, DRAWING_NUMBER_10);
    // 6. OH_Drawing_CanvasDrawTextBlob with the fourth parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, DRAWING_NUMBER_10, 0);
    // 7. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawTextBlobAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_TextBlob from text
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to a
    // negative value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to a
    // negative value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawTextBlobMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_TextBlob from text
    const char *str = "123456";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlob *textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 3. Draw OH_Drawing_TextBlob on canvas with x-coordinate of the bottom left corner of the text object set to
    // maximum value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, FLT_MAX, DRAWING_NUMBER_10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to
    // maximum value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, DRAWING_NUMBER_10, FLT_MAX);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    // 5. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawTextBlobInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with clipOp and doAntiAlias parameters, iterate through enum values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < sizeof(clipOp) / sizeof(clipOp[0]); i++) {
        for (int j = 0; j < sizeof(clipOp) / sizeof(clipOp[0]); j++) {
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

int TestCanvasClipRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with the first parameter being nullptr
    OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with left, top, right, and bottom
    // values being 0
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, 0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with all values being 0
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 0, 0);
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

int TestCanvasClipRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(-DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, -DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the x-coordinate of the top-left corner is equal
    // to the x-coordinate of the bottom-right corner, or the y-coordinate of the top-left corner is equal to the
    // y-coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are equal to the
    // bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are greater than
    // the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with extreme values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRoundRectNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with parameters clipOp and doAntiAlias, iterate through the enumeration values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < sizeof(clipOp) / sizeof(clipOp[0]); i++) {
        for (int j = 0; j < sizeof(clipOp) / sizeof(clipOp[0]); j++) {
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

void CanvasClipRoundRectNull(OH_Drawing_Canvas *canvas)
{
    // 5. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect's left,
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, 0);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with all rect's
    rect2 = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad set to 0
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 0, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 8. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad set to 0
    rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_10, 0);
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect2);
}

int TestCanvasClipRoundRectNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with the first parameter being null
    OH_Drawing_CanvasClipRoundRect(nullptr, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasClipRoundRect with the second parameter being null
    OH_Drawing_CanvasClipRoundRect(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    CanvasClipRoundRectNull(canvas);
    // 9. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void CanvasClipRoundRectAbnormal(OH_Drawing_Canvas *canvas, OH_Drawing_Rect *rect, OH_Drawing_RoundRect *roundRect)
{
    // 2. OH_Drawing_CanvasClipRoundRect, pass negative values for left, top, right, and bottom when creating
    rect = OH_Drawing_RectCreate(-DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, -DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, -DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, -DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
}

int TestCanvasClipRoundRectAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = nullptr;
    OH_Drawing_RoundRect *roundRect = nullptr;
    CanvasClipRoundRectAbnormal(canvas, rect, roundRect);
    // 4. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates greater than right-bottom
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative xRad
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative yRad
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 8. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRoundRectMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRoundRect, pass extreme values for left, top, right, and bottom when creating
    // OH_Drawing_RoundRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, FLT_MAX, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for xRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, DRAWING_NUMBER_10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for yRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_10, FLT_MAX);
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

int TestCanvasClipRoundRectInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipPathNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathLineTo(path, 0, DRAWING_NUMBER_100);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. OH_Drawing_CanvasClipPath
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < sizeof(clipOp) / sizeof(clipOp[0]); i++) {
        for (int j = 0; j < sizeof(clipOp) / sizeof(clipOp[0]); j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipPath(canvas, path, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipPathNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    OH_Drawing_PathLineTo(path, 0, DRAWING_NUMBER_100);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. OH_Drawing_CanvasClipPath with the first parameter being null
    OH_Drawing_CanvasClipPath(nullptr, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. OH_Drawing_CanvasClipPath with the second parameter being null
    OH_Drawing_CanvasClipPath(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. OH_Drawing_CanvasClipPath with the second parameter being an empty path
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path2, nullptr);
    OH_Drawing_CanvasClipPath(canvas, path2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipPathInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate, rotate degrees with values 0, DRAWING_NUMBER_180, 360
    float degrees[] = {0, DRAWING_NUMBER_180, 360};
    for (int i = 0; i < sizeof(degrees) / sizeof(degrees[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasRotate(canvas, degrees[i], DRAWING_NUMBER_10, DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with the first parameter being null
    OH_Drawing_CanvasRotate(nullptr, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasRotate with the third parameter being 0
    OH_Drawing_CanvasRotate(canvas, 0, 0, DRAWING_NUMBER_10);
    // 4. OH_Drawing_CanvasRotate with the fourth parameter being 0
    OH_Drawing_CanvasRotate(canvas, 0, DRAWING_NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with negative degrees input
    OH_Drawing_CanvasRotate(canvas, -DRAWING_NUMBER_180, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_CanvasRotate with degrees input greater than 360
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_370, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 4. OH_Drawing_CanvasRotate with negative px input for rotation center
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_180, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. OH_Drawing_CanvasRotate with negative py input for rotation center
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_180, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with maximum rotation angle degrees input
    OH_Drawing_CanvasRotate(canvas, FLT_MAX, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_CanvasRotate with maximum x-coordinate px input for rotation center
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_180, FLT_MAX, DRAWING_NUMBER_10);
    // 4. OH_Drawing_CanvasRotate with maximum y-coordinate py input for rotation center
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_180, DRAWING_NUMBER_10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRotateMultipleCalls()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasRotate 10 times, each time with different rotation angles and rotation center
    // coordinates
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasRotate(canvas, i * DRAWING_NUMBER_10, i * DRAWING_NUMBER_10, i * DRAWING_NUMBER_10);
        // 3. Call drawing class interface
        OH_Drawing_Rect *rect =
            OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the first parameter being null
    OH_Drawing_CanvasTranslate(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasTranslate with the second parameter being 0
    OH_Drawing_CanvasTranslate(canvas, 0, DRAWING_NUMBER_10);
    // 4. OH_Drawing_CanvasTranslate with the third parameter being 0
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with negative movement distance dx in the x-axis direction
    OH_Drawing_CanvasTranslate(canvas, -DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 3. OH_Drawing_CanvasTranslate with negative movement distance dy in the y-axis direction
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, -DRAWING_NUMBER_10);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the movement distance dx in the x-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, FLT_MAX, DRAWING_NUMBER_10);
    // 3. OH_Drawing_CanvasTranslate with the movement distance dy in the y-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasTranslateMultipleCalls()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasTranslate 10 times, each time with different movement distances
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasTranslate(canvas, i * DRAWING_NUMBER_10, i * DRAWING_NUMBER_10);
        // 3. Call drawing class interface
        OH_Drawing_Rect *rect =
            OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleNormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas
    OH_Drawing_CanvasScale(canvas, 2.0f, 2.0f);

    // 3. Call drawing class interface
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleNull()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the first parameter being null
    OH_Drawing_CanvasScale(nullptr, 2.0f, 2.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Scale the canvas, with the second parameter being 0
    OH_Drawing_CanvasScale(canvas, 0, 2.0f);

    // 4. Scale the canvas, with the third parameter being 0
    OH_Drawing_CanvasScale(canvas, 2.0f, 0);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleAbnormal()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with a negative scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, -2.0f, 2.0f);

    // 3. Scale the canvas, with a negative scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, 2.0f, -2.0f);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleMaximum()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the maximum scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, DBL_MAX, 2.0f);

    // 3. Scale the canvas, with the maximum scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, 2.0f, DBL_MAX);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleInputDestroyed()
{
    DrawingNativeCanvasPart3TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasScaleMultipleCalls()
{
    DrawingNativeCanvasPart3TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasScale 10 times, each time with different compression ratios
    for (int i = DRAWING_NUMBER_1; i <= DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasScale(canvas, i * 1.0f, i * 1.0f);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
