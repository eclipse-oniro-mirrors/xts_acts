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

#include "gtest/gtest.h"

#include "DrawingNativeCanvasCommon.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeCanvasPart3Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasPart3Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart3Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasPart3Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart3Test errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1900
 * @tc.name: testCanvasDrawOvalNormal
 * @tc.desc: test for testCanvasDrawOvalNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawOvalNormal, TestSize.Level0) {
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);

    // 3. Draw oval on canvas
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1901
 * @tc.name: testCanvasDrawOvalNull
 * @tc.desc: test for testCanvasDrawOvalNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawOvalNull, TestSize.Level3) {
    // 1. Create OH_Drawing_Canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawOval with nullptr as the first parameter
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawOval with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 200, 200, 200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 0, 200, 200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 200, 0, 200);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    rect2 = OH_Drawing_RectCreate(200, 200, 200, 0);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1902
 * @tc.name: testCanvasDrawOvalAbnormal
 * @tc.desc: test for testCanvasDrawOvalAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawOvalAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create OH_Drawing_Rect with left, top, right, and bottom values as negative numbers
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, 100, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, -100, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, -200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 200, -200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    // 3. Create OH_Drawing_Rect with the horizontal coordinate of the top-left corner equal to the horizontal
    // coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner equal to the vertical
    // coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 100, 100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect3);
    // 4. Create OH_Drawing_Rect with the top-left corner coordinates equal to the bottom-right corner coordinates
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawOval(canvas, rect4);
    // 5. Create OH_Drawing_Rect with the top-left corner coordinates greater than the bottom-right corner coordinates
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 200, 100, 100);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1903
 * @tc.name: testCanvasDrawOvalMaximum
 * @tc.desc: test for testCanvasDrawOvalMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawOvalMaximum, TestSize.Level3) {
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1904
 * @tc.name: testCanvasDrawOvalInputDestroyed
 * @tc.desc: test for testCanvasDrawOvalInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawOvalInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2000
 * @tc.name: testCanvasDrawArcNormal
 * @tc.desc: test for testCanvasDrawArcNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawArcNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2001
 * @tc.name: testCanvasDrawArcNull
 * @tc.desc: test for testCanvasDrawArcNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawArcNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawArc with nullptr as the first parameter
    OH_Drawing_CanvasDrawArc(nullptr, rect, 0.0f, 90.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with 0 for left, top, right, and bottom
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 100, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 0, 200, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 100, 0, 200);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    rect2 = OH_Drawing_RectCreate(100, 100, 200, 0);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2002
 * @tc.name: testCanvasDrawArcAbnormal
 * @tc.desc: test for testCanvasDrawArcAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawArcAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, -100, -200, -200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(-100, 100, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, -100, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, 100, -200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    rect = OH_Drawing_RectCreate(100, 100, 200, -200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, 90.0f);
    // 3. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the horizontal coordinate of the top-left corner
    // equal to the horizontal coordinate of the bottom-right corner, or the vertical coordinate of the top-left corner
    // equal to the vertical coordinate of the bottom-right corner
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect2, 0.0f, 90.0f);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 100, 100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect3, 0.0f, 90.0f);
    // 4. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates equal to the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect4, 0.0f, 90.0f);
    // 5. OH_Drawing_CanvasDrawArc with OH_Drawing_Rect created with the top-left corner coordinates greater than the
    // bottom-right corner coordinates
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 200, 100, 100);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2003
 * @tc.name: testCanvasDrawArcMaximum
 * @tc.desc: test for testCanvasDrawArcMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawArcMaximum, TestSize.Level3) {
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
    rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, FLT_MAX, 90.0f);
    OH_Drawing_RectDestroy(rect);
    // 4. OH_Drawing_CanvasDrawArc with sweepAngle FLT_MAX
    rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 0.0f, FLT_MAX);
    OH_Drawing_RectDestroy(rect);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2004
 * @tc.name: testCanvasDrawArcInputDestroyed
 * @tc.desc: test for testCanvasDrawArcInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawArcInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2100
 * @tc.name: testCanvasDrawRoundRectNormal
 * @tc.desc: test for testCanvasDrawRoundRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawRoundRectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2101
 * @tc.name: testCanvasDrawRoundRectNull
 * @tc.desc: test for testCanvasDrawRoundRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawRoundRectNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
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

    // 5. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having 0
    // in any of the four positions
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 100, 200, 300);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect2, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect2);

    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(10, 0, 200, 300);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect3, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect3, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect3);

    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(10, 100, 0, 300);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_RoundRect *roundRect4 = OH_Drawing_RoundRectCreate(rect4, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect4, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect4);

    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(10, 100, 200, 0);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_RoundRect *roundRect5 = OH_Drawing_RoundRectCreate(rect5, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect5, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect5);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect having
    // all positions as 0
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_RoundRect *roundRect6 = OH_Drawing_RoundRectCreate(rect6, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect6, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect6);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad as 0
    OH_Drawing_Rect *rect7 = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_RoundRect *roundRect7 = OH_Drawing_RoundRectCreate(rect7, 0.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect7, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect7);

    // 8. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad as 0
    OH_Drawing_Rect *rect8 = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_RoundRect *roundRect8 = OH_Drawing_RoundRectCreate(rect8, 1.0f, 0.0f);
    // add assert
    EXPECT_NE(roundRect8, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect8);

    // 9. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RoundRectDestroy(roundRect4);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RoundRectDestroy(roundRect5);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RoundRectDestroy(roundRect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RoundRectDestroy(roundRect7);
    OH_Drawing_RectDestroy(rect8);
    OH_Drawing_RoundRectDestroy(roundRect8);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2102
 * @tc.name: testCanvasDrawRoundRectAbnormal
 * @tc.desc: test for testCanvasDrawRoundRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawRoundRectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to negative numbers
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, -100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, -200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, 200, -300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_CanvasDrawRoundRect creating rect with the horizontal
    // coordinate of the top-left corner equal to the horizontal coordinate of the bottom-right corner, or the vertical
    // coordinate of the top-left corner equal to the vertical coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(100, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(0, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates equal to the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with the top-left corner
    // coordinates greater than the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 6. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative xRad
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, -1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 7. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate creating roundRect with a
    // negative yRad
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 0.0f, -1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2103
 * @tc.name: testCanvasDrawRoundRectMaximum
 * @tc.desc: test for testCanvasDrawRoundRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawRoundRectMaximum, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawRoundRect with OH_Drawing_RoundRectCreate creating rect with left, top, right, bottom
    // being set to FLT_MAX
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, FLT_MAX, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, FLT_MAX, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    rect = OH_Drawing_RectCreate(10, 100, 200, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 3. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 1.0f);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 4. OH_Drawing_CanvasDrawRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad being
    // set to FLT_MAX
    rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, FLT_MAX);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2104
 * @tc.name: testCanvasDrawRoundRectInputDestroyed
 * @tc.desc: test for testCanvasDrawRoundRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawRoundRectInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2200
 * @tc.name: testCanvasDrawTextBlobNormal
 * @tc.desc: test for testCanvasDrawTextBlobNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawTextBlobNormal, TestSize.Level0) {
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
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 10);
    // 4. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2201
 * @tc.name: testCanvasDrawTextBlobNull
 * @tc.desc: test for testCanvasDrawTextBlobNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawTextBlobNull, TestSize.Level3) {
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
    OH_Drawing_CanvasDrawTextBlob(nullptr, textBlob, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawTextBlob with the second parameter being nullptr
    OH_Drawing_CanvasDrawTextBlob(canvas, nullptr, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawTextBlob with the third parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 0, 10);
    // 6. OH_Drawing_CanvasDrawTextBlob with the fourth parameter being 0
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, 0);
    // 7. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);

    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2202
 * @tc.name: testCanvasDrawTextBlobAbnormal
 * @tc.desc: test for testCanvasDrawTextBlobAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawTextBlobAbnormal, TestSize.Level3) {
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
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, -10, 10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to a
    // negative value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, -10);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2203
 * @tc.name: testCanvasDrawTextBlobMaximum
 * @tc.desc: test for testCanvasDrawTextBlobMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawTextBlobMaximum, TestSize.Level3) {
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
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, FLT_MAX, 10);
    // 4. Draw OH_Drawing_TextBlob on canvas with y-coordinate of the bottom left corner of the text object set to
    // maximum value
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, 10, FLT_MAX);
    // 5. Release memory
    OH_Drawing_TextBlobDestroy(textBlob);
    // 5. Release memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2204
 * @tc.name: testCanvasDrawTextBlobInputDestroyed
 * @tc.desc: test for testCanvasDrawTextBlobInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasDrawTextBlobInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2300
 * @tc.name: testCanvasClipRectNormal
 * @tc.desc: test for testCanvasClipRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with clipOp and doAntiAlias parameters, iterate through enum values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipRect(canvas, rect, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2301
 * @tc.name: testCanvasClipRectNull
 * @tc.desc: test for testCanvasClipRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRectNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasClipRect with the first parameter being nullptr
    OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasClipRect with the second parameter OH_Drawing_Rect created with left, top, right, and bottom
    // values being 0
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 10, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 0, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 0);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2302
 * @tc.name: testCanvasClipRectAbnormal
 * @tc.desc: test for testCanvasClipRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with negative values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, -10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, -100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, -100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the x-coordinate of the top-left corner is equal
    // to the x-coordinate of the bottom-right corner, or the y-coordinate of the top-left corner is equal to the
    // y-coordinate of the bottom-right corner
    rect = OH_Drawing_RectCreate(100, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are equal to the
    // bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created where the top-left corner coordinates are greater than
    // the bottom-right corner coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2303
 * @tc.name: testCanvasClipRectMaximum
 * @tc.desc: test for testCanvasClipRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRectMaximum, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRect with OH_Drawing_Rect created with extreme values for left, top, right, and bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, FLT_MAX, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, FLT_MAX, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2304
 * @tc.name: testCanvasClipRectInputDestroyed
 * @tc.desc: test for testCanvasClipRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRectInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2400
 * @tc.name: testCanvasClipRoundRectNormal
 * @tc.desc: test for testCanvasClipRoundRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRoundRectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with parameters clipOp and doAntiAlias, iterate through the enumeration values
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2401
 * @tc.name: testCanvasClipRoundRectNull
 * @tc.desc: test for testCanvasClipRoundRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRoundRectNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
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
    // 5. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with rect's left,
    // top, right, and bottom values all set to 0
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 10, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 0, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 6. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with all rect's
    // left, top, right, and bottom values set to 0
    rect2 = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with xRad set to 0
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 0, 10);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 8. OH_Drawing_CanvasClipRoundRect with the second parameter OH_Drawing_RoundRectCreate created with yRad set to 0
    rect2 = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    roundRect2 = OH_Drawing_RoundRectCreate(rect2, 10, 0);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 9. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2402
 * @tc.name: testCanvasClipRoundRectAbnormal
 * @tc.desc: test for testCanvasClipRoundRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRoundRectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRoundRect, pass negative values for left, top, right, and bottom when creating
    // OH_Drawing_RoundRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, -10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, -100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, -100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 3. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom
    // coordinates
    rect = OH_Drawing_RectCreate(100, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 4. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates equal to right-bottom
    // coordinates
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 5. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with left-top coordinates greater than right-bottom
    // coordinates
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 6. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative xRad
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, -10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 7. OH_Drawing_CanvasClipRoundRect, pass OH_Drawing_RoundRect with negative yRad
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, -10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);

    // 8. Release memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2403
 * @tc.name: testCanvasClipRoundRectMaximum
 * @tc.desc: test for testCanvasClipRoundRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRoundRectMaximum, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClipRoundRect, pass extreme values for left, top, right, and bottom when creating
    // OH_Drawing_RoundRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, FLT_MAX, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, FLT_MAX, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    rect = OH_Drawing_RectCreate(10, 10, 100, FLT_MAX);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 3. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for xRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 10);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 4. OH_Drawing_CanvasClipRoundRect, pass FLT_MAX for yRad when creating OH_Drawing_RoundRect
    rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 10, FLT_MAX);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasClipRoundRect(canvas, roundRect, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2404
 * @tc.name: testCanvasClipRoundRectInputDestroyed
 * @tc.desc: test for testCanvasClipRoundRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipRoundRectInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2500
 * @tc.name: testCanvasClipPathNormal
 * @tc.desc: test for testCanvasClipPathNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipPathNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100, 0);
    OH_Drawing_PathLineTo(path, 100, 100);
    OH_Drawing_PathLineTo(path, 0, 100);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, 10, 10, 100, 100, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. OH_Drawing_CanvasClipPath
    OH_Drawing_CanvasClipOp clipOp[] = {OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipPath(canvas, path, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2501
 * @tc.name: testCanvasClipPathNull
 * @tc.desc: test for testCanvasClipPathNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipPathNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, 100, 0);
    OH_Drawing_PathLineTo(path, 100, 100);
    OH_Drawing_PathLineTo(path, 0, 100);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, 10, 10, 100, 100, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2502
 * @tc.name: testCanvasClipPathInputDestroyed
 * @tc.desc: test for testCanvasClipPathInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasClipPathInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2600
 * @tc.name: testCanvasRotateNormal
 * @tc.desc: test for testCanvasRotateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate, rotate degrees with values 0, 180, 360
    float degrees[] = {0, 180, 360};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasRotate(canvas, degrees[i], 10, 10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2601
 * @tc.name: testCanvasRotateNull
 * @tc.desc: test for testCanvasRotateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with the first parameter being null
    OH_Drawing_CanvasRotate(nullptr, 0, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasRotate with the third parameter being 0
    OH_Drawing_CanvasRotate(canvas, 0, 0, 10);
    // 4. OH_Drawing_CanvasRotate with the fourth parameter being 0
    OH_Drawing_CanvasRotate(canvas, 0, 10, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2602
 * @tc.name: testCanvasRotateAbnormal
 * @tc.desc: test for testCanvasRotateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with negative degrees input
    OH_Drawing_CanvasRotate(canvas, -180, 10, 10);
    // 3. OH_Drawing_CanvasRotate with degrees input greater than 360
    OH_Drawing_CanvasRotate(canvas, 370, 10, 10);
    // 4. OH_Drawing_CanvasRotate with negative px input for rotation center
    OH_Drawing_CanvasRotate(canvas, 180, -10, 10);
    // 5. OH_Drawing_CanvasRotate with negative py input for rotation center
    OH_Drawing_CanvasRotate(canvas, 180, 10, -10);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2603
 * @tc.name: testCanvasRotateMaximum
 * @tc.desc: test for testCanvasRotateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with maximum rotation angle degrees input
    OH_Drawing_CanvasRotate(canvas, FLT_MAX, 10, 10);
    // 3. OH_Drawing_CanvasRotate with maximum x-coordinate px input for rotation center
    OH_Drawing_CanvasRotate(canvas, 180, FLT_MAX, 10);
    // 4. OH_Drawing_CanvasRotate with maximum y-coordinate py input for rotation center
    OH_Drawing_CanvasRotate(canvas, 180, 10, FLT_MAX);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2604
 * @tc.name: testCanvasRotateInputDestroyed
 * @tc.desc: test for testCanvasRotateInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2605
 * @tc.name: testCanvasRotateMultipleCalls
 * @tc.desc: test for testCanvasRotateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasRotateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasRotate 10 times, each time with different rotation angles and rotation center
    // coordinates
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasRotate(canvas, i * 10, i * 10, i * 10);
        // 3. Call drawing class interface
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2700
 * @tc.name: testCanvasTranslateNormal
 * @tc.desc: test for testCanvasTranslateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateNormal, TestSize.Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate
    OH_Drawing_CanvasTranslate(canvas, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2701
 * @tc.name: testCanvasTranslateNull
 * @tc.desc: test for testCanvasTranslateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateNull, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the first parameter being null
    OH_Drawing_CanvasTranslate(nullptr, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasTranslate with the second parameter being 0
    OH_Drawing_CanvasTranslate(canvas, 0, 10);
    // 4. OH_Drawing_CanvasTranslate with the third parameter being 0
    OH_Drawing_CanvasTranslate(canvas, 10, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2702
 * @tc.name: testCanvasTranslateAbnormal
 * @tc.desc: test for testCanvasTranslateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with negative movement distance dx in the x-axis direction
    OH_Drawing_CanvasTranslate(canvas, -10, 10);
    // 3. OH_Drawing_CanvasTranslate with negative movement distance dy in the y-axis direction
    OH_Drawing_CanvasTranslate(canvas, 10, -10);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2703
 * @tc.name: testCanvasTranslateMaximum
 * @tc.desc: test for testCanvasTranslateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the movement distance dx in the x-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, FLT_MAX, 10);
    // 3. OH_Drawing_CanvasTranslate with the movement distance dy in the y-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, 10, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2704
 * @tc.name: testCanvasTranslateInputDestroyed
 * @tc.desc: test for testCanvasTranslateInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2705
 * @tc.name: testCanvasTranslateMultipleCalls
 * @tc.desc: test for testCanvasTranslateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasTranslateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasTranslate 10 times, each time with different movement distances
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasTranslate(canvas, i * 10, i * 10);
        // 3. Call drawing class interface
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2800
 * @tc.name: testCanvasScaleNormal
 * @tc.desc: test for testCanvasScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleNormal, TestSize.Level0) {
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas
    OH_Drawing_CanvasScale(canvas, 2.0, 2.0);

    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2801
 * @tc.name: testCanvasScaleNull
 * @tc.desc: test for testCanvasScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleNull, TestSize.Level3) {
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the first parameter being null
    OH_Drawing_CanvasScale(nullptr, 2.0, 2.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Scale the canvas, with the second parameter being 0
    OH_Drawing_CanvasScale(canvas, 0, 2.0);

    // 4. Scale the canvas, with the third parameter being 0
    OH_Drawing_CanvasScale(canvas, 2.0, 0);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2802
 * @tc.name: testCanvasScaleAbnormal
 * @tc.desc: test for testCanvasScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleAbnormal, TestSize.Level3) {
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with a negative scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, -2.0, 2.0);

    // 3. Scale the canvas, with a negative scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, 2.0, -2.0);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2803
 * @tc.name: testCanvasScaleMaximum
 * @tc.desc: test for testCanvasScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleMaximum, TestSize.Level3) {
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the maximum scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, DBL_MAX, 2.0);

    // 3. Scale the canvas, with the maximum scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, 2.0, DBL_MAX);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2804
 * @tc.name: testCanvasScaleInputDestroyed
 * @tc.desc: test for testCanvasScaleInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2805
 * @tc.name: testCanvasScaleMultipleCalls
 * @tc.desc: test for testCanvasScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart3Test, testCanvasScaleMultipleCalls, TestSize.Level3) {
    // 1. Create a canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasScale 10 times, each time with different compression ratios
    for (int i = 1; i <= 10; i++) {
        OH_Drawing_CanvasScale(canvas, i * 1.0, i * 1.0);
    }

    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 10, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS