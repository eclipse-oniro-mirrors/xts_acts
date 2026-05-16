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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_29 29
#define DRAWING_NUMBER_32 32
#define DRAWING_NUMBER_90 90
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_8888 8888
#define DRAWING_NUMBER_0X1111111 0x11111111
#define DRAWING_NUMBER_0X7FFFFFFF 0x7FFFFFFF
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestCanvasSkewNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with positive skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect1);
    // 4. OH_Drawing_CanvasSkew with negative skew values on the x and y axes
    OH_Drawing_CanvasSkew(canvas, -DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call drawing class interface
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    // 6. OH_Drawing_CanvasSkew with positive skew value on the x-axis and negative skew value on the y-axis
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Call drawing class interface
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestCanvasSkewNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the first parameter as null
    OH_Drawing_CanvasSkew(nullptr, DRAWING_NUMBER_2, DRAWING_NUMBER_2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasSkew with the second parameter as 0
    OH_Drawing_CanvasSkew(canvas, 0, DRAWING_NUMBER_2);
    // 4. OH_Drawing_CanvasSkew with the third parameter as 0
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_2, 0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSkewMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasSkew with the skew amount sx on the x-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, FLT_MAX, DRAWING_NUMBER_1);
    // 3. OH_Drawing_CanvasSkew with the skew amount sy on the y-axis as the maximum value
    OH_Drawing_CanvasSkew(canvas, DRAWING_NUMBER_1, FLT_MAX);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSkewInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSkewMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasSkew 10 times, each time with a different skew value
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float skew = i * DRAWING_NUMBER_1;
        OH_Drawing_CanvasSkew(canvas, skew, skew);
    }
    // 3. Call drawing class interface
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetWidthtestCanvasGetHeightNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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

int TestCanvasGetWidthtestCanvasGetHeightNull()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetWidthtestCanvasGetHeightMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, width);
        EXPECT_EQ(canvasHeight, height);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    // 3. Switch the binding to different widths and heights of bitmap canvas 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        int32_t canvasWidth = OH_Drawing_CanvasGetWidth(canvas);
        int32_t canvasHeight = OH_Drawing_CanvasGetHeight(canvas);
        EXPECT_EQ(canvasWidth, DRAWING_NUMBER_200 + DRAWING_NUMBER_90);
        EXPECT_EQ(canvasHeight, DRAWING_NUMBER_200 + DRAWING_NUMBER_90);
    }

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetWidthtestCanvasGetHeightInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth after each switch
    constexpr uint32_t width = DRAWING_NUMBER_4096;
    constexpr uint32_t height = DRAWING_NUMBER_2160;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_CanvasBind(canvas, bitmap);
        OH_Drawing_BitmapDestroy(bitmap);
    }

    // 4. Call OH_Drawing_CanvasGetHeight and OH_Drawing_CanvasGetWidth 10 times to verify the canvas
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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

int TestCanvasGetLocalClipBoundsNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestCanvasGetLocalClipBoundsNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    rect = OH_Drawing_RectCreate(0, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetLocalClipBoundsAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect created with negative values for left, top, right,
    // and bottom
    OH_Drawing_Rect *rect1 =
        OH_Drawing_RectCreate(-DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect1);
    OH_Drawing_Rect *rect2 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, -DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect2);
    OH_Drawing_Rect *rect3 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, -DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect3, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect3);
    OH_Drawing_Rect *rect4 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, -DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect4, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect4);
    // 3. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate or the top-left coordinate equal to the bottom-right coordinate
    OH_Drawing_Rect *rect5 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect5, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect5);
    OH_Drawing_Rect *rect6 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect6, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect6);
    // 4. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate
    OH_Drawing_Rect *rect7 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect7, nullptr);
    OH_Drawing_CanvasGetLocalClipBounds(canvas, rect7);
    // 5. OH_Drawing_CanvasGetLocalClipBounds with OH_Drawing_Rect src created with the top-left coordinate greater than
    // the bottom-right coordinate
    OH_Drawing_Rect *rect8 =
        OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetLocalClipBoundsMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200;
        uint32_t height = DRAWING_NUMBER_200;
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
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
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetLocalClipBoundsInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetLocalClipBoundsMultipleCallsBoundary()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Switch the binding to a bitmap canvas with different widths and heights 10 times, and verify the canvas
    // information by calling OH_Drawing_CanvasGetLocalClipBounds after each switch
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasGetLocalClipBounds(canvas, rect);
    }
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasConcatMatrixtestCanvasGetTotalMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasConcatMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
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

int TestCanvasGetTotalMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void CanvasConcatMatrixAndCanvasGetTotalMatrixMultipleCalls(OH_Drawing_Canvas *canvas)
{
    // 8. Repeat steps 2-7 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Matrix *matrix =
            OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
        OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
        EXPECT_NE(totalMatrix, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
        OH_Drawing_Matrix *matrix2 =
            OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
        EXPECT_NE(matrix2, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
        OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
        EXPECT_NE(totalMatrix2, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
        OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
        EXPECT_NE(matrix3, nullptr);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
        OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
        EXPECT_NE(totalMatrix3, nullptr);
        OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
        OH_Drawing_MatrixDestroy(matrix);
        OH_Drawing_MatrixDestroy(matrix2);
        OH_Drawing_MatrixDestroy(matrix3);
        OH_Drawing_MatrixDestroy(totalMatrix);
        OH_Drawing_MatrixDestroy(totalMatrix2);
        OH_Drawing_MatrixDestroy(totalMatrix3);
    }
}

int TestCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreateScale
    OH_Drawing_Matrix *matrix =
        OH_Drawing_MatrixCreateScale(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(matrix, nullptr);
    // 3. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    OH_Drawing_Matrix *totalMatrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix);
    // 4. OH_Drawing_MatrixCreateRotation
    OH_Drawing_Matrix *matrix2 =
        OH_Drawing_MatrixCreateRotation(DRAWING_NUMBER_180, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    EXPECT_NE(matrix2, nullptr);
    // 5. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    OH_Drawing_CanvasConcatMatrix(canvas, matrix2);
    OH_Drawing_Matrix *totalMatrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix2, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix2);
    // 6. OH_Drawing_MatrixCreateTranslation
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateTranslation(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_NE(matrix3, nullptr);
    // 7. Call OH_Drawing_CanvasConcatMatrix to get the 3x3 matrix of the canvas by calling
    OH_Drawing_CanvasConcatMatrix(canvas, matrix3);
    OH_Drawing_Matrix *totalMatrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(totalMatrix3, nullptr);
    OH_Drawing_CanvasGetTotalMatrix(canvas, totalMatrix3);
    CanvasConcatMatrixAndCanvasGetTotalMatrixMultipleCalls(canvas);
    // 9. Call OH_Drawing_CanvasConcatMatrix 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    }
    // 10. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(totalMatrix);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawShadowNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    OH_Drawing_Point3D p1{0.0f, 0.0f, 0.0f};
    OH_Drawing_Point3D p2{DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10};
    for (int i = 0; i < sizeof(flags) / sizeof(flags[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, flags[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawShadowNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow with the first parameter as null
    OH_Drawing_Point3D p1{0.0f, 0.0f, 0.0f};
    OH_Drawing_Point3D p2{DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10};
    OH_Drawing_CanvasDrawShadow(nullptr, path, p1, p2, DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_CanvasDrawShadow with the second parameter as null
    OH_Drawing_CanvasDrawShadow(canvas, nullptr, p1, p2, DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasDrawShadow with the third parameter as null
    // Unable to test, compilation error
    // 6. OH_Drawing_CanvasDrawShadow with the fourth parameter as null
    // Unable to test, compilation error
    // 7. OH_Drawing_CanvasDrawShadow with the fifth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, 0, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 8. OH_Drawing_CanvasDrawShadow with the sixth parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, 0, 0xFF000000, SHADOW_FLAGS_ALL);
    // 9. OH_Drawing_CanvasDrawShadow with the seventh parameter as 0
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, 0xFF000000, 0, SHADOW_FLAGS_ALL);
    // 10. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawShadowAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 3. OH_Drawing_CanvasDrawShadow, the third parameter planeParams x, y, z are set to negative values
    OH_Drawing_Point3D p1{-DRAWING_NUMBER_1, -DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    OH_Drawing_Point3D p2{DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, the fourth parameter devLightPos x, y, z are set to negative values
    OH_Drawing_Point3D p3{0.0f, 0.0f, 0.0f};
    OH_Drawing_Point3D p4{-DRAWING_NUMBER_10, -DRAWING_NUMBER_10, -DRAWING_NUMBER_10};
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, the fifth parameter lightRadius is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, -DRAWING_NUMBER_10, 0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, the sixth parameter ambientColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, DRAWING_NUMBER_10, -0xFF000000, 0xFF000000, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, the seventh parameter spotColor is set to a negative value
    OH_Drawing_CanvasDrawShadow(canvas, path, p3, p4, DRAWING_NUMBER_10, 0xFF000000, -0xFF000000, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawShadowMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point3D p1{DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_Point3D p2{DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10};
    // 3. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the planeParams parameter to maximum values
    p1 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, DRAWING_NUMBER_0XFFFFFFFF,
                                DRAWING_NUMBER_0XFFFFFFFF, SHADOW_FLAGS_ALL);
    // 4. OH_Drawing_CanvasDrawShadow, set the x, y, z values in the devLightPos parameter to maximum values
    p1 = {DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    p2 = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, DRAWING_NUMBER_0XFFFFFFFF,
                                DRAWING_NUMBER_0XFFFFFFFF, SHADOW_FLAGS_ALL);
    // 5. OH_Drawing_CanvasDrawShadow, set the lightRadius parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, FLT_MAX, DRAWING_NUMBER_0XFFFFFFFF, DRAWING_NUMBER_0XFFFFFFFF,
                                SHADOW_FLAGS_ALL);
    // 6. OH_Drawing_CanvasDrawShadow, set the ambientColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, DRAWING_NUMBER_0XFFFFFFFF,
                                DRAWING_NUMBER_0XFFFFFFFF, SHADOW_FLAGS_ALL);
    // 7. OH_Drawing_CanvasDrawShadow, set the spotColor parameter to maximum value
    OH_Drawing_CanvasDrawShadow(canvas, path, p1, p2, DRAWING_NUMBER_10, DRAWING_NUMBER_0XFFFFFFFF,
                                DRAWING_NUMBER_0XFFFFFFFF, SHADOW_FLAGS_ALL);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawShadowInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear, covering the minimum value and the maximum value for color
    OH_Drawing_CanvasClear(canvas, 0x00000000);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasClear(canvas, DRAWING_NUMBER_0XFFFFFFFF);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearNull()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to a negative value
    OH_Drawing_CanvasClear(canvas, -DRAWING_NUMBER_1);
    // 3. OH_Drawing_CanvasClear with the parameter color set to a floating-point value
    // compile error, ignore
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasClear 10 times, each time with a different color
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasClear(canvas, DRAWING_NUMBER_0X1111111 + i * DRAWING_NUMBER_10);
    }
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClearMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasClear with the parameter color set to the maximum value
    OH_Drawing_CanvasClear(canvas, DRAWING_NUMBER_0XFFFFFFFF);
    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSetMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_CanvasSetMatrix and use OH_Drawing_MatrixGetValue to get the matrix information
    OH_Drawing_CanvasSetMatrix(canvas, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float val = OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(val, DRAWING_NUMBER_1);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSetMatrixNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
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
int TestCanvasSetMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, and after each call, call OH_Drawing_MatrixGetValue to get the
    // matrix information
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        float val = OH_Drawing_MatrixGetValue(matrix, 0);
        EXPECT_EQ(val, DRAWING_NUMBER_1);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasSetMatrixInputDestroyed()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasResetMatrixNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

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

int TestCanvasResetMatrixMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_CanvasSetMatrix 10 times, call OH_Drawing_CanvasResetMatrix 10 times, and get matrix
    // information using OH_Drawing_MatrixGetValue
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
    }
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    EXPECT_EQ(val, DRAWING_NUMBER_1);
    // 5. Repeat steps 4 for 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasSetMatrix(canvas, matrix);
        OH_Drawing_CanvasResetMatrix(canvas);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), DRAWING_NUMBER_1);
    }
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawImageRectWithSrcNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_ImageCreate to create an image object
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    // 3. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 4. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawImageRectWithSrcNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawImageRectNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object using OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create an image object using OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 3. Create a rectangle object using OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawImageRectNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawVerticesNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point_three = {DRAWING_NUMBER_300, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points_vertices[DRAWING_NUMBER_3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_Point2D texs_three = {DRAWING_NUMBER_2, 0};
    OH_Drawing_Point2D texs_vertices[DRAWING_NUMBER_3] = {texs_one, texs_two, texs_three};
    uint32_t colors[DRAWING_NUMBER_3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[DRAWING_NUMBER_3] = {0, DRAWING_NUMBER_1, DRAWING_NUMBER_2};
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasDrawVertices with the second parameter iterating through the enum
    OH_Drawing_VertexMode mode[] = {VERTEX_MODE_TRIANGLES, VERTEX_MODE_TRIANGLES_STRIP, VERTEX_MODE_TRIANGLE_FAN};
    for (int i = 0; i < sizeof(mode) / sizeof(mode[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, mode[i], DRAWING_NUMBER_3, points_vertices, texs_vertices, colors,
            DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
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
    for (int i = 0; i < DRAWING_NUMBER_29; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
            colors, DRAWING_NUMBER_3, indices, blendMode[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawVerticesNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point_three = {DRAWING_NUMBER_300, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points_vertices[DRAWING_NUMBER_3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_Point2D texs_three = {DRAWING_NUMBER_2, 0};
    OH_Drawing_Point2D texs_vertices[DRAWING_NUMBER_3] = {texs_one, texs_two, texs_three};
    uint32_t colors[DRAWING_NUMBER_3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[DRAWING_NUMBER_3] = {0, DRAWING_NUMBER_1, DRAWING_NUMBER_2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 1. Call OH_Drawing_CanvasDrawVertices with the first parameter as nullptr
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
        colors, DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, 0, points_vertices, texs_vertices, colors,
        DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasDrawVertices with the fourth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, nullptr, texs_vertices, colors,
        DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_CanvasDrawVertices with the fifth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, nullptr, colors,
        DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
    // 5. Call OH_Drawing_CanvasDrawVertices with the sixth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
        nullptr, DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
    // 6. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as 0
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
        colors, 0, indices, BLEND_MODE_COLOR);
    // 7. Call OH_Drawing_CanvasDrawVertices with the eighth parameter as nullptr
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
        colors, DRAWING_NUMBER_3, nullptr, BLEND_MODE_COLOR);
    // 8. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawVerticesAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawVerticesMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Point2D point_one = {0, 0};
    OH_Drawing_Point2D point_two = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point_three = {DRAWING_NUMBER_300, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points_vertices[DRAWING_NUMBER_3] = {point_one, point_two, point_three};

    OH_Drawing_Point2D texs_one = {0, 0};
    OH_Drawing_Point2D texs_two = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_Point2D texs_three = {DRAWING_NUMBER_2, 0};
    OH_Drawing_Point2D texs_vertices[DRAWING_NUMBER_3] = {texs_one, texs_two, texs_three};
    uint32_t colors[DRAWING_NUMBER_3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
    uint16_t indices[DRAWING_NUMBER_3] = {0, DRAWING_NUMBER_1, DRAWING_NUMBER_2};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    if (0) {
        // todo cpp crash
        // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_0X7FFFFFFF, points_vertices,
            texs_vertices, colors, DRAWING_NUMBER_3, indices, BLEND_MODE_COLOR);
        // 3. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as the maximum value 0x7FFFFFFF
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, DRAWING_NUMBER_3, points_vertices, texs_vertices,
            colors, DRAWING_NUMBER_0X7FFFFFFF, indices, BLEND_MODE_COLOR);
    }

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixels with the first parameter as nullptr
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsMismatch()
{
    DrawingNativeCanvasPart4TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as a negative number or a floating-point number
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, -DRAWING_NUMBER_1, 0, 0);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, DRAWING_NUMBER_1, 0, 0);
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, DRAWING_NUMBER_1, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, DRAWING_NUMBER_1);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as the maximum value DRAWING_NUMBER_0XFFFFFFFF
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, DRAWING_NUMBER_0XFFFFFFFF, 0, 0);
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, DRAWING_NUMBER_0X7FFFFFFF, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, DRAWING_NUMBER_0X7FFFFFFF);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsBoundary()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_4096;
    constexpr uint32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, 0, 0, 0);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsToBitmapNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    uint32_t width = DRAWING_NUMBER_200;
    uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapFormat format{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &format);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsToBitmapNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixelsToBitmap with the first parameter as null
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(nullptr, bitmap, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasReadPixelsToBitmap with the second parameter as null
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, nullptr, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, 0, DRAWING_NUMBER_1);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_1, 0);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsToBitmapAbnormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as a floating-point number
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_1, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasReadPixelsToBitmapMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter set to the maximum value 0x7FFFFFFF
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_0X7FFFFFFF, 0);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter set to the maximum value 0x7FFFFFFF
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, DRAWING_NUMBER_1, DRAWING_NUMBER_0X7FFFFFFF);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestCanvasDrawSingleCharacter()
{
    DrawingNativeCanvasPart4TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    const char* strOne = "a";
    const char* strTwo = "你好";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    float x = 0;
    float y = 0;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawSingleCharacterNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    //3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_0XFFFFFFFF);
    //4. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //5. OH_Drawing_FontSetTextSize
    const float textSize = DRAWING_NUMBER_10;
    OH_Drawing_FontSetTextSize(font, textSize);
    //6. OH_Drawing_CanvasDrawSingleCharacter parameter is normal, where str is a single character,UTF-8 encoded, and
    // Chinese/English characters are passed
    float x = 0;
    float y = 0;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawSingleCharacterNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    //3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_0XFFFFFFFF);
    //4. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //5. OH_Drawing_FontSetTextSize
    const float textSize = DRAWING_NUMBER_10;
    OH_Drawing_FontSetTextSize(font, textSize);
    //6. OH_Drawing_CanvasDrawSingleCharacter parameter canvas is empty
    float x = 0;
    float y = 0;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_Point2D create an array of points
    OH_Drawing_Point2D texs_one = {0.0f, 0.0f};
    OH_Drawing_Point2D texs_two = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_Point2D texs_three = {DRAWING_NUMBER_2, DRAWING_NUMBER_2};
    OH_Drawing_Point2D point_vertices[DRAWING_NUMBER_1] = {texs_one};
    for (int i = 0; i < DRAWING_NUMBER_1; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &point_vertices[i]);
    }
    //3. OH_Drawing_Point2D create an array of multiple points
    OH_Drawing_Point2D texs_vertices[DRAWING_NUMBER_3] = {texs_one, texs_two, texs_three};
    for (int i = 0; i < DRAWING_NUMBER_3; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &texs_vertices[i]);
    }
    //4. free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointNull()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawPointMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvases[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    //2. Call OH_Drawing_CanvasDrawPoint 10 times
    OH_Drawing_Point2D pointDRAWING_NUMBER_1 = {0.0f, 0.0f};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDrawPoint(canvases[i], &pointDRAWING_NUMBER_1);
    }
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawColorNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawColor enumeration traversal
    uint32_t color[DRAWING_NUMBER_3] = {0xFFFF0000, 0xFFFF0000, 0xFFFF0000};
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
    for (int i = 0; i < DRAWING_NUMBER_29; i++) {
        for (int j = 0; j < sizeof(color) / sizeof(color[0]); j++) {
            OH_Drawing_CanvasDrawColor(canvas, color[j], blendMode[i]);
        }
    }
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawColorNull()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    for (int i = 0; i < DRAWING_NUMBER_29; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, color, blendMode[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    //3. OH_Drawing_CanvasDrawColor with the first parameter as 0
    for (int i = 0; i < DRAWING_NUMBER_29; i++) {
        OH_Drawing_CanvasDrawColor(canvas, 0, blendMode[i]);
    }
    //4. free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawColorMaximum()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    //2. OH_Drawing_CanvasDrawColor with the second parameter set to the maximum value
    uint32_t color = DRAWING_NUMBER_0XFFFFFFFF;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawColor(canvas, color, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawColor(canvas, color, static_cast<OH_Drawing_BlendMode>(DRAWING_NUMBER_29));
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    //3. free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawColorMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDrawColor(canvas, color, blendMode[i]);
    }
    //3. free memory
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsClipEmptyNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. OH_Drawing_CanvasIsClipEmpty
    bool isClipEmpty[] = {true, false};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvas, &isClipEmpty[i]);
    }
    //5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsClipEmptyNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. OH_Drawing_CanvasIsClipEmpty with the first parameter as null
    bool isClipEmpty[] = {true, false};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsClipEmptyMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect  *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    //2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    //3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = {OH_Drawing_CanvasClipOp::DIFFERENCE};
    bool doAntiAlias[] = {true, false};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    //4. Call OH_Drawing_CanvasIsClipEmpty 10 times
    bool isClipEmpty = true;
    OH_Drawing_Canvas *canvases[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvases[i], &isClipEmpty);
    }
    //5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetImageInfoNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = DRAWING_NUMBER_3;
    const uint32_t padding = DRAWING_NUMBER_32;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetImageInfoNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = DRAWING_NUMBER_3;
    const uint32_t padding = DRAWING_NUMBER_32;
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasGetImageInfoMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    //2. OH_Drawing_BitmapGetPixels
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
    //3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    //4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = DRAWING_NUMBER_3;
    const uint32_t padding = DRAWING_NUMBER_32;
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
    OH_Drawing_Canvas *canvases[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasGetImageInfo(canvases[i], &imageInfo);
    }
    //7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRegionNormal()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRegionNull()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(canvas, nullptr, clipOp), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //6. The third parameter of the interface is an enumeration that is out of range.
    OH_Drawing_ErrorCode errCode =
        OH_Drawing_CanvasClipRegion(canvas, region, static_cast<OH_Drawing_CanvasClipOp>(DRAWING_NUMBER_2));
    EXPECT_EQ(errCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    //7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasClipRegionMultipleCalls()
{
    DrawingNativeCanvasPart4TestSetUp();
    //1. OH_Drawing_RectCreate
    OH_Drawing_Canvas *canvases[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        canvases[i]= OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasClipRegion(canvases[i], region, clipOp);
    }
    //5. free memory
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeCanvasPart4TestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS