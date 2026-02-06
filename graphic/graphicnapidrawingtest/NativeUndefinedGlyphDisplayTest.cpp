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

#include <filesystem>
#include "gtest/gtest.h"
#include "drawing_bitmap.h"
#include "drawing_font_collection.h"
#include "drawing_rect.h"
#include "drawing_text_global.h"
#include "drawing_text_line.h"
#include "drawing_text_typography.h"

using namespace testing;
using namespace testing::ext;

namespace {
bool ExistNotdef()
{
    return std::filesystem::exists("/system/fonts/HarmonyOS_Sans_Notdef.ttf");
}

bool ExistNotoSans()
{
    return std::filesystem::exists("/system/fonts/NotoSans[wdth,wght].ttf");
}
} // namespace

namespace OHOS {
namespace Rosen {
namespace {
    const int NUM_1 = 1;
    const int NUM_3 = 3;
    const int NUM_100 = 100;
}

class NativeUndefinedGlyphDisplayTest : public testing::Test {
public:
    OH_Drawing_Typography* PrepareCreateTypography(
        const std::string& text, const char** fontFamilies = nullptr, int fontCount = 0);
    void BoundsResult(OH_Drawing_Typography* typography, const float rectResult[][4], size_t size);

    static constexpr const char* text_ = "Hello 测 World \uffff\n!@#$%^&*~(){\uffff\uffff}[]90 - = ,.\n\uffff"
                                         "testlp\uffff试\uffff Drawing\uffff";
    static constexpr const char* noGlyphText_ = "\uffff";
    static constexpr float defaultResult_[][4] = { { 2.0, 2.0, 206.63979, 29.0 }, { 1.0, 5.0, 388.10962, 37.0 },
        { 0, 8.0, 319.4397, 42.0 } };
    static constexpr float tofuResult_[][4] = { { 2.0, 2.0, 228.63979, 29.0 }, { 1.0, 5.0, 388.10962, 37.0 },
        { 8.0, 8.0, 341.4397, 42.0 } };
    static constexpr float notoResult_[][4] = { { 2.0, 2.0, 232.20976, 29.0 }, { 2.0, 5.0, 388.43961, 33.0 },
        { 8.0, 8.0, 347.76962, 42.0 } };
    static constexpr float noGlyphTofuResult_[][4] = { { 8.0, 0, 22.0, 22.0 } };
    static constexpr float noGlyphDefaultResult_[][4] = { { 0, 0, 0, 0 } };
    static constexpr float noGlyphNotoResult_[][4] = { { 0, 0, 0, 0 } };
};

OH_Drawing_Typography* NativeUndefinedGlyphDisplayTest::PrepareCreateTypography(
    const std::string& text, const char** fontFamilies, int fontCount)
{
    double maxWidth = 500.0;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    EXPECT_NE(typoStyle, nullptr);
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_NE(txtStyle, nullptr);
    OH_Drawing_SetTextStyleFontFamilies(txtStyle, fontCount, fontFamilies);
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    EXPECT_NE(fontCollection, nullptr);
    OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    EXPECT_NE(handler, nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text.c_str());
    OH_Drawing_Typography* typography = OH_Drawing_CreateTypography(handler);
    EXPECT_NE(typography, nullptr);
    OH_Drawing_TypographyLayout(typography, maxWidth);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    return typography;
}

void NativeUndefinedGlyphDisplayTest::BoundsResult(
    OH_Drawing_Typography* typography, const float rectResult[][4], size_t size)
{
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography);
    size_t arraySize = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, arraySize);
    for (size_t index = 0; index < arraySize; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Rect* rect = OH_Drawing_TextLineGetImageBounds(textLine);
        EXPECT_FLOAT_EQ(rectResult[index][0], OH_Drawing_RectGetLeft(rect));
        EXPECT_FLOAT_EQ(rectResult[index][1], OH_Drawing_RectGetTop(rect));
        // 2 is the index of right
        EXPECT_FLOAT_EQ(rectResult[index][2], OH_Drawing_RectGetRight(rect));
        // 3 is the index of bottom
        EXPECT_FLOAT_EQ(rectResult[index][3], OH_Drawing_RectGetBottom(rect));
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_DestroyTextLine(textLine);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_001
 * @tc.name  : OHDrawingSetTextUndefinedGlyphDisplay001
 * @tc.desc  : Test undefined glyph display use tofu
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeUndefinedGlyphDisplayTest, OHDrawingSetTextUndefinedGlyphDisplay001, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_TOFU);
    OH_Drawing_Typography* typography = PrepareCreateTypography(text_);
    EXPECT_NE(typography, nullptr);
    if (ExistNotdef()) {
        BoundsResult(typography, tofuResult_, NUM_3);
    } else {
        BoundsResult(typography, defaultResult_, NUM_3);
    }
    OH_Drawing_DestroyTypography(typography);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_002
 * @tc.name  : OHDrawingSetTextUndefinedGlyphDisplay002
 * @tc.desc  : Test undefined glyph display use default
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeUndefinedGlyphDisplayTest, OHDrawingSetTextUndefinedGlyphDisplay002, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_DEFAULT);
    OH_Drawing_Typography* typography = PrepareCreateTypography(text_);
    EXPECT_NE(typography, nullptr);
    BoundsResult(typography, defaultResult_, NUM_3);
    OH_Drawing_DestroyTypography(typography);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_003
 * @tc.name  : OHDrawingSetTextUndefinedGlyphDisplay003
 * @tc.desc  : Test undefined glyph display use invalid input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeUndefinedGlyphDisplayTest, OHDrawingSetTextUndefinedGlyphDisplay003, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_DEFAULT);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* defaultTypography = PrepareCreateTypography(text_);
    EXPECT_NE(defaultTypography, nullptr);
    BoundsResult(defaultTypography, defaultResult_, NUM_3);
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_TOFU);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* tofuTypography = PrepareCreateTypography(text_);
    EXPECT_NE(tofuTypography, nullptr);
    if (ExistNotdef()) {
        BoundsResult(tofuTypography, tofuResult_, NUM_3);
    } else {
        BoundsResult(tofuTypography, defaultResult_, NUM_3);
    }
    OH_Drawing_DestroyTypography(defaultTypography);
    OH_Drawing_DestroyTypography(tofuTypography);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_004
 * @tc.name  : OHDrawingSetTextUndefinedGlyphDisplay004
 * @tc.desc  : Test undefined glyph display use only no glyph
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeUndefinedGlyphDisplayTest, OHDrawingSetTextUndefinedGlyphDisplay004, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_DEFAULT);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* defaultTypography = PrepareCreateTypography(noGlyphText_);
    EXPECT_NE(defaultTypography, nullptr);
    BoundsResult(defaultTypography, noGlyphDefaultResult_, NUM_1);
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_TOFU);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* tofuTypography = PrepareCreateTypography(noGlyphText_);
    EXPECT_NE(tofuTypography, nullptr);
    if (ExistNotdef()) {
        BoundsResult(tofuTypography, noGlyphTofuResult_, NUM_1);
    } else {
        BoundsResult(defaultTypography, noGlyphDefaultResult_, NUM_1);
    }
    OH_Drawing_DestroyTypography(defaultTypography);
    OH_Drawing_DestroyTypography(tofuTypography);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_005
 * @tc.name  : OHDrawingSetTextUndefinedGlyphDisplay005
 * @tc.desc  : Test set family name, but still force tofu
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeUndefinedGlyphDisplayTest, OHDrawingSetTextUndefinedGlyphDisplay005, Function | MediumTest | Level0)
{
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_TOFU);
    const char* fontFamilies[] = { "Noto Sans" };
    OH_Drawing_Typography* typography = PrepareCreateTypography(text_, fontFamilies, NUM_1);
    EXPECT_NE(typography, nullptr);
    if (ExistNotoSans()) {
        BoundsResult(typography, notoResult_, NUM_3);
    } else {
        BoundsResult(typography, defaultResult_, NUM_3);
    }
    OH_Drawing_Typography* onlyTypography = PrepareCreateTypography(noGlyphText_, fontFamilies, NUM_1);
    EXPECT_NE(onlyTypography, nullptr);
    if (ExistNotdef()) {
        BoundsResult(onlyTypography, noGlyphTofuResult_, NUM_1);
    } else {
        BoundsResult(onlyTypography, noGlyphDefaultResult_, NUM_1);
    }
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_UNDEFINED_GLYPH_USE_DEFAULT);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypography(onlyTypography);
}
}
} // namespace OHOS