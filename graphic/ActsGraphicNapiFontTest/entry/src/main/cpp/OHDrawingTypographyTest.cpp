/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "include/OHDrawingTypographyTest.h"
#include <cstring>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
namespace {
// 字体大小常量
constexpr double DEFAULT_FONT_SIZE = 30.0;
constexpr double FONT_SIZE_40 = 40.0;
constexpr double FONT_SIZE_80 = 80.0;

// 宽度和高度常量
constexpr double DEFAULT_MAX_WIDTH = 800.0;
constexpr uint32_t BITMAP_WIDTH = 20;
constexpr uint32_t BITMAP_HEIGHT = 40;
constexpr double PLACEHOLDER_WIDTH = 20.0;
constexpr double PLACEHOLDER_HEIGHT = 40.0;

// 位置常量
constexpr double POSITION_X = 10.0;
constexpr double POSITION_Y = 15.0;
constexpr double ARC_FONT_SIZE = 30.0;
constexpr double MAX_WIDTH = 800.0;
constexpr double RADIAN_TER = 180.0;
constexpr double LEFT_POS = 50.0;
constexpr double RIGHT_POS = 150.0;

// 间距常量
constexpr double SPACING_10 = 10.0;
constexpr double SPACING_20 = 20.0;
constexpr double SPACING_80 = 80.0;
constexpr double SPACING_0 = 0.0;
constexpr double SPACING_1 = 1.0;
constexpr double SPACING_2 = 2.0;

// 缩进常量
constexpr float INDENT_1_2 = 1.2f;
constexpr float INDENT_3_4 = 3.4f;

// 行数常量
constexpr int MAX_LINES_100 = 100;
constexpr int MAX_LINES_200 = 200;

// 无效值常量
constexpr int INVALID_VALUE = -1;

// 索引常量
constexpr int INDEX_0 = 0;
constexpr int INDEX_1 = 1;
constexpr int INDEX_2 = 2;

// 数组大小常量
constexpr int ARRAY_SIZE_1 = 1;
constexpr int ARRAY_SIZE_2 = 2;

// 颜色常量
constexpr uint8_t COLOR_ALPHA_FF = 0xFF;
constexpr uint8_t COLOR_RGB_00 = 0x00;
constexpr uint8_t ALPHA_64 = 64;
constexpr uint8_t ALPHA_128 = 128;

// 大数字常量（用于测试边界情况）
constexpr int LARGE_INDEX = 10000000;

// 笔宽常量
constexpr float PEN_WIDTH_10 = 10.0f;
constexpr float PEN_WIDTH_20 = 20.0f;

// 其他常量
constexpr double ZERO = 0.0;
constexpr int LINE_NUM_0 = 0;
constexpr size_t FROM_10 = 10;
} // namespace

static std::string g_existFontPathStr = std::string("/system/fonts/") + GetSystemDefaultFont(true) + ".ttf";
const char* EXIST_FONT_PATH = g_existFontPathStr.c_str();
const char* OHOS_THEME_FONT = "OhosThemeFont";

enum class FontWeight {
    W100, // thin
    W200,
    W300,
    W400, // normal
    W500,
    W600,
    W700, // bold
    W800,
    W900,
};

enum class FontWidth {
    ULTRA_CONDENSED = 1,
    EXTRA_CONDENSED = 2,
    CONDENSED = 3,
    SEMI_CONDENSED = 4,
    NORMAL = 5,
    SEMI_EXPANDED = 6,
    EXPANDED = 7,
    EXTRA_EXPANDED = 8,
    ULTRA_EXPANDED = 9,
};

enum class FontStyle {
    NORMAL,
    ITALIC,
    OBLIQUE,
};

enum class TextAlign {
    LEFT,
    RIGHT,
    CENTER,
    JUSTIFY,
    START,
    END,
};

enum class TextDirection {
    RTL,
    LTR,
};

enum class BreakStrategy { GREEDY = 0, HIGH_QUALITY = 1, BALANCED = 2 };

enum class WordBreakType { NORMAL = 0, BREAK_ALL = 1, BREAK_WORD = 2, BREAK_HYPHEN = 3 };

enum class EllipsisModal {
    HEAD = 0,
    MIDDLE = 1,
    TAIL = 2,
};

enum class TextBaseline {
    ALPHABETIC,
    IDEOGRAPHIC,
};

enum TextDecoration {
    NONE = 0x0,
    UNDERLINE = 0x1,
    OVERLINE = 0x2,
    LINE_THROUGH = 0x4,
};

enum class TextDecorationStyle {
    SOLID,
    DOUBLE,
    DOTTED,
    DASHED,
    WAVY,
};

enum class TextVerticalAlign { BASELINE = 0, BOTTOM = 1, CENTER = 2, TOP = 3 };

struct TextStyle {
    char colorPad[30];
    TextDecoration decoration;
    char decorationColor[30];

    TextDecorationStyle decorationStyle;
    double decorationThicknessScale = 1.0;
    FontWeight fontWeight;
    FontWidth fontWidth;
    FontStyle fontStyle;
    TextBaseline baseline;
    std::vector<std::string> fontFamilies;
    double fontSize;
    double letterSpacing = 0.0;
    double wordSpacing = 0.0;
    double heightScale = 1.0;
    bool halfLeading = false;
    bool heightOnly = false;
    std::u16string ellipsis;
    EllipsisModal ellipsisModal = EllipsisModal::TAIL;
    std::string locale;
    
//    std::optional<Drawing::Brush> foregroundBrush;
    char pad3[99];
//    std::optional<Drawing::Pen> foregroundPen;
    char pad4[99];
//    std::optional<Drawing::Brush> backgroundBrush;
    char pad5[99];
//    std::optional<Drawing::Pen> backgroundPen;
    char pad6[99];
//    std::vector<TextShadow> shadows;
    char pad7[24];
    
//    FontFeatures fontFeatures;
    char pad8[33];

    // if Pen and SkPaint are setting, use pen first
    int styleId = 0;
    bool operator==(const TextStyle& rhs) const;
    bool EqualByFonts(const TextStyle& rhs) const;
    // symbol glyph
    bool isSymbolGlyph = false;
    double baseLineShift = 0.0;
    bool isPlaceholder;
};

enum TextHeightBehavior {
    ALL = 0x0,
    DISABLE_FIRST_ASCENT = 0x1,
    DISABLE_LAST_ASCENT = 0x2,
    DISABLE_ALL = 0x1 | 0x2,
};

struct TypographyStyle {
    FontWeight fontWeight;
    FontWeight fontWidth;
    FontStyle fontStyle;

    std::string fontFamily;

    double fontSize;
    double heightScale;

    bool halfLeading;
    bool heightOnly;
    bool useLineStyle;

    FontWeight lineStyleFontWeight;
    FontWidth lineStyleFontWidth;
    FontStyle lineStyleFontStyle;

    std::vector<std::string> lineStyleFontFamilies;

    double lineStyleFontSize;
    double lineStyleHeightScale;

    bool lineStyleHeightOnlyInit;
    bool lineStyleHeightOnly;
    bool lineStyleHalfLeading;

    double lineStyleSpacingScale;
    bool lineStyleOnly;

    TextAlign textAlign;
    TextDirection textDirection;

    size_t maxLines;

    // std::u16string ellipsis
    std::u16string ellipsis;

    // std::string locale
    std::string locale;

    BreakStrategy breakStrategy;
    WordBreakType wordBreakType;
    EllipsisModal ellipsisModal;

    float textSplitRatio;
    float paragraphSpacing;

    bool isEndAddParagraphSpacing;
    bool isTrailingSpaceOptimized;
    bool compressHeadPunctuation;
    bool enableAutoSpace;

    TextVerticalAlign verticalAlignment;

    // TextStyle insideTextStyle（未知类型）
    char insideTextStyleBlob[35];

    bool customTextStyle;

    TextHeightBehavior textHeightBehavior;
    bool hintingIsOn;
    char pad5[7];

    // TextTab tab
    char tabBlob[32];

    // std::bitset<...>
    char relayoutChangeBitmapBlob[32]; // 依模板参数

    size_t defaultTextStyleUid;

    double maxLineHeight;
    double minLineHeight;
    double lineSpacing;

    uint32_t lineHeightStyle;

    bool includeFontPadding;
    bool fallbackLineSpacing;
    char pad6[6];
};

static TypographyStyle* ConvertToOriginalText(OH_Drawing_TypographyStyle* style)
{
    return reinterpret_cast<TypographyStyle*>(style);
}

static TextStyle* ConvertToOriginalText(OH_Drawing_TextStyle* style)
{
    return reinterpret_cast<TextStyle*>(style);
}

