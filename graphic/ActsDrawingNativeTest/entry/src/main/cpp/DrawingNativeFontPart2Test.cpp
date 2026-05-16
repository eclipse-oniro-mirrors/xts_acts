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

#include <cmath>
#include <random>
#include <vector>
#include "include/DrawingNativeFontTest.h"
#include "include/OhosCommonTest.h"

#define MAX_ALLOWED_SIZE 100
#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_13 13
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_29 29
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_35 35
#define DRAWING_NUMBER_37 37
#define DRAWING_NUMBER_40 40
#define DRAWING_NUMBER_42 42
#define DRAWING_NUMBER_47 47
#define DRAWING_NUMBER_48 48
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_58 58
#define DRAWING_NUMBER_60 60
#define DRAWING_NUMBER_71 71
#define DRAWING_NUMBER_87 87
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_110 110
#define DRAWING_NUMBER_126 126
#define DRAWING_NUMBER_129 129
#define DRAWING_NUMBER_158 158
#define DRAWING_NUMBER_160 160
#define DRAWING_NUMBER_187 187
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_251 251
#define DRAWING_NUMBER_277 277
#define DRAWING_NUMBER_400_1 400.1f
#define DRAWING_NUMBER_585 585
#define DRAWING_NUMBER_900 900
#define DRAWING_NUMBER_1234 1234
#define DRAWING_NUMBER_585007 585007
#define DRAWING_NUMBER_1000000 1000000
#define DRAWING_NUMBER_1234567890 1234567890

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeFontPart2TestSetUp()
{
    std::cout << "DrawingNativeFontPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeFontPart2TestTearDown()
{
    std::cout << "DrawingNativeFontPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart2Test errorCodeReset after each test case." << std::endl;
}

int TestFontArgumentsCreateNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsAddVariationNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -1.0f);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_400_1);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_900);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_1000000);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsAddVariationNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the first parameter is nullptr
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(nullptr, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is nullptr
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, nullptr, DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsAddVariationAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "WGHT", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "w", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsAddVariationMultipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_900);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0.0f);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -1.0f);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsDestoryNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(fontArguments);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsDestoryNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy, parameter is null
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontArgumentsDestoryMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_FontArguments *fontArguments = nullptr;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        fontArguments = OH_Drawing_FontArgumentsCreate();
    }
    // 2. OH_Drawing_FontCreate, OH_Drawing_FontArgumentsAddVariation
    OH_Drawing_ErrorCode drawingErrorCode1 = OH_DRAWING_ERROR_INVALID_PARAMETER;
    for (size_t i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontArguments *fontArguments1 = OH_Drawing_FontArgumentsCreate();
        drawingErrorCode1 = OH_Drawing_FontArgumentsDestroy(fontArguments1);
        EXPECT_EQ(drawingErrorCode1, OH_DRAWING_SUCCESS);
    }
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontSetThemeFontFollowedNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, false);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontSetThemeFontFollowedMuitipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
        drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    }
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontSetThemeFontFollowedNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(nullptr, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontIsThemeFontFollowedNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, false);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, true);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, false);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, false);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsThemeFontFollowedNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    OH_Drawing_ErrorCode drawingErrorCode1 = OH_DRAWING_SUCCESS;
    OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_SUCCESS;
    drawingErrorCode1 = OH_Drawing_FontIsThemeFontFollowed(nullptr, &followed);
    EXPECT_EQ(drawingErrorCode1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, nullptr);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsThemeFontFollowedMultipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    bool isFollowed[] = {true, false, false, true, true, true, false, false, true, false};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
        OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_ERROR_INVALID_PARAMETER;
        drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, isFollowed[i]);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
        drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
        EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
        EXPECT_EQ(followed, isFollowed[i]);
    }
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0f, 0.0f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_Font *font2 = OH_Drawing_FontCreate();
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font2, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth), OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8, TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32, TEXT_ENCODING_GLYPH_ID
    };
    for (OH_Drawing_TextEncoding encode : encodes) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        encode, brush, nullptr, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), DRAWING_NUMBER_100);
    const char* text1 = "hello world";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text1, strlen(text1),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), DRAWING_NUMBER_126);
    const char* text2 = "1234567890 !@#$%^&*(";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text2),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), DRAWING_NUMBER_277);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0f, 0.0f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Pass in the styled brush
    OH_Drawing_BrushSetColor(brush, 0xFF00FFFF);
    OH_Drawing_BrushSetAlpha(brush, DRAWING_NUMBER_100);
    OH_Drawing_BrushSetAntiAlias(brush, true);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Pass in the styled pen
    OH_Drawing_PenSetWidth(pen, DRAWING_NUMBER_10);
    OH_Drawing_PenSetColor(pen, 0xFF00FFFF);
    OH_Drawing_PenSetAlpha(pen, DRAWING_NUMBER_100);
    OH_Drawing_PenSetAntiAlias(pen, true);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Verify the bounds
    const char* text1 = "hello world";
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text1, strlen(text1),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetLeft(bounds)), DRAWING_NUMBER_3);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetRight(bounds)), DRAWING_NUMBER_251);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetBottom(bounds)), DRAWING_NUMBER_1);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0f, 0.0f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // font passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(nullptr, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // text passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, nullptr, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // text passes to null
    const char* text2 = "";
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // text's length mismatch
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, 0,
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // textWidth passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, bounds, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // bounds passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, nullptr, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0f, 0.0f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // byteLength passes to 0
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, 0,
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenMultiCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0f, 0.0f, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // OH_Drawing_FontMeasureTextWithBrushOrPen is called 20 times.
    for (int i = 0; i < DRAWING_NUMBER_20; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsBoundsNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // Font does not set any attributes
    OH_Drawing_Font *font2 = OH_Drawing_FontCreate();
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font2, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    // Font set some attributes
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void FontGetWidthsBoundsNormal2(OH_Drawing_Font *font, uint16_t glyphs[], int glyphsCount, OH_Drawing_Brush* brush,
    OH_Drawing_Pen* pen, float widths[], OH_Drawing_Array *outRectarr, std::vector<int> widthArr, uint32_t count)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetWidthsBounds(
        font, glyphs, glyphsCount, brush, nullptr, widths, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count; i++) {
        EXPECT_EQ((int)widths[i], widthArr[i]);
    }
    errorCode = OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, outRectarr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    std::vector<std::array<int, DRAWING_NUMBER_4>> arr = { { 0, -DRAWING_NUMBER_42, DRAWING_NUMBER_48, DRAWING_NUMBER_3
        }, { DRAWING_NUMBER_1, -DRAWING_NUMBER_42, DRAWING_NUMBER_48, DRAWING_NUMBER_3 }, { DRAWING_NUMBER_2,
        -DRAWING_NUMBER_42, DRAWING_NUMBER_47, DRAWING_NUMBER_2 }, { DRAWING_NUMBER_1, -40, DRAWING_NUMBER_48,
            DRAWING_NUMBER_3
        }
    };
    for (int i = 0; i < count; i++) {
        OH_Drawing_Rect* iter = nullptr;
        EXPECT_EQ(OH_Drawing_RectGetArrayElement(outRectarr, i, &iter), OH_DRAWING_SUCCESS);
        EXPECT_NE(iter, nullptr);
        EXPECT_EQ((int)OH_Drawing_RectGetLeft(iter), arr[i][0]);
        EXPECT_EQ((int)OH_Drawing_RectGetTop(iter), arr[i][DRAWING_NUMBER_1]);
        EXPECT_EQ((int)OH_Drawing_RectGetRight(iter), arr[i][DRAWING_NUMBER_2]);
        EXPECT_EQ((int)OH_Drawing_RectGetBottom(iter), arr[i][DRAWING_NUMBER_3]);
        EXPECT_EQ(OH_Drawing_RectGetBottom(iter) - OH_Drawing_RectGetTop(iter), OH_Drawing_RectGetHeight(iter));
        EXPECT_EQ(OH_Drawing_RectGetRight(iter) - OH_Drawing_RectGetLeft(iter), OH_Drawing_RectGetWidth(iter));
    }
    OH_Drawing_BrushSetColor(brush, 0xFF00FFFF);
    OH_Drawing_BrushSetAlpha(brush, DRAWING_NUMBER_100);
    OH_Drawing_BrushSetAntiAlias(brush, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    OH_Drawing_PenSetWidth(pen, DRAWING_NUMBER_10);
    OH_Drawing_PenSetColor(pen, 0xFF00FFFF);
    OH_Drawing_PenSetAlpha(pen, DRAWING_NUMBER_100);
    OH_Drawing_PenSetAntiAlias(pen, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_SUCCESS);
}

int TestFontGetWidthsBoundsNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    std::vector<int> widthArr = {DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_50};
    FontGetWidthsBoundsNormal2(font, glyphs, glyphsCount, brush, pen, widths,
                               outRectarr, widthArr, count);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsBoundsNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // Font passes to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(nullptr, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Glyphs passes to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, nullptr, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    // Widths pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, outRectarr),
        OH_DRAWING_SUCCESS);
    // Bounds pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, widths, nullptr),
        OH_DRAWING_SUCCESS);
    // Widths and Bounds pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, nullptr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsBoundsAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // count passes to 0
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, 0, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // count passes to negative number
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, -1, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // The input parameter of count is less than the length of the glyphs array
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, sizeof(glyphs)/sizeof(glyphs[0]) - DRAWING_NUMBER_1, nullptr,
        pen, widths, nullptr), OH_DRAWING_SUCCESS);
    // Both brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsBoundsMultiCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // OH_Drawing_FontGetWidthsBounds is called 20 times
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_20; i++) {
        errorCode = OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGePosNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    //font Different words
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        //font does not set any attributes
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        std::vector<std::array<int, DRAWING_NUMBER_2>> testPoints = {{DRAWING_NUMBER_10, DRAWING_NUMBER_10},
            {DRAWING_NUMBER_60, DRAWING_NUMBER_10}, {DRAWING_NUMBER_110, DRAWING_NUMBER_10}, {DRAWING_NUMBER_160,
                DRAWING_NUMBER_10}
        };
        for (int i = 0; i < count; i++) {
            EXPECT_EQ((int)points[i].x, testPoints[i][0]);
            EXPECT_EQ((int)points[i].y, testPoints[i][DRAWING_NUMBER_1]);
        }
        //length count < glyphs
        OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs, sizeof(glyphs)/sizeof(glyphs[0])-1,
            point, points);
        EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
        OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
        OH_Drawing_FontSetTypeface(font, typeface);
        OH_Drawing_FontSetFakeBoldText(font, true);
        OH_Drawing_FontSetScaleX(font, 0.5f);
        OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
        //font set some attributes
        OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
        EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void FontGetPosNormal1(OH_Drawing_Font *font, const char* text, OH_Drawing_Point *point1, OH_Drawing_Point2D* points1)
{
    uint32_t count1 = 0;
    count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    point1 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, 0.0f);
    std::vector<std::array<int, DRAWING_NUMBER_2>> testPoints1 = {{DRAWING_NUMBER_100, 0}, {DRAWING_NUMBER_129, 0},
        {DRAWING_NUMBER_158, 0}, {DRAWING_NUMBER_187, 0}};
    uint16_t glyphs1[count1];
    int glyphsCount1 = 0;
    glyphsCount1 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    points1 = new OH_Drawing_Point2D[count1];
    if (count1 == 0 || count1 > MAX_ALLOWED_SIZE) {
        return;
    } else {
        OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
        EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
        for (int i = 0; i < count1; i++) {
            EXPECT_EQ((int)points1[i].x, testPoints1[i][0]);
            EXPECT_EQ((int)points1[i].y, testPoints1[i][DRAWING_NUMBER_1]);
        }
    }
}

int TestFontGetPosNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "1234";
    OH_Drawing_Point *point1 = nullptr;
    OH_Drawing_Point2D* points1 = nullptr;
    FontGetPosNormal1(font, text, point1, points1);
    uint32_t count2 = 0;
    count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(0.0f, DRAWING_NUMBER_100);
    std::vector<std::array<int, DRAWING_NUMBER_2>> testPoints2 = {{0, DRAWING_NUMBER_100}, {DRAWING_NUMBER_29,
        DRAWING_NUMBER_100}, {DRAWING_NUMBER_58, DRAWING_NUMBER_100}, {DRAWING_NUMBER_87, DRAWING_NUMBER_100}};
    uint16_t glyphs2[count2];
    int glyphsCount2 = 0;
    glyphsCount2 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    if (count2 == 0 || count2 > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
        EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
        for (int i = 0; i < count2; i++) {
            EXPECT_EQ((int)points2[i].x, testPoints2[i][0]);
            EXPECT_EQ((int)points2[i].y, testPoints2[i][DRAWING_NUMBER_1]);
        }
    }
    OH_Drawing_PointDestroy(point1);
    OH_Drawing_PointDestroy(point2);
    if (points1 != nullptr || points2 != nullptr) {
        delete[] points1;
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void FontGePosNormal2(OH_Drawing_Font *font, const char* text, OH_Drawing_Point *point1, OH_Drawing_Point2D* points1)
{
    uint32_t count1 = 0;
    count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    point1 = OH_Drawing_PointCreate(100.25f, 200.585f);
    std::vector<std::array<float, DRAWING_NUMBER_2>> testPoints1 = {{100.25f, 200.585007f}, {129.25f, 200.585007f},
        {158.25f, 200.585007f}, {187.25f, 200.585007f}};
    uint16_t glyphs1[count1];
    int glyphsCount1 = 0;
    glyphsCount1 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    points1 = new OH_Drawing_Point2D[count1];
    if (count1 == 0 || count1 > MAX_ALLOWED_SIZE) {
        return;
    } else {
        OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
        EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
        for (int i = 0; i < count1; i++) {
            EXPECT_EQ(points1[i].x, testPoints1[i][0]);
            EXPECT_EQ(points1[i].y, testPoints1[i][DRAWING_NUMBER_1]);
        }
    }
}

int TestFontGePosNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "1234";
    OH_Drawing_Point *point1 = nullptr;
    OH_Drawing_Point2D* points1 = nullptr;
    FontGePosNormal2(font, text, point1, points1);
    uint32_t count2 = 0;
    count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(-100.0f, -100.0f);
    std::vector<std::array<int, DRAWING_NUMBER_2>> testPoints2 = {{-DRAWING_NUMBER_100, -DRAWING_NUMBER_100}, {
        -DRAWING_NUMBER_71, -DRAWING_NUMBER_100}, {-DRAWING_NUMBER_42, -DRAWING_NUMBER_100}, {-DRAWING_NUMBER_13,
        -DRAWING_NUMBER_100}};
    uint16_t glyphs2[count2];
    int glyphsCount2 = 0;
    glyphsCount2 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    if (count2 == 0 || count2 > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
        EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
        for (int i = 0; i < count2; i++) {
            EXPECT_EQ((int)points2[i].x, testPoints2[i][0]);
            EXPECT_EQ((int)points2[i].y, testPoints2[i][DRAWING_NUMBER_1]);
        }
    }
    OH_Drawing_PointDestroy(point1);
    OH_Drawing_PointDestroy(point2);
    if (points1 != nullptr || points2 != nullptr) {
        delete[] points1;
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGePosNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        EXPECT_EQ(OH_Drawing_FontGetPos(nullptr, glyphs, glyphsCount, point, points),
                  OH_DRAWING_ERROR_INVALID_PARAMETER);
        EXPECT_EQ(OH_Drawing_FontGetPos(font, nullptr, glyphsCount, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, nullptr, nullptr),
                  OH_DRAWING_ERROR_INVALID_PARAMETER);
        OH_Drawing_Point *point1 = OH_Drawing_PointCreate(0.0f, 0.0f);
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point1, points), OH_DRAWING_SUCCESS);
        OH_Drawing_PointDestroy(point1);
    }
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGePosMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        for (int i = 0; i < DRAWING_NUMBER_20; i++) {
            EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points), OH_DRAWING_SUCCESS);
        }
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGePosAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, 0, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, -1.0f, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontGeSpacingNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float spacing = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_30);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    EXPECT_EQ(std::fabs(spacing - 35.16f) < 1e-6, true);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGeSpacingMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_30);
    float spacing = 0;
    for (int i = 0; i < DRAWING_NUMBER_20; i++) {
        EXPECT_EQ(OH_Drawing_FontGetSpacing(font, &spacing), OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(std::fabs(spacing - 35.16f) < 1e-6, true);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGeSpacingNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_30);
    float spacing = 0;
    EXPECT_EQ(OH_Drawing_FontGetSpacing(nullptr, &spacing), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetSpacing(font, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleChaWithFeaturesNormal()
{
    DrawingNativeFontPart2TestSetUp();
    const char *str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0;
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_37);
    str = "你";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    str = "（";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    str = "｛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    str = "《";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    str = "8";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_29);
    str = "乂";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    str = "飛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, DRAWING_NUMBER_50);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleChaWithFeaturesAbNormal()
{
    DrawingNativeFontPart2TestSetUp();
    const char *str = "（";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, 0xFF0000FF);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0;
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(nullptr, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, nullptr, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, nullptr, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, "", features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontMeasureSingleChaWithFeaturesCalls()
{
    DrawingNativeFontPart2TestSetUp();
    const char *str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(textWidth, DRAWING_NUMBER_37);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontFeaturesAddFeatureNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaa", DRAWING_NUMBER_1);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaaa", DRAWING_NUMBER_1);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontFeaturesAddFeatureAbNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(nullptr, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, nullptr, 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, "", 0.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
int TestFontFeaturesandFeatureDestroyNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesDestroy(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontFeatures* features1 = OH_Drawing_FontFeaturesCreate();
        OH_Drawing_ErrorCode code1 = OH_Drawing_FontFeaturesDestroy(features1);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontFeaturesDestroy(features);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
