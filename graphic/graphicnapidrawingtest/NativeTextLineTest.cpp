/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <string>
#include <fstream>
#include "drawing_color.h"
#include "drawing_font.h"
#include "drawing_rect.h"
#include "drawing_font_collection.h"
#include "drawing_text_declaration.h"
#include "drawing_text_line.h"
#include "drawing_text_typography.h"
#include "gtest/gtest.h"

#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define NUM_6 6
#define NUM_7 7
#define NUM_10 10
#define NUM_20 20
#define NUM_600 600
#define NUM_700 700

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace {
    constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
}

class NativeTextLineTest : public testing::Test {
public:
    void SetUp() override
    {
        typoStyle_ = nullptr;
        txtStyle_ = nullptr;
        fontCollection_ = nullptr;
        handler_ = nullptr;
        typography_ = nullptr;
    }

    void TearDown() override
    {
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
};

void NativeTextLineTest::PrepareCreateTextLine(const std::string& text)
{
    double maxWidth = 500.0;
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
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, NUM_1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_TRUE(typography_ != nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_001
 * @tc.name  : TextLineTest001
 * @tc.desc  : test for the textLine GetGlyphCount
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest001, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine0 = OH_Drawing_GetTextLineByIndex(textLines, 0);
    double data0 = 13;
    double count0 = OH_Drawing_TextLineGetGlyphCount(textLine0);
    EXPECT_EQ(count0, data0);

    OH_Drawing_TextLine* textLine1 = OH_Drawing_GetTextLineByIndex(textLines, NUM_1);
    double data1 = 34;
    double count1 = OH_Drawing_TextLineGetGlyphCount(textLine1);
    EXPECT_EQ(count1, data1);

    OH_Drawing_TextLine* textLine2 = OH_Drawing_GetTextLineByIndex(textLines, NUM_2);
    double data2 = 29;
    double count2 = OH_Drawing_TextLineGetGlyphCount(textLine2);
    EXPECT_EQ(count2, data2);
    
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_002
 * @tc.name  : TextLineTest002
 * @tc.desc  : test for the textLine GetGlyphCount
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest002, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double count = OH_Drawing_TextLineGetGlyphCount(textLine);
        if (index == NUM_3) {
            EXPECT_EQ(count, 0);
        } else if (index == NUM_6) {
            EXPECT_EQ(count, NUM_3);
        } else {
            EXPECT_GE(count, NUM_10);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_003
 * @tc.name  : TextLineTest003
 * @tc.desc  : test for the textLine GetGlyphCount
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest003, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double count = OH_Drawing_TextLineGetGlyphCount(textLine);
        EXPECT_EQ(count, 0);
    }
    OH_Drawing_DestroyTextLines(textLines);

    double count = OH_Drawing_TextLineGetGlyphCount(nullptr);
    EXPECT_EQ(count, 0);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_004
 * @tc.name  : TextLineTest004
 * @tc.desc  : test for the textLine GetTextRange
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest004, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    size_t start = 0;
    size_t end = 0;
    size_t data1 = 16;
    size_t data2 = 17;
    size_t data3 = 51;
    size_t data4 = 52;
    size_t data5 = 87;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        if (index == 0) {
            EXPECT_EQ(start, 0);
            EXPECT_EQ(end, data1);
        }else if (index == NUM_1) {
            EXPECT_EQ(start, data2);
            EXPECT_EQ(end, data3);
        }else {
            EXPECT_EQ(start, data4);
            EXPECT_EQ(end, data5);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_005
 * @tc.name  : TextLineTest005
 * @tc.desc  : test for the textLine GetTextRange
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest005, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    size_t start = 0;
    size_t end = 0;
    std::vector<int32_t> startArr = {0, 26, 62, 98, 99, 176, 219};
    std::vector<int32_t> endArr = {25, 61, 97, 98, 176, 218, 222};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        EXPECT_EQ(start, startArr[index]);
        EXPECT_EQ(end, endArr[index]);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_006
 * @tc.name  : TextLineTest006
 * @tc.desc  : test for the textLine GetTextRange
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest006, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_2);

    size_t start = 0;
    size_t end = 0;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        EXPECT_EQ(start, 0);
        EXPECT_EQ(end, NUM_1);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_007
 * @tc.name  : TextLineTest007
 * @tc.desc  : test for the textLine GetTextRange
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest007, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_4);

    OH_Drawing_TextLine* textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);

    size_t start = 0;
    OH_Drawing_TextLineGetTextRange(textLine, &start, nullptr);
    EXPECT_EQ(start, 0);

    size_t end = 0;
    OH_Drawing_TextLineGetTextRange(textLine, nullptr, &end);
    EXPECT_EQ(end, 0);

    OH_Drawing_TextLineGetTextRange(textLine, nullptr, nullptr);
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_008
 * @tc.name  : TextLineTest008
 * @tc.desc  : test for the textLine GetGlyphRuns
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest008, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    std::vector<int32_t> sizeArr = {4, 1, 6};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_TRUE(runs != nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        EXPECT_EQ(runsSize, sizeArr[index]);
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_009
 * @tc.name  : TextLineTest009
 * @tc.desc  : test for the textLine GetGlyphRuns
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest009, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    std::vector<int32_t> sizeArr = {6, 1, 6, 0, 7, 8, 1};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        if (index == NUM_3) {
            EXPECT_TRUE(runs == nullptr);
            EXPECT_EQ(runsSize, 0);
        } else if (index == NUM_1 || index == NUM_6) {
            EXPECT_TRUE(runs != nullptr);
            EXPECT_EQ(runsSize, NUM_1);
        } else {
            EXPECT_TRUE(runs != nullptr);
            EXPECT_GE(runsSize, NUM_6);
        }
        EXPECT_EQ(runsSize, sizeArr[index]);
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_010
 * @tc.name  : TextLineTest010
 * @tc.desc  : test for the textLine GetGlyphRuns
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest010, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_4);

    for (size_t index = 0; index < size - NUM_1; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_TRUE(runs == nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        EXPECT_EQ(runsSize, 0);
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_011
 * @tc.name  : TextLineTest011
 * @tc.desc  : test for the textLine GetGlyphRuns
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest011, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);

    OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    EXPECT_TRUE(runs == nullptr);

    runs = OH_Drawing_TextLineGetGlyphRuns(nullptr);
    EXPECT_TRUE(runs == nullptr);

    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_012
 * @tc.name  : TextLineTest012
 * @tc.desc  : test for the textLine GetTypographicBounds
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest012, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    double ascent = 0.0;
    double descent = 0.0;
    double leading = 0.0;
    std::vector<float> widthArr = {206.639786, 490.139404, 459.509460};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_NEAR(ascent, -27.84, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(descent, 7.32, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(leading, 0.0, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_013
 * @tc.name  : TextLineTest013
 * @tc.desc  : test for the textLine GetTypographicBounds
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest013, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    double ascent = 0.0;
    double descent = 0.0;
    double leading = 0.0;
    std::vector<float> widthArr = {290.939697, 498.239380, 458.309509, 0.0, 497.952301, 409.497314, 51.300049};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_EQ(leading, 0);
        if (index == NUM_4) {
            EXPECT_NEAR(ascent, -27.84, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, 7.431193, FLOAT_DATA_EPSILON);
        } else if (index == NUM_5) {
            EXPECT_NEAR(ascent, -35.369999, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, 9.690001, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_NEAR(ascent, -27.84, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, 7.32, FLOAT_DATA_EPSILON);
        }
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_014
 * @tc.name  : TextLineTest014
 * @tc.desc  : test for the textLine GetTypographicBounds
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest014, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);

    double ascent = 0.0;
    double descent = 0.0;
    double leading = 0.0;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_NEAR(ascent, -27.84, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(descent, 7.32, FLOAT_DATA_EPSILON);
        EXPECT_EQ(leading, 0);
        EXPECT_EQ(width, 0);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_015
 * @tc.name  : TextLineTest015
 * @tc.desc  : test for the textLine GetTypographicBounds
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest015, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);

    double ascent = 0.0;
    double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, nullptr, nullptr);
    EXPECT_EQ(ascent, 0);
    EXPECT_EQ(width, 0);

    double descent = 0.0;
    width = OH_Drawing_TextLineGetTypographicBounds(textLine, nullptr, &descent, nullptr);
    EXPECT_EQ(descent, 0);
    EXPECT_EQ(width, 0);

    double leading = 0.0;
    width = OH_Drawing_TextLineGetTypographicBounds(textLine, nullptr, nullptr, &leading);
    EXPECT_EQ(leading, 0);
    EXPECT_EQ(width, 0);

    width = OH_Drawing_TextLineGetTypographicBounds(textLine, nullptr, nullptr, nullptr);
    EXPECT_EQ(width, 0);

    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_016
 * @tc.name  : TextLineTest016
 * @tc.desc  : test for the textLine GetTrailingSpaceWidth
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest016, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    std::vector<float> widthArr = {8.099991, 8.099976, 16.199951};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_017
 * @tc.name  : TextLineTest017
 * @tc.desc  : test for the textLine GetTrailingSpaceWidth
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest017, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        if (index < NUM_3) {
            EXPECT_NEAR(width, 8.099976, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(width, 0.0);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_018
 * @tc.name  : TextLineTest018
 * @tc.desc  : test for the textLine GetTrailingSpaceWidth
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest018, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        EXPECT_EQ(width, 0.0);
    }
    OH_Drawing_DestroyTextLines(textLines);

    double width = OH_Drawing_TextLineGetTrailingSpaceWidth(nullptr);
    EXPECT_EQ(width, 0.0);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_019
 * @tc.name  : TextLineTest019
 * @tc.desc  : test for the textLine GetOffsetForStringIndex
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest019, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    const int maxCharacterNum = 88;
    std::vector<float> offSetArr = {206.639786, 490.139404, 459.509460};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NUM_10);
        if (index == 0) {
            EXPECT_NEAR(offset, 161.939835, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(offset, 0.0);
        }
        EXPECT_LE(offset, 500.0);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, maxCharacterNum);
        EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, -2);
        EXPECT_EQ(offset, 0.0);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_020
 * @tc.name  : TextLineTest020
 * @tc.desc  : test for the textLine GetOffsetForStringIndex
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest020, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    const int maxCharacterNum = 88;
    std::vector<float> offSetArr = {290.939697, 498.239380, 458.309509};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NUM_10);
        if (index == 0) {
            EXPECT_NEAR(offset, 155.129852, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(offset, 0.0);
        }
        EXPECT_LE(offset, 500.0);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, maxCharacterNum);
        if (index <= NUM_2) {
            EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        }  else {
            EXPECT_EQ(offset, 0.0);
        }
        EXPECT_LE(offset, 500.0);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, -2);
        EXPECT_EQ(offset, 0.0);
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_021
 * @tc.name  : TextLineTest021
 * @tc.desc  : test for the textLine EnumerateCaretOffsets
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest021, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("H测😀مرحب\n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    OH_Drawing_TextLine* textLine1 = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_TextLineEnumerateCaretOffsets(textLine1, [](double offset, int32_t index, bool leadingEdge) {
        static int offsetNum = 0;
        int32_t data1 = 51;
        int32_t data2 = 50;
        if (index == 0 && leadingEdge) {
            EXPECT_NEAR(offset, 0.0, FLOAT_DATA_EPSILON);
        } else if (index == NUM_1 && leadingEdge) {
            EXPECT_NEAR(offset, 22.349976, FLOAT_DATA_EPSILON);
        } else if (index == NUM_2 && leadingEdge) {
            EXPECT_NEAR(offset, 52.349945, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_LE(offset, 500.0);
        }
        if (offsetNum++ % NUM_2 == 0) {
            EXPECT_TRUE(leadingEdge);
        } else {
            EXPECT_FALSE(leadingEdge);
        }
        EXPECT_LE(index, data1);
        return index > data2;
    });
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_022
 * @tc.name  : TextLineTest022
 * @tc.desc  : test for the textLine EnumerateCaretOffsets
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest022, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineEnumerateCaretOffsets(textLine, [](double offset, int32_t index, bool leadingEdge) {
            EXPECT_GE(index, 0);
            EXPECT_EQ(offset, 0.0);
            EXPECT_TRUE(leadingEdge);
            return true;
        });
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_023
 * @tc.name  : TextLineTest023
 * @tc.desc  : test for the textLine EnumerateCaretOffsets
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest023, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);
    OH_Drawing_TextLineEnumerateCaretOffsets(textLine, nullptr);
    OH_Drawing_TextLineEnumerateCaretOffsets(nullptr, [](double offset, int32_t index, bool leadingEdge) {
            return false;
        });
    OH_Drawing_TextLineEnumerateCaretOffsets(nullptr, nullptr);
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_024
 * @tc.name  : TextLineTest024
 * @tc.desc  : test for the textLine GetAlignmentOffset
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest024, Function | MediumTest | Level0)
{
    PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    std::vector<float> offSetArr = {208.580139, 104.930298, 124.895233, 350.000000, 101.023849, 145.251343, 324.349976};
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 0.0, NUM_600);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 0.5, NUM_700);
        EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, -1.0, NUM_700);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 2.0, NUM_20);
        if (index == NUM_3) {
            EXPECT_EQ(offset, 20.0);
        } else {
            EXPECT_EQ(offset, 0.0);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
}

/*
 * @tc.number: SUB_GRAPHIC_GRAPHIC_2D_TextLineTest_025
 * @tc.name  : TextLineTest025
 * @tc.desc  : test for the textLine GetAlignmentOffset
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(NativeTextLineTest, TextLineTest025, Function | MediumTest | Level0)
{
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 0.0, NUM_600);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 0.5, NUM_700);
        EXPECT_EQ(offset, 350.0);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, -1.0, -700);
        EXPECT_EQ(offset, 0.0);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, 2.0, NUM_20);
        EXPECT_EQ(offset, 20.0);
    }
    OH_Drawing_DestroyTextLines(textLines);

    double offset = OH_Drawing_TextLineGetAlignmentOffset(nullptr, 0.0, 0.0);
    EXPECT_EQ(offset, 0.0);
}
}