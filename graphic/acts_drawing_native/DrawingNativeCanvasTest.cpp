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
class DrawingNativeCanvasTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasTest errorCodeReset after each test case." << std::endl;
    }
};
/**
 * @tc.name   testCanvasDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0100
 * @tc.desc   test for testCanvasDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDestroyNormal, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // step 2
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0101
 * @tc.desc   test for testCanvasDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDestroyNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_CanvasDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testCanvasBindNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0200
 * @tc.desc   test for testCanvasBindNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasBindNormal, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasBindNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0201
 * @tc.desc   test for testCanvasBindNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasBindNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(nullptr, bitmap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // step 3
    OH_Drawing_CanvasBind(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // step 4
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasBindDestroyBitmap
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0202
 * @tc.desc   test for testCanvasBindNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasBindDestroyBitmap, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    // step 4
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // step 5
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasBindMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0203
 * @tc.desc   test for testCanvasBindNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasBindMultipleCalls, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 200 + i;
        uint32_t height = 200 + i;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasBindBoundaryMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0204
 * @tc.desc   test for testCanvasBindBoundaryl.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasBindBoundaryMultipleCallsBoundary, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = 4096;
        uint32_t height = 2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachPenDetachPenNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0300
 * @tc.desc   test for testCanvasAttachPenDetachPenNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachPenDetachPenNormal, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // step 4
    OH_Drawing_CanvasDetachPen(canvas);

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachPenDetachPenNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0301
 * @tc.desc   test for testCanvasAttachPenDetachPenNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachPenDetachPenNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    OH_Drawing_CanvasAttachPen(nullptr, pen);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // step 3
    OH_Drawing_CanvasAttachPen(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // step 4
    OH_Drawing_CanvasDetachPen(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // step 5
    OH_Drawing_Canvas *canvas2 = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas2, nullptr);
    OH_Drawing_CanvasDetachPen(canvas2);

    // step 6
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_CanvasDestroy(canvas2);
}

/**
 * @tc.name   testCanvasAttachPenDetachPenMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0302
 * @tc.desc   test for testCanvasAttachPenDetachPenMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachPenDetachPenMultipleCalls, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
    }

    // step 3
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 4
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachPenOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0303
 * @tc.desc   test for testCanvasAttachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachPenOnly, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    OH_Drawing_CanvasAttachPen(canvas, pen);

    // step 3
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDetachPenOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0304
 * @tc.desc   test for testCanvasDetachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDetachPenOnly, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachPen(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachPenDetachPenBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0305
 * @tc.desc   test for testCanvasAttachPenDetachPenBounday.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachPenDetachPenBoundary, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    OH_Drawing_CanvasAttachPen(canvas, pen);

    // step 4
    OH_Drawing_CanvasDetachPen(canvas);

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0400
 * @tc.desc   test for testCanvasAttachBrushDetachBrushNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachBrushDetachBrushNormal, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // step 4
    OH_Drawing_CanvasDetachBrush(canvas);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // step 5
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BitmapDestroy(bitmap);
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0401
 * @tc.desc   test for testCanvasAttachBrushDetachBrushNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachBrushDetachBrushNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasAttachBrush(nullptr, brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // step 3
    OH_Drawing_CanvasAttachBrush(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // step 4
    OH_Drawing_CanvasDetachBrush(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // step 5
    OH_Drawing_Canvas *canvas2 = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas2, nullptr);
    OH_Drawing_CanvasDetachBrush(canvas2);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0402
 * @tc.desc   test for testCanvasAttachBrushDetachBrushMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachBrushDetachBrushMultipleCalls, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
    }

    // step 3
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 4
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 5
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachBrushOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0403
 * @tc.desc   test for testCanvasAttachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachBrushOnly, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    OH_Drawing_CanvasAttachBrush(canvas, brush);

    // step 3
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDetachBrushOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0404
 * @tc.desc   test for testCanvasDetachBrushOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDetachBrushOnly, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachBrush(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushBoudary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0405
 * @tc.desc   test for testCanvasAttachBrushDetachBrushBoudary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasAttachBrushDetachBrushBoudary, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 4096;
    constexpr uint32_t height = 2160;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasAttachBrush(canvas, brush);

    // step 4
    OH_Drawing_CanvasDetachBrush(canvas);

    // step 5
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BitmapDestroy(bitmap);
}

/**
 * @tc.name   testCanvasSaveNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0500
 * @tc.desc   test for testCanvasSaveNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveNormal, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // step 3
    OH_Drawing_CanvasTranslate(canvas, 300, 300);

    // step 4
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 3);

    // step 5
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, 10, 200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0501
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSavetestCanvasGetSaveCountNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_CanvasSave(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(nullptr), 0);
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0502
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSavetestCanvasGetSaveCountMultipleCalls, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSkew(canvas, 10, 20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // step 3
    OH_Drawing_CanvasScale(canvas, 0.5, 0.5);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 3);

    // step 4
    OH_Drawing_CanvasTranslate(canvas, 10, 20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 4);

    // step 5
    OH_Drawing_CanvasRotate(canvas, 10, 0, 0);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 5);

    // step 6
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 6 + i);
    }

    // step 7
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    OH_Drawing_CanvasDrawArc(canvas, rect, 10, 200);
    OH_Drawing_RectDestroy(rect);

    // step 8
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0503
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountInputDestroyed
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSavetestCanvasGetSaveCountInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasGetSaveCountWhenNoSave
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0504
 * @tc.desc   test for testCanvasGetSaveCountWhenNoSave
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasGetSaveCountWhenNoSave, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // step 3
    OH_Drawing_CanvasScale(canvas, 0.5, 0.5);
    OH_Drawing_CanvasTranslate(canvas, 10, 20);
    OH_Drawing_CanvasRotate(canvas, 10, 0, 0);
    OH_Drawing_CanvasSave(canvas);

    // step 4
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // step 5
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    OH_Drawing_CanvasDrawArc(canvas, rect, 10, 200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSaveLayerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0600
 * @tc.desc   test for testCanvasSaveLayerNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveLayerNormal, Function | SmallTest | Level0) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // step 3
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSaveLayerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0601
 * @tc.desc   test for testCanvasSaveLayerNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveLayerNull, Function | SmallTest | Level3) {
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    OH_Drawing_CanvasSaveLayer(nullptr, rect, brush);

    // step 3
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 500, 300, 600);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect2, brush);
    OH_Drawing_RectDestroy(rect2);

    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(200, 0, 300, 600);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect3, brush);
    OH_Drawing_RectDestroy(rect3);

    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(200, 500, 0, 600);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect4, brush);
    OH_Drawing_RectDestroy(rect4);

    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 500, 300, 0);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect5, brush);
    OH_Drawing_RectDestroy(rect5);

    // step 4
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect6, brush);
    OH_Drawing_RectDestroy(rect6);

    // step 5
    OH_Drawing_CanvasSaveLayer(canvas, rect, nullptr);

    // step 6
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSaveLayerAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0602
 * @tc.desc   test for testCanvasSaveLayerAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveLayerAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, negative numbers are passed for left, top, right,
    // and bottom.
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(-200, 500, 300, 600);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect1, brush);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(200, -500, 300, 600);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect2, brush);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(200, 500, -300, 600);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect3, brush);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(200, 500, 300, -600);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect4, brush);
    OH_Drawing_RectDestroy(rect4);

    // 3. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the horizontal coordinate of the top-left corner
    // of the rectangle is equal to the horizontal coordinate of the bottom-right corner, or the vertical coordinate of
    // the top-left corner of the rectangle is equal to the vertical coordinate of the bottom-right corner.
    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(200, 500, 200, 600);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect5, brush);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_Rect *rect6 = OH_Drawing_RectCreate(200, 500, 300, 500);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect6, brush);
    OH_Drawing_RectDestroy(rect6);

    // 4. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the coordinates of the top-left corner are equal
    // to the coordinates of the bottom-right corner.
    OH_Drawing_Rect *rect7 = OH_Drawing_RectCreate(200, 500, 200, 500);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect7, brush);
    OH_Drawing_RectDestroy(rect7);

    // 5. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the coordinates of the top-left corner are
    // greater than the coordinates of the bottom-right corner.
    OH_Drawing_Rect *rect8 = OH_Drawing_RectCreate(300, 600, 200, 500);
    // add assert
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect8, brush);
    OH_Drawing_RectDestroy(rect8);

    // 6. Release memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasSaveLayerRestore
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0603
 * @tc.desc   test for testCanvasSaveLayerRestore.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveLayerRestore, Function | SmallTest | Level2) {
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_RectCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states
    // for the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // 3. Use the restore interface OH_Drawing_CanvasRestore to discard any changes made to the matrix and clip region
    // and draw the bitmap.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testCanvasSaveLayerMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0604
 * @tc.desc   test for testCanvasSaveLayerMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasSaveLayerMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer in a loop 10 times, configure different sizes of rects. After each call to the
    // interface, use OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for the canvas.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300 + i, 600 + i);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + 2);
        OH_Drawing_RectDestroy(rect);
    }

    // 3. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testCanvasRestoreNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0700
 * @tc.desc   test for testCanvasRestoreNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // 3. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0701
 * @tc.desc   test for testCanvasRestoreNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // 3. Use OH_Drawing_CanvasRestore with no arguments, and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    OH_Drawing_CanvasRestore(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 2);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0702
 * @tc.desc   test for testCanvasRestoreMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + 2);
    }

    // 3. Call OH_Drawing_CanvasRestore 11 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < 11; i++) {
        OH_Drawing_CanvasRestore(canvas);
        if (10 - i <= 0) {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);
        } else {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 10 - i);
        }
    }

    // 4. Call OH_Drawing_CanvasSave, then call OH_Drawing_CanvasRestore, and finally call OH_Drawing_CanvasGetSaveCount
    // to retrieve the number of saved states for the canvas.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 5. Repeat step 4 for 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);
    }

    // 6. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreBeforeSave
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0703
 * @tc.desc   test for testCanvasRestoreBeforeSave.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreBeforeSave, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 3. Call OH_Drawing_CanvasRestore multiple times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);
    }

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0704
 * @tc.desc   test for testCanvasRestoreInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasRestoreExceededSaveSavelayerTimes
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0705
 * @tc.desc   test for testCanvasRestoreExceededSaveSavelayerTimes.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreExceededSaveSavelayerTimes, Function | SmallTest | Level3) {
    // 1、OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2、Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + 2);
    }

    // 3、Use OH_Drawing_CanvasTranslate, OH_Drawing_CanvasScale, and OH_Drawing_CanvasSkew to modify the canvas status.
    OH_Drawing_CanvasTranslate(canvas, 10, 10);
    OH_Drawing_CanvasScale(canvas, 10, 10);
    OH_Drawing_CanvasSkew(canvas, 10, 10);

    // 4、Call OH_Drawing_CanvasSaveLayer 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 12 + i);
    }

    // 5、Call OH_Drawing_CanvasRestore more than 20 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states corresponding to the canvas status.
    for (int i = 0; i < 20; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 20 - i);
    }

    // 6、Call OH_Drawing_CanvasSave -> OH_Drawing_CanvasSaveLayer -> Call OH_Drawing_CanvasRestore 3 times, and then
    // call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states corresponding to the canvas status.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 7、Repeat step 6 ten times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);
    }

    // 8、Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testCanvasRestoreToCountNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0800
 * @tc.desc   test for testCanvasRestoreToCountNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and then use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + 2);
    }

    // 3. Iterate through the parameter saveCount from 1 to the maximum number of canvas states, and use
    // OH_Drawing_CanvasRestoreToCount to restore the canvas to each state. Use OH_Drawing_CanvasGetSaveCount to
    // retrieve the number of saved states corresponding to the canvas status.
    for (int i = 1; i <= 10; i++) {
        OH_Drawing_CanvasRestoreToCount(canvas, i);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);
    }

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreToCountNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0801
 * @tc.desc   test for testCanvasRestoreToCountNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with the first parameter empty to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(nullptr, 1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with the second parameter as 0 to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, 0);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreToCountAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0802
 * @tc.desc   test for testCanvasRestoreToCountAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a negative value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, -1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with a floating-point value for the saveCount parameter to retrieve the
    // number of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, 1.0);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreToCountMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0803
 * @tc.desc   test for testCanvasRestoreToCountMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a very large value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 1);

    // 3. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreToCountExceeded
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0804
 * @tc.desc   test for testCanvasRestoreToCountExceeded.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountExceeded, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + 2);
    }

    // 3. Use OH_Drawing_CanvasRestoreToCount with a saveCount parameter greater than the maximum number of current
    // canvas states to retrieve the number of saved states corresponding to the canvas status using
    // OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), 11);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasRestoreToCountInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0805
 * @tc.desc   test for testCanvasRestoreToCountInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasRestoreToCountInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasDrawLineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0900
 * @tc.desc   test for testCanvasDrawLineNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawLineNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    // 2. OH_Drawing_CanvasDrawLine, passing floating-point coordinates
    // 3. OH_Drawing_CanvasDrawLine, passing integer coordinates
    // 4. Free memory
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasDrawLine(canvas, 0.0f, 0.0f, 20.0f, 20.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawLineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0901
 * @tc.desc   test for testCanvasDrawLineNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawLineNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an empty value for the first parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(nullptr, 0, 0, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Pass NULL for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 10, 20, 20);

    // 4. Pass NULL for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 10, 0, 20, 20);

    // 5. Pass NULL for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 10, 10, 0, 20);

    // 6. Pass NULL for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 10, 10, 20, 0);

    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawLineAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0902
 * @tc.desc   test for testCanvasDrawLineAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawLineAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a negative value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, -1, 0, 20, 20);

    // 3. Pass a negative value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, -1, 20, 20);

    // 4. Pass a negative value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, -20, 20);

    // 5. Pass a negative value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, 20, -20);

    // 6. The Y-coordinate (Y1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // X-coordinate (X2) of the end point, but the Y-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, 20, 21);

    // 7. The X-coordinate (X1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // Y-coordinate (Y2) of the starting point, but the X-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas, 0, 20, 21, 20);

    // 8. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are equal to the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas, 10, 10, 10, 10);

    // 9. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are greater than the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas, 100, 100, 20, 20);

    // 10. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawLineMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0903
 * @tc.desc   test for testCanvasDrawLineMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawLineMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a maximum value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, FLT_MAX, 0, 20, 20);

    // 3. Pass a maximum value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, FLT_MAX, 20, 20);

    // 4. Pass a maximum value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, FLT_MAX, 20);

    // 5. Pass a maximum value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, 20, FLT_MAX);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawLineInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_0904
 * @tc.desc   test for testCanvasDrawLineInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawLineInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

/**
 * @tc.name   testCanvasDrawPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1000
 * @tc.desc   test for testCanvasDrawPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPathNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    // 3. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 50.0f, 50.0f);

    // 4. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 50.0f);

    // 5. OH_Drawing_CanvasDrawPath
    OH_Drawing_CanvasDrawPath(canvas, path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testCanvasDrawPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1001
 * @tc.desc   test for testCanvasDrawPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPathNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    // 3. Pass null as the first argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(nullptr, path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass null as the second argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 5. Pass null path as the second argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(canvas, path);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testCanvasDrawPathInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1002
 * @tc.desc   test for testCanvasDrawPathInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPathInputDestroyed, Function | SmallTest | Level3) {
    // Deprecated
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
