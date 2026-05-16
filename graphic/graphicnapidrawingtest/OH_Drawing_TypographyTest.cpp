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

#include "gtest/gtest.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_font.h"
#include "drawing_font_collection.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_text_declaration.h"
#include "drawing_text_typography.h"
#include "drawing_text_line.h"
#include "drawing_text_lineTypography.h"
#include "rosen_text/typography.h"
#include "rosen_text/typography_create.h"
#include "drawing_text_global.h"
#include "drawing_text_blob.h"
#include "global_config/text_global_config.h"
#include "text/text_blob.h"
#include "text_style.h"
#include "typography.h"
#include "drawing_register_font.h"

#include <string>
#include <fstream>

using namespace OHOS::Rosen;
using namespace testing;
using namespace testing::ext;

namespace OHOS {
class OH_Drawing_TypographyTest : public testing::Test {
public:
    void SetUp() override
    {
        typoStyle_ = nullptr;
        txtStyle_ = nullptr;
        fontCollection_ = nullptr;
        handler_ = nullptr;
        typography_ = nullptr;
        cBitmap_ = nullptr;
        canvas_ = nullptr;
    }

    void TearDown() override
    {
        if (canvas_ != nullptr) {
            OH_Drawing_CanvasDestroy(canvas_);
            canvas_ = nullptr;
        }
        if (typography_ != nullptr) {
            OH_Drawing_DestroyTypography(typography_);
            typography_ = nullptr;
        }
        if (handler_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler_);
            handler_ = nullptr;
        }
        if (txtStyle_ != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle_);
            txtStyle_ = nullptr;
        }
        if (typoStyle_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle_);
            typoStyle_ = nullptr;
        }
        if (cBitmap_ != nullptr) {
            OH_Drawing_BitmapDestroy(cBitmap_);
            cBitmap_ = nullptr;
        }
        if (fontCollection_ != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection_);
            fontCollection_ = nullptr;
        }
    }

    void PrepareCreateTextLine(const std::string& text);

protected:
    OH_Drawing_TypographyStyle* typoStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Bitmap* cBitmap_ = nullptr;
    OH_Drawing_Canvas* canvas_ = nullptr;
};

const double ARC_FONT_SIZE = 30;
const double MAX_WIDTH = 800.0;
const double RADIAN_TER = 180.0;
const double LEFT_POS = 50.0;
const double RIGHT_POS = 150.0;
const char* EXISTFONTPATH = "/system/fonts/HarmonyOS_Sans.ttf";
const char* OHOS_THEME_FONT = "OhosThemeFont";

static TypographyStyle* ConvertToOriginalText(OH_Drawing_TypographyStyle* style)
{
    return reinterpret_cast<TypographyStyle*>(style);
}

static TextStyle* ConvertToOriginalText(OH_Drawing_TextStyle* style)
{
    return reinterpret_cast<TextStyle*>(style);
}

static uint32_t GetTextHighContrast()
{
    auto &instance = Rosen::Drawing::ProcessTextConstrast::Instance();
    return static_cast<uint32_t>(instance.GetTextContrast());
}

void OH_Drawing_TypographyTest::PrepareCreateTextLine(const std::string& text)
{
    double maxWidth = 500.0;
    uint32_t height = 40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    EXPECT_TRUE(typoStyle_ != nullptr);
    txtStyle_ = OH_Drawing_CreateTextStyle();
    EXPECT_TRUE(txtStyle_ != nullptr);
    fontCollection_ = OH_Drawing_CreateFontCollection();
    EXPECT_TRUE(fontCollection_ != nullptr);
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    EXPECT_TRUE(handler_ != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_TRUE(typography_ != nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {10.0, 15.0};
    cBitmap_ = OH_Drawing_BitmapCreate();
    EXPECT_TRUE(cBitmap_ != nullptr);
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    EXPECT_TRUE(canvas_ != nullptr);
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

/**
 * @tc.name   OH_Drawing_TypographyTest001
 * @tc.number OH_Drawing_TypographyTest001
 * @tc.desc   test for creating TypographyStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest001, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_EQ(typoStyle == nullptr, false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest002
 * @tc.number OH_Drawing_TypographyTest002
 * @tc.desc   test for text direction
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest002, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_LTR);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_RTL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::RTL);
    OH_Drawing_SetTypographyTextDirection(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
}

/**
 * @tc.name   OH_Drawing_TypographyTest003
 * @tc.number OH_Drawing_TypographyTest003
 * @tc.desc   test for text alignment
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest003, Function | MediumTest | Level1)
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
    OH_Drawing_SetTypographyTextAlign(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::LEFT);
}

/**
 * @tc.name   OH_Drawing_TypographyTest004
 * @tc.number OH_Drawing_TypographyTest004
 * @tc.desc   test for max lines
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest004, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 100);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, 100);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 200);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, 200);
}

/**
 * @tc.name   OH_Drawing_TypographyTest005
 * @tc.number OH_Drawing_TypographyTest005
 * @tc.desc   test for creating text style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest005, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(txtStyle == nullptr, false);
    OH_Drawing_DestroyTextStyle(txtStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest006
 * @tc.number OH_Drawing_TypographyTest006
 * @tc.desc   test for text color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest006, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    // black
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFF000000);
    // red
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFFFF0000);
    // blue
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFF0000FF);
}

/**
 * @tc.name   OH_Drawing_TypographyTest007
 * @tc.number OH_Drawing_TypographyTest007
 * @tc.desc   test for font size
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest007, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(txtStyle, 80);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, 80);
    OH_Drawing_SetTextStyleFontSize(txtStyle, 40);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, 40);
}

/**
 * @tc.name   OH_Drawing_TypographyTest008
 * @tc.number OH_Drawing_TypographyTest008
 * @tc.desc   test for font weight
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest008, Function | MediumTest | Level1)
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
    OH_Drawing_SetTextStyleFontWeight(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W400);
}

/**
 * @tc.name   OH_Drawing_TypographyTest009
 * @tc.number OH_Drawing_TypographyTest009
 * @tc.desc   test for baseline location
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest009, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_IDEOGRAPHIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::IDEOGRAPHIC);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
}

/**
 * @tc.name   OH_Drawing_TypographyTest010
 * @tc.number OH_Drawing_TypographyTest010
 * @tc.desc   test for text decoration
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest010, Function | MediumTest | Level1)
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
    OH_Drawing_SetTextStyleDecoration(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::NONE);
}

/**
 * @tc.name   OH_Drawing_TypographyTest011
 * @tc.number OH_Drawing_TypographyTest011
 * @tc.desc   test for text decoration color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest011, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFF000000);
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFFFF0000);
}

/**
 * @tc.name   OH_Drawing_TypographyTest012
 * @tc.number OH_Drawing_TypographyTest012
 * @tc.desc   test for font height
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest012, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontHeight(txtStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->heightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest013
 * @tc.number OH_Drawing_TypographyTest013
 * @tc.desc   test for font families
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest013, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = {"Roboto"};
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontFamilies, fontFamiliesResult);
}

/**
 * @tc.name   OH_Drawing_TypographyTest014
 * @tc.number OH_Drawing_TypographyTest014
 * @tc.desc   test for font italic
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest014, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest015
 * @tc.number OH_Drawing_TypographyTest015
 * @tc.desc   test for font locale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest015, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->locale, "en");
}

/**
 * @tc.name   OH_Drawing_TypographyTest016
 * @tc.number OH_Drawing_TypographyTest016
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest016, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);

    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    float indent = 3.4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));

    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLine(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
        OH_Drawing_TypographyGetMaxIntrinsicWidth(typography), true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest017
 * @tc.number OH_Drawing_TypographyTest017
 * @tc.desc   test for break strategy
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest017, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_GREEDY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_HIGH_QUALITY);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::HIGH_QUALITY);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::BALANCED);
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::GREEDY);
}

/**
 * @tc.name   OH_Drawing_TypographyTest018
 * @tc.number OH_Drawing_TypographyTest018
 * @tc.desc   test for word break type
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest018, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::NORMAL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_ALL);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_WORD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
}

/**
 * @tc.name   OH_Drawing_TypographyTest019
 * @tc.number OH_Drawing_TypographyTest019
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest019, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::TAIL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest020
 * @tc.number OH_Drawing_TypographyTest020
 * @tc.desc   test for decoration style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest020, Function | MediumTest | Level1)
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
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
}

/**
 * @tc.name   OH_Drawing_TypographyTest021
 * @tc.number OH_Drawing_TypographyTest021
 * @tc.desc   test for decoration thickness scale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest021, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 10);
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest022
 * @tc.number OH_Drawing_TypographyTest022
 * @tc.desc   test for letter spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest022, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 10);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest023
 * @tc.number OH_Drawing_TypographyTest023
 * @tc.desc   test for word spacing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest023, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 10);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 10);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 20);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 20);
}

/**
 * @tc.name   OH_Drawing_TypographyTest024
 * @tc.number OH_Drawing_TypographyTest024
 * @tc.desc   test for ellipsis modal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest024, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_HEAD);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::HEAD);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_MIDDLE);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::MIDDLE);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_TAIL);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest025
 * @tc.number OH_Drawing_TypographyTest025
 * @tc.desc   test for set ellipsis
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest025, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsis(txtStyle, "...");
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsis, u"...");
}

/**
 * @tc.name   OH_Drawing_TypographyTest026
 * @tc.number OH_Drawing_TypographyTest026
 * @tc.desc   test for typography and txtStyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest026, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_PlaceholderSpan placeholderSpan = {20, 40,
        ALIGNMENT_OFFSET_AT_BASELINE, TEXT_BASELINE_ALPHABETIC, 10};
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    EXPECT_EQ(OH_Drawing_TypographyDidExceedMaxLines(typography) != true, true);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetWordBoundary(typography, 1) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineTextRange(typography, 1, true) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineCount(typography) != 0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest027
 * @tc.number OH_Drawing_TypographyTest027
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest027, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest028
 * @tc.number OH_Drawing_TypographyTest028
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest028, Function | MediumTest | Level1)
{
    OH_Drawing_TextShadow* textShadow = OH_Drawing_CreateTextShadow();
    EXPECT_EQ(textShadow == nullptr, false);
    OH_Drawing_DestroyTextShadow(textShadow);
    OH_Drawing_DestroyTextShadow(nullptr);
}

/**
 * @tc.name   OH_Drawing_TypographyTest029
 * @tc.number OH_Drawing_TypographyTest029
 * @tc.desc   test for font weight of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest029, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest030
 * @tc.number OH_Drawing_TypographyTest030
 * @tc.desc   test for font style of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest030, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest031
 * @tc.number OH_Drawing_TypographyTest031
 * @tc.desc   test for font family of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest031, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontFamily(typoStyle, "monospace");
    EXPECT_EQ(ConvertToOriginalText(typoStyle)-> fontFamily, "monospace");
}

/**
 * @tc.name   OH_Drawing_TypographyTest032
 * @tc.number OH_Drawing_TypographyTest032
 * @tc.desc   test for font size of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest032, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontSize(typoStyle, 80);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, 80);
    OH_Drawing_SetTypographyTextFontSize(typoStyle, 40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->fontSize, 40);
}

/**
 * @tc.name   OH_Drawing_TypographyTest033
 * @tc.number OH_Drawing_TypographyTest033
 * @tc.desc   test for font height of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest033, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextFontHeight(typoStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->heightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest034
 * @tc.number OH_Drawing_TypographyTest034
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest034, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest035
 * @tc.number OH_Drawing_TypographyTest035
 * @tc.desc   test for font style of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest035, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_NORMAL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_ITALIC);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::ITALIC);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, -1);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontStyle, FontStyle::NORMAL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest036
 * @tc.number OH_Drawing_TypographyTest036
 * @tc.desc   test for font families of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest036, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTypographyTextLineStyleFontFamilies(typoStyle, 1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = {"Roboto"};
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontFamilies, fontFamiliesResult);
}

/**
 * @tc.name   OH_Drawing_TypographyTest037
 * @tc.number OH_Drawing_TypographyTest037
 * @tc.desc   test for font size of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest037, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, 80);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, 80);
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, 40);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleFontSize, 40);
}

/**
 * @tc.name   OH_Drawing_TypographyTest038
 * @tc.number OH_Drawing_TypographyTest038
 * @tc.desc   test for font height of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest038, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleFontHeight(typoStyle, 0.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleHeightScale, 0.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest039
 * @tc.number OH_Drawing_TypographyTest039
 * @tc.desc   test for spacing scale of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest039, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, 1.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, 1.0);
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, 2.0);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->lineStyleSpacingScale, 2.0);
}

/**
 * @tc.name   OH_Drawing_TypographyTest040
 * @tc.number OH_Drawing_TypographyTest040
 * @tc.desc   test for line metrics for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest040, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_NE(handler, nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_FontDescriptor *descriptor = OH_Drawing_CreateFontDescriptor();
    OH_Drawing_FontParser* parser = OH_Drawing_CreateFontParser();

    static const std::string FILE_NAME = "/system/fonts/visibility_list.json";
    std::ifstream fileStream(FILE_NAME.c_str());
    if (fileStream.is_open()) {
        size_t fontNum;
        char** list = OH_Drawing_FontParserGetSystemFontList(parser, &fontNum);
        EXPECT_NE(list, nullptr);
        const char *name = list[0];
        EXPECT_NE(OH_Drawing_FontParserGetFontByName(parser, name), nullptr);
        OH_Drawing_DestroySystemFontList(list, fontNum);
    }
    OH_Drawing_DestroyFontParser(parser);
    OH_Drawing_DestroyFontDescriptor(descriptor);
    OH_Drawing_LineMetrics* vectorMetrics = OH_Drawing_TypographyGetLineMetrics(typography);
    EXPECT_NE(vectorMetrics, nullptr);
    EXPECT_NE(OH_Drawing_LineMetricsGetSize(vectorMetrics), 0);
    OH_Drawing_DestroyLineMetrics(vectorMetrics);
    OH_Drawing_LineMetrics* metrics = new OH_Drawing_LineMetrics();
    EXPECT_TRUE(OH_Drawing_TypographyGetLineMetricsAt(typography, 0, metrics));
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest041
 * @tc.number OH_Drawing_TypographyTest041
 * @tc.desc   test for font weight of line style for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest041, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest042
 * @tc.number OH_Drawing_TypographyTest042
 * @tc.desc   test for text shadow for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest042, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    EXPECT_EQ(OH_Drawing_TextStyleGetShadows(txtStyle) != nullptr, true);
    OH_Drawing_TextStyleClearShadows(txtStyle);
    OH_Drawing_TextShadow* textshadows = OH_Drawing_TextStyleGetShadows(txtStyle);
    OH_Drawing_DestroyTextShadows(textshadows);
    OH_Drawing_DestroyTextShadows(nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, OH_Drawing_CreateTextShadow());
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(txtStyle, 10000000) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowWithIndex(nullptr, 0) == nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyle), 1);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(nullptr), 0);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest043
 * @tc.number OH_Drawing_TypographyTest043
 * @tc.desc   test for effectiveAlignment, isLineUnlimited, isEllipsized for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest043, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Font_Metrics fontmetrics;
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(typography, txtStyle, &fontmetrics), true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontMetrics(nullptr, txtStyle, &fontmetrics), false);
    OH_Drawing_DisableFontCollectionFallback(OH_Drawing_CreateFontCollection());
    OH_Drawing_DisableFontCollectionFallback(nullptr);
    OH_Drawing_DisableFontCollectionSystemFont(OH_Drawing_CreateFontCollection());
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, text);
    OH_Drawing_SetTypographyTextLocale(typoStyle, text);
    OH_Drawing_SetTypographyTextSplitRatio(typoStyle, fontSize);
    OH_Drawing_TypographyGetTextStyle(typoStyle);
    EXPECT_EQ(OH_Drawing_TypographyGetEffectiveAlignment(typoStyle) >= 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsLineUnlimited(typoStyle) != 0, true);
    EXPECT_EQ(OH_Drawing_TypographyIsEllipsized(typoStyle) != 0, true);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest044
 * @tc.number OH_Drawing_TypographyTest044
 * @tc.desc   test for foreground brush for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest044, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Brush *foregroundBrush = OH_Drawing_BrushCreate();
    uint8_t alpha = 128;
    OH_Drawing_BrushSetAlpha(foregroundBrush, alpha);
    OH_Drawing_SetTextStyleForegroundBrush(txtStyle, nullptr);
    OH_Drawing_SetTextStyleForegroundBrush(txtStyle, foregroundBrush);
    OH_Drawing_Brush *resForegroundBrush = OH_Drawing_BrushCreate();
    OH_Drawing_TextStyleGetForegroundBrush(txtStyle, nullptr);
    OH_Drawing_TextStyleGetForegroundBrush(txtStyle, resForegroundBrush);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(resForegroundBrush), alpha);
    OH_Drawing_BrushDestroy(resForegroundBrush);
    OH_Drawing_BrushDestroy(foregroundBrush);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest045
 * @tc.number OH_Drawing_TypographyTest045
 * @tc.desc   test for background brush for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest045, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Brush *backgroundBrush = OH_Drawing_BrushCreate();
    uint8_t backgroundAlpha = 64;
    OH_Drawing_BrushSetAlpha(backgroundBrush, backgroundAlpha);
    OH_Drawing_SetTextStyleBackgroundBrush(txtStyle, nullptr);
    OH_Drawing_SetTextStyleBackgroundBrush(txtStyle, backgroundBrush);
    OH_Drawing_Brush *resBackgroundBrush = OH_Drawing_BrushCreate();
    OH_Drawing_TextStyleGetBackgroundBrush(txtStyle, nullptr);
    OH_Drawing_TextStyleGetBackgroundBrush(txtStyle, resBackgroundBrush);
    EXPECT_EQ(OH_Drawing_BrushGetAlpha(resBackgroundBrush), backgroundAlpha);
    OH_Drawing_BrushDestroy(resBackgroundBrush);
    OH_Drawing_BrushDestroy(backgroundBrush);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest046
 * @tc.number OH_Drawing_TypographyTest046
 * @tc.desc   test for background pen for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest046, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Pen *backgroundPen = OH_Drawing_PenCreate();
    float backgroundPenWidth = 10;
    OH_Drawing_PenSetWidth(backgroundPen, backgroundPenWidth);
    OH_Drawing_SetTextStyleBackgroundPen(txtStyle, nullptr);
    OH_Drawing_SetTextStyleBackgroundPen(txtStyle, backgroundPen);
    OH_Drawing_Pen *resBackgroundPen = OH_Drawing_PenCreate();
    OH_Drawing_TextStyleGetBackgroundPen(txtStyle, nullptr);
    OH_Drawing_TextStyleGetBackgroundPen(txtStyle, resBackgroundPen);
    EXPECT_EQ(OH_Drawing_PenGetWidth(resBackgroundPen), backgroundPenWidth);
    OH_Drawing_PenDestroy(resBackgroundPen);
    OH_Drawing_PenDestroy(backgroundPen);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest047
 * @tc.number OH_Drawing_TypographyTest047
 * @tc.desc   test for foreground pen for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest047, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_Pen *foregroundPen = OH_Drawing_PenCreate();
    float foregroundPenWidth = 20;
    OH_Drawing_PenSetWidth(foregroundPen, foregroundPenWidth);
    OH_Drawing_SetTextStyleForegroundPen(txtStyle, nullptr);
    OH_Drawing_SetTextStyleForegroundPen(txtStyle, foregroundPen);
    OH_Drawing_Pen *resForegroundPen = OH_Drawing_PenCreate();
    OH_Drawing_TextStyleGetForegroundPen(txtStyle, nullptr);
    OH_Drawing_TextStyleGetForegroundPen(txtStyle, resForegroundPen);
    EXPECT_EQ(OH_Drawing_PenGetWidth(resForegroundPen), foregroundPenWidth);
    OH_Drawing_PenDestroy(resForegroundPen);
    OH_Drawing_PenDestroy(foregroundPen);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OH_Drawing_TypographyTest048
 * @tc.number OH_Drawing_TypographyTest048
 * @tc.desc   test for font weight for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest048, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest049
 * @tc.number OH_Drawing_TypographyTest049
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest049, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    bool halfLeading = true;
    OH_Drawing_SetTypographyTextHalfLeading(typoStyle, halfLeading);
    OH_Drawing_SetTypographyTextLineStyleHalfLeading(typoStyle, halfLeading);
    bool uselineStyle = true;
    OH_Drawing_SetTypographyTextUseLineStyle(typoStyle, uselineStyle);
    bool linestyleOnly = false;
    OH_Drawing_SetTypographyTextLineStyleOnly(typoStyle, linestyleOnly);
}


/**
 * @tc.name   OH_Drawing_TypographyTest050
 * @tc.number OH_Drawing_TypographyTest050
 * @tc.desc   test for getting numbers for textstyle
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest050, Function | MediumTest | Level1)
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
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    size_t fontFamiliesNumber;
    char** fontFamiliesList = OH_Drawing_TextStyleGetFontFamilies(txtStyle, &fontFamiliesNumber);
    EXPECT_EQ(fontFamiliesList != nullptr, true);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFamilies(nullptr, &fontFamiliesNumber) == nullptr, true);
    OH_Drawing_TextStyleDestroyFontFamilies(fontFamiliesList, fontFamiliesNumber);
    OH_Drawing_SetTextStyleFontSize(txtStyle, 60); // 60 means font size for test
    EXPECT_EQ(OH_Drawing_TextStyleGetFontSize(txtStyle), 60);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontSize(nullptr), 0.0);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 20); // 20 means letter spacing for test
    EXPECT_EQ(OH_Drawing_TextStyleGetLetterSpacing(txtStyle), 20);
    EXPECT_EQ(OH_Drawing_TextStyleGetLetterSpacing(nullptr), 0.0);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 80); // 80 means word spacing for test
    EXPECT_EQ(OH_Drawing_TextStyleGetWordSpacing(txtStyle), 80);
    EXPECT_EQ(OH_Drawing_TextStyleGetWordSpacing(nullptr), 0.0);
    OH_Drawing_SetTextStyleFontHeight(txtStyle, 0.0); // 0.0 means font height for test
    EXPECT_EQ(OH_Drawing_TextStyleGetFontHeight(txtStyle), 0.0);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontHeight(nullptr), 0.0);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    EXPECT_EQ(OH_Drawing_TextStyleGetHalfLeading(txtStyle), true);
    EXPECT_EQ(OH_Drawing_TextStyleGetHalfLeading(nullptr), false);
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    EXPECT_EQ(std::strcmp(OH_Drawing_TextStyleGetLocale(txtStyle), "en"), 0);
    EXPECT_EQ(OH_Drawing_TextStyleGetLocale(nullptr) == nullptr, true);
}

/**
 * @tc.name   OH_Drawing_TypographyTest051
 * @tc.number OH_Drawing_TypographyTest051
 * @tc.desc   test for getting line info for text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest051, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    OH_Drawing_RectStyle_Info rectStyleInfo = {1, 1.5, 1.5, 1.5, 1.5}; // 1.5 means corner radius for test
    int styleId = 1; // 1 means styleId for test
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
    EXPECT_EQ(OH_Drawing_TextStyleGetBaselineShift(txtStyle), 1.5);
}

/**
 * @tc.name   OH_Drawing_TypographyTest052
 * @tc.number OH_Drawing_TypographyTest052
 * @tc.desc   test for setting the mode of leading over and under text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest052, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::ALL);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_FIRST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_LAST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_ALL);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textHeightBehavior, TextHeightBehavior::DISABLE_ALL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest053
 * @tc.number OH_Drawing_TypographyTest053
 * @tc.desc   test for getting the mode of leading over and under text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest053, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest054
 * @tc.number OH_Drawing_TypographyTest054
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest054, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest055
 * @tc.number OH_Drawing_TypographyTest055
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest055, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest056
 * @tc.number OH_Drawing_TypographyTest056
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest056, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    size_t from = 10; // 10 means font size for test
    size_t to = 11; // 11 means font size for test
    float fontSize = 1.0; // 1.0 means font size for test
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest057
 * @tc.number OH_Drawing_TypographyTest057
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest057, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest058
 * @tc.number OH_Drawing_TypographyTest058
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest058, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest059
 * @tc.number OH_Drawing_TypographyTest059
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest059, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest060
 * @tc.number OH_Drawing_TypographyTest060
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest060, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    size_t fontNum = 1; // 1 means font number for test
    const char* fontFamilies[] = {"Roboto"};
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest061
 * @tc.number OH_Drawing_TypographyTest061
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest061, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest062
 * @tc.number OH_Drawing_TypographyTest062
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest062, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    double result = OH_Drawing_TypographyTextlineStyleGetHeightScale(typoStyle);
    EXPECT_TRUE(result == 1.0); // 1.0 means enable the font height for line styles in text layout only
    result = OH_Drawing_TypographyTextlineStyleGetHeightScale(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
}

/**
 * @tc.name   OH_Drawing_TypographyTest063
 * @tc.number OH_Drawing_TypographyTest063
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest063, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest064
 * @tc.number OH_Drawing_TypographyTest064
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest064, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest065
 * @tc.number OH_Drawing_TypographyTest065
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest065, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest066
 * @tc.number OH_Drawing_TypographyTest066
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest066, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest067
 * @tc.number OH_Drawing_TypographyTest067
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest067, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    size_t result = OH_Drawing_TypographyGetTextMaxLines(typoStyle);
    EXPECT_TRUE(result != 0);
    result = OH_Drawing_TypographyGetTextMaxLines(nullptr);
    EXPECT_TRUE(result == 0);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
}

/**
 * @tc.name   OH_Drawing_TypographyTest068
 * @tc.number OH_Drawing_TypographyTest068
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest068, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest069
 * @tc.number OH_Drawing_TypographyTest069
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest069, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest070
 * @tc.number OH_Drawing_TypographyTest070
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest070, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest071
 * @tc.number OH_Drawing_TypographyTest071
 * @tc.desc   test for halfleading, uselinestyle linestyleonly of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest071, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    int align = TEXT_ALIGN_RIGHT;
    OH_Drawing_SetTypographyTextAlign(typoStyle, align);
    OH_Drawing_TextAlign result = OH_Drawing_TypographyGetTextAlign(typoStyle);
    EXPECT_TRUE(result == TEXT_ALIGN_RIGHT);
    result= OH_Drawing_TypographyGetTextAlign(nullptr);
    EXPECT_TRUE(result == TEXT_ALIGN_LEFT);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    typoStyle = nullptr;
    EXPECT_TRUE(typoStyle == nullptr);
}

/**
 * @tc.name   OH_Drawing_TypographyTest072
 * @tc.number OH_Drawing_TypographyTest072
 * @tc.desc   test for create and releases the memory occupied by system font configuration information
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest072, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest073
 * @tc.number OH_Drawing_TypographyTest073
 * @tc.desc   test for getting all font metrics array from current line
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest073, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_TRUE(typoStyle != nullptr);
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_TRUE(txtStyle != nullptr);
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest074
 * @tc.number OH_Drawing_TypographyTest074
 * @tc.desc   test for getting and setting strut style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest074, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_NE(typoStyle, nullptr);
    OH_Drawing_StrutStyle *strutstyle = new OH_Drawing_StrutStyle();
    EXPECT_NE(strutstyle, nullptr);
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
    strutstyle->families = (char**)malloc(strutstyle->familiesSize*sizeof(char*));
    const char *temp[] = {"1", "2", "3", "4"};
    for (int i = 0; i < strutstyle->familiesSize; i++) {
        // 2 For families member size
        strutstyle->families[i] = (char*)malloc(2*sizeof(char));
        strcpy_s(strutstyle->families[i], 2, temp[i]);
    }
    OH_Drawing_SetTypographyStyleTextStrutStyle(typoStyle, strutstyle);
    EXPECT_EQ(OH_Drawing_TypographyStyleGetStrutStyle(typoStyle) != nullptr, true);
    OH_Drawing_TypographyStyleDestroyStrutStyle(strutstyle);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest075
 * @tc.number OH_Drawing_TypographyTest075
 * @tc.desc   test for the two TextStyle objects have matching properties
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest075, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle *txtStyleCompare = OH_Drawing_CreateTextStyle();
    bool result = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    EXPECT_TRUE(result == true);
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    result = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    EXPECT_TRUE(result == false);
    EXPECT_EQ(OH_Drawing_TextStyleIsAttributeMatched(nullptr, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES), false);
    EXPECT_EQ(OH_Drawing_TextStyleIsAttributeMatched(txtStyle, nullptr, TEXT_STYLE_ALL_ATTRIBUTES), false);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(txtStyleCompare);
}

/**
 * @tc.name   OH_Drawing_TypographyTest076
 * @tc.number OH_Drawing_TypographyTest076
 * @tc.desc   test for sets and gets isPlaceholder for TextStyle objects
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest076, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(nullptr), false);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), false);
    OH_Drawing_TextStyleSetPlaceholder(nullptr);
    OH_Drawing_TextStyleSetPlaceholder(txtStyle);
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), true);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->isPlaceholder, true);
    OH_Drawing_DestroyTextStyle(txtStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest077
 * @tc.number OH_Drawing_TypographyTest077
 * @tc.desc   test for gets the typoStyle alignment mode and whether to enable text prompts
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest077, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_EQ(OH_Drawing_TypographyStyleGetEffectiveAlignment(typoStyle), TEXT_ALIGN_LEFT);
    EXPECT_EQ(OH_Drawing_TypographyStyleIsHintEnabled(typoStyle), false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest078
 * @tc.number OH_Drawing_TypographyTest078
 * @tc.desc   test for strutstyle equals
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest078, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest079
 * @tc.number OH_Drawing_TypographyTest079
 * @tc.desc   test for setting the hinting of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest079, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyStyleSetHintsEnabled(typoStyle, true);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->hintingIsOn, true);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest080
 * @tc.number OH_Drawing_TypographyTest080
 * @tc.desc   test for whether two TextStyle objects are equal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest080, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle *txtStyleCompare = OH_Drawing_CreateTextStyle();
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest081
 * @tc.number OH_Drawing_TypographyTest081
 * @tc.desc   test for getting and setting text style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest081, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest082
 * @tc.number OH_Drawing_TypographyTest082
 * @tc.desc   test for getting and setting typography style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest082, Function | MediumTest | Level1)
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest083
 * @tc.number OH_Drawing_TypographyTest083
 * @tc.desc   test for the font properties of two TextStyle objects are equal
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest083, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle *txtStyleCompare = OH_Drawing_CreateTextStyle();
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest084
 * @tc.number OH_Drawing_TypographyTest084
 * @tc.desc   test for BREAK_STRATEGY_GREEDY
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest084, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_GREEDY);
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyGreedyTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
}

/**
 * @tc.name   OH_Drawing_TypographyTest085
 * @tc.number OH_Drawing_TypographyTest085
 * @tc.desc   test for BREAK_STRATEGY_BALANCED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest085, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyBALANCEDTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
}

/**
 * @tc.name   OH_Drawing_TypographyTest086
 * @tc.number OH_Drawing_TypographyTest086
 * @tc.desc   test for BREAK_STRATEGY_HIGH_QUALITY
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest086, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_HIGH_QUALITY);
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "breakStrategyTest breakStrategy breakStrategyHighQualityTest";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    // {1.2, 3.4} for unit test
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    // 300.0 for unit test
    double maxWidth = 300.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
}

/**
 * @tc.name   OH_Drawing_TypographyTest102
 * @tc.number OH_Drawing_TypographyTest102
 * @tc.desc   test for the font parser
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest102, Function | MediumTest | Level1)
{
    OH_Drawing_FontParser* parser = OH_Drawing_CreateFontParser();
    static const std::string FILE_NAME = "/system/fonts/visibility_list.json";
    std::ifstream fileStream(FILE_NAME.c_str());
    if (fileStream.is_open()) {
        size_t fontNum;
        char** list = OH_Drawing_FontParserGetSystemFontList(parser, &fontNum);
        EXPECT_NE(list, nullptr);
        EXPECT_EQ(OH_Drawing_FontParserGetSystemFontList(nullptr, &fontNum), nullptr);
        const char *name = list[0];
        EXPECT_NE(OH_Drawing_FontParserGetFontByName(parser, name), nullptr);
        EXPECT_EQ(OH_Drawing_FontParserGetFontByName(nullptr, name), nullptr);
        OH_Drawing_DestroySystemFontList(list, fontNum);
        OH_Drawing_DestroySystemFontList(nullptr, fontNum);
    }
    OH_Drawing_DestroyFontParser(parser);
}

/**
 * @tc.name   OH_Drawing_TypographyTest103
 * @tc.number OH_Drawing_TypographyTest103
 * @tc.desc   test arc text drawing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest103, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, ARC_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);
    OH_Drawing_Path* cPath = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(cPath, LEFT_POS, LEFT_POS, RIGHT_POS, RIGHT_POS, 0, RADIAN_TER);

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest104
 * @tc.number OH_Drawing_TypographyTest104
 * @tc.desc   test arc text offset
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest104, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    OH_Drawing_SetTextStyleFontSize(txtStyle, ARC_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);
    OH_Drawing_Path* cPath = OH_Drawing_PathCreate();
    OH_Drawing_PathArcTo(cPath, LEFT_POS, LEFT_POS, RIGHT_POS, RIGHT_POS, 0, RADIAN_TER);

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
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
}

/**
 * @tc.name   OH_Drawing_TypographyTest105
 * @tc.number OH_Drawing_TypographyTest105
 * @tc.desc   test for the text box
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest105, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
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
}

/**
 * @tc.name   OH_Drawing_TypographyTestWithIndent
 * @tc.number OH_Drawing_TypographyTestWithIndent
 * @tc.desc   test for typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTestWithIndent, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);

    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);

    const char* text = "OpenHarmony\n";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(handler);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    const float indents[] = {1.2, 3.4};
    OH_Drawing_TypographySetIndents(typography, 2, indents);
    float indent = 3.4;
    EXPECT_EQ(indent, OH_Drawing_TypographyGetIndentsWithIndex(typography, 1));
    double maxWidth = 800.0;
    OH_Drawing_TypographyLayout(typography, maxWidth);
    EXPECT_EQ(maxWidth, OH_Drawing_TypographyGetMaxWidth(typography));
    double position[2] = {10.0, 15.0};
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    uint32_t height = 40;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(cBitmap));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(cBitmap));

    OH_Drawing_Canvas* cCanvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(cCanvas, cBitmap);
    OH_Drawing_CanvasClear(cCanvas, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));

    EXPECT_EQ(OH_Drawing_TypographyGetHeight(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLongestLineWithIndent(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetMinIntrinsicWidth(typography) <=
        OH_Drawing_TypographyGetMaxIntrinsicWidth(typography), true);
    EXPECT_EQ(OH_Drawing_TypographyGetAlphabeticBaseline(typography) != 0.0, true);
    EXPECT_EQ(OH_Drawing_TypographyGetIdeographicBaseline(typography) != 0.0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/**
 * @tc.name   OHDrawingAddTextStyleDecoration001
 * @tc.number OHDrawingAddTextStyleDecoration001
 * @tc.desc   test for Add Text Style Decoration
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingAddTextStyleDecoration001, Function | MediumTest | Level1)
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
    OH_Drawing_AddTextStyleDecoration(txtStyle,
        TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_OVERLINE | TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration,
        TextDecoration::UNDERLINE | TextDecoration::OVERLINE | TextDecoration::LINE_THROUGH);
    OH_Drawing_RemoveTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_LINE_THROUGH);
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
    OH_Drawing_RemoveTextStyleDecoration(nullptr, TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_LINE_THROUGH);

    OH_Drawing_DestroyTextStyle(txtStyle);
}

/**
 * @tc.name   OHDrawingSetTypographyTextTab001
 * @tc.number OHDrawingSetTypographyTextTab001
 * @tc.desc   test for Set Typography Text Tab
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTypographyTextTab001, Function | MediumTest | Level1)
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, -1.0);
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextTab(typoStyle, textTab);
    OH_Drawing_SetTypographyTextTab(nullptr, textTab);
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->tab.alignment, TextAlign::LEFT);
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->tab.location, -1.0);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OHDrawingTextLineEnumerateCaretOffsets001
 * @tc.number OHDrawingTextLineEnumerateCaretOffsets001
 * @tc.desc   test for Text Line Enumerate Caret Offsets
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingTextLineEnumerateCaretOffsets001, Function | MediumTest | Level1)
{
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, 4);

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
}

/**
 * @tc.name   OHDrawingSetTextHighContrast001
 * @tc.number OHDrawingSetTextHighContrast001
 * @tc.desc   test for text high contrast mode
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast001, Function | MediumTest | Level1)
{
    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
}

/**
 * @tc.name   OHDrawingSetTextHighContrast002
 * @tc.number OHDrawingSetTextHighContrast002
 * @tc.desc   test for text high contrast mode(Invalid)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast002, Function | MediumTest | Level1)
{
    uint32_t preValue = GetTextHighContrast();
    OH_Drawing_SetTextHighContrast(static_cast<OH_Drawing_TextHighContrast>(Rosen::SrvText::TEXT_HIGH_CONTRAST_BUTT));
    EXPECT_EQ(GetTextHighContrast(), preValue);
}

/**
 * @tc.name   testOHDrawingUnregisterFont001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingUnregisterFont_001
 * @tc.desc   test for unregister font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, testOHDrawingUnregisterFont001, Function | MediumTest | Level1)
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    uint32_t result = OH_Drawing_RegisterFont(fontCollection, "test1", EXISTFONTPATH);
    EXPECT_EQ(result, 0);
    result = OH_Drawing_RegisterFont(fontCollection, "test2", EXISTFONTPATH);
    EXPECT_EQ(result, 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test1"), 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test2"), 0);
    EXPECT_EQ(OH_Drawing_UnregisterFont(fontCollection, "test3"), 0);

    OH_Drawing_DestroyFontCollection(fontCollection);
}

/**
 * @tc.name   testOHDrawingUnregisterFont002
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingUnregisterFont_002
 * @tc.desc   test for unregister font
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, testOHDrawingUnregisterFont002, Function | MediumTest | Level1)
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
}
}