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
class DrawingNativeCanvasPart4Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasPart4Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart4Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasPart4Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart4Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testCanvasSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2900
 * @tc.desc   test for testCanvasSkewNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with positive skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, 1.0, 1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect1);
    // 4. OH_Drawing_CanvasSkew with negative skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, -1.0, -1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call drawing class interface
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    // 6. OH_Drawing_CanvasSkew with positive skew value on the x-axis and negative skew value on the y-axis
    OH_Drawing_CanvasSkew(canvas, 1.0, -1.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Call drawing class interface
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect3);
    // 8. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2901
 * @tc.desc   test for testCanvasSkewNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the first parameter as null
    OH_Drawing_CanvasSkew(nullptr, 2, 2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasSkew with the second parameter as 0
    OH_Drawing_CanvasSkew(canvas, 0, 2);
    // 4. OH_Drawing_CanvasSkew with the third parameter as 0
    OH_Drawing_CanvasSkew(canvas, 2, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2903
 * @tc.desc   test for testCanvasSkewMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the skew amount sx on the x-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, FLT_MAX, 1);
    // 3. OH_Drawing_CanvasSkew with the skew amount sy on the y-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, 1, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSkewInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2904
 * @tc.desc   test for testCanvasSkewInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_2905
 * @tc.desc   test for testCanvasSkewMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSkewMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasSkew 10 times, each time with a different skew value
    for (int i = 0; i < 10; i++) {
        float skew = i * 0.1;
        OH_Drawing_CanvasSkew(canvas, skew, skew);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3000
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas using OH_Drawing_CanvasBind, and verify the canvas information by
    // calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
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
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3001
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
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
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3002
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
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
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < 10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, 200 + 90);
        EXPECT_EQ(canvasHeight, 200 + 90);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3003
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3004
 * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < 10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3100
 * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
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
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3101
 * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
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
    rect = OH_Drawing_RectCreate(0, 100, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 0, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 100, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 6. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with all values as 0
    rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3102
 * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with negative values for left, top, right,
    // and bottom
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(-100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect1);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100, -100, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(100, 100, -100, 100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect3);
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(100, 100, 100, -100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect4);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate or the top-left coordinate equal to the bottom-right coordinate
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(100, 200, 200, 200);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect5);
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(200, 100, 200, 200);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect6);
    // 4. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate
    OH_Drawing_Rect *rect7 = OH_Drawing_RectCreate(100, 100, 100, 100);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect7);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate greater than
    // the bottom-right coordinate
    OH_Drawing_Rect *rect8 = OH_Drawing_RectCreate(200, 200, 100, 100);
    // add assert
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect8);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_RectDestroy(rect6);
    OH_Drawing_RectDestroy(rect7);
    OH_Drawing_RectDestroy(rect8);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3103
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200;
        uint32_t height = 200;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i * 10;
        uint32_t height = 200 + i * 10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3104
 * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3105
 * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetLocalClipBoundsMultipleCallsBoundary, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    uint32_t width = 4096;
    uint32_t height = 2160;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 4. Call OH_Drawing_CanvasGetLocalClipBounds 10 times to verify the canvas
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3200
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    EXPECT_NE(totalMatrix, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(totalMatrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasConcatMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3201
 * @tc.desc   test for testCanvasConcatMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
}

/**
 * @tc.name   testCanvasGetTotalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3202
 * @tc.desc   test for testCanvasGetTotalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetTotalMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3203
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreateScale
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    // 4. OH_Drawing_MatrixCreateRotation
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 5. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix2, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
    // 6. OH_Drawing_MatrixCreateTranslation
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 7. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    // OH_Drawing_CanvasGetTotalMatrix
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(totalMatrix3, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    // 8. Repeat steps 2-7 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10, 10, 10, 10);
        // add assert
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
        OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);

        OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 1, 1);
        // add assert
        EXPECT_NE(matrix2, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
        OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix2, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);

        OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(10, 10);
        // add assert
        EXPECT_NE(matrix3, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
        OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(totalMatrix3, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);

        OH_Drawing_MatrixDestroy(matrix);
        OH_Drawing_MatrixDestroy(matrix2);
        OH_Drawing_MatrixDestroy(matrix3);
        OH_Drawing_MatrixDestroy(totalMatrix);
        OH_Drawing_MatrixDestroy(totalMatrix2);
        OH_Drawing_MatrixDestroy(totalMatrix3);
    }
    // 9. Call OH_Drawing_CanvasConcatMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    }

    // 10. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
}

/**
 * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3204
 * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasDrawShadowNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3300
 * @tc.desc   test for testCanvasDrawShadowNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, iterate through the OH_Drawing_CanvasShadowFlags enumeration values
    OH_Drawing_CanvasShadowFlags flags[] = {
        SHADOW_FLAGS_NONE,
        SHADOW_FLAGS_TRANSPARENT_OCCLUDER,
        SHADOW_FLAGS_GEOMETRIC_ONLY,
        SHADOW_FLAGS_ALL,
    };
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    for (int i = 0; i < 4; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, flags[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3301
 * @tc.desc   test for testCanvasDrawShadowNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow with the first parameter as null
    OH_Drawing_Point3D p1{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(nullptr, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawShadow with the second parameter as null
    OH_Drawing_CanvasDrawShadow(canvas, nullptr, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawShadow with the third parameter as null
    // Unable to test, compilation error
    // 6. OH_Drawing_CanvasDrawShadow with the fourth parameter as null
    // Unable to test, compilation error
    // 7. OH_Drawing_CanvasDrawShadow with the fifth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 0, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 8. OH_Drawing_CanvasDrawShadow with the sixth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0, 0xFF000000, SHADOW_FLAGS_ALL);
    // 9. OH_Drawing_CanvasDrawShadow with the seventh parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0, SHADOW_FLAGS_ALL);
    // 10. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3302
 * @tc.desc   test for testCanvasDrawShadowAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, the third parameter planeParams x, y, z are set to negative values
    OH_Drawing_Point3D p1{-1.0, -1.0, -1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, the fourth parameter devLightPos x, y, z are set to negative values
    OH_Drawing_Point3D p3{0.0, 0.0, 0.0};
    OH_Drawing_Point3D p4{-10.0, -10.0, -10.0};
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, the fifth parameter lightRadius is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, -10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, the sixth parameter ambientColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, -0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, the seventh parameter spotColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, 10, 0xFF000000, -0xFF000000, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3303
 * @tc.desc   test for testCanvasDrawShadowMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point3D p1{1.0, 1.0, 1.0};
    OH_Drawing_Point3D p2{10.0, 10.0, 10.0};
    // 3. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the planeParams parameter to maximum values
    p1 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the devLightPos parameter to maximum values
    p1 = {1.0, 1.0, 1.0};
    p2 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, set the lightRadius parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, FLT_MAX, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, set the ambientColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, set the spotColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 10, 0xFFFFFFFF, 0xFFFFFFFF, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawShadowInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3304
 * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawShadowInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasClearNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3400
 * @tc.desc   test for testCanvasClearNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
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
}

/**
 * @tc.name   testCanvasClearNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3401
 * @tc.desc   test for testCanvasClearNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the first parameter as null
    OH_Drawing_CanvasClear(nullptr, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3402
 * @tc.desc   test for testCanvasClearAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to a negative value
    OH_Drawing_CanvasClear(canvas, -1);
    // 3. OH_Drawing_CanvasClear with the parameter color set to a floating-point value
    // compile error, ignore
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3403
 * @tc.desc   test for testCanvasClearMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasClear 10 times, each time with a different color
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasClear(canvas, 0x11111111 + i * 10);
    }
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasClearInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3404
 * @tc.desc   test for testCanvasClearInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasClearMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3405
 * @tc.desc   test for testCanvasClearMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClearMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to the maximum value
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3500
 * @tc.desc   test for testCanvasSetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
}

/**
 * @tc.name   testCanvasSetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3501
 * @tc.desc   test for testCanvasSetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
}
/**
 * @tc.name   testCanvasSetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3502
 * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, and after each call, call OH_Drawing_MatrixGetValue to get the
    // matrix information
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        float val = OH_Drawing_MatrixGetValue(matrix, 0);
        EXPECT_EQ(val, 1);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSetMatrixInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3503
 * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasSetMatrixInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasResetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3600
 * @tc.desc   test for testCanvasResetMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasResetMatrix
    OH_Drawing_CanvasResetMatrix(canvas);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasResetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3601
 * @tc.desc   test for testCanvasResetMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_CanvasResetMatrix with a null parameter
    OH_Drawing_CanvasResetMatrix(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   testCanvasResetMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3603
 * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasResetMatrixMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, call OH_Drawing_CanvasResetMatrix 10 times, and get matrix
    // information using OH_Drawing_MatrixGetValue
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
    }
    for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        OH_Drawing_CanvasResetMatrix(canvas);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1);
    }
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawImageRectWithSrcNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3700
 * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawImageRectWithSrcNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_ImageCreate to create an image object
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    // 3. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    // 5. Call OH_Drawing_SamplingOptionsCreate to create a sampling options object
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
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
}

/**
 * @tc.name   testCanvasDrawImageRectWithSrcNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3701
 * @tc.desc   test for testCanvasDrawImageRectWithSrcNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawImageRectWithSrcNull, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
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
}

/**
 * @tc.name   testCanvasDrawImageRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3800
 * @tc.desc   test for testCanvasDrawImageRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawImageRectNormal, Function | SmallTest | Level0) {
    // 1. Create a canvas object using OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create an image object using OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 3. Create a rectangle object using OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Create a sampling options object using OH_Drawing_SamplingOptionsCreate
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
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
}

/**
 * @tc.name   testCanvasDrawImageRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3801
 * @tc.desc   test for testCanvasDrawImageRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawImageRectNull, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(OH_Drawing_FilterMode::FILTER_MODE_NEAREST,
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
}

/**
 * @tc.name   testCanvasDrawVerticesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3900
 * @tc.desc   test for testCanvasDrawVerticesNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawVerticesNormal, Function | SmallTest | Level0) {
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasDrawVertices with the second parameter iterating through the enum
    OH_Drawing_VertexMode mode[] = {VERTEX_MODE_TRIANGLES, VERTEX_MODE_TRIANGLES_STRIP, VERTEX_MODE_TRIANGLE_FAN};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, mode[i], 3, points_vertices, texs_vertices, colors, 3, indices,
                                      BLEND_MODE_COLOR);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Call OH_Drawing_CanvasDrawVertices with the ninth parameter iterating through the enum
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < 29; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3,
                                      indices, blendMode[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawVerticesNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3901
 * @tc.desc   test for testCanvasDrawVerticesNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawVerticesNull, Function | SmallTest | Level3) {
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 1. Call OH_Drawing_CanvasDrawVertices with the first parameter as nullptr
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 0, points_vertices, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasDrawVertices with the fourth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, nullptr, texs_vertices, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_CanvasDrawVertices with the fifth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, nullptr, colors, 3, indices,
                                  BLEND_MODE_COLOR);
    // 5. Call OH_Drawing_CanvasDrawVertices with the sixth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, nullptr, 3, indices,
                                  BLEND_MODE_COLOR);
    // 6. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 0, indices,
                                  BLEND_MODE_COLOR);
    // 7. Call OH_Drawing_CanvasDrawVertices with the eighth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors, 3, nullptr,
                                  BLEND_MODE_COLOR);
    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawVerticesAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3902
 * @tc.desc   test for testCanvasDrawVerticesAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawVerticesAbnormal, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the third parameter
    // Compilation error, cannot pass a floating-point number

    // 3. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the seventh parameter
    // Compilation error, cannot pass a floating-point number

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawVerticesMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_3903
 * @tc.desc   test for testCanvasDrawVerticesMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawVerticesMaximum, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {100, 100};
    OH_Drawing_Point2D point_three = {300, 100};
    OH_Drawing_Point2D points_vertices[3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {1, 1};
    OH_Drawing_Point2D texs_three = {2, 0};
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    uint32_t colors[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[3] = {0, 1, 2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    if (0) {
        // todo cpp crash
        // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 0x7FFFFFFF, points_vertices, texs_vertices, colors,
                                      3, indices, BLEND_MODE_COLOR);
        // 3. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 3, points_vertices, texs_vertices, colors,
                                      0x7FFFFFFF, indices, BLEND_MODE_COLOR);
    }

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4000
 * @tc.desc   test for testCanvasReadPixelsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsNormal, Function | SmallTest | Level0) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4001
 * @tc.desc   test for testCanvasReadPixelsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsNull, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixels with the first parameter as nullptr
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(nullptr, &imageInfo, pixels, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasReadPixels with the second parameter as nullptr
    ret = OH_Drawing_CanvasReadPixels(canvas, nullptr, pixels, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasReadPixels with the third parameter as nullptr
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, nullptr, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsMismatch
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4002
 * @tc.desc   test for testCanvasReadPixelsMismatch.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsMismatch, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasReadPixelsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4003
 * @tc.desc   test for testCanvasReadPixelsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsAbnormal, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as a negative number or a floating-point number
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, -1, 0, 0);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 1.0f, 0, 0);
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 1.0f, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 1.0f);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4004
 * @tc.desc   test for testCanvasReadPixelsMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsMaximum, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as the maximum value 0xFFFFFFFF
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0xFFFFFFFF, 0, 0);
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0x7FFFFFFF, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0x7FFFFFFF);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4005
 * @tc.desc   test for testCanvasReadPixelsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsBoundary, Function | SmallTest | Level0) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4100
 * @tc.desc   test for testCanvasReadPixelsToBitmapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsToBitmapNormal, Function | SmallTest | Level0) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    uint32_t width = 200;
    uint32_t height = 200;
    OH_Drawing_BitmapFormat format{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &format);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 100, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4101
 * @tc.desc   test for testCanvasReadPixelsToBitmapNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsToBitmapNull, Function | SmallTest | Level3) {
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixelsToBitmap with the first parameter as null
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(nullptr, bitmap, 1, 1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasReadPixelsToBitmap with the second parameter as null
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, nullptr, 1, 1);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 0, 1);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 0);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4102
 * @tc.desc   test for testCanvasReadPixelsToBitmapAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsToBitmapAbnormal, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as a floating-point number
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1.0f, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 1.0f);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4103
 * @tc.desc   test for testCanvasReadPixelsToBitmapMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasReadPixelsToBitmapMaximum, Function | SmallTest | Level3) {
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter set to the maximum value 0x7FFFFFFF
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 0x7FFFFFFF, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter set to the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 1, 0x7FFFFFFF);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testCanvasDrawSingleCharacter
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4104
 * @tc.desc   test for testCanvasDrawSingleCharacter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawSingleCharacter, Function | SmallTest | Level1)
{
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    const char* strOne = "a";
    const char* strTwo = "你好";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    float x = 0.f;
    float y = 0.f;
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strOne, font, x, y), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strTwo, font, x, y), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(nullptr, strOne, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, nullptr, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strOne, nullptr, x, y),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    const char* strThree = "";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strThree, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawSingleCharacterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4200
 * @tc.desc   test for testCanvasDrawSingleCharacterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawSingleCharacterNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    //3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0xFFFFFFFF);
    //4. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //5. OH_Drawing_FontSetTextSize
    const float textSize = 10.f;
    OH_Drawing_FontSetTextSize(font, textSize);
    //6. OH_Drawing_CanvasDrawSingleCharacter parameter is normal, where str is a single character,UTF-8 encoded, and
    // Chinese/English characters are passed
    float x = 0.f;
    float y = 0.f;
    const char* str = "a";
    const char* str1 = "我";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str1, font, x, y);
    //7. OH_Drawing_CanvasDrawSingleCharacter parameters are entered normally, where str is a multi-character, UTF-8
    // encoded, and English/Chinese characters are in
    str = "abc";
    str1 = "你是谁";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str1, font, x, y);
    //8. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testCanvasDrawSingleCharacterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4201
 * @tc.desc   test for testCanvasDrawSingleCharacterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawSingleCharacterNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    //3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0xFFFFFFFF);
    //4. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //5. OH_Drawing_FontSetTextSize
    const float textSize = 10.f;
    OH_Drawing_FontSetTextSize(font, textSize);
    //6. OH_Drawing_CanvasDrawSingleCharacter parameter canvas is empty
    float x = 0.f;
    float y = 0.f;
    const char *str = "a";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(nullptr, str, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //7. OH_Drawing_CanvasDrawSingleCharacter parameter str is empty
    str = "";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    //8. OH_Drawing_CanvasDrawSingleCharacter parameter font is empty
    str = "a";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, str, nullptr, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //9. OH_Drawing_CanvasDrawSingleCharacter parameter str to 0 characters
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    //10.free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testCanvasDrawPointNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4300
 * @tc.desc   test for testCanvasDrawPointNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawPointNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_Point2D create an array of points
    OH_Drawing_Point2D texs_one = {0.0f, 0.0f};
    OH_Drawing_Point2D texs_two = {1.0f, 1.0f};
    OH_Drawing_Point2D texs_three = {2.0f, 2.0f};
    OH_Drawing_Point2D point_vertices[1] = {texs_one};
    for (int i = 0; i < 1; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &point_vertices[i]);
    }
    //3. OH_Drawing_Point2D create an array of multiple points
    OH_Drawing_Point2D texs_vertices[3] = {texs_one, texs_two, texs_three};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &texs_vertices[i]);
    }
    //4. free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPointNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4301
 * @tc.desc   test for testCanvasDrawPointNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawPointNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawPoint the first parameter is empty
    const OH_Drawing_Point2D point = {0.0f, 0.0f};
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasDrawPoint(nullptr, &point), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. OH_Drawing_CanvasDrawPoint the second parameter is empty
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasDrawPoint(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //4.free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPointMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4302
 * @tc.desc   test for testCanvasDrawPointMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawPointMultipleCalls, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvases[10];
    for (int i = 0; i < 10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    //2. Call OH_Drawing_CanvasDrawPoint 10 times
    OH_Drawing_Point2D point1 = {0.0f, 0.0f};
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDrawPoint(canvases[i], &point1);
    }
}

/**
 * @tc.name   testCanvasDrawColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4400
 * @tc.desc   test for testCanvasDrawColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawColorNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawColor enumeration traversal
    uint32_t color[3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < 29; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_CanvasDrawColor(canvas, color[j], blendMode[i]);
        }
    }
}

/**
 * @tc.name   testCanvasDrawColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4401
 * @tc.desc   test for testCanvasDrawColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawColorNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawColor with the first parameter as nullptr
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    uint32_t color = 0xFFFF0000;
    for (int i = 0; i < 29; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, color, blendMode[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    //3. OH_Drawing_CanvasDrawColor with the first parameter as 0
    for (int i = 0; i < 29; i++) {
        OH_Drawing_CanvasDrawColor(canvas, 0, blendMode[i]);
    }
    //4. free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawColorMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4402
 * @tc.desc   test for testCanvasDrawColorMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawColorMaximum, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawColor with the second parameter set to the maximum value
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    uint32_t color = 0x00000000;
    for (int i = 0; i < 29; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, color, blendMode[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    //3. free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawColorMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4403
 * @tc.desc   test for testCanvasDrawColorMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasDrawColorMultipleCalls, Function | SmallTest | Level3) {
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. Call OH_Drawing_CanvasDrawColor 10 times
    uint32_t color = 0xFFFF0000;
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,
    };
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDrawColor(canvas, color, blendMode[i]);
    }
    //3. free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasIsClipEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4500
 * @tc.desc   test for testCanvasIsClipEmptyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasIsClipEmptyNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. OH_Drawing_CanvasIsClipEmpty
    bool isClipEmpty[] = {true, false};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvas, &isClipEmpty[i]);
    }
    //5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/**
 * @tc.name   testCanvasIsClipEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4501
 * @tc.desc   test for testCanvasIsClipEmptyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasIsClipEmptyNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. OH_Drawing_CanvasIsClipEmpty with the first parameter as null
    bool isClipEmpty[] = {true, false};
    for (int i = 0; i < 2; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(nullptr, &isClipEmpty[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    //5. OH_Drawing_CanvasIsClipEmpty with the second parameter as null
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //6. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/**
 * @tc.name   testCanvasIsClipEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4502
 * @tc.desc   test for testCanvasIsClipEmptyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasIsClipEmptyMultipleCalls, Function | SmallTest | Level3) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. Call OH_Drawing_CanvasIsClipEmpty 10 times
    bool isClipEmpty = true;
    OH_Drawing_Canvas *canvases[10];
    for (int i = 0; i < 10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvases[i], &isClipEmpty);
    }
    //5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
}

/**
 * @tc.name   testCanvasGetImageInfoNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4600
 * @tc.desc   test for testCanvasGetImageInfoNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetImageInfoNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap *frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, (nullptr));
    //5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    //6. OH_Drawing_CanvasGetImageInfo
    OH_Drawing_CanvasGetImageInfo(canvas, &imageInfo);
    //7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
}

/**
 * @tc.name   testCanvasGetImageInfoNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4601
 * @tc.desc   test for testCanvasGetImageInfoNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetImageInfoNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap *frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, nullptr);
    //5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    //6. OH_Drawing_CanvasGetImageInfo with the first parameter as null
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(nullptr, &imageInfo), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //7. OH_Drawing_CanvasGetImageInfo with the second parameter as null
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //8. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
}

/**
 * @tc.name   testCanvasGetImageInfoMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4602
 * @tc.desc   test for testCanvasGetImageInfoMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasGetImageInfoMultipleCalls, Function | SmallTest | Level3) {
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap *frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, nullptr);
    //5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    //6. Call OH_Drawing_CanvasGetImageInfo 10 times
    OH_Drawing_Canvas *canvases[10];
    for (int i = 0; i < 10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasGetImageInfo(canvases[i], &imageInfo);
    }
    //7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
}

/**
 * @tc.name   testCanvasClipRegionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4700
 * @tc.desc   test for testCanvasClipRegionNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClipRegionNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    //2. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    //3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    //4. OH_Drawing_CanvasClipRegion
    OH_Drawing_CanvasClipRegion(canvas, region, clipOp);
    //5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testCanvasClipRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4701
 * @tc.desc   test for testCanvasClipRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClipRegionNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    //2. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    //3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    //4. OH_Drawing_CanvasClipRegion with the first parameter as nullptr
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(nullptr, region, clipOp), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //5. OH_Drawing_CanvasClipRegion with the second parameter as nullptr
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(canvas, nullptr, clipOp), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //6. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testCanvasClipRegionMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4702
 * @tc.desc   test for testCanvasClipRegionMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart4Test, testCanvasClipRegionMultipleCalls, Function | SmallTest | Level3) {
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvases[10];
    for (int i = 0; i < 10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    //2. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    //3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    //4. Call OH_Drawing_CanvasClipRegion 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasClipRegion(canvases[i], region, clipOp);
    }
    //5. free memory
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS