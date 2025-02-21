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
#include "c/drawing_bitmap.h"
#include "c/drawing_canvas.h"
#include "c/drawing_color.h"
#include "c/drawing_font_collection.h"
#include "c/drawing_text_declaration.h"
#include "c/drawing_text_typography.h"
#ifndef USE_GRAPHIC_TEXT_GINE
#include "rosen_text/ui/typography.h"
#include "rosen_text/ui/typography_create.h"
#else
#include "rosen_text/typography.h"
#include "rosen_text/typography_create.h"
#endif

#ifndef USE_GRAPHIC_TEXT_GINE
using namespace rosen;
#else
using namespace OHOS::Rosen;
#endif
using namespace testing;
using namespace testing::ext;

namespace OHOS {
class OH_Drawing_TypographyTest : public testing::Test {
};

static TypographyStyle* ConvertToOriginalText(OH_Drawing_TypographyStyle* style)
{
    return reinterpret_cast<TypographyStyle*>(style);
}

static TextStyle* ConvertToOriginalText(OH_Drawing_TextStyle* style)
{
    return reinterpret_cast<TextStyle*>(style);
}

/*
 * @tc.name: OH_Drawing_TypographyTest001
 * @tc.desc: test for creating TypographyStyle
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest001, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_EQ(typoStyle == nullptr, false);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/*
 * @tc.name: OH_Drawing_TypographyTest002
 * @tc.desc: test for text direction
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest002, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_LTR);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection_, TextDirection::LTR);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
#endif
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_RTL);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection_, TextDirection::RTL);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::RTL);
#endif
    OH_Drawing_SetTypographyTextDirection(typoStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection_, TextDirection::LTR);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textDirection, TextDirection::LTR);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest003
 * @tc.desc: test for text alignment
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest003, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_LEFT);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::LEFT);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::LEFT);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_RIGHT);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::RIGHT);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::RIGHT);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_CENTER);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::CENTER);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::CENTER);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_JUSTIFY);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::JUSTIFY);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::JUSTIFY);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_START);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::START);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::START);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_END);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::END);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::END);
#endif
    OH_Drawing_SetTypographyTextAlign(typoStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign_, TextAlign::LEFT);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->textAlign, TextAlign::LEFT);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest004
 * @tc.desc: test for max lines
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest004, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 100);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines_, 100);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, 100);
#endif
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 200);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines_, 200);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->maxLines, 200);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest005
 * @tc.desc: test for creating text style
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest005, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(txtStyle == nullptr, false);
    OH_Drawing_DestroyTextStyle(txtStyle);
}

/*
 * @tc.name: OH_Drawing_TypographyTest006
 * @tc.desc: test for text color
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest006, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    // black
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color_, 0xFF000000);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFF000000);
#endif
    // red
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color_, 0xFFFF0000);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFFFF0000);
#endif
    // blue
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF));
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color_, 0xFF0000FF);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->color, 0xFF0000FF);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest007
 * @tc.desc: test for font size
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest007, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(txtStyle, 80);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize_, 80);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, 80);
#endif
    OH_Drawing_SetTextStyleFontSize(txtStyle, 40);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize_, 40);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontSize, 40);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest008
 * @tc.desc: test for font weight
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest008, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_100);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W100);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W100);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_200);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W200);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W200);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_300);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W300);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W300);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W400);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W400);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_500);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W500);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W500);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_600);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W600);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W600);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_700);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W700);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W700);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_800);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W800);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W800);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_900);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W900);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W900);
#endif
    OH_Drawing_SetTextStyleFontWeight(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight_, FontWeight::W400);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontWeight, FontWeight::W400);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest009
 * @tc.desc: test for baseline location
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest009, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->textBaseline_, TextBaseline::ALPHABETIC);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
#endif
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_IDEOGRAPHIC);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->textBaseline_, TextBaseline::IDEOGRAPHIC);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::IDEOGRAPHIC);
#endif
    OH_Drawing_SetTextStyleBaseLine(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->textBaseline_, TextBaseline::ALPHABETIC);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->baseline, TextBaseline::ALPHABETIC);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest010
 * @tc.desc: test for text decoration
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest010, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_NONE);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration_, TextDecoration::NONE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::NONE);
#endif
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_UNDERLINE);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration_, TextDecoration::UNDERLINE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::UNDERLINE);
#endif
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_OVERLINE);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration_, TextDecoration::OVERLINE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::OVERLINE);
#endif
    OH_Drawing_SetTextStyleDecoration(txtStyle, TEXT_DECORATION_LINE_THROUGH);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration_, TextDecoration::LINETHROUGH);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::LINE_THROUGH);
#endif
    OH_Drawing_SetTextStyleDecoration(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration_, TextDecoration::NONE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decoration, TextDecoration::NONE);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest011
 * @tc.desc: test for text decoration color
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest011, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor_, 0xFF000000);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFF000000);
#endif
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor_, 0xFFFF0000);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFFFF0000);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest012
 * @tc.desc: test for font height
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest012, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontHeight(txtStyle, 0.0);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->height_, 0.0);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->heightScale, 0.0);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest013
 * @tc.desc: test for font families
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest013, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, 1, fontFamilies);
    std::vector<std::string> fontFamiliesResult = {"Roboto"};
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontFamilies_, fontFamiliesResult);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontFamilies, fontFamiliesResult);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest014
 * @tc.desc: test for font italic
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest014, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_NORMAL);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle_, rosen::FontStyle::NORMAL);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
#endif
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_ITALIC);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle_, rosen::FontStyle::ITALIC);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::ITALIC);
#endif
    OH_Drawing_SetTextStyleFontStyle(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle_, rosen::FontStyle::NORMAL);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->fontStyle, FontStyle::NORMAL);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest015
 * @tc.desc: test for font locale
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest015, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->locale_, "en");
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->locale, "en");
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest016
 * @tc.desc: test for typography
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest016, TestSize.Level1)
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
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
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
    EXPECT_EQ(OH_Drawing_TypographyDidExceedMaxLines(typography) != true, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}


/*
 * @tc.name: OH_Drawing_TypographyTest017
 * @tc.desc: test for typography
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest017, TestSize.Level1)
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
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_ALPHABETIC);
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

    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetRectsForPlaceholders(typography) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetGlyphPositionAtCoordinateWithCluster(typography, 1, 0) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetWordBoundary(typography, 1) != nullptr, true);
    EXPECT_EQ(OH_Drawing_TypographyGetLineCount(typography) != 0, true);
    OH_Drawing_TypographyPaint(typography, cCanvas, position[0], position[1]);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/*
 * @tc.name: OH_Drawing_TypographyTest018
 * @tc.desc: test for break strategy
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest018, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextBreakStrategy(typoStyle, BREAK_STRATEGY_BALANCED);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy_, BreakStrategy::BreakStrategyBalanced);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->breakStrategy, BreakStrategy::BALANCED);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest019
 * @tc.desc: test for word break type
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest019, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_WORD);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType_, WordBreakType::WordBreakTypeBreakWord);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
#endif
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType_, WordBreakType::WordBreakTypeBreakWord);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->wordBreakType, WordBreakType::BREAK_WORD);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest020
 * @tc.desc: test for ellipsis modal
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest020, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextEllipsisModal(typoStyle, ELLIPSIS_MODAL_HEAD);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal_, EllipsisModal::HEAD);
#else
    EXPECT_EQ(ConvertToOriginalText(typoStyle)->ellipsisModal, EllipsisModal::HEAD);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest021
 * @tc.desc: test for decoration style
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest021, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_SOLID);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::SOLID);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
#endif
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOUBLE);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::DOUBLE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOUBLE);
#endif
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOTTED);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::DOTTED);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DOTTED);
#endif
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DASHED);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::DASHED);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::DASHED);
#endif
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_WAVY);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::WAVY);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::WAVY);
#endif
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle_, TextDecorationStyle::SOLID);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationStyle, TextDecorationStyle::SOLID);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest022
 * @tc.desc: test for decoration thickness scale
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest022, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 10);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessMultiplier_, 10);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 10);
#endif
    OH_Drawing_SetTextStyleDecorationThicknessScale(txtStyle, 20);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessMultiplier_, 20);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationThicknessScale, 20);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest023
 * @tc.desc: test for letter spacing
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest023, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 10);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing_, 10);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 10);
#endif
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, 20);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing_, 20);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->letterSpacing, 20);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest024
 * @tc.desc: test for word spacing
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest024, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 10);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing_, 10);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 10);
#endif
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, 20);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing_, 20);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->wordSpacing, 20);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest025
 * @tc.desc: test for ellipsis modal
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest025, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_HEAD);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal_, EllipsisModal::HEAD);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::HEAD);
#endif
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_MIDDLE);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal_, EllipsisModal::MIDDLE);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::MIDDLE);
#endif
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, ELLIPSIS_MODAL_TAIL);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal_, EllipsisModal::TAIL);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
#endif
    OH_Drawing_SetTextStyleEllipsisModal(txtStyle, -1);
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal_, EllipsisModal::TAIL);
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsisModal, EllipsisModal::TAIL);
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest026
 * @tc.desc: test for set ellipsis
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest026, TestSize.Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleEllipsis(txtStyle, "...");
#ifndef USE_GRAPHIC_TEXT_GINE
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsis_, u"...");
#else
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->ellipsis, u"...");
#endif
}

/*
 * @tc.name: OH_Drawing_TypographyTest027
 * @tc.desc: test for get rect
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest027, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    OH_Drawing_TextBox* TextBox = OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle);
    OH_Drawing_GetLeftFromTextBox(TextBox, 1);
    OH_Drawing_GetRightFromTextBox(TextBox, 1);
    OH_Drawing_GetTopFromTextBox(TextBox, 1);
    OH_Drawing_GetBottomFromTextBox(TextBox, 1);
    OH_Drawing_GetTextDirectionFromTextBox(TextBox, 2);
    OH_Drawing_GetSizeOfTextBox(TextBox);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/*
 * @tc.name: OH_Drawing_TypographyTest028
 * @tc.desc: test for get position
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest028, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_PositionAndAffinity* affinity = OH_Drawing_TypographyGetGlyphPositionAtCoordinate(typography, 1, 0);
    OH_Drawing_GetPositionFromPositionAndAffinity(affinity);
    OH_Drawing_GetAffinityFromPositionAndAffinity(affinity);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/*
 * @tc.name: OH_Drawing_TypographyTest029
 * @tc.desc: test for get range
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest029, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_Range* range = OH_Drawing_TypographyGetWordBoundary(typography, 1);
    OH_Drawing_GetStartFromRange(range);
    OH_Drawing_GetEndFromRange(range);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

/*
 * @tc.name: OH_Drawing_TypographyTest030
 * @tc.desc: test for get lineWidht and lineHeight
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest030, TestSize.Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle,
        OH_Drawing_CreateFontCollection());
    EXPECT_TRUE(handler != nullptr);
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyGetLineHeight(typography, 1);
    OH_Drawing_TypographyGetLineWidth(typography, 2);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
}

}
