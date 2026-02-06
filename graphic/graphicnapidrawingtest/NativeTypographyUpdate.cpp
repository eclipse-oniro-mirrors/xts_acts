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

#include "drawing_font_collection.h"
#include "drawing_text_typography.h"
#include "gtest/gtest.h"
#include "typography.h"

using namespace testing;
using namespace testing::ext;
using namespace OHOS::Rosen;

namespace OHOS {
namespace {
    const double DEFAULT_FONT_SIZE = 50;
    const char* DEFAULT_TEXT = "text";
} // namespace

class NativeTypographyUpdate : public testing::Test {
public:
    void SetUp() override;
    void TearDown() override;
    void PrepareWorkForAlignmentTest();

protected:
    OH_Drawing_TypographyCreate* fHandler{nullptr};
    OH_Drawing_Typography* fTypography{nullptr};
    OH_Drawing_TypographyStyle* fTypoStyle{nullptr};
    OH_Drawing_TextStyle* fTxtStyle{nullptr};
    int fLayoutWidth{50};
};

static Typography* ConvertToOriginalText(OH_Drawing_Typography* style)
{
    return reinterpret_cast<Typography*>(style);
}

void NativeTypographyUpdate::PrepareWorkForAlignmentTest()
{
    fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
    ASSERT_NE(fHandler, nullptr);
    fTxtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(fTxtStyle, nullptr);
    OH_Drawing_SetTextStyleFontSize(fTxtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
    OH_Drawing_TypographyHandlerAddText(fHandler, DEFAULT_TEXT);
    fTypography = OH_Drawing_CreateTypography(fHandler);
    ASSERT_NE(fTypography, nullptr);
    OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
}

void NativeTypographyUpdate::SetUp()
{
    fTypoStyle = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(fTypoStyle, nullptr);
    OH_Drawing_SetTypographyTextFontSize(fTypoStyle, DEFAULT_FONT_SIZE);
    fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
    ASSERT_NE(fHandler, nullptr);
    fTxtStyle = OH_Drawing_CreateTextStyle();
    ASSERT_NE(fTxtStyle, nullptr);
    OH_Drawing_SetTextStyleFontSize(fTxtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
    OH_Drawing_TypographyHandlerAddText(fHandler, DEFAULT_TEXT);
    fTypography = OH_Drawing_CreateTypography(fHandler);
    ASSERT_NE(fTypography, nullptr);
    OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
}

void NativeTypographyUpdate::TearDown()
{
    if (fHandler != nullptr) {
        OH_Drawing_DestroyTypographyHandler(fHandler);
        fHandler = nullptr;
    }
    if (fTypography != nullptr) {
        OH_Drawing_DestroyTypography(fTypography);
        fTypography = nullptr;
    }
    if (fTypoStyle != nullptr) {
        OH_Drawing_DestroyTypographyStyle(fTypoStyle);
        fTypoStyle = nullptr;
    }
    if (fTxtStyle != nullptr) {
        OH_Drawing_DestroyTextStyle(fTxtStyle);
        fTxtStyle = nullptr;
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate001
 * @tc.number OHDrawingTypographyUpdate001
 * @tc.desc   test the nullptr input value for updating the paint attribute
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate001, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateFontColor(nullptr, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0xFF));
    OH_Drawing_TypographyUpdateDecoration(nullptr, TEXT_DECORATION_LINE_THROUGH);
    OH_Drawing_TypographyUpdateDecorationThicknessScale(nullptr, 2.0);
    OH_Drawing_TypographyUpdateDecorationStyle(nullptr, TEXT_DECORATION_STYLE_DOTTED);
}

/**
 * @tc.name   OHDrawingTypographyUpdate002
 * @tc.number OHDrawingTypographyUpdate002
 * @tc.desc   test for updating the font color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate002, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateFontColor(fTypography, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0xFF));

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->color.CastToColorQuad(), Drawing::Color::ColorQuadSetARGB(255, 0, 255, 255));
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate003
 * @tc.number OHDrawingTypographyUpdate003
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_LINE_THROUGH
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate003, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecoration(fTypography, TEXT_DECORATION_LINE_THROUGH);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decoration, TextDecoration::LINE_THROUGH);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate004
 * @tc.number OHDrawingTypographyUpdate004
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_UNDERLINE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate004, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecoration(fTypography, TEXT_DECORATION_UNDERLINE);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decoration, TextDecoration::UNDERLINE);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate005
 * @tc.number OHDrawingTypographyUpdate005
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_OVERLINE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate005, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecoration(fTypography, TEXT_DECORATION_OVERLINE);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decoration, TextDecoration::OVERLINE);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate006
 * @tc.number OHDrawingTypographyUpdate006
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_NONE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate006, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecoration(fTypography, TEXT_DECORATION_NONE);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decoration, TextDecoration::NONE);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate007
 * @tc.number OHDrawingTypographyUpdate007
 * @tc.desc   test for updating the decoration thickness scale
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate007, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationThicknessScale(fTypography, 2.0);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationThicknessScale, 2.0);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate008
 * @tc.number OHDrawingTypographyUpdate008
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_STYLE_DOTTED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate008, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_DOTTED);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::DOTTED);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate009
 * @tc.number OHDrawingTypographyUpdate009
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_STYLE_DOTTED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate009, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_SOLID);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::SOLID);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate010
 * @tc.number OHDrawingTypographyUpdate010
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_STYLE_WAVY
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate010, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_WAVY);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::WAVY);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate011
 * @tc.number OHDrawingTypographyUpdate011
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_STYLE_DASHED
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate011, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_DASHED);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::DASHED);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate012
 * @tc.number OHDrawingTypographyUpdate012
 * @tc.desc   test for updating the decoration to the value of TEXT_DECORATION_STYLE_DOUBLE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate012, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_DOUBLE);

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::DOUBLE);
    }
}

/**
 * @tc.name   OHDrawingTypographyUpdate013
 * @tc.number OHDrawingTypographyUpdate013
 * @tc.desc   test for updating the font color and decoration in mutiple text.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdate013, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextStyleColor(fTxtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0x00));
    OH_Drawing_SetTextStyleDecoration(fTxtStyle, TEXT_DECORATION_NONE);
    OH_Drawing_SetTextStyleDecorationStyle(fTxtStyle, TEXT_DECORATION_STYLE_SOLID);
    OH_Drawing_SetTextStyleDecorationThicknessScale(fTxtStyle, 1.5);
    OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
    OH_Drawing_TypographyHandlerAddText(fHandler, DEFAULT_TEXT);

    OH_Drawing_TypographyUpdateDecoration(fTypography, TEXT_DECORATION_LINE_THROUGH);
    OH_Drawing_TypographyUpdateDecorationStyle(fTypography, TEXT_DECORATION_STYLE_DOTTED);
    OH_Drawing_TypographyUpdateDecorationThicknessScale(fTypography, 2.0);
    OH_Drawing_TypographyUpdateFontColor(fTypography, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0xFF));

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decoration, TextDecoration::LINE_THROUGH);
        EXPECT_EQ(item.second.textStyle->decorationStyle, TextDecorationStyle::DOTTED);
        EXPECT_EQ(item.second.textStyle->decorationThicknessScale, 2.0);
        EXPECT_EQ(item.second.textStyle->color.CastToColorQuad(), Drawing::Color::ColorQuadSetARGB(255, 0, 255, 255));
    }
}

/**
 * @tc.name   OHDrawingSetTypographyTextTrailingSpaceOptimized001
 * @tc.number OHDrawingSetTypographyTextTrailingSpaceOptimized001
 * @tc.desc   test for setting the different value of trailingSpaceOptimized and improve code coverage
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingSetTypographyTextTrailingSpaceOptimized001, Function | MediumTest | Level0)
{
    OH_Drawing_SetTypographyTextAlign(fTypoStyle, TEXT_ALIGN_RIGHT);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(nullptr, true);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(nullptr, false);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(fTypoStyle, true);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(fTypoStyle, false);
    PrepareWorkForAlignmentTest();
}

/**
 * @tc.name   OHDrawingTypographyUpdateDecorationColor001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_TypographyUpdateDecorationColor_001
 * @tc.desc   test for updating the decoration color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingTypographyUpdateDecorationColor001, Function | MediumTest | Level0)
{
    OH_Drawing_TypographyUpdateDecorationColor(nullptr, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0xFF));
    OH_Drawing_TypographyUpdateDecorationColor(fTypography, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0xFF, 0xFF));

    Typography* typography = ConvertToOriginalText(fTypography);
    auto runMetrics = typography->GetLineMetrics()[0].runMetrics;
    for (const auto& item : runMetrics) {
        EXPECT_EQ(item.second.textStyle->decorationColor.CastToColorQuad(),
            Drawing::Color::ColorQuadSetARGB(255, 0, 255, 255));
    }
}

/**
 * @tc.name   OHDrawingSetTypographyVerticalAlignment001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTypographyVerticalAlignment_001
 * @tc.desc   Test for vertical align valid params
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTypographyUpdate, OHDrawingSetTypographyVerticalAlignment001, Function | MediumTest | Level0)
{
    EXPECT_NO_FATAL_FAILURE(OH_Drawing_SetTypographyVerticalAlignment(nullptr,
        OH_Drawing_TextVerticalAlignment::TEXT_VERTICAL_ALIGNMENT_BOTTOM));
}
} // namespace OHOS