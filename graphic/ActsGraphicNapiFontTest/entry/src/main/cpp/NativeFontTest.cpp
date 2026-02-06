/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/NativeFontTest.h"
#include <cstring>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/NativeCopyStyleTest.h"
#include "include/OhosCommonTest.h"

#define NUM_10 10
#define NUM_52 52
#define NUM_100 100
#define NUM_1200 1200

using namespace OHOS::Rosen::Drawing;

namespace OHOS {
static const char* FONT_FAMILY = "Roboto-Black";
static const char* FONT_PATH = "/data/Roboto-Black.ttf";
constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
namespace Rosen {
namespace Drawing {

/**
 * @tc.name   NativeFontTestFontMeasureText015
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1500
 * @tc.desc   test for the textbox.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int NativeFontTestFontMeasureText015()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TextBox* textBox = OH_Drawing_TypographyGetRectsForPlaceholders(typography);
    EXPECT_EQ(textBox == nullptr, false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_TypographyDestroyTextBox(textBox);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   NativeFontTestFontMeasureText016
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1600
 * @tc.desc   test for the textshadow.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int NativeFontTestFontMeasureText016()
{
    OH_Drawing_TextShadow* shadow = OH_Drawing_CreateTextShadow();
    uint32_t color = ZERO;
    OH_Drawing_Point* offset = OH_Drawing_PointCreate(ZERO, ZERO);
    double blurRadius = 0.0;
    OH_Drawing_SetTextShadow(shadow, color, offset, blurRadius);
    OH_Drawing_DestroyTextShadow(shadow);
    OH_Drawing_PointDestroy(offset);
    EXPECT_TRUE(shadow != nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   NativeFontTestFontMeasureText017
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_MEASURE_TEXT_1700
 * @tc.desc   test for the fontVariation.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int NativeFontTestFontMeasureText017()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(txtStyle == nullptr, false);
    const char* key = "宋体";
    int value = ONE;
    OH_Drawing_TextStyleAddFontFeature(txtStyle, key, value);
    OH_Drawing_TextStyleAddFontVariation(txtStyle, key, value);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatureSize(txtStyle), ONE);
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_ClearFontCaches(fontCollection);
    EXPECT_EQ(fontCollection == nullptr, false);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   NativeDrawingRegisterFontTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_REGISTER_FONT_TEST_0100
 * @tc.desc   test for register font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int NativeDrawingRegisterFontTest001()
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    uint32_t errorCode = OH_Drawing_RegisterFont(fontCollection, FONT_FAMILY, FONT_PATH);
    std::ifstream fileStream(FONT_PATH);
    if (fileStream.is_open()) {
        EXPECT_EQ(errorCode, ZERO);
        fileStream.close();
    } else {
        EXPECT_EQ(errorCode, ONE);
    }
    OH_Drawing_DestroyFontCollection(fontCollection);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   NativeDrawingRegisterFontTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_REGISTER_FONT_TEST_0200
 * @tc.desc   test for register font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int NativeDrawingRegisterFontTest002()
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    uint32_t errorCode = OH_Drawing_RegisterFontBuffer(fontCollection, FONT_FAMILY, nullptr, FONT_BUFFER_SIZE);
    std::ifstream fileStream(FONT_PATH);
    if (fileStream.is_open()) {
        EXPECT_EQ(errorCode, ZERO);
        fileStream.close();
    } else {
        EXPECT_EQ(errorCode, SIX);
    }
    OH_Drawing_DestroyFontCollection(fontCollection);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingFontCollectionTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_COLLECTION_TEST_0100
 * @tc.desc   test for creating fontCollection
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingFontCollectionTest001()
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    EXPECT_EQ(fontCollection == nullptr, false);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_FontCollection* sharedFontCollection = OH_Drawing_CreateSharedFontCollection();
    EXPECT_EQ(sharedFontCollection == nullptr, false);
    OH_Drawing_DisableFontCollectionFallback(sharedFontCollection);
    OH_Drawing_DisableFontCollectionSystemFont(sharedFontCollection);
    OH_Drawing_DestroyFontCollection(sharedFontCollection);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyLargeValueTest016
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_1600
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
namespace {
OH_Drawing_Canvas* CreateTestCanvas(OH_Drawing_Bitmap** cBitmap)
{
    *cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = TEST_BITMAP_WIDTH;
    uint32_t height = TEST_BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(*cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(*cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(*cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, *cBitmap);
    OH_Drawing_CanvasClear(
        cCanvas, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_WHITE, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    return cCanvas;
}

void SetupTypographyWithIndents(OH_Drawing_TypographyCreate* handler, OH_Drawing_Typography** typography)
{
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    *typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = { INDENT_FIRST, INDENT_SECOND };
    OH_Drawing_TypographySetIndents(*typography, INDENT_COUNT, indents);
    float indent = INDENT_SECOND;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(*typography, INDENT_INDEX));
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(*typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(*typography));
}

void VerifyTypographyBasicProperties(OH_Drawing_Typography* typography)
{
    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLine(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
                  OH_Drawing_TypographyGetMaxIntrinsicWidth(typography),
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
}

void VerifyTypographyProperties(OH_Drawing_Typography* typography)
{
    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLineWithIndent(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
                  OH_Drawing_TypographyGetMaxIntrinsicWidth(typography),
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
}

void SetupTextStyleForTypography026(OH_Drawing_TextStyle* txtStyle)
{
    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ONE, fontFamilies);
}

void SetupTypographyWithPlaceholder(OH_Drawing_TypographyCreate* handler, OH_Drawing_Typography** typography)
{
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_PlaceholderSpan placeholderSpan = { PLACEHOLDER_WIDTH,
                                                   PLACEHOLDER_HEIGHT,
                                                   ALIGNMENT_OFFSET_AT_BASELINE,
                                                   TEXT_BASELINE_ALPHABETIC,
                                                   PLACEHOLDER_BASELINE_OFFSET };
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    *typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(*typography, maxWidth);
}

void VerifyTypographyProperties026(OH_Drawing_Typography* typography)
{
    EXPECT_EQ(OH_Drawing_TypographyDidExceedMaxLines(typography) != true, true);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    EXPECT_NE(OH_Drawing_TypographyGetRectsForRange(typography, RANGE_START, RANGE_END, heightStyle, widthStyle),
              nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetRectsForPlaceholders(typography), nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, COORDINATE_X, COORDINATE_Y), nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, COORDINATE_X, COORDINATE_Y),
              nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetWordBoundary(typography, RANGE_START), nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetLineTextRange(typography, RANGE_START, true), nullptr);
    EXPECT_NE(OH_Drawing_TypographyGetLineCount(typography), 0);
}
} // namespace

int OHDrawingTypographyLargeValueTest016()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ONE, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    OH_Drawing_Typography* typography = nullptr;
    SetupTypographyWithIndents(handler, &typography);

    OH_Drawing_Bitmap* cBitmap = nullptr;
    OH_Drawing_Canvas* cCanvas = CreateTestCanvas(&cBitmap);
    VerifyTypographyBasicProperties(typography);
    double position[2] = { TEST_POSITION_X, TEST_POSITION_Y };
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyLargeValueTest026
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_2600
 * @tc.desc   test for typography and txtStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyLargeValueTest026()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    SetupTextStyleForTypography026(txtStyle);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    OH_Drawing_Typography* typography = nullptr;
    SetupTypographyWithPlaceholder(handler, &typography);

    OH_Drawing_Bitmap* cBitmap = nullptr;
    OH_Drawing_Canvas* cCanvas = CreateTestCanvas(&cBitmap);
    VerifyTypographyProperties026(typography);
    double position[TWO] = { TEST_POSITION_X, TEST_POSITION_Y };
    OH_Drawing_TypographyPaint(typography, cCanvas, position[ZERO], position[ONE]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyLargeValueTest027
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_2700
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyLargeValueTest027()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ONE, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { TEST_POSITION_X, TEST_POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = TEST_BITMAP_WIDTH;
    uint32_t height = TEST_BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(
        cCanvas, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_WHITE, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    int lineNum = 0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics;
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, nullptr), false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, -1, oneLine, includeWhitespace, &lineMetrics), false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, &lineMetrics), true);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyLargeValueTest042
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_4200
 * @tc.desc   test for text shadow for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyLargeValueTest042()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ONE, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { TEST_POSITION_X, TEST_POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = TEST_BITMAP_WIDTH;
    uint32_t height = TEST_BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(
        cCanvas, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_WHITE, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    EXPECT_EQ(OH_Drawing_TextStyleGetShadows(txtStyle) != nullptr, true);
    OH_Drawing_TextStyleClearShadows(txtStyle);
    OH_Drawing_TextShadow* textshadows = OH_Drawing_TextStyleGetShadows(txtStyle);
    OH_Drawing_DestroyTextShadows(textshadows);
    OH_Drawing_DestroyTextShadows(nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, OH_Drawing_CreateTextShadow());
    const int textStyleGetShadowWithIndexMax = 10000000;
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, textStyleGetShadowWithIndexMax) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(nullptr, 0) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyle), 1);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(nullptr), 0);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyLargeValueTestWithIndent
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_LARGE_VALUE_TEST_WITH_INDENT_0100
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */

int OHDrawingTypographyLargeValueTestWithIndent()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ONE, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = { 1.2, 3.4 };
    OH_Drawing_TypographySetIndents(typography, INDENT_COUNT, indents);
    float indent = 3.4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));