/**
 * @tc.name   OHDrawingTypographyTest001
 * @tc.number OHDrawingTypographyTest001
 * @tc.desc   test for creating TypographyStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest001()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_EQ(typoStyle == nullptr, false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest002
 * @tc.number OHDrawingTypographyTest002
 * @tc.desc   test for text direction
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest002()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_LTR);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_RTL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::RTL);
    OH_Drawing_SetTypographyTextDirection(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest003
 * @tc.number OHDrawingTypographyTest003
 * @tc.desc   test for text alignment
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest003()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_LEFT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::LEFT);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_RIGHT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::RIGHT);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_CENTER);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::CENTER);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_JUSTIFY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::JUSTIFY);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_START);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::START);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_END);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::END);
    OH_Drawing_SetTypographyTextAlign(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::LEFT);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest004
 * @tc.number OHDrawingTypographyTest004
 * @tc.desc   test for max lines
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest004()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, MAX_LINES_100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, MAX_LINES_100);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, MAX_LINES_200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, MAX_LINES_200);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest005
 * @tc.number OHDrawingTypographyTest005
 * @tc.desc   test for creating text style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest005()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(txtStyle == nullptr, false);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest006
 * @tc.number OHDrawingTypographyTest006
 * @tc.desc   test for text color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest006()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    // black
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    EXPECT_EQ(OH_Drawing_TextStyleGetColor(txtStyle), 0xFF000000);
    // red
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00));
    EXPECT_EQ(OH_Drawing_TextStyleGetColor(txtStyle), 0xFFFF0000);
    // blue
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_ALPHA_FF));
    EXPECT_EQ(OH_Drawing_TextStyleGetColor(txtStyle), 0xFF0000FF);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest007
 * @tc.number OHDrawingTypographyTest007
 * @tc.desc   test for font size
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest007()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(txtStyle, FONT_SIZE_80);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, FONT_SIZE_80);
    OH_Drawing_SetTextStyleFontSize(txtStyle, FONT_SIZE_40);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, FONT_SIZE_40);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest008
 * @tc.number OHDrawingTypographyTest008
 * @tc.desc   test for font weight
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest008()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_100);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W100);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_200);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W200);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_300);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W300);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W400);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_500);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W500);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_600);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W600);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_700);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W700);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_800);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W800);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_900);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W900);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W400);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest009
 * @tc.number OHDrawingTypographyTest009
 * @tc.desc   test for baseline location
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest009()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_IDEOGRAPHIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::IDEOGRAPHIC);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest010
 * @tc.number OHDrawingTypographyTest010
 * @tc.desc   test for text decoration
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest010()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_NONE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::NONE);
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::UNDERLINE);
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_OVERLINE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::LINE_THROUGH);
    OH_Drawing_SetTextStyleDecoration(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::NONE);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest012
 * @tc.number OHDrawingTypographyTest012
 * @tc.desc   test for font height
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest012()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontHeight(txtStyle, ZERO);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->heightScale, ZERO);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest013
 * @tc.number OHDrawingTypographyTest013
 * @tc.desc   test for font families
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest013()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = { "Roboto" };
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontFamilies, fontFamiliesResult);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest014
 * @tc.number OHDrawingTypographyTest014
 * @tc.desc   test for font italic
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest014()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest015
 * @tc.number OHDrawingTypographyTest015
 * @tc.desc   test for font locale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest015()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->locale, "en");
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest016
 * @tc.number OHDrawingTypographyTest016
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest016()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = { INDENT_1_2, INDENT_3_4 };
    OH_Drawing_TypographySetIndents(typography, ARRAY_SIZE_2, indents);
    float indent = INDENT_3_4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));

    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLine(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
                  OH_Drawing_TypographyGetMaxIntrinsicWidth(typography),
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest017
 * @tc.number OHDrawingTypographyTest017
 * @tc.desc   test for break strategy
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest017()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_GREEDY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_HIGH_QUALITY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::HIGH_QUALITY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::BALANCED);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest018
 * @tc.number OHDrawingTypographyTest018
 * @tc.desc   test for word break type
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest018()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::NORMAL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_ALL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_WORD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest019
 * @tc.number OHDrawingTypographyTest019
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest019()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest020
 * @tc.number OHDrawingTypographyTest020
 * @tc.desc   test for decoration style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest020()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_SOLID);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOUBLE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOUBLE);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOTTED);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOTTED);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DASHED);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DASHED);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_WAVY);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::WAVY);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest021
 * @tc.number OHDrawingTypographyTest021
 * @tc.desc   test for decoration thickness scale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest021()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, SPACING_10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, SPACING_10);
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, SPACING_20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, SPACING_20);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest022
 * @tc.number OHDrawingTypographyTest022
 * @tc.desc   test for letter spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest022()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, SPACING_10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, SPACING_10);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, SPACING_20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, SPACING_20);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest023
 * @tc.number OHDrawingTypographyTest023
 * @tc.desc   test for word spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest023()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, SPACING_10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, SPACING_10);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, SPACING_20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, SPACING_20);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest024
 * @tc.number OHDrawingTypographyTest024
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest024()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest025
 * @tc.number OHDrawingTypographyTest025
 * @tc.desc   test for set ellipsis
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest025()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsis(txtStyle, "...");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsis, u"...");
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest026
 * @tc.number OHDrawingTypographyTest026
 * @tc.desc   test for typography and txtStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest026()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, true);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, "OpenHarmony\n");
    OH_Drawing_PlaceholderSpan placeholderSpan = {
        PLACEHOLDER_WIDTH, PLACEHOLDER_HEIGHT, ALIGNMENT_OFFSET_AT_BASELINE, TEXT_BASELINE_ALPHABETIC, SPACING_10
    };
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_BitmapBuild(cBitmap, BITMAP_WIDTH, BITMAP_HEIGHT, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    EXPECT_EQ(OH_Drawing_TypographyDidExceedMaxLines(typography) != true, true);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForRange(typography, INDEX_1, INDEX_2, heightStyle, widthStyle) != nullptr,
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, INDEX_1, INDEX_0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, INDEX_1, INDEX_0) != nullptr,
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetWordBoundary(typography, INDEX_1) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineTextRange(typography, INDEX_1, true) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineCount(typography) != 0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest027
 * @tc.number OHDrawingTypographyTest027
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest027()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    int lineNum = LINE_NUM_0;
    bool oneLine = true;
    bool includeWhitespace = true;
    OH_Drawing_LineMetrics lineMetrics;
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, nullptr), false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, INVALID_VALUE, oneLine, includeWhitespace, &lineMetrics),
              false);
    EXPECT_EQ(OH_Drawing_TypographyGetLineInfo(typography, lineNum, oneLine, includeWhitespace, &lineMetrics), true);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest028
 * @tc.number OHDrawingTypographyTest028
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest028()
{
    OH_Drawing_TextShadow* textShadow = OH_Drawing_CreateTextShadow();
    EXPECT_EQ(textShadow == nullptr, false);
    OH_Drawing_DestroyTextShadow(textShadow);
    OH_Drawing_DestroyTextShadow(nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest029
 * @tc.number OHDrawingTypographyTest029
 * @tc.desc   test for font weight of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest029()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W100);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W200);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_300);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W300);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_400);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W400);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest030
 * @tc.number OHDrawingTypographyTest030
 * @tc.desc   test for font style of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest030()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest031
 * @tc.number OHDrawingTypographyTest031
 * @tc.desc   test for font family of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest031()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontFamily(typoStyle, "monospace");
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontFamily, "monospace");
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest032
 * @tc.number OHDrawingTypographyTest032
 * @tc.desc   test for font size of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest032()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontSize(typoStyle, FONT_SIZE_80);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, FONT_SIZE_80);
    OH_Drawing_SetTypographyTextFontSize(typoStyle, FONT_SIZE_40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, FONT_SIZE_40);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest033
 * @tc.number OHDrawingTypographyTest033
 * @tc.desc   test for font height of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest033()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontHeight(typoStyle, ZERO);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->heightScale, ZERO);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest034
 * @tc.number OHDrawingTypographyTest034
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest034()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W100);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W200);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_300);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W300);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_400);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W400);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_500);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W500);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest035
 * @tc.number OHDrawingTypographyTest035
 * @tc.desc   test for font style of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest035()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, INVALID_VALUE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest036
 * @tc.number OHDrawingTypographyTest036
 * @tc.desc   test for font families of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest036()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTypographyTextLineStyleFontFamilies(typoStyle, ARRAY_SIZE_1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = { "Roboto" };
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontFamilies, fontFamiliesResult);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest037
 * @tc.number OHDrawingTypographyTest037
 * @tc.desc   test for font size of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest037()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, FONT_SIZE_80);
    OHPrintf("ConvertToOriginalText(typoStyle)->lineStyleFontSize=%d",
             ConvertToOriginalText(typoStyle)->lineStyleFontSize);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, FONT_SIZE_80);
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, FONT_SIZE_40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, FONT_SIZE_40);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest038
 * @tc.number OHDrawingTypographyTest038
 * @tc.desc   test for font height of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest038()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontHeight(typoStyle, ZERO);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleHeightScale, ZERO);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest039
 * @tc.number OHDrawingTypographyTest039
 * @tc.desc   test for spacing scale of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest039()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, SPACING_1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, SPACING_1);
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, SPACING_2);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, SPACING_2);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest040
 * @tc.number OHDrawingTypographyTest040
 * @tc.desc   test for line metrics for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest040()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_NE(handler, nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, "OpenHarmony\n");
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_BitmapBuild(cBitmap, BITMAP_WIDTH, BITMAP_HEIGHT, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_FontParser* parser = OH_Drawing_CreateFontParser();
    static const std::string fileName = "/system/fonts/visibility_list.json";
    std::ifstream fileStream(fileName.c_str());
    if (fileStream.is_open()) {
        size_t fontNum;
        char** list = OH_Drawing_FontParserGetSystemFontList(parser, &fontNum);
        EXPECT_NE(list, nullptr);
        EXPECT_NE(OH_Drawing_FontParserGetFontByName(parser, list[0]), nullptr);
        OH_Drawing_DestroySystemFontList(list, fontNum);
    }
    OH_Drawing_DestroyFontParser(parser);
    OH_Drawing_LineMetrics* vectorMetrics = OH_Drawing_TypographyGetLineMetrics(typography);
    EXPECT_NE(vectorMetrics, nullptr);
    EXPECT_NE(OH_Drawing_LineMetricsGetSize(vectorMetrics), 0);
    OH_Drawing_DestroyLineMetrics(vectorMetrics);
    OH_Drawing_LineMetrics* metrics = new OH_Drawing_LineMetrics();
    EXPECT_TRUE(OH_Drawing_TypographyGetLineMetricsAt(typography, 0, metrics));
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest041
 * @tc.number OHDrawingTypographyTest041
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest041()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_600);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W600);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_700);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W700);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_800);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W800);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_900);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontWeight, FontWeight::W900);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest042
 * @tc.number OHDrawingTypographyTest042
 * @tc.desc   test for text shadow for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest042()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    EXPECT_EQ(OH_Drawing_TextStyleGetShadows(txtStyle) != nullptr, true);
    OH_Drawing_TextStyleClearShadows(txtStyle);
    OH_Drawing_TextShadow* textshadows = OH_Drawing_TextStyleGetShadows(txtStyle);
    OH_Drawing_DestroyTextShadows(textshadows);
    OH_Drawing_DestroyTextShadows(nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, OH_Drawing_CreateTextShadow());
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, INDEX_0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, LARGE_INDEX) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(nullptr, INDEX_0) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyle), ARRAY_SIZE_1);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(nullptr), 0);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest043
 * @tc.number OHDrawingTypographyTest043
 * @tc.desc   test for effectiveAlignment, isLineUnlimited, isEllipsized for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest043()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, "OpenHarmony\n");
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Font_Metrics fontmetrics;
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(typography, txtStyle, &fontmetrics), true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(nullptr, txtStyle, &fontmetrics), false);
    OH_Drawing_DisableFontCollectionFallback(OH_Drawing_CreateFontCollection());
    OH_Drawing_DisableFontCollectionFallback(nullptr);
    OH_Drawing_DisableFontCollectionSystemFont(OH_Drawing_CreateFontCollection());
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, "OpenHarmony\n");
    OH_Drawing_SetTypographyTextLocale(typoStyle, "OpenHarmony\n");
    OH_Drawing_SetTypographyTextSplitRatio(typoStyle, fontSize);
    OH_Drawing_TypographyGetTextStyle(typoStyle);
    EXPECT_EQ(OH_Drawing_TypographyGetEffectiveAlignment(typoStyle) >= 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsLineUnlimited(typoStyle) != 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsEllipsized(typoStyle) != 0, true);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest044
 * @tc.number OHDrawingTypographyTest044
 * @tc.desc   test for foreground brush for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest044()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Brush* foregroundBrush = OH_Drawing_BrushCreate();
    uint8_t alpha = ALPHA_128;
    OH_Drawing_BrushSetAlpha(foregroundBrush, alpha);
    OH_Drawing_SetTextStyleForegroundBrush(txtStyle, nullptr);
    OH_Drawing_SetTextStyleForegroundBrush(txtStyle, foregroundBrush);
    OH_Drawing_Brush* resForegroundBrush = OH_Drawing_BrushCreate();
    OH_Drawing_TextStyleGetForegroundBrush(txtStyle, nullptr);
    OH_Drawing_TextStyleGetForegroundBrush(txtStyle, resForegroundBrush);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(resForegroundBrush), alpha);
    OH_Drawing_BrushDestroy(resForegroundBrush);
    OH_Drawing_BrushDestroy(foregroundBrush);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest045
 * @tc.number OHDrawingTypographyTest045
 * @tc.desc   test for background brush for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest045()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Brush* backgroundBrush = OH_Drawing_BrushCreate();
    uint8_t backgroundAlpha = ALPHA_64;
    OH_Drawing_BrushSetAlpha(backgroundBrush, backgroundAlpha);
    OH_Drawing_SetTextStyleBackgroundBrush(txtStyle, nullptr);
    OH_Drawing_SetTextStyleBackgroundBrush(txtStyle, backgroundBrush);
    OH_Drawing_Brush* resBackgroundBrush = OH_Drawing_BrushCreate();
    OH_Drawing_TextStyleGetBackgroundBrush(txtStyle, nullptr);
    OH_Drawing_TextStyleGetBackgroundBrush(txtStyle, resBackgroundBrush);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(resBackgroundBrush), backgroundAlpha);
    OH_Drawing_BrushDestroy(resBackgroundBrush);
    OH_Drawing_BrushDestroy(backgroundBrush);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest046
 * @tc.number OHDrawingTypographyTest046
 * @tc.desc   test for background pen for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest046()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Pen* backgroundPen = OH_Drawing_PenCreate();
    float backgroundPenWidth = PEN_WIDTH_10;
    OH_Drawing_PenSetWidth(backgroundPen, backgroundPenWidth);
    OH_Drawing_SetTextStyleBackgroundPen(txtStyle, nullptr);
    OH_Drawing_SetTextStyleBackgroundPen(txtStyle, backgroundPen);
    OH_Drawing_Pen* resBackgroundPen = OH_Drawing_PenCreate();
    OH_Drawing_TextStyleGetBackgroundPen(txtStyle, nullptr);
    OH_Drawing_TextStyleGetBackgroundPen(txtStyle, resBackgroundPen);
    EXPECT_EQ(OH_Drawing_PenGetWidth(resBackgroundPen), backgroundPenWidth);
    OH_Drawing_PenDestroy(resBackgroundPen);
    OH_Drawing_PenDestroy(backgroundPen);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest047
 * @tc.number OHDrawingTypographyTest047
 * @tc.desc   test for foreground pen for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest047()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Pen* foregroundPen = OH_Drawing_PenCreate();
    float foregroundPenWidth = PEN_WIDTH_20;
    OH_Drawing_PenSetWidth(foregroundPen, foregroundPenWidth);
    OH_Drawing_SetTextStyleForegroundPen(txtStyle, nullptr);
    OH_Drawing_SetTextStyleForegroundPen(txtStyle, foregroundPen);
    OH_Drawing_Pen* resForegroundPen = OH_Drawing_PenCreate();
    OH_Drawing_TextStyleGetForegroundPen(txtStyle, nullptr);
    OH_Drawing_TextStyleGetForegroundPen(txtStyle, resForegroundPen);
    EXPECT_EQ(OH_Drawing_PenGetWidth(resForegroundPen), foregroundPenWidth);
    OH_Drawing_PenDestroy(resForegroundPen);
    OH_Drawing_PenDestroy(foregroundPen);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest048
 * @tc.number OHDrawingTypographyTest048
 * @tc.desc   test for font weight for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest048()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_500);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W500);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_600);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W600);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_700);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W700);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_800);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W800);
    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_900);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontWeight, FontWeight::W900);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest049
 * @tc.number OHDrawingTypographyTest049
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest049()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    bool halfLeading = true;
    OH_Drawing_SetTypographyTextHalfLeading(typoStyle, halfLeading);
    OH_Drawing_SetTypographyTextLineStyleHalfLeading(typoStyle, halfLeading);
    bool uselineStyle = true;
    OH_Drawing_SetTypographyTextUseLineStyle(typoStyle, uselineStyle);
    bool linestyleOnly = false;
    OH_Drawing_SetTypographyTextLineStyleOnly(typoStyle, linestyleOnly);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest050
 * @tc.number OHDrawingTypographyTest050
 * @tc.desc   test for getting numbers for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest050()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle, 1);
    EXPECT_EQ(OH_Drawing_TextStyleGetColor(txtStyle), 1);
    EXPECT_EQ(OH_Drawing_TextStyleGetColor(nullptr), 0xFFFFFFFF);
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_SOLID);
    EXPECT_EQ(OH_Drawing_TextStyleGetDecorationStyle(txtStyle), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetDecorationStyle(nullptr), TEXT_DECORATION_STYLE_SOLID);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_100);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontWeight(txtStyle), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontWeight(nullptr), FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyle(txtStyle), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyle(nullptr), FONT_STYLE_NORMAL);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    EXPECT_EQ(OH_Drawing_TextStyleGetBaseline(txtStyle), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetBaseline(nullptr), TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    size_t fontFamiliesNumber;
    char** fontFamiliesList = OH_Drawing_TextStyleGetFontFamilies(txtStyle, &fontFamiliesNumber);
    EXPECT_EQ(fontFamiliesList != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFamilies(nullptr, &fontFamiliesNumber) == nullptr, true);
    OH_Drawing_TextStyleDestroyFontFamilies(fontFamiliesList, fontFamiliesNumber);
    OH_Drawing_SetTextStyleFontSize(txtStyle, 60); // 60 means font size for test
    EXPECT_EQ(OH_Drawing_TextStyleGetFontSize(txtStyle), 60);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontSize(nullptr), ZERO);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, SPACING_20); // 20 means letter spacing for test
    EXPECT_EQ(OH_Drawing_TextStyleGetLetterSpacing(txtStyle), SPACING_20);
    EXPECT_EQ(OH_Drawing_TextStyleGetLetterSpacing(nullptr), ZERO);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, SPACING_80); // 80 means word spacing for test
    EXPECT_EQ(OH_Drawing_TextStyleGetWordSpacing(txtStyle), SPACING_80);
    EXPECT_EQ(OH_Drawing_TextStyleGetWordSpacing(nullptr), ZERO);
    OH_Drawing_SetTextStyleFontHeight(txtStyle, ZERO); // 0.0 means font height for test
    EXPECT_EQ(OH_Drawing_TextStyleGetFontHeight(txtStyle), ZERO);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontHeight(nullptr), ZERO);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    EXPECT_EQ(OH_Drawing_TextStyleGetHalfLeading(txtStyle), true);
    EXPECT_EQ(OH_Drawing_TextStyleGetHalfLeading(nullptr), false);
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    EXPECT_EQ(std::strcmp(OH_Drawing_TextStyleGetLocale(txtStyle), "en"), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetLocale(nullptr) == nullptr, true);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest051
 * @tc.number OHDrawingTypographyTest051
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest051()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_RectStyle_Info rectStyleInfo = { 1, 1.5, 1.5, 1.5, 1.5 }; // 1.5 means corner radius for test
    int styleId = 1;                                                     // 1 means styleId for test
    OH_Drawing_TextStyleSetBackgroundRect(txtStyle, nullptr, styleId);
    OH_Drawing_TextStyleSetBackgroundRect(nullptr, &rectStyleInfo, styleId);
    OH_Drawing_TextStyleSetBackgroundRect(txtStyle, &rectStyleInfo, styleId);
    uint32_t symbol = 2; // 2 means symbol for test
    OH_Drawing_TypographyHandlerAddSymbol(handler, symbol);
    const char* key1 = "宋体";
    int value1 = 1; // 1 for test
    OH_Drawing_TextStyleAddFontFeature(nullptr, key1, value1);
    OH_Drawing_TextStyleAddFontFeature(txtStyle, nullptr, value1);
    OH_Drawing_TextStyleAddFontFeature(txtStyle, key1, value1);
    const char* key2 = "斜体";
    int value2 = 2; // 2 for test
    OH_Drawing_TextStyleAddFontFeature(txtStyle, key2, value2);
    const char* key3 = "方体";
    int value3 = 3; // 3 for test
    OH_Drawing_TextStyleAddFontFeature(txtStyle, key3, value3);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatureSize(txtStyle), 3); // 3 means font feature size for test
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatureSize(nullptr), 0);
    OH_Drawing_FontFeature* fontFeaturesArray = OH_Drawing_TextStyleGetFontFeatures(txtStyle);
    EXPECT_EQ(fontFeaturesArray != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatures(nullptr) == nullptr, true);
    OH_Drawing_TextStyleDestroyFontFeatures(fontFeaturesArray, OH_Drawing_TextStyleGetFontFeatureSize(txtStyle));
    OH_Drawing_TextStyleDestroyFontFeatures(nullptr, OH_Drawing_TextStyleGetFontFeatureSize(txtStyle));
    OH_Drawing_TextStyleClearFontFeature(txtStyle);
    OH_Drawing_TextStyleClearFontFeature(nullptr);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatureSize(txtStyle), 0);
    double lineShift = 1.5; // 1.5 means baseline shift for test
    OH_Drawing_TextStyleSetBaselineShift(nullptr, lineShift);
    EXPECT_EQ(OH_Drawing_TextStyleGetBaselineShift(nullptr), 0.0);
    OH_Drawing_TextStyleSetBaselineShift(txtStyle, lineShift);
    EXPECT_EQ(OH_Drawing_TextStyleGetBaselineShift(txtStyle), lineShift);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest053
 * @tc.number OHDrawingTypographyTest053
 * @tc.desc   test for getting the mode of leading over and under text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest053()
{
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(nullptr) == TEXT_HEIGHT_ALL, true);
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_ALL);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle) == TEXT_HEIGHT_ALL, true);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle) == TEXT_HEIGHT_DISABLE_FIRST_ASCENT, true);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle) == TEXT_HEIGHT_DISABLE_LAST_ASCENT, true);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_ALL);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle) == TEXT_HEIGHT_DISABLE_ALL, true);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest054
 * @tc.number OHDrawingTypographyTest054
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest054()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyMarkDirty(typography);
    OH_Drawing_TypographyMarkDirty(nullptr);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    typoStyle = nullptr;
    fontCollection = nullptr;
    handler = nullptr;
    typography = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    EXPECT_TRUE(fontCollection == nullptr);
    EXPECT_TRUE(handler == nullptr);
    EXPECT_TRUE(typography == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest055
 * @tc.number OHDrawingTypographyTest055
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest055()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    int32_t result = OH_Drawing_TypographyGetUnresolvedGlyphsCount(typography);
    EXPECT_TRUE(result != 0);
    result = OH_Drawing_TypographyGetUnresolvedGlyphsCount(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    typoStyle = nullptr;
    fontCollection = nullptr;
    handler = nullptr;
    typography = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    EXPECT_TRUE(fontCollection == nullptr);
    EXPECT_TRUE(handler == nullptr);
    EXPECT_TRUE(typography == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest056
 * @tc.number OHDrawingTypographyTest056
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest056()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    size_t from = FROM_10; // 10 means font size for test
    size_t to = 11;        // 11 means font size for test
    float fontSize = 1.0;  // 1.0 means font size for test
    OH_Drawing_TypographyUpdateFontSize(typography, from, to, fontSize);
    OH_Drawing_TypographyUpdateFontSize(nullptr, from, to, fontSize);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    typoStyle = nullptr;
    fontCollection = nullptr;
    handler = nullptr;
    typography = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    EXPECT_TRUE(fontCollection == nullptr);
    EXPECT_TRUE(handler == nullptr);
    EXPECT_TRUE(typography == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest057
 * @tc.number OHDrawingTypographyTest057
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest057()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    bool useLineStyle = true;
    OH_Drawing_SetTypographyTextUseLineStyle(typoStyle, useLineStyle);
    bool result = OH_Drawing_TypographyTextGetLineStyle(typoStyle);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyTextGetLineStyle(nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest058
 * @tc.number OHDrawingTypographyTest058
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest058()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    int weight = FONT_WEIGHT_100;
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, weight);
    OH_Drawing_FontWeight result = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    EXPECT_TRUE(result == FONT_WEIGHT_100);
    result = OH_Drawing_TypographyTextlineStyleGetFontWeight(nullptr);
    EXPECT_TRUE(result == FONT_WEIGHT_400);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest059
 * @tc.number OHDrawingTypographyTest059
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest059()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    int fontStyle = FONT_STYLE_ITALIC;
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, fontStyle);
    OH_Drawing_FontStyle result = OH_Drawing_TypographyTextlineStyleGetFontStyle(typoStyle);
    EXPECT_TRUE(result == FONT_STYLE_ITALIC);
    result = OH_Drawing_TypographyTextlineStyleGetFontStyle(nullptr);
    EXPECT_TRUE(result == FONT_STYLE_NORMAL);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest060
 * @tc.number OHDrawingTypographyTest060
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest060()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    size_t fontNum = 1; // 1 means font number for test
    const char* fontFamilies[] = { "Roboto" };
    int fontFamiliesNumber = 1; // 1 means font families number for test
    OH_Drawing_SetTypographyTextLineStyleFontFamilies(typoStyle, fontFamiliesNumber, fontFamilies);
    char** result = OH_Drawing_TypographyTextlineStyleGetFontFamilies(typoStyle, &fontNum);
    EXPECT_TRUE(result != nullptr);
    result = OH_Drawing_TypographyTextlineStyleGetFontFamilies(nullptr, &fontNum);
    EXPECT_TRUE(result == nullptr);
    OH_Drawing_TypographyTextlineStyleDestroyFontFamilies(result, fontNum);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest061
 * @tc.number OHDrawingTypographyTest061
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest061()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    double result = OH_Drawing_TypographyTextlineStyleGetFontSize(typoStyle);
    // 14.0 Fontsize default value
    EXPECT_TRUE(result == 14.0);
    result = OH_Drawing_TypographyTextlineStyleGetFontSize(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest062
 * @tc.number OHDrawingTypographyTest062
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest062()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    double result = OH_Drawing_TypographyTextlineStyleGetHeightScale(typoStyle);
    EXPECT_TRUE(result == 1.0); // 1.0 means enable the font height for line styles in text layout only
    result = OH_Drawing_TypographyTextlineStyleGetHeightScale(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest063
 * @tc.number OHDrawingTypographyTest063
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest063()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    // 2.0 measn font height for test
    double lineStyleFontHeight = 2.0;
    OH_Drawing_SetTypographyTextLineStyleFontHeight(typoStyle, lineStyleFontHeight);
    bool result = OH_Drawing_TypographyTextlineStyleGetHeightOnly(typoStyle);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyTextlineStyleGetHeightOnly(nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest064
 * @tc.number OHDrawingTypographyTest064
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest064()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    bool lineStyleHalfLeading = true;
    OH_Drawing_SetTypographyTextLineStyleHalfLeading(typoStyle, lineStyleHalfLeading);
    bool result = OH_Drawing_TypographyTextlineStyleGetHalfLeading(typoStyle);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyTextlineStyleGetHalfLeading(nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest065
 * @tc.number OHDrawingTypographyTest065
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest065()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    double result = OH_Drawing_TypographyTextlineStyleGetSpacingScale(typoStyle);
    // -1.0 for test
    EXPECT_TRUE(result == -1.0);
    result = OH_Drawing_TypographyTextlineStyleGetSpacingScale(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest066
 * @tc.number OHDrawingTypographyTest066
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest066()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    int direction = TEXT_DIRECTION_RTL;
    OH_Drawing_SetTypographyTextDirection(typoStyle, direction);
    OH_Drawing_TextDirection result = OH_Drawing_TypographyGetTextDirection(typoStyle);
    EXPECT_TRUE(result == TEXT_DIRECTION_RTL);
    result = OH_Drawing_TypographyGetTextDirection(nullptr);
    EXPECT_TRUE(result == TEXT_DIRECTION_LTR);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest067
 * @tc.number OHDrawingTypographyTest067
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest067()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    size_t result = OH_Drawing_TypographyGetTextMaxLines(typoStyle);
    EXPECT_TRUE(result != 0);
    result = OH_Drawing_TypographyGetTextMaxLines(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest068
 * @tc.number OHDrawingTypographyTest068
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest068()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    char* result = OH_Drawing_TypographyGetTextEllipsis(typoStyle);
    EXPECT_TRUE(result != nullptr);
    result = OH_Drawing_TypographyGetTextEllipsis(nullptr);
    EXPECT_TRUE(result == nullptr);
    OH_Drawing_TypographyDestroyEllipsis(result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest069
 * @tc.number OHDrawingTypographyTest069
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest069()
{
    OH_Drawing_TypographyStyle* from = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyStyle* to = OH_Drawing_CreateTypographyStyle();
    bool result = OH_Drawing_TypographyStyleEquals(from, to);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyStyleEquals(nullptr, to);
    EXPECT_TRUE(result == false);
    result = OH_Drawing_TypographyStyleEquals(from, nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_DestroyTypographyStyle(from);
    OH_Drawing_DestroyTypographyStyle(to);
    from = nullptr;
    to = nullptr;
    EXPECT_TRUE(from == nullptr);
    EXPECT_TRUE(to == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest070
 * @tc.number OHDrawingTypographyTest070
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest070()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleOnly(typoStyle, true);
    bool result = OH_Drawing_TypographyTextlineGetStyleOnly(typoStyle);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyTextlineGetStyleOnly(nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest071
 * @tc.number OHDrawingTypographyTest071
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest071()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    int align = TEXT_ALIGN_RIGHT;
    OH_Drawing_SetTypographyTextAlign(typoStyle, align);
    OH_Drawing_TextAlign result = OH_Drawing_TypographyGetTextAlign(typoStyle);
    EXPECT_TRUE(result == TEXT_ALIGN_RIGHT);
    result = OH_Drawing_TypographyGetTextAlign(nullptr);
    EXPECT_TRUE(result == TEXT_ALIGN_LEFT);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest072
 * @tc.number OHDrawingTypographyTest072
 * @tc.desc   test for create and releases the memory occupied by system font configuration information
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest072()
{
    OH_Drawing_FontConfigInfoErrorCode code = ERROR_FONT_CONFIG_INFO_UNKNOWN;
    OH_Drawing_FontConfigInfo* configJsonInfo = OH_Drawing_GetSystemFontConfigInfo(&code);
    if (configJsonInfo != nullptr) {
        EXPECT_EQ(code, SUCCESS_FONT_CONFIG_INFO);
    } else {
        EXPECT_NE(code, SUCCESS_FONT_CONFIG_INFO);
    }
    OH_Drawing_DestroySystemFontConfigInfo(configJsonInfo);
    configJsonInfo = nullptr;
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest073
 * @tc.number OHDrawingTypographyTest073
 * @tc.desc   test for getting all font metrics array from current line
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest073()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_TRUE(typoStyle != nullptr);
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_TRUE(txtStyle != nullptr);
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    size_t charNumber = 0;
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    EXPECT_TRUE(typography != nullptr);
    OH_Drawing_Font_Metrics* StartLineFont = OH_Drawing_TypographyGetLineFontMetrics(typography, 1, &charNumber);
    EXPECT_TRUE(StartLineFont == nullptr);
    OH_Drawing_TypographyDestroyLineFontMetrics(StartLineFont);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest074
 * @tc.number OHDrawingTypographyTest074
 * @tc.desc   test for getting and setting strut style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest074()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_StrutStyle* strutstyle = new OH_Drawing_StrutStyle();
    strutstyle->weight = FONT_WEIGHT_400;
    strutstyle->style = FONT_STYLE_ITALIC;
    // 17.0 For size
    strutstyle->size = 17.0;
    // 2.0 For heightScale
    strutstyle->heightScale = 2;
    strutstyle->heightOverride = true;
    strutstyle->halfLeading = true;
    // 3.0 For leading
    strutstyle->leading = 3.0;
    strutstyle->forceStrutHeight = true;
    // 4 For families size
    strutstyle->familiesSize = 4;
    strutstyle->families = (char**)malloc(strutstyle->familiesSize * sizeof(char*));
    const char* temp[] = { "1", "2", "3", "4" };
    for (int i = 0; i < strutstyle->familiesSize; i++) {
        // 2 For families member size
        strutstyle->families[i] = (char*)malloc(2 * sizeof(char));
        strutstyle->families[i][0] = temp[i][0];
        strutstyle->families[i][1] = '\0';
    }
    OH_Drawing_SetTypographyStyleTextStrutStyle(typoStyle, strutstyle);
    EXPECT_EQ(OH_Drawing_TypographyStyleGetStrutStyle(typoStyle) != nullptr, true);
    OH_Drawing_TypographyStyleDestroyStrutStyle(strutstyle);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest075
 * @tc.number OHDrawingTypographyTest075
 * @tc.desc   test for the two TextStyle objects have matching properties
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest075()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle* txtStyleCompare = OH_Drawing_CreateTextStyle();
    bool result = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    EXPECT_TRUE(result == true);
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    result = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    EXPECT_TRUE(result == false);
    EXPECT_EQ(OH_Drawing_TextStyleIsAttributeMatched(nullptr, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES), false);
    EXPECT_EQ(OH_Drawing_TextStyleIsAttributeMatched(txtStyle, nullptr, TEXT_STYLE_ALL_ATTRIBUTES), false);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(txtStyleCompare);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest077
 * @tc.number OHDrawingTypographyTest077
 * @tc.desc   test for gets the typoStyle alignment mode and whether to enable text prompts
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest077()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_EQ(OH_Drawing_TypographyStyleGetEffectiveAlignment(typoStyle), TEXT_ALIGN_LEFT);
    EXPECT_EQ(OH_Drawing_TypographyStyleIsHintEnabled(typoStyle), false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest078
 * @tc.number OHDrawingTypographyTest078
 * @tc.desc   test for strutstyle equals
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest078()
{
    OH_Drawing_StrutStyle* from = new OH_Drawing_StrutStyle();
    OH_Drawing_StrutStyle* to = new OH_Drawing_StrutStyle();
    bool result = OH_Drawing_TypographyStyleStrutStyleEquals(from, to);
    EXPECT_TRUE(result == true);
    result = OH_Drawing_TypographyStyleStrutStyleEquals(nullptr, to);
    EXPECT_TRUE(result == false);
    result = OH_Drawing_TypographyStyleStrutStyleEquals(from, nullptr);
    EXPECT_TRUE(result == false);
    OH_Drawing_TypographyStyleDestroyStrutStyle(from);
    OH_Drawing_TypographyStyleDestroyStrutStyle(to);
    from = nullptr;
    to = nullptr;
    EXPECT_TRUE(from == nullptr);
    EXPECT_TRUE(to == nullptr);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest080
 * @tc.number OHDrawingTypographyTest080
 * @tc.desc   test for whether two TextStyle objects are equal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest080()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle* txtStyleCompare = OH_Drawing_CreateTextStyle();
    bool result = OH_Drawing_TextStyleIsEqual(txtStyle, txtStyleCompare);
    EXPECT_TRUE(result == true);
    OH_Drawing_SetTextStyleColor(txtStyle, 1);
    result = OH_Drawing_TextStyleIsEqual(txtStyle, txtStyleCompare);
    EXPECT_TRUE(result == false);
    OH_Drawing_SetTextStyleColor(txtStyleCompare, 1);
    result = OH_Drawing_TextStyleIsEqual(txtStyle, txtStyleCompare);
    EXPECT_TRUE(result == true);
    EXPECT_EQ(OH_Drawing_TextStyleIsEqual(nullptr, txtStyleCompare), false);
    EXPECT_EQ(OH_Drawing_TextStyleIsEqual(txtStyle, nullptr), false);
    EXPECT_EQ(OH_Drawing_TextStyleIsEqual(nullptr, nullptr), true);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(txtStyleCompare);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest081
 * @tc.number OHDrawingTypographyTest081
 * @tc.desc   test for getting and setting text style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest081()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_NE(txtStyle, nullptr);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_SetTextStyleFontStyleStruct(txtStyle, normalStyle);

    OH_Drawing_FontStyleStruct style = OH_Drawing_TextStyleGetFontStyleStruct(txtStyle);
    EXPECT_EQ(style.weight, normalStyle.weight);
    EXPECT_EQ(style.width, normalStyle.width);
    EXPECT_EQ(style.slant, normalStyle.slant);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest082
 * @tc.number OHDrawingTypographyTest082
 * @tc.desc   test for getting and setting typography style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest082()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_NE(typoStyle, nullptr);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_SetTypographyStyleFontStyleStruct(typoStyle, normalStyle);

    OH_Drawing_FontStyleStruct style = OH_Drawing_TypographyStyleGetFontStyleStruct(typoStyle);
    EXPECT_EQ(style.weight, normalStyle.weight);
    EXPECT_EQ(style.width, normalStyle.width);
    EXPECT_EQ(style.slant, normalStyle.slant);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest083
 * @tc.number OHDrawingTypographyTest083
 * @tc.desc   test for the font properties of two TextStyle objects are equal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest083()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle* txtStyleCompare = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    OH_Drawing_SetTextStyleLocale(txtStyleCompare, "en");
    bool result = OH_Drawing_TextStyleIsEqualByFont(txtStyle, txtStyleCompare);
    EXPECT_TRUE(result == true);
    OH_Drawing_SetTextStyleLocale(txtStyle, "ch");
    result = OH_Drawing_TextStyleIsEqualByFont(txtStyle, txtStyleCompare);
    EXPECT_TRUE(result == false);
    EXPECT_EQ(OH_Drawing_TextStyleIsEqualByFont(nullptr, txtStyleCompare), false);
    EXPECT_EQ(OH_Drawing_TextStyleIsEqualByFont(txtStyle, nullptr), false);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(txtStyleCompare);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest084
 * @tc.number OHDrawingTypographyTest084
 * @tc.desc   test for BREAK_STRATEGY_GREEDY
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest084()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_GREEDY);
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyGreedyTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = { 1.2, 3.4 };
    OH_Drawing_TypographySetIndents(typography, ARRAY_SIZE_2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest085
 * @tc.number OHDrawingTypographyTest085
 * @tc.desc   test for BREAK_STRATEGY_BALANCED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest085()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyBALANCEDTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = { 1.2, 3.4 };
    OH_Drawing_TypographySetIndents(typography, ARRAY_SIZE_2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest086
 * @tc.number OHDrawingTypographyTest086
 * @tc.desc   test for BREAK_STRATEGY_HIGH_QUALITY
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest086()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_HIGH_QUALITY);
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyHighQualityTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = { 1.2, 3.4 };
    OH_Drawing_TypographySetIndents(typography, ARRAY_SIZE_2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest102
 * @tc.number OHDrawingTypographyTest102
 * @tc.desc   test for the font parser
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest102()
{
    OH_Drawing_FontParser* parser = OH_Drawing_CreateFontParser();
    static const std::string fileName = "/system/fonts/visibility_list.json";
    std::ifstream fileStream(fileName.c_str());
    if (fileStream.is_open()) {
        size_t fontNum;
        char** list = OH_Drawing_FontParserGetSystemFontList(parser, &fontNum);
        EXPECT_NE(list, nullptr);
        EXPECT_EQ(OH_Drawing_FontParserGetSystemFontList(nullptr, &fontNum), nullptr);
        const char* name = list[0];
        EXPECT_NE(OH_Drawing_FontParserGetFontByName(parser, name), nullptr);
        EXPECT_EQ(OH_Drawing_FontParserGetFontByName(nullptr, name), nullptr);
        OH_Drawing_DestroySystemFontList(list, fontNum);
        OH_Drawing_DestroySystemFontList(nullptr, fontNum);
    }
    OH_Drawing_DestroyFontParser(parser);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest103
 * @tc.number OHDrawingTypographyTest103
 * @tc.desc   test arc text drawing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest103()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, ARC_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);
    OH_Drawing_Path* cPath = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(cPath, LEFT_POS, LEFT_POS, RIGHT_POS, RIGHT_POS, 0, RADIAN_TER);

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_CanvasDrawPath(cCanvas, cPath);
    OH_Drawing_TypographyPaintOnPath(typography, cCanvas, cPath, ARC_FONT_SIZE, ARC_FONT_SIZE);
    OH_Drawing_Font_Metrics fontmetrics;
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(typography, txtStyle, &fontmetrics), true);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_PathDestroy(cPath);
    OH_Drawing_CanvasDestroy(cCanvas);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest104
 * @tc.number OHDrawingTypographyTest104
 * @tc.desc   test arc text offset
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest104()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, ARC_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);
    OH_Drawing_Path* cPath = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(cPath, LEFT_POS, LEFT_POS, RIGHT_POS, RIGHT_POS, 0, RADIAN_TER);

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_CanvasDrawPath(cCanvas, cPath);
    OH_Drawing_TypographyPaintOnPath(typography, cCanvas, cPath, ARC_FONT_SIZE, ARC_FONT_SIZE);
    OH_Drawing_Font_Metrics fontmetrics;
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(typography, txtStyle, &fontmetrics), true);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_PathDestroy(cPath);
    OH_Drawing_CanvasDestroy(cCanvas);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTest105
 * @tc.number OHDrawingTypographyTest105
 * @tc.desc   test for the text box
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTest105()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TextBox* textBox = OH_Drawing_TypographyGetRectsForPlaceholders(typography);
    OH_Drawing_GetLeftFromTextBox(textBox, 0);
    OH_Drawing_GetRightFromTextBox(textBox, 0);
    OH_Drawing_GetTopFromTextBox(textBox, 0);
    OH_Drawing_GetBottomFromTextBox(textBox, 0);
    EXPECT_EQ(OH_Drawing_GetTextDirectionFromTextBox(textBox, 0), 0);
    EXPECT_EQ(OH_Drawing_GetSizeOfTextBox(textBox), 0);

    OH_Drawing_PositionAndAffinity* positionAndAffinity =
        OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0);
    OH_Drawing_GetPositionFromPositionAndAffinity(positionAndAffinity);
    OH_Drawing_GetAffinityFromPositionAndAffinity(positionAndAffinity);

    OH_Drawing_Range* range = OH_Drawing_TypographyGetWordBoundary(typography, 1);
    OH_Drawing_GetStartFromRange(range);
    OH_Drawing_GetEndFromRange(range);
    OH_Drawing_TypographyGetLineHeight(typography, 1);
    OH_Drawing_TypographyGetLineWidth(typography, 1);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTypographyTestWithIndent
 * @tc.number OHDrawingTypographyTestWithIndent
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTypographyTestWithIndent()
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(txtStyle,
                                 OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_RGB_00, COLOR_RGB_00));
    double fontSize = DEFAULT_FONT_SIZE;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, ARRAY_SIZE_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = { INDENT_1_2, INDENT_3_4 };
    OH_Drawing_TypographySetIndents(typography, ARRAY_SIZE_2, indents);
    float indent = INDENT_3_4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = DEFAULT_MAX_WIDTH;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = { POSITION_X, POSITION_Y };
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = BITMAP_WIDTH;
    uint32_t height = BITMAP_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF, COLOR_ALPHA_FF));

    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLineWithIndent(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
                  OH_Drawing_TypographyGetMaxIntrinsicWidth(typography),
              true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingAddTextStyleDecoration001
 * @tc.number OHDrawingAddTextStyleDecoration001
 * @tc.desc   test for Add Text Style Decoration
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingAddTextStyleDecoration001()
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_NE(txtStyle, nullptr);
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_NONE);

    OH_Drawing_AddTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE);
    OH_Drawing_AddTextStyleDecoration(txtStyle, TEXT_DECORATION_OVERLINE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::UNDERLINE | TextDecoration::OVERLINE);
    OH_Drawing_RemoveTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_RemoveTextStyleDecoration(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_RemoveTextStyleDecoration(nullptr, TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_AddTextStyleDecoration(
        txtStyle, TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_OVERLINE | TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration,
              TextDecoration::UNDERLINE | TextDecoration::OVERLINE | TextDecoration::LINE_THROUGH);
    OH_Drawing_RemoveTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_RemoveTextStyleDecoration(nullptr, TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_LINE_THROUGH);

    OH_Drawing_DestroyTextStyle(txtStyle);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingTextLineEnumerateCaretOffsets001
 * @tc.number OHDrawingTextLineEnumerateCaretOffsets001
 * @tc.desc   test for Text Line Enumerate Caret Offsets
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingTextLineEnumerateCaretOffsets001()
{
    OHDrawingTypographyTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    const int expectResult = 4;
    EXPECT_EQ(size, expectResult);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineEnumerateCaretOffsets(textLine, [](double offset, int32_t index, bool leadingEdge) {
            EXPECT_GE(index, 0);
            EXPECT_EQ(offset, 0.0);
            EXPECT_TRUE(leadingEdge);
            return false;
        });
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingUnregisterFont001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingUnregisterFont_001
 * @tc.desc   test for unregister font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingUnregisterFont001()
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    uint32_t result = OH_Drawing_RegisterFont(fontCollection, "test1", EXIST_FONT_PATH);
    EXPECT_EQ(result, 0);
    result = OH_Drawing_RegisterFont(fontCollection, "test2", EXIST_FONT_PATH);
    EXPECT_EQ(result, 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test1"), 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test2"), 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test3"), 0);

    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyFontCollection(fontCollection);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TestOHDrawingUnregisterFont002
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingUnregisterFont_002
 * @tc.desc   test for unregister font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int TestOHDrawingUnregisterFont002()
{
    // ERROR_NULL_FONT_COLLECTION is 8
    const uint32_t nullFontCollection = 8;
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    EXPECT_EQ(OH_Drawing_UnregisterFont(nullptr, ""), nullFontCollection);
    EXPECT_EQ(OH_Drawing_UnregisterFont(nullptr, nullptr), nullFontCollection);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, nullptr), nullFontCollection);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, ""), nullFontCollection);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, OHOS_THEME_FONT), nullFontCollection);
    OH_Drawing_DestroyFontCollection(fontCollection);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS