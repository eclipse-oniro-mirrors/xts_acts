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
#include <cstdint>

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_1080 1080
#define DRAWING_NUMBER_1090 1090
#define DRAWING_NUMBER_1100 1100

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeCanvasTestPart6TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasTestPart6TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset after each test case." << std::endl;
}

int TestCanvasDrawSingleChaWithFeaturesNormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char *str1 = "DRAWING_NUMBER_1";
    const char *str2 = "H";
    const char *str3 = "a";
    const char *str4 = "你";
    const char *str5 = "（";
    const char *str6 = "(";
    const char *str7 = "{";
    const char *str8 = "龘";
    const char *str9 = "無";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float curX = DRAWING_NUMBER_100;
    float curY = DRAWING_NUMBER_100;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(features, nullptr);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str2, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str3, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str4, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str5, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str6, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str7, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str8, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str9, font, curX, curY, features),
        OH_DRAWING_SUCCESS);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawSingleChaWithFeaturesAbNormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    float curX = DRAWING_NUMBER_100;
    float curY = DRAWING_NUMBER_100;
    float textSize = DRAWING_NUMBER_50;
    const char *str = "(";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, 0xFF0000FF);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, textSize);
    OH_Drawing_FontFeatures* feat = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(feat, nullptr);
    OH_Drawing_ErrorCode code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(nullptr, str, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, nullptr, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, nullptr, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, -100.0f, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, -100.0f, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, curY, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, "", font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontFeaturesDestroy(feat);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawSingleChaWithFeaturesCalls()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char *str1 = "DRAWING_NUMBER_1";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float curX = DRAWING_NUMBER_100;
    float curY = DRAWING_NUMBER_100;
    int count = DRAWING_NUMBER_10;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    EXPECT_NE(features, nullptr);
    for (int i = 0; i < count; i++) {
        EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
            OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasResetClipNormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100.0f, 100.0f, 300.0f, 300.0f);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect1, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasResetClip(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100.0f, 100.0f, 500.0f, 500.0f);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasResetClipNull()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100.0f, 100.0f, 300.0f, 300.0f);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect1, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasResetClip(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100.0f, 100.0f, 500.0f, 500.0f);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasResetClipMultipleCalls()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100.0f, 100.0f, 300.0f, 300.0f);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_CanvasClipRect(canvas, rect1, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasResetClip(canvas);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100.0f, 100.0f, 500.0f, 500.0f);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect2);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawGlyphsNormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100.0f);
    EXPECT_NE(font, nullptr);
    int glyphIds[] = {DRAWING_NUMBER_1080, DRAWING_NUMBER_1090, DRAWING_NUMBER_1100};
    OH_Drawing_Point2D positions[] = {
        {DRAWING_NUMBER_100, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_200, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_300, DRAWING_NUMBER_100}
    };
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_FontDestroy(font);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawGlyphsNull()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100.0f);
    EXPECT_NE(font, nullptr);
    int glyphIds[] = {DRAWING_NUMBER_1080, DRAWING_NUMBER_1090, DRAWING_NUMBER_1100};
    OH_Drawing_Point2D positions[] = {
        {DRAWING_NUMBER_100, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_200, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_300, DRAWING_NUMBER_100}
    };
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawGlyphs(
        nullptr, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, nullptr, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, nullptr, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_FontDestroy(font);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawGlyphsAbnormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100.0f);
    EXPECT_NE(font, nullptr);
    int glyphIds[] = {DRAWING_NUMBER_1080, DRAWING_NUMBER_1090, DRAWING_NUMBER_1100};
    OH_Drawing_Point2D positions[] = {
        {DRAWING_NUMBER_100, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_200, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_300, DRAWING_NUMBER_100}
    };
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, -1, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, -DRAWING_NUMBER_1, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_2, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_2, 0, DRAWING_NUMBER_3, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, 0, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    errorCode = OH_Drawing_CanvasDrawGlyphs(
        canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, -DRAWING_NUMBER_1, font);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_FontDestroy(font);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasDrawGlyphsMultipleCalls()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 100.0f);
    EXPECT_NE(font, nullptr);
    int glyphIds[] = {DRAWING_NUMBER_1080, DRAWING_NUMBER_1090, DRAWING_NUMBER_1100};
    OH_Drawing_Point2D positions[] = {
        {DRAWING_NUMBER_100, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_200, DRAWING_NUMBER_100},
        {DRAWING_NUMBER_300, DRAWING_NUMBER_100}
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawGlyphs(
            canvas, glyphIds, DRAWING_NUMBER_3, 0, positions, DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3, font);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_FontDestroy(font);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsOpaqueNormal()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    int32_t width = DRAWING_NUMBER_256;
    int32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    bool isOpaque = false;
    uint32_t sizePix = width * height;
    std::vector<uint32_t> pixels(sizePix, 0);
    uint32_t rowBytes = width * DRAWING_NUMBER_4;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels.data(), rowBytes);
    OH_Drawing_Canvas *bitmapCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(bitmapCanvas, bitmap);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasIsOpaque(bitmapCanvas, &isOpaque);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isOpaque, true);
    OH_Drawing_CanvasDestroy(bitmapCanvas);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsOpaqueNull()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    int32_t width = DRAWING_NUMBER_256;
    int32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    bool isOpaque = false;
    uint32_t sizePix = width * height;
    std::vector<uint32_t> pixels(sizePix, 0);
    uint32_t rowBytes = width * DRAWING_NUMBER_4;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels.data(), rowBytes);
    OH_Drawing_Canvas *bitmapCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(bitmapCanvas, bitmap);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasIsOpaque(nullptr, &isOpaque);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isOpaque, false);
    errorCode = OH_Drawing_CanvasIsOpaque(bitmapCanvas, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isOpaque, false);
    OH_Drawing_CanvasDestroy(bitmapCanvas);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCanvasIsOpaqueMultipleCalls()
{
    DrawingNativeCanvasTestPart6TestSetUp();
    int32_t width = DRAWING_NUMBER_256;
    int32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    bool isOpaque = false;
    uint32_t sizePix = width * height;
    std::vector<uint32_t> pixels(sizePix, 0);
    uint32_t rowBytes = width * DRAWING_NUMBER_4;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels.data(), rowBytes);
    OH_Drawing_Canvas *bitmapCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(bitmapCanvas, bitmap);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasIsOpaque(bitmapCanvas, &isOpaque);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isOpaque, true);
    }
    OH_Drawing_CanvasDestroy(bitmapCanvas);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeCanvasTestPart6TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS