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

#include "include/DrawingNativeCanvasTest.h"
#include <cfloat>
#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasTestSetUp()
{
    std::cout << "DrawingNativeCanvasTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasTestTearDown()
{
    std::cout << "DrawingNativeCanvasTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasTest errorCodeReset after each test case." << std::endl;
}
/**
 * @tc.name   testCanvasDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0100
 * @tc.desc   test for testCanvasDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDestroyNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // step 2
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0200
 * @tc.desc   test for testCanvasDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDestroyNull()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_CanvasDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasBindNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0300
 * @tc.desc   test for testCanvasBindNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasBindNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_BITMAP_SIZE;
    constexpr uint32_t height = TEST_CANVAS_BITMAP_SIZE;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasBindNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0400
 * @tc.desc   test for testCanvasBindNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasBindNull()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_BITMAP_SIZE;
    constexpr uint32_t height = TEST_CANVAS_BITMAP_SIZE;
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

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasBindDestroyBitmap
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0500
 * @tc.desc   test for testCanvasBindNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasBindDestroyBitmap()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_BITMAP_SIZE;
    constexpr uint32_t height = TEST_CANVAS_BITMAP_SIZE;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    // step 4
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_RECT_X1, TEST_CANVAS_RECT_Y1, TEST_CANVAS_RECT_X2, TEST_CANVAS_RECT_Y2);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // step 5
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasBindMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0600
 * @tc.desc   test for testCanvasBindNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasBindMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = TEST_CANVAS_BITMAP_SIZE + i;
        uint32_t height = TEST_CANVAS_BITMAP_SIZE + i;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasBindBoundaryMultipleCallsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0700
 * @tc.desc   test for testCanvasBindBoundaryl.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasBindBoundaryMultipleCallsBoundary()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = static_cast<uint32_t>(TEST_CANVAS_4K_WIDTH);
        uint32_t height = static_cast<uint32_t>(TEST_CANVAS_4K_HEIGHT);
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachPenDetachPenNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0800
 * @tc.desc   test for testCanvasAttachPenDetachPenNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasAttachPenDetachPenNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_BITMAP_SIZE;
    constexpr uint32_t height = TEST_CANVAS_BITMAP_SIZE;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
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

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachPenDetachPenNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_0900
 * @tc.desc   test for testCanvasAttachPenDetachPenNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachPenDetachPenNull()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
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
    OH_Drawing_Canvas* canvas2 = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas2, nullptr);
    OH_Drawing_CanvasDetachPen(canvas2);

    // step 6
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_CanvasDestroy(canvas2);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachPenDetachPenMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1000
 * @tc.desc   test for testCanvasAttachPenDetachPenMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachPenDetachPenMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
    }

    // step 3
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 4
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachPenOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1100
 * @tc.desc   test for testCanvasAttachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachPenOnly()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    OH_Drawing_CanvasAttachPen(canvas, pen);

    // step 3
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDetachPenOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1200
 * @tc.desc   test for testCanvasDetachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDetachPenOnly()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachPen(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachPenDetachPenBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1300
 * @tc.desc   test for testCanvasAttachPenDetachPenBounday.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasAttachPenDetachPenBoundary()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = static_cast<uint32_t>(TEST_CANVAS_4K_WIDTH);
    constexpr uint32_t height = static_cast<uint32_t>(TEST_CANVAS_4K_HEIGHT);
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    OH_Drawing_CanvasAttachPen(canvas, pen);

    // step 4
    OH_Drawing_CanvasDetachPen(canvas);

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1400
 * @tc.desc   test for testCanvasAttachBrushDetachBrushNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachBrushDetachBrushNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_BITMAP_SIZE;
    constexpr uint32_t height = TEST_CANVAS_BITMAP_SIZE;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
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

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1500
 * @tc.desc   test for testCanvasAttachBrushDetachBrushNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachBrushDetachBrushNull()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
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
    OH_Drawing_Canvas* canvas2 = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas2, nullptr);
    OH_Drawing_CanvasDetachBrush(canvas2);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_CanvasDestroy(canvas2);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1600
 * @tc.desc   test for testCanvasAttachBrushDetachBrushMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachBrushDetachBrushMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
    }

    // step 3
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 4
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 5
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachBrushOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1700
 * @tc.desc   test for testCanvasAttachPenOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachBrushOnly()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    OH_Drawing_CanvasAttachBrush(canvas, brush);

    // step 3
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDetachBrushOnly
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1800
 * @tc.desc   test for testCanvasDetachBrushOnly.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDetachBrushOnly()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachBrush(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasAttachBrushDetachBrushBoudary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_1900
 * @tc.desc   test for testCanvasAttachBrushDetachBrushBoudary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasAttachBrushDetachBrushBoudary()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = static_cast<uint32_t>(TEST_CANVAS_4K_WIDTH);
    constexpr uint32_t height = static_cast<uint32_t>(TEST_CANVAS_4K_HEIGHT);
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasAttachBrush(canvas, brush);

    // step 4
    OH_Drawing_CanvasDetachBrush(canvas);

    // step 5
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSaveNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2000
 * @tc.desc   test for testCanvasSaveNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasSaveNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // step 3
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_300);

    // step 4
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_FORMAT_RGBA);

    // step 5
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2100
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSavetestCanvasGetSaveCountNull()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_CanvasSave(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(nullptr), TEST_PIXELMAP_NEGATIVE_0);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2200
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSavetestCanvasGetSaveCountMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSkew(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // step 3
    OH_Drawing_CanvasScale(canvas, TEST_CANVAS_SCALE, TEST_CANVAS_SCALE);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_FORMAT_RGBA);

    // step 4
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_SIZE_SMALL);

    // step 5
    OH_Drawing_CanvasRotate(canvas, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_WIDTH_5);

    // step 6
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_FORMAT_6 + i);
    }

    // step 7
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_200);
    OH_Drawing_RectDestroy(rect);

    // step 8
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSavetestCanvasGetSaveCountInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2300
 * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountInputDestroyed
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSavetestCanvasGetSaveCountInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();

    // Deprecated

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetSaveCountWhenNoSave
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2400
 * @tc.desc   test for testCanvasGetSaveCountWhenNoSave
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetSaveCountWhenNoSave()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // step 3
    OH_Drawing_CanvasScale(canvas, TEST_CANVAS_SCALE, TEST_CANVAS_SCALE);
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_20);
    OH_Drawing_CanvasRotate(canvas, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
    OH_Drawing_CanvasSave(canvas);

    // step 4
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // step 5
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300);
    OH_Drawing_CanvasDrawArc(canvas, rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSaveLayerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2500
 * @tc.desc   test for testCanvasSaveLayerNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasSaveLayerNormal()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // step 3
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSaveLayerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2600
 * @tc.desc   test for testCanvasSaveLayerNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSaveLayerNull()
{
    DrawingNativeCanvasTestSetUp();

    // step 1
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    OH_Drawing_CanvasSaveLayer(nullptr, rect, brush);

    // step 3
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect2, brush);
    OH_Drawing_RectDestroy(rect2);

    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect3, brush);
    OH_Drawing_RectDestroy(rect3);

    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_600);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect4, brush);
    OH_Drawing_RectDestroy(rect4);

    OH_Drawing_Rect* rect5 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_MATRIX_VALUE_0);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect5, brush);
    OH_Drawing_RectDestroy(rect5);

    // step 4
    OH_Drawing_Rect* rect6 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0);
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

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

// 拆分出的第一部分函数：负责初始化和执行测试
static void TestCanvasSaveLayerAbnormal_Part1(OH_Drawing_Canvas** canvas, OH_Drawing_Brush** brush)
{
    DrawingNativeCanvasTestSetUp();

    *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(*canvas, nullptr);

    *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(*brush, nullptr);

    // 1. 传入负数坐标
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(
        -TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect1, *brush);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, -TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect2, *brush);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, -TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect3, *brush);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_Rect* rect4 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, -TEST_CANVAS_COORD_600);
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect4, *brush);
    OH_Drawing_RectDestroy(rect4);

    // 2. 坐标相等 (线)
    OH_Drawing_Rect* rect5 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect5, *brush);
    OH_Drawing_RectDestroy(rect5);
    OH_Drawing_Rect* rect6 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_500);
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect6, *brush);
    OH_Drawing_RectDestroy(rect6);

    // 3. 坐标完全相等 (点)
    OH_Drawing_Rect* rect7 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500);
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect7, *brush);
    OH_Drawing_RectDestroy(rect7);

    // 4. 左上角坐标大于右下角坐标
    OH_Drawing_Rect* rect8 = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500);
    EXPECT_NE(rect8, nullptr);
    OH_Drawing_CanvasSaveLayer(*canvas, rect8, *brush);
    OH_Drawing_RectDestroy(rect8);
}

// 拆分出的第二部分函数：负责清理
static void TestCanvasSaveLayerAbnormal_Part2(OH_Drawing_Canvas* canvas, OH_Drawing_Brush* brush)
{
    // 5. 释放内存
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();
}

/**
 * @tc.name   testCanvasSaveLayerAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2700
 * @tc.desc   test for testCanvasSaveLayerAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSaveLayerAbnormal()
{
    OH_Drawing_Canvas* canvas = nullptr;
    OH_Drawing_Brush* brush = nullptr;

    TestCanvasSaveLayerAbnormal_Part1(&canvas, &brush);
    TestCanvasSaveLayerAbnormal_Part2(canvas, brush);

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSaveLayerRestore
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2800
 * @tc.desc   test for testCanvasSaveLayerRestore.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasSaveLayerRestore()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate, OH_Drawing_RectCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states
    // for the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // 3. Use the restore interface OH_Drawing_CanvasRestore to discard any changes made to the matrix and clip region
    // and draw the bitmap.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasSaveLayerMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_2900
 * @tc.desc   test for testCanvasSaveLayerMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasSaveLayerMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer in a loop 10 times, configure different sizes of rects. After each call to the
    // interface, use OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for the canvas.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
            TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300 + i, TEST_CANVAS_COORD_600 + i);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + TEST_PIXELMAP_VERT_OFFSET_2);
        OH_Drawing_RectDestroy(rect);
    }

    // 3. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3000
 * @tc.desc   test for testCanvasRestoreNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasRestoreNormal()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // 3. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3100
 * @tc.desc   test for testCanvasRestoreNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreNull()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // 3. Use OH_Drawing_CanvasRestore with no arguments, and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    OH_Drawing_CanvasRestore(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_2);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3200
 * @tc.desc   test for testCanvasRestoreMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + TEST_PIXELMAP_VERT_OFFSET_2);
    }

    // 3. Call OH_Drawing_CanvasRestore 11 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < TEST_LOOP_COUNT_11; i++) {
        OH_Drawing_CanvasRestore(canvas);
        if (TEST_LOOP_COUNT_10 - i <= 0) {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);
        } else {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_LOOP_COUNT_10 - i);
        }
    }

    // 4. Call OH_Drawing_CanvasSave, then call OH_Drawing_CanvasRestore, and finally call OH_Drawing_CanvasGetSaveCount
    // to retrieve the number of saved states for the canvas.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 5. Repeat step 4 for 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);
    }

    // 6. Release memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreBeforeSave
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3300
 * @tc.desc   test for testCanvasRestoreBeforeSave.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreBeforeSave()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 3. Call OH_Drawing_CanvasRestore multiple times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);
    }

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3400
 * @tc.desc   test for testCanvasRestoreInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();

    // Deprecated

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreExceededSaveSavelayerTimes
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3500
 * @tc.desc   test for testCanvasRestoreExceededSaveSavelayerTimes.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreExceededSaveSavelayerTimes()
{
    DrawingNativeCanvasTestSetUp();

    // 1、OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_500, TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2、Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + TEST_PIXELMAP_VERT_OFFSET_2);
    }

    // 3、Use OH_Drawing_CanvasTranslate, OH_Drawing_CanvasScale, and OH_Drawing_CanvasSkew to modify the canvas status.
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    OH_Drawing_CanvasScale(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    OH_Drawing_CanvasSkew(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);

    // 4、Call OH_Drawing_CanvasSaveLayer 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERTICES_SIZE_12 + i);
    }

    // 5、Call OH_Drawing_CanvasRestore more than 20 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states corresponding to the canvas status.
    for (int i = 0; i < TEST_LOOP_COUNT_20; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_DATA_LENGTH_20 - i);
    }

    // 6、Call OH_Drawing_CanvasSave -> OH_Drawing_CanvasSaveLayer -> Call OH_Drawing_CanvasRestore 3 times, and then
    // call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states corresponding to the canvas status.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 7、Repeat step 6 ten times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);
    }

    // 8、Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3600
 * @tc.desc   test for testCanvasRestoreToCountNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasRestoreToCountNormal()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and then use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + TEST_PIXELMAP_VERT_OFFSET_2);
    }

    // 3. Iterate through the parameter saveCount from 1 to the maximum number of canvas states, and use
    // OH_Drawing_CanvasRestoreToCount to restore the canvas to each state. Use OH_Drawing_CanvasGetSaveCount to
    // retrieve the number of saved states corresponding to the canvas status.
    for (int i = 1; i <= TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasRestoreToCount(canvas, i);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);
    }

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3700
 * @tc.desc   test for testCanvasRestoreToCountNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreToCountNull()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with the first parameter empty to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(nullptr, TEST_PIXELMAP_VERT_OFFSET_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with the second parameter as 0 to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, TEST_PIXELMAP_NEGATIVE_0);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3800
 * @tc.desc   test for testCanvasRestoreToCountAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreToCountAbnormal()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a negative value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, TEST_PIXELMAP_NEGATIVE_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with a floating-point value for the saveCount parameter to retrieve the
    // number of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, TEST_MATRIX_VALUE_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_3900
 * @tc.desc   test for testCanvasRestoreToCountMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreToCountMaximum()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a very large value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX_VALUE);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERT_OFFSET_1);

    // 3. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountExceeded
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4000
 * @tc.desc   test for testCanvasRestoreToCountExceeded.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreToCountExceeded()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + TEST_PIXELMAP_VERT_OFFSET_2);
    }

    // 3. Use OH_Drawing_CanvasRestoreToCount with a saveCount parameter greater than the maximum number of current
    // canvas states to retrieve the number of saved states corresponding to the canvas status using
    // OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX_VALUE);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), TEST_PIXELMAP_VERTICES_SIZE_11);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRestoreToCountInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4100
 * @tc.desc   test for testCanvasRestoreToCountInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRestoreToCountInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();

    // Deprecated

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawLineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4200
 * @tc.desc   test for testCanvasDrawLineNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawLineNormal()
{
    DrawingNativeCanvasTestSetUp();

    // 1. OH_Drawing_CanvasCreate
    // 2. OH_Drawing_CanvasDrawLine, passing floating-point coordinates
    // 3. OH_Drawing_CanvasDrawLine, passing integer coordinates
    // 4. Free memory
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasDrawLine(
        canvas, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_20, TEST_CANVAS_COORD_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