    OH_Drawing_Bitmap* cBitmap = nullptr;
    OH_Drawing_Canvas* cCanvas = CreateTestCanvas(&cBitmap);
    VerifyTypographyProperties(typography);
    double position[2] = { TEST_POSITION_X, TEST_POSITION_Y };
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCreateTextTab001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0100
 * @tc.desc   test for the text tab create and destroy
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCreateTextTab001()
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, TEXT_TAB_LOCATION_DEFAULT);
    EXPECT_NE(textTab, nullptr);
    OH_Drawing_TextTab* textTab2 = OH_Drawing_CreateTextTab(TEXT_ALIGN_END, TEXT_TAB_LOCATION_NEGATIVE_ONE);
    EXPECT_NE(textTab2, nullptr);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_DestroyTextTab(textTab2);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCreateTextTab002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0200
 * @tc.desc   test for get alignment of the text tab
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCreateTextTab002()
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, TEXT_TAB_LOCATION_DEFAULT);
    EXPECT_EQ(OH_Drawing_GetTextTabAlignment(textTab), TEXT_ALIGN_LEFT);
    OH_Drawing_TextTab* textTab2 = OH_Drawing_CreateTextTab(TEXT_ALIGN_JUSTIFY, 0.0);
    EXPECT_EQ(OH_Drawing_GetTextTabAlignment(textTab), TEXT_ALIGN_LEFT);
    EXPECT_EQ(OH_Drawing_GetTextTabAlignment(nullptr), TEXT_ALIGN_LEFT);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_DestroyTextTab(textTab2);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCreateTextTab003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_CREATE_TEXT_TAB_0300
 * @tc.desc   test for get location of the text tab
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCreateTextTab003()
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, TEXT_TAB_LOCATION_DEFAULT);
    EXPECT_EQ(OH_Drawing_GetTextTabLocation(textTab), TEXT_TAB_LOCATION_DEFAULT);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_TextTab* textTab2 = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, TEXT_TAB_LOCATION_NEGATIVE);
    EXPECT_EQ(OH_Drawing_GetTextTabLocation(textTab2), TEXT_TAB_LOCATION_NEGATIVE);
    EXPECT_EQ(OH_Drawing_GetTextTabLocation(nullptr), TEXT_TAB_LOCATION_DEFAULT);
    OH_Drawing_DestroyTextTab(textTab2);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TypographyTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0100
 * @tc.desc   test for text tab with left alignment
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TypographyTest001()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, NUM_10);

    OH_Drawing_TextTab* tab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, NUM_100);
    OH_Drawing_SetTypographyTextTab(typoStyle, tab);

    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateSharedFontCollection());
    OH_Drawing_TextStyle* textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, NUM_52);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, textStyle);

    const char* text = "Hello\tWorld\tHello";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, NUM_1200);

    double width = OH_Drawing_TypographyGetLongestLine(typography);
    EXPECT_NEAR(width, EXPECTED_WIDTH_LEFT_ALIGN, FLOAT_DATA_EPSILON);

    // branch coverage
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTextStyle(textStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextTab(tab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TypographyTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0200
 * @tc.desc   test for text tab with left alignment
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TypographyTest002()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, NUM_10);

    OH_Drawing_TextTab* tab = OH_Drawing_CreateTextTab(TEXT_ALIGN_RIGHT, NUM_100);
    OH_Drawing_SetTypographyTextTab(typoStyle, tab);

    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateSharedFontCollection());
    OH_Drawing_TextStyle* textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, NUM_52);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, textStyle);

    const char* text = "Hello\tWorld\tHello";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, NUM_1200);

    double width = OH_Drawing_TypographyGetLongestLine(typography);
    EXPECT_NEAR(width, EXPECTED_WIDTH_RIGHT_ALIGN, FLOAT_DATA_EPSILON);

    // branch coverage
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTextStyle(textStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextTab(tab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TypographyTest003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0300
 * @tc.desc   test for text tab with center alignment
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TypographyTest003()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, NUM_10);

    OH_Drawing_TextTab* tab = OH_Drawing_CreateTextTab(TEXT_ALIGN_CENTER, NUM_100);
    OH_Drawing_SetTypographyTextTab(typoStyle, tab);

    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateSharedFontCollection());
    OH_Drawing_TextStyle* textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, NUM_52);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, textStyle);

    const char* text = "Hello\tWorld\tHello";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, NUM_1200);

    double width = OH_Drawing_TypographyGetLongestLine(typography);
    EXPECT_NEAR(width, EXPECTED_WIDTH_CENTER_ALIGN, FLOAT_DATA_EPSILON);

    // branch coverage
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTextStyle(textStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextTab(tab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TypographyTest004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0400
 * @tc.desc   test for setting both the texttab and text layout direction
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TypographyTest004()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, NUM_10);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_CENTER);

    OH_Drawing_TextTab* tab = OH_Drawing_CreateTextTab(TEXT_ALIGN_CENTER, NUM_100);
    OH_Drawing_SetTypographyTextTab(typoStyle, tab);

    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateSharedFontCollection());
    OH_Drawing_TextStyle* textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, NUM_52);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, textStyle);

    const char* text = "Hello\tWorld\tHello";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, NUM_1200);

    double width = OH_Drawing_TypographyGetLongestLine(typography);
    EXPECT_NEAR(width, EXPECTED_WIDTH_CENTER_WITH_DIR, FLOAT_DATA_EPSILON);

    // branch coverage
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTextStyle(textStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextTab(tab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TypographyTest005
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TYPOGRAPHY_TEST_0500
 * @tc.desc   test for setting both the texttab and ellipsis
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TypographyTest005()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, NUM_10);
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, "...");
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_TAIL);

    OH_Drawing_TextTab* tab = OH_Drawing_CreateTextTab(TEXT_ALIGN_CENTER, NUM_100);
    OH_Drawing_SetTypographyTextTab(typoStyle, tab);

    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateSharedFontCollection());
    OH_Drawing_TextStyle* textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, NUM_52);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, textStyle);

    const char* text = "Hello\tWorld\tHello";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, NUM_1200);

    double width = OH_Drawing_TypographyGetLongestLine(typography);
    EXPECT_NEAR(width, EXPECTED_WIDTH_CENTER_WITH_DIR, FLOAT_DATA_EPSILON);

    // branch coverage
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTextStyle(textStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextTab(tab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   FontGetTextPath001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0100
 * @tc.desc   test for common character of textpath
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int FontGetTextPath001()
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "Hello 中文";
    size_t length = std::char_traits<char>::length(str);
    float x = TEXT_PATH_COORDINATE_X;
    float y = TEXT_PATH_COORDINATE_Y;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    ASSERT_NE(path, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    EXPECT_TRUE(OH_Drawing_PathGetLength(path, false) > 0);
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   FontGetTextPath002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0200
 * @tc.desc   test for UTF16 and UTF32 character of textpath
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int FontGetTextPath002()
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);

    float x = TEXT_PATH_COORDINATE_X;
    float y = TEXT_PATH_COORDINATE_Y;
    const char16_t* u16str = u"Hello 中文";
    size_t u16strLen = std::char_traits<char16_t>::length(u16str);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, u16str, sizeof(char16_t) * u16strLen, TEXT_ENCODING_UTF16, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    float u16PathLen = OH_Drawing_PathGetLength(path, false);

    const char32_t* u32str = U"Hello 中文";
    size_t u32strLen = std::char_traits<char32_t>::length(u32str);
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, u32str, sizeof(char32_t) * u32strLen, TEXT_ENCODING_UTF32, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    float u32PathLen = OH_Drawing_PathGetLength(path, false);
    ASSERT_TRUE(u16PathLen > 0 && u32PathLen > 0);
    ASSERT_EQ(u16PathLen, u32PathLen);
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   FontGetTextPath003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0300
 * @tc.desc   test for space character of textpath
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int FontGetTextPath003()
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* space = " ";
    size_t length = std::char_traits<char>::length(space);
    float x = TEXT_PATH_COORDINATE_X;
    float y = TEXT_PATH_COORDINATE_Y;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    ASSERT_NE(path, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, space, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    EXPECT_TRUE(OH_Drawing_PathGetLength(path, false) == 0);
    EXPECT_FALSE(OH_Drawing_PathIsClosed(path, false));
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   FontGetTextPath004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0400
 * @tc.desc   test for negative coordinates of textpath
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int FontGetTextPath004()
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "Hello 中文";
    size_t length = std::char_traits<char>::length(str);
    float x = TEXT_PATH_NEGATIVE_COORD;
    float y = TEXT_PATH_NEGATIVE_COORD;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    ASSERT_NE(path, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    if (path != nullptr) {
        EXPECT_TRUE(OH_Drawing_PathGetLength(path, false) > 0);
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   FontGetTextPath005
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_FONT_GET_TEXT_PATH_0500
 * @tc.desc   test for conversion of glyphsID to path
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int FontGetTextPath005()
{
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "Hello 中文";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_NE(count, 0);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);

    float x = TEXT_PATH_COORDINATE_X;
    float y = TEXT_PATH_COORDINATE_Y;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    ASSERT_NE(path, nullptr);
    EXPECT_EQ(OH_Drawing_FontGetTextPath(font, glyphs, sizeof(glyphs), TEXT_ENCODING_GLYPH_ID, x, y, path),
              OH_DRAWING_SUCCESS);
    ASSERT_NE(path, nullptr);
    if (path != nullptr) {
        EXPECT_TRUE(OH_Drawing_PathGetLength(path, false) > 0);
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS