/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "include/NativeCopyStyleTest.h"
#include <cstring>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace {
const double DOUBLE_TEST_SIZE_NOT_DEFAULT = 20.0;
const float FLOAT_TEST_SIZE_NOT_DEFAULT = 10.0f;
const int INT_TEST_SIZE_NOT_DEFAULT = 2;
} // namespace

/**
 * @tc.name   OHDrawingCopyTextStyle001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0100
 * @tc.desc   test for copy text style：base
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTextStyle001()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;

    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);

    OH_Drawing_SetTextStyleColor(
        txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_SetTextStyleDecorationStyle(txtStyle, TEXT_DECORATION_STYLE_DOTTED);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_900);
    OH_Drawing_SetTextStyleFontStyle(txtStyle, FONT_STYLE_ITALIC);
    OH_Drawing_SetTextStyleBaseLine(txtStyle, TEXT_BASELINE_IDEOGRAPHIC);
    const char* fontFamilies[] = { "Text", "Text2" };
    int fontFamiliesNumBefore = FONT_FAMILIES_COUNT_TWO;
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, fontFamiliesNumBefore, fontFamilies);
    OH_Drawing_SetTextStyleFontSize(txtStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTextStyleLetterSpacing(txtStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTextStyleWordSpacing(txtStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTextStyleFontHeight(txtStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTextStyleLocale(txtStyle, "TestLocal");
    OH_Drawing_TextStyleSetBaselineShift(txtStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_TextStyleSetPlaceholder(txtStyle);

    txtStyleCopy = OH_Drawing_CopyTextStyle(txtStyle);
    ASSERT_NE(txtStyleCopy, nullptr);

    EXPECT_EQ(OH_Drawing_TextStyleGetColor(txtStyleCopy), COLOR_CYAN_ARGB);
    EXPECT_EQ(OH_Drawing_TextStyleGetDecorationStyle(txtStyleCopy), TEXT_DECORATION_STYLE_DOTTED);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontWeight(txtStyleCopy), FONT_WEIGHT_900);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyle(txtStyleCopy), FONT_STYLE_ITALIC);
    EXPECT_EQ(OH_Drawing_TextStyleGetBaseline(txtStyleCopy), TEXT_BASELINE_IDEOGRAPHIC);
    size_t fontFamiliesNumAfter;
    char** fontFamiliesList = OH_Drawing_TextStyleGetFontFamilies(txtStyleCopy, &fontFamiliesNumAfter);
    EXPECT_EQ(fontFamiliesNumAfter, fontFamiliesNumBefore);
    EXPECT_NE(fontFamiliesList, nullptr);
    EXPECT_NEAR(OH_Drawing_TextStyleGetFontSize(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(OH_Drawing_TextStyleGetLetterSpacing(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(OH_Drawing_TextStyleGetWordSpacing(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(OH_Drawing_TextStyleGetFontHeight(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_EQ(std::strcmp(OH_Drawing_TextStyleGetLocale(txtStyleCopy), "TestLocal"), 0);
    EXPECT_NEAR(OH_Drawing_TextStyleGetBaselineShift(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_TRUE(OH_Drawing_TextStyleIsPlaceholder(txtStyleCopy));
    OH_Drawing_TextStyleDestroyFontFamilies(fontFamiliesList, fontFamiliesNumAfter);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTextStyle002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0200
 * @tc.desc   test for copy text style: FontStyleStruct、AddFontFeature
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTextStyle002()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;

    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);

    OH_Drawing_FontStyleStruct fontStyle;
    fontStyle.slant = FONT_STYLE_ITALIC;
    fontStyle.weight = FONT_WEIGHT_600;
    fontStyle.width = FONT_WIDTH_EXTRA_EXPANDED;
    OH_Drawing_SetTextStyleFontStyleStruct(txtStyle, fontStyle);
    const char* tag = "frac";
    const char* tag2 = "test";
    OH_Drawing_TextStyleAddFontFeature(txtStyle, tag, INT_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_TextStyleAddFontFeature(txtStyle, tag2, INT_TEST_SIZE_NOT_DEFAULT);

    txtStyleCopy = OH_Drawing_CopyTextStyle(txtStyle);
    ASSERT_NE(txtStyleCopy, nullptr);

    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyleStruct(txtStyleCopy).weight, FONT_WEIGHT_600);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyleStruct(txtStyleCopy).slant, FONT_STYLE_ITALIC);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyleStruct(txtStyleCopy).width, FONT_WIDTH_EXTRA_EXPANDED);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontFeatureSize(txtStyleCopy), FONT_FEATURE_COUNT); // Set 2 font features
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTextStyle003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0300
 * @tc.desc   test for copy text style: brush
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTextStyle003()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;

    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);

    OH_Drawing_Brush* backgroundBrush = OH_Drawing_BrushCreate();
    OH_Drawing_Brush* foregroundBrush = OH_Drawing_BrushCreate();
    ASSERT_NE(backgroundBrush, nullptr);
    ASSERT_NE(foregroundBrush, nullptr);
    OH_Drawing_BrushSetColor(
        backgroundBrush,
        OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_BrushSetColor(
        foregroundBrush, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_01, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_SetTextStyleBackgroundBrush(txtStyle, backgroundBrush);
    OH_Drawing_SetTextStyleForegroundBrush(txtStyle, foregroundBrush);

    txtStyleCopy = OH_Drawing_CopyTextStyle(txtStyle);
    ASSERT_NE(txtStyleCopy, nullptr);

    OH_Drawing_Brush* backgroundBrushCopy = OH_Drawing_BrushCreate();
    OH_Drawing_Brush* foregroundBrushCopy = OH_Drawing_BrushCreate();
    ASSERT_NE(backgroundBrushCopy, nullptr);
    ASSERT_NE(foregroundBrushCopy, nullptr);
    OH_Drawing_TextStyleGetBackgroundBrush(txtStyleCopy, backgroundBrushCopy);
    OH_Drawing_TextStyleGetForegroundBrush(txtStyleCopy, foregroundBrushCopy);
    EXPECT_EQ(OH_Drawing_BrushGetColor(backgroundBrushCopy), COLOR_CYAN_ARGB);
    EXPECT_EQ(OH_Drawing_BrushGetColor(foregroundBrushCopy), COLOR_CYAN_VARIANT_1);

    // 修改复制之后的brush的color不会影响copy前brush的颜色
    OH_Drawing_BrushSetColor(
        backgroundBrushCopy,
        OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    EXPECT_EQ(OH_Drawing_BrushGetColor(backgroundBrushCopy), COLOR_BLACK_ARGB);
    EXPECT_EQ(OH_Drawing_BrushGetColor(backgroundBrush), COLOR_CYAN_ARGB);
    OH_Drawing_BrushDestroy(backgroundBrush);
    OH_Drawing_BrushDestroy(foregroundBrush);
    OH_Drawing_BrushDestroy(backgroundBrushCopy);
    OH_Drawing_BrushDestroy(foregroundBrushCopy);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTextStyle004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_STYLE_0400
 * @tc.desc   test for copy text style: pen
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTextStyle004()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;

    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);

    OH_Drawing_Pen* backgroundPen = OH_Drawing_PenCreate();
    OH_Drawing_Pen* foregroundPen = OH_Drawing_PenCreate();
    ASSERT_NE(backgroundPen, nullptr);
    ASSERT_NE(foregroundPen, nullptr);
    OH_Drawing_PenSetColor(backgroundPen,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_02, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_PenSetColor(foregroundPen,
                           OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_03, COLOR_RGB_WHITE, COLOR_RGB_WHITE));
    OH_Drawing_SetTextStyleBackgroundPen(txtStyle, backgroundPen);
    OH_Drawing_SetTextStyleForegroundPen(txtStyle, foregroundPen);

    OH_Drawing_CopyTextStyle(nullptr);
    txtStyleCopy = OH_Drawing_CopyTextStyle(txtStyle);
    ASSERT_NE(txtStyleCopy, nullptr);

    OH_Drawing_Pen* backgroundPenCopy = OH_Drawing_PenCreate();
    OH_Drawing_Pen* foregroundPenCopy = OH_Drawing_PenCreate();
    ASSERT_NE(backgroundPenCopy, nullptr);
    ASSERT_NE(foregroundPenCopy, nullptr);
    OH_Drawing_TextStyleGetBackgroundPen(txtStyleCopy, backgroundPenCopy);
    OH_Drawing_TextStyleGetForegroundPen(txtStyleCopy, foregroundPenCopy);
    EXPECT_EQ(OH_Drawing_PenGetColor(backgroundPenCopy), COLOR_CYAN_VARIANT_2);
    EXPECT_EQ(OH_Drawing_PenGetColor(foregroundPenCopy), COLOR_CYAN_VARIANT_3);

    // 修改复制之后的pen的color不会影响copy前pen的颜色
    OH_Drawing_PenSetColor(
        backgroundPenCopy,
        OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
    EXPECT_EQ(OH_Drawing_PenGetColor(backgroundPenCopy), COLOR_BLACK_ARGB);
    EXPECT_EQ(OH_Drawing_PenGetColor(backgroundPen), COLOR_CYAN_VARIANT_2);
    OH_Drawing_PenDestroy(backgroundPen);
    OH_Drawing_PenDestroy(foregroundPen);
    OH_Drawing_PenDestroy(backgroundPenCopy);
    OH_Drawing_PenDestroy(foregroundPenCopy);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTextShadow001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TEXT_SHADOW_0100
 * @tc.desc   test for copy text shadow and copy textstyle with shadow
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTextShadow001()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;

    OH_Drawing_TextShadow* shadow = OH_Drawing_CreateTextShadow();
    ASSERT_NE(shadow, nullptr);
    OH_Drawing_Point* offset = OH_Drawing_PointCreate(FLOAT_TEST_SIZE_NOT_DEFAULT, FLOAT_TEST_SIZE_NOT_DEFAULT);
    ASSERT_NE(offset, nullptr);
    double blurRadius = DOUBLE_TEST_SIZE_NOT_DEFAULT;
    OH_Drawing_SetTextShadow(
        shadow,
        OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_WHITE, COLOR_RGB_BLACK, COLOR_RGB_BLACK),
        offset,
        blurRadius);
    OH_Drawing_TextShadow* shadowCopy = OH_Drawing_CopyTextShadow(shadow);
    OH_Drawing_CopyTextShadow(nullptr);
    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, shadow);
    OH_Drawing_TextStyleAddShadow(txtStyle, shadowCopy);

    txtStyleCopy = OH_Drawing_CopyTextStyle(txtStyle);
    ASSERT_NE(txtStyleCopy, nullptr);
    OH_Drawing_TextShadow* shadowsCopy = OH_Drawing_TextStyleGetShadows(txtStyleCopy);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyleCopy), OH_Drawing_TextStyleGetShadowCount(txtStyle));
    OH_Drawing_PointDestroy(offset);
    OH_Drawing_DestroyTextShadow(shadow);
    OH_Drawing_DestroyTextShadow(shadowCopy);
    OH_Drawing_DestroyTextShadows(shadowsCopy);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTypographyStyle001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0100
 * @tc.desc   test for copy typography style
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
namespace {
void SetupTypographyStyleForCopy(OH_Drawing_TypographyStyle* typoStyle, int& fontFamiliesNumBefore)
{
    OH_Drawing_SetTypographyTextFontHeight(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextUseLineStyle(typoStyle, true);
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_600);
    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_ITALIC);
    const char* fontFamilies[] = { "Text1", "Text2" };
    fontFamiliesNumBefore = FONT_FAMILIES_COUNT_TWO;
    OH_Drawing_SetTypographyTextLineStyleFontFamilies(typoStyle, fontFamiliesNumBefore, fontFamilies);
    OH_Drawing_SetTypographyTextLineStyleFontSize(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextLineStyleFontHeight(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextLineStyleHalfLeading(typoStyle, true);
    OH_Drawing_SetTypographyTextLineStyleSpacingScale(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextLineStyleOnly(typoStyle, true);
    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_CENTER);
    OH_Drawing_SetTypographyTextDirection(typoStyle, TEXT_DIRECTION_RTL);
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, INT_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, "...");
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    OH_Drawing_TypographyStyleSetHintsEnabled(typoStyle, true);
}

void VerifyTypographyStyleCopy(OH_Drawing_TypographyStyle* typoStyleCopy, int fontFamiliesNumBefore)
{
    EXPECT_TRUE(OH_Drawing_TypographyTextGetLineStyle(typoStyleCopy));
    EXPECT_EQ(OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyleCopy), FONT_WEIGHT_600);
    EXPECT_EQ(OH_Drawing_TypographyTextlineStyleGetFontStyle(typoStyleCopy), FONT_STYLE_ITALIC);
    size_t num;
    char** fontFamiliesList = OH_Drawing_TypographyTextlineStyleGetFontFamilies(typoStyleCopy, &num);
    EXPECT_EQ(num, fontFamiliesNumBefore);
    EXPECT_EQ(OH_Drawing_TypographyTextlineStyleGetFontSize(typoStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT);
    EXPECT_TRUE(OH_Drawing_TypographyTextlineStyleGetHeightOnly(typoStyleCopy));
    EXPECT_NEAR(OH_Drawing_TypographyTextlineStyleGetHeightScale(typoStyleCopy),
                DOUBLE_TEST_SIZE_NOT_DEFAULT,
                FLOAT_DATA_EPSILON);
    EXPECT_TRUE(OH_Drawing_TypographyTextlineStyleGetHalfLeading(typoStyleCopy));
    EXPECT_EQ(OH_Drawing_TypographyTextlineStyleGetSpacingScale(typoStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT);
    EXPECT_TRUE(OH_Drawing_TypographyTextlineGetStyleOnly(typoStyleCopy));
    EXPECT_EQ(OH_Drawing_TypographyGetTextAlign(typoStyleCopy), TEXT_ALIGN_CENTER);
    EXPECT_EQ(OH_Drawing_TypographyGetTextDirection(typoStyleCopy), TEXT_DIRECTION_RTL);
    EXPECT_EQ(OH_Drawing_TypographyGetTextMaxLines(typoStyleCopy), INT_TEST_SIZE_NOT_DEFAULT);
    EXPECT_EQ(std::strcmp(OH_Drawing_TypographyGetTextEllipsis(typoStyleCopy), "..."), 0);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyleCopy), TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    EXPECT_TRUE(OH_Drawing_TypographyStyleIsHintEnabled(typoStyleCopy));
    OH_Drawing_TextStyleDestroyFontFamilies(fontFamiliesList, num);
}
} // namespace

int OHDrawingCopyTypographyStyle001()
{
    NativeCopyStyleTestContext ctx;
    auto& typoStyle = ctx.typoStyle;
    auto& typoStyleCopy = ctx.typoStyleCopy;
    typoStyle = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(typoStyle, nullptr);

    int fontFamiliesNumBefore = 0;
    SetupTypographyStyleForCopy(typoStyle, fontFamiliesNumBefore);
    typoStyleCopy = OH_Drawing_CopyTypographyStyle(typoStyle);
    ASSERT_NE(typoStyleCopy, nullptr);
    VerifyTypographyStyleCopy(typoStyleCopy, fontFamiliesNumBefore);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTypographyStyle002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0200
 * @tc.desc   test for copy typography style：FontWeight、FontStyle、FontFamily、FontSize、FontHeight
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTypographyStyle002()
{
    NativeCopyStyleTestContext ctx;
    auto& typoStyle = ctx.typoStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;
    auto& typoStyleCopy = ctx.typoStyleCopy;

    typoStyle = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(typoStyle, nullptr);

    OH_Drawing_SetTypographyTextFontWeight(typoStyle, FONT_WEIGHT_900);
    OH_Drawing_SetTypographyTextFontStyle(typoStyle, FONT_STYLE_ITALIC);
    OH_Drawing_SetTypographyTextFontFamily(typoStyle, "Test");
    OH_Drawing_SetTypographyTextFontSize(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);
    OH_Drawing_SetTypographyTextFontHeight(typoStyle, DOUBLE_TEST_SIZE_NOT_DEFAULT);

    OH_Drawing_CopyTypographyStyle(nullptr);
    typoStyleCopy = OH_Drawing_CopyTypographyStyle(typoStyle);
    ASSERT_NE(typoStyleCopy, nullptr);

    txtStyleCopy = OH_Drawing_TypographyGetTextStyle(typoStyleCopy);
    ASSERT_NE(txtStyleCopy, nullptr);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontWeight(txtStyleCopy), FONT_WEIGHT_900);
    EXPECT_EQ(OH_Drawing_TextStyleGetFontStyle(txtStyleCopy), FONT_STYLE_ITALIC);
    size_t fontFamiliesNumAfter;
    char** fontFamiliesList = OH_Drawing_TextStyleGetFontFamilies(txtStyleCopy, &fontFamiliesNumAfter);
    EXPECT_EQ(fontFamiliesNumAfter, FONT_FAMILIES_COUNT_ONE);
    EXPECT_NEAR(OH_Drawing_TextStyleGetFontSize(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(OH_Drawing_TextStyleGetFontHeight(txtStyleCopy), DOUBLE_TEST_SIZE_NOT_DEFAULT, FLOAT_DATA_EPSILON);
    OH_Drawing_TextStyleDestroyFontFamilies(fontFamiliesList, fontFamiliesNumAfter);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTypographyStyle003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0300
 * @tc.desc   test for copy typography style: FontStyleStruct
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTypographyStyle003()
{
    NativeCopyStyleTestContext ctx;
    auto& typoStyle = ctx.typoStyle;
    auto& typoStyleCopy = ctx.typoStyleCopy;

    typoStyle = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(typoStyle, nullptr);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_600;
    normalStyle.width = FONT_WIDTH_EXTRA_EXPANDED;
    normalStyle.slant = FONT_STYLE_ITALIC;
    OH_Drawing_SetTypographyStyleFontStyleStruct(typoStyle, normalStyle);

    typoStyleCopy = OH_Drawing_CopyTypographyStyle(typoStyle);
    ASSERT_NE(typoStyleCopy, nullptr);
    EXPECT_EQ(OH_Drawing_TypographyStyleGetFontStyleStruct(typoStyleCopy).weight, FONT_WEIGHT_600);
    EXPECT_EQ(OH_Drawing_TypographyStyleGetFontStyleStruct(typoStyleCopy).slant, FONT_STYLE_ITALIC);
    EXPECT_EQ(OH_Drawing_TypographyStyleGetFontStyleStruct(typoStyleCopy).width, FONT_WIDTH_EXTRA_EXPANDED);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingCopyTypographyStyle004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_COPY_TYPOGRAPHY_STYLE_0400
 * @tc.desc   test for copy text shadow: typographystyle->textstyle->shadow
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingCopyTypographyStyle004()
{
    NativeCopyStyleTestContext ctx;
    auto& txtStyle = ctx.txtStyle;
    auto& typoStyle = ctx.typoStyle;
    auto& txtStyleCopy = ctx.txtStyleCopy;
    auto& typoStyleCopy = ctx.typoStyleCopy;

    OH_Drawing_TextShadow* shadow = OH_Drawing_CreateTextShadow();
    ASSERT_NE(shadow, nullptr);
    OH_Drawing_Point* offset = OH_Drawing_PointCreate(FLOAT_TEST_SIZE_NOT_DEFAULT, FLOAT_TEST_SIZE_NOT_DEFAULT);
    ASSERT_NE(offset, nullptr);
    double blurRadius = DOUBLE_TEST_SIZE_NOT_DEFAULT;
    OH_Drawing_SetTextShadow(
        shadow,
        OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_WHITE, COLOR_RGB_BLACK, COLOR_RGB_BLACK),
        offset,
        blurRadius);
    OH_Drawing_TextShadow* shadowCopy = OH_Drawing_CopyTextShadow(shadow);
    txtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(txtStyle, nullptr);
    OH_Drawing_TextStyleAddShadow(txtStyle, shadow);
    OH_Drawing_TextStyleAddShadow(txtStyle, shadow);
    OH_Drawing_TextStyleAddShadow(txtStyle, shadowCopy);

    typoStyle = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(typoStyle, nullptr);
    OH_Drawing_SetTypographyTextStyle(typoStyle, txtStyle);
    typoStyleCopy = OH_Drawing_CopyTypographyStyle(typoStyle);
    ASSERT_NE(typoStyleCopy, nullptr);

    // 接口OH_Drawing_TypographyGetTextStyle与OH_Drawing_SetTypographyTextStyle并不是配套接口。
    // set的是insideTextstyle，但是get是兜底的textstyle属性。
    txtStyleCopy = OH_Drawing_TypographyGetTextStyle(typoStyleCopy);
    ASSERT_NE(txtStyleCopy, nullptr);
    OH_Drawing_TextShadow* shadowsCopy = OH_Drawing_TextStyleGetShadows(txtStyleCopy);
    ASSERT_NE(shadowsCopy, nullptr);
    EXPECT_NE(OH_Drawing_TextStyleGetShadowCount(txtStyleCopy), OH_Drawing_TextStyleGetShadowCount(txtStyle));
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyleCopy), ZERO);
    EXPECT_EQ(OH_Drawing_TextStyleGetShadowCount(txtStyle),
              SHADOW_COUNT_THREE); // 3是因为OH_Drawing_TextStyleAddShadow加了三个shadow。
    OH_Drawing_PointDestroy(offset);
    OH_Drawing_DestroyTextShadow(shadow);
    OH_Drawing_DestroyTextShadow(shadowCopy);
    OH_Drawing_DestroyTextShadows(shadowsCopy);
    return TEST_SUCCESS_CODE;
}
} // namespace OHOS