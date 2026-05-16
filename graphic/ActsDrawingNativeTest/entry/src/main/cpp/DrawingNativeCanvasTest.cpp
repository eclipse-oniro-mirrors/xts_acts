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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_11 11
#define DRAWING_NUMBER_12 12
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_21 21
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_600 600
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_8888 8888

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestCanvasDestroyNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // step 2
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDestroyNull()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = nullptr;
    OH_Drawing_CanvasDestroy(nullptr);
    EXPECT_EQ(canvas, nullptr);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasBindNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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

int TestCanvasBindNull()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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

int TestCanvasBindDestroyBitmap()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas, bitmap);

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    // step 4
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // step 5
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasBindMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i;
        uint32_t height = DRAWING_NUMBER_200 + i;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasBindBoundaryMultipleCallsBoundary()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_4096;
        uint32_t height = DRAWING_NUMBER_2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachPenDetachPenNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachPenDetachPenNull()
{
    DrawingNativeCanvasTestSetUp();
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
    OH_Drawing_Canvas *canvasDRAWING_NUMBER_2 = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvasDRAWING_NUMBER_2, nullptr);
    OH_Drawing_CanvasDetachPen(canvasDRAWING_NUMBER_2);

    // step 6
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_CanvasDestroy(canvasDRAWING_NUMBER_2);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachPenDetachPenMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);

    // step 2
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
    }

    // step 3
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 4
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDetachPen(canvas);
    }

    // step 5
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachPenOnly()
{
    DrawingNativeCanvasTestSetUp();
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDetachPenOnly()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachPen(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachPenDetachPenBoundary()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_4096;
    constexpr uint32_t height = DRAWING_NUMBER_2160;
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachBrushDetachBrushNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachBrushDetachBrushNull()
{
    DrawingNativeCanvasTestSetUp();
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
    OH_Drawing_Canvas *canvasDRAWING_NUMBER_2 = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvasDRAWING_NUMBER_2, nullptr);
    OH_Drawing_CanvasDetachBrush(canvasDRAWING_NUMBER_2);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachBrushDetachBrushMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
    }

    // step 3
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 4
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDetachBrush(canvas);
    }

    // step 5
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachBrushOnly()
{
    DrawingNativeCanvasTestSetUp();
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDetachBrushOnly()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasDetachBrush(canvas);

    // step 3
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasAttachBrushDetachBrushBoudary()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_4096;
    constexpr uint32_t height = DRAWING_NUMBER_2160;
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // step 3
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_300, DRAWING_NUMBER_300);

    // step 4
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_3);

    // step 5
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawArc(canvas, rect, DRAWING_NUMBER_10, DRAWING_NUMBER_200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSavetestCanvasGetSaveCountNull()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_CanvasSave(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(nullptr), 0);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSavetestCanvasGetSaveCountMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // step 3
    OH_Drawing_CanvasScale(canvas, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_3);

    // step 4
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_20);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_4);

    // step 5
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_10, 0, 0);
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_5);

    // step 6
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_6 + i);
    }

    // step 7
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300);
    OH_Drawing_CanvasDrawArc(canvas, rect, DRAWING_NUMBER_10, DRAWING_NUMBER_200);
    OH_Drawing_RectDestroy(rect);

    // step 8
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSavetestCanvasGetSaveCountInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();
    // Deprecated
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetSaveCountWhenNoSave()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // step 3
    OH_Drawing_CanvasScale(canvas, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_20);
    OH_Drawing_CanvasRotate(canvas, DRAWING_NUMBER_10, 0, 0);
    OH_Drawing_CanvasSave(canvas);

    // step 4
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // step 5
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300);
    OH_Drawing_CanvasDrawArc(canvas, rect, DRAWING_NUMBER_10, DRAWING_NUMBER_200);
    OH_Drawing_RectDestroy(rect);

    // step 6
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveLayerNormal()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);

    // step 2
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // step 3
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveLayerNull()
{
    DrawingNativeCanvasTestSetUp();
    // step 1
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // step 2
    OH_Drawing_CanvasSaveLayer(nullptr, rect, brush);

    // step 3
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect2, brush);
    OH_Drawing_RectDestroy(rect2);

    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, 0, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect3, brush);
    OH_Drawing_RectDestroy(rect3);

    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, 0, DRAWING_NUMBER_600);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect4, brush);
    OH_Drawing_RectDestroy(rect4);

    OH_Drawing_Rect *rect5 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, 0);
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveLayerAbnormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);
    // 2. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, negative numbers are passed for left, top, right,
    // and bottom.
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(-DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, -DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, -DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    OH_Drawing_RectDestroy(rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, -DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    // 3. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the horizontal coordinate of the top-left corner
    // of the rectangle is equal to the horizontal coordinate of the bottom-right corner, or the vertical coordinate of
    // the top-left corner of the rectangle is equal to the vertical coordinate of the bottom-right corner.
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_200, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    // 4. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the coordinates of the top-left corner are equal
    // to the coordinates of the bottom-right corner.
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_200, DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    // 5. When creating OH_Drawing_Rect in OH_Drawing_CanvasSaveLayer, the coordinates of the top-left corner are
    // greater than the coordinates of the bottom-right corner.
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_300, DRAWING_NUMBER_600, DRAWING_NUMBER_200, DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    // 6. Release memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveLayerRestore()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_RectCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states
    // for the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // 3. Use the restore interface OH_Drawing_CanvasRestore to discard any changes made to the matrix and clip region
    // and draw the bitmap.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSaveLayerMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate, OH_Drawing_BrushCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2. Use OH_Drawing_CanvasSaveLayer in a loop 10 times, configure different sizes of rects. After each call to the
    // interface, use OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for the canvas.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300 + i,
                                                      DRAWING_NUMBER_600 + i);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + DRAWING_NUMBER_2);
        OH_Drawing_RectDestroy(rect);
    }

    // 3. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreNormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // 3. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreNull()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasSave and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasSave(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // 3. Use OH_Drawing_CanvasRestore with no arguments, and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    OH_Drawing_CanvasRestore(nullptr);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_2);

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreMultipleCalls()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + DRAWING_NUMBER_2);
    }

    // 3. Call OH_Drawing_CanvasRestore 11 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states for the canvas.
    for (int i = 0; i < DRAWING_NUMBER_11; i++) {
        OH_Drawing_CanvasRestore(canvas);
        if (DRAWING_NUMBER_10 - i <= 0) {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);
        } else {
            EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_10 - i);
        }
    }

    // 4. Call OH_Drawing_CanvasSave, then call OH_Drawing_CanvasRestore, and finally call OH_Drawing_CanvasGetSaveCount
    // to retrieve the number of saved states for the canvas.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 5. Repeat step 4 for 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);
    }

    // 6. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreBeforeSave()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestore and call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states for
    // the canvas.
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 3. Call OH_Drawing_CanvasRestore multiple times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states for the canvas.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);
    }

    // 4. Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();
    // Deprecated
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreExceededSaveSavelayerTimes()
{
    DrawingNativeCanvasTestSetUp();
    // 1、OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500, DRAWING_NUMBER_300, DRAWING_NUMBER_600);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 2、Call OH_Drawing_CanvasSave 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + DRAWING_NUMBER_2);
    }

    // 3、Use OH_Drawing_CanvasTranslate, OH_Drawing_CanvasScale, and OH_Drawing_CanvasSkew to modify the canvas status.
    OH_Drawing_CanvasTranslate(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    OH_Drawing_CanvasScale(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10);

    // 4、Call OH_Drawing_CanvasSaveLayer 10 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_12 + i);
    }

    // 5、Call OH_Drawing_CanvasRestore more than 20 times and then call OH_Drawing_CanvasGetSaveCount to retrieve the
    // number of saved states corresponding to the canvas status.
    for (int i = 0; i < DRAWING_NUMBER_20; i++) {
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_20 - i);
    }

    // 6、Call OH_Drawing_CanvasSave -> OH_Drawing_CanvasSaveLayer -> Call OH_Drawing_CanvasRestore 3 times, and then
    // call OH_Drawing_CanvasGetSaveCount to retrieve the number of saved states corresponding to the canvas status.
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_CanvasRestore(canvas);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 7、Repeat step 6 ten times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasSaveLayer(canvas, rect, brush);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_CanvasRestore(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);
    }

    // 8、Release memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountNormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and then use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + DRAWING_NUMBER_2);
    }

    // 3. Iterate through the parameter saveCount from 1 to the maximum number of canvas states, and use
    // OH_Drawing_CanvasRestoreToCount to restore the canvas to each state. Use OH_Drawing_CanvasGetSaveCount to
    // retrieve the number of saved states corresponding to the canvas status.
    for (int i = DRAWING_NUMBER_1; i <= DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasRestoreToCount(canvas, i);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);
    }

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountNull()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with the first parameter empty to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(nullptr, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with the second parameter as 0 to retrieve the number of saved states
    // corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, 0);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountAbnormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a negative value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, -DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 3. Use OH_Drawing_CanvasRestoreToCount with a floating-point value for the saveCount parameter to retrieve the
    // number of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountMaximum()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Use OH_Drawing_CanvasRestoreToCount with a very large value for the saveCount parameter to retrieve the number
    // of saved states corresponding to the canvas status using OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_1);

    // 3. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountExceeded()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasSave multiple times and use OH_Drawing_CanvasGetSaveCount to retrieve the number of
    // saved states corresponding to the canvas status.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSave(canvas);
        EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), i + DRAWING_NUMBER_2);
    }

    // 3. Use OH_Drawing_CanvasRestoreToCount with a saveCount parameter greater than the maximum number of current
    // canvas states to retrieve the number of saved states corresponding to the canvas status using
    // OH_Drawing_CanvasGetSaveCount.
    OH_Drawing_CanvasRestoreToCount(canvas, INT32_MAX);
    EXPECT_EQ(OH_Drawing_CanvasGetSaveCount(canvas), DRAWING_NUMBER_11);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasRestoreToCountInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();
    // Deprecated
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawLineNormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    // 2. OH_Drawing_CanvasDrawLine, passing floating-point coordinates
    // 3. OH_Drawing_CanvasDrawLine, passing integer coordinates
    // 4. Free memory
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasDrawLine(canvas, 0.0f, 0.0f, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawLineNull()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an empty value for the first parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(nullptr, 0, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Pass NULL for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 4. Pass NULL for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 5. Pass NULL for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10, 0, DRAWING_NUMBER_20);

    // 6. Pass NULL for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_20, 0);

    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawLineAbnormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a negative value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, -DRAWING_NUMBER_1, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 3. Pass a negative value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, -DRAWING_NUMBER_1, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 4. Pass a negative value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, -DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 5. Pass a negative value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, DRAWING_NUMBER_20, -DRAWING_NUMBER_20);

    // 6. The Y-coordinate (Y1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // X-coordinate (X2) of the end point, but the Y-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_21);

    // 7. The X-coordinate (X1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // Y-coordinate (Y2) of the starting point, but the X-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_21, DRAWING_NUMBER_20);

    // 8. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are equal to the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);

    // 9. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are greater than the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 10. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawLineMaximum()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a maximum value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, FLT_MAX, 0, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 3. Pass a maximum value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, FLT_MAX, DRAWING_NUMBER_20, DRAWING_NUMBER_20);

    // 4. Pass a maximum value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, FLT_MAX, DRAWING_NUMBER_20);

    // 5. Pass a maximum value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas, 0, 0, DRAWING_NUMBER_20, FLT_MAX);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawLineInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();
    // Deprecated
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPathNormal()
{
    DrawingNativeCanvasTestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    // 3. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);

    // 4. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_50);

    // 5. OH_Drawing_CanvasDrawPath
    OH_Drawing_CanvasDrawPath(canvas, path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PathDestroy(path);
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPathNull()
{
    DrawingNativeCanvasTestSetUp();
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
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPathInputDestroyed()
{
    DrawingNativeCanvasTestSetUp();
    // Deprecated
    DrawingNativeCanvasTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
