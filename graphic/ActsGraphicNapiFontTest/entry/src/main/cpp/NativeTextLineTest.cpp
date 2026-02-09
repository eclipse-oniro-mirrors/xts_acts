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

#include "include/NativeTextLineTest.h"
#include <cstring>
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/NativeCopyStyleTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
namespace {
constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
}

/**
 * @tc.name   TextLineTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0100
 * @tc.desc   test for the textLine GetGlyphCount
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest001()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine0 = OH_Drawing_GetTextLineByIndex(textLines, 0);
    double data0 = GLYPH_COUNT_LINE_0;
    double count0 = OH_Drawing_TextLineGetGlyphCount(textLine0);
    EXPECT_EQ(count0, data0);

    OH_Drawing_TextLine* textLine1 = OH_Drawing_GetTextLineByIndex(textLines, NUM_1);
    double data1 = GLYPH_COUNT_LINE_1;
    double count1 = OH_Drawing_TextLineGetGlyphCount(textLine1);
    EXPECT_EQ(count1, data1);

    OH_Drawing_TextLine* textLine2 = OH_Drawing_GetTextLineByIndex(textLines, NUM_2);
    double data2 = GLYPH_COUNT_LINE_2;
    double count2 = OH_Drawing_TextLineGetGlyphCount(textLine2);
    EXPECT_EQ(count2, data2);

    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0200
 * @tc.desc   test for the textLine GetGlyphCount
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest002()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double count = OH_Drawing_TextLineGetGlyphCount(textLine);
        if (index == NUM_3) {
            EXPECT_EQ(count, ZERO);
        } else if (index == NUM_6) {
            EXPECT_EQ(count, NUM_3);
        } else {
            EXPECT_GE(count, NUM_10);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0300
 * @tc.desc   test for the textLine GetGlyphCount
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest003()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
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
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0400
 * @tc.desc   test for the textLine GetTextRange
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest004()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    size_t start = TEXT_RANGE_START_INIT;
    size_t end = TEXT_RANGE_END_INIT;
    size_t data1 = TEXT_RANGE_DATA_1;
    size_t data2 = TEXT_RANGE_DATA_2;
    size_t data3 = TEXT_RANGE_DATA_3;
    size_t data4 = TEXT_RANGE_DATA_4;
    size_t data5 = TEXT_RANGE_DATA_5;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        if (index == 0) {
            EXPECT_EQ(start, TEXT_RANGE_START_INIT);
            EXPECT_EQ(end, data1);
        } else if (index == NUM_1) {
            EXPECT_EQ(start, data2);
            EXPECT_EQ(end, data3);
        } else {
            EXPECT_EQ(start, data4);
            EXPECT_EQ(end, data5);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest005
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0500
 * @tc.desc   test for the textLine GetTextRange
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest005()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    size_t start = TEXT_RANGE_START_INIT;
    size_t end = TEXT_RANGE_END_INIT;
    std::vector<int32_t> startArr = { 0, 26, 62, 98, 99, 176, 219 };
    std::vector<int32_t> endArr = { 25, 61, 97, 98, 176, 218, 222 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        EXPECT_EQ(start, startArr[index]);
        EXPECT_EQ(end, endArr[index]);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest006
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0600
 * @tc.desc   test for the textLine GetTextRange
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest006()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_2);

    size_t start = TEXT_RANGE_START_INIT;
    size_t end = TEXT_RANGE_END_INIT;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineGetTextRange(textLine, &start, &end);
        EXPECT_EQ(start, TEXT_RANGE_START_INIT);
        EXPECT_EQ(end, NUM_1);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest007
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0700
 * @tc.desc   test for the textLine GetTextRange
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest007()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_4);

    OH_Drawing_TextLine* textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);

    size_t start = 0;
    OH_Drawing_TextLineGetTextRange(textLine, &start, nullptr);
    EXPECT_EQ(start, 0);

    size_t end = 0;
    OH_Drawing_TextLineGetTextRange(textLine, nullptr, &end);
    EXPECT_EQ(end, TEXT_RANGE_END_INIT);

    OH_Drawing_TextLineGetTextRange(textLine, nullptr, nullptr);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest008
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0800
 * @tc.desc   test for the textLine GetGlyphRuns
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest008()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    std::vector<int32_t> sizeArr = { RUN_SIZE_ARRAY_0, RUN_SIZE_ARRAY_1, RUN_SIZE_ARRAY_2 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_TRUE(runs != nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        EXPECT_EQ(runsSize, sizeArr[index]);
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest009
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_0900
 * @tc.desc   test for the textLine GetGlyphRuns
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest009()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    std::vector<int32_t> sizeArr = { RUN_SIZE_ARRAY_2, RUN_SIZE_ARRAY_1, RUN_SIZE_ARRAY_2, RUN_SIZE_ARRAY_3,
                                     RUN_SIZE_ARRAY_4, RUN_SIZE_ARRAY_5, RUN_SIZE_ARRAY_1 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        if (index == NUM_3) {
            EXPECT_TRUE(runs == nullptr);
            EXPECT_EQ(runsSize, ZERO);
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
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest010
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1000
 * @tc.desc   test for the textLine GetGlyphRuns
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest010()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_4);

    for (size_t index = 0; index < size - NUM_1; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_TRUE(runs == nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        EXPECT_EQ(runsSize, 0);
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest011
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1100
 * @tc.desc   test for the textLine GetGlyphRuns
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest011()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    EXPECT_TRUE(runs == nullptr);

    runs = OH_Drawing_TextLineGetGlyphRuns(nullptr);
    EXPECT_TRUE(runs == nullptr);

    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest012
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1200
 * @tc.desc   test for the textLine GetTypographicBounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest012()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    double ascent = LEADING_VALUE;
    double descent = LEADING_VALUE;
    double leading = LEADING_VALUE;
    std::vector<float> widthArr = { 206.639786, 490.139404, 459.509460 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_NEAR(ascent, ASCENT_VALUE, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(descent, DESCENT_VALUE, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(leading, LEADING_VALUE, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest013
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1300
 * @tc.desc   test for the textLine GetTypographicBounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest013()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);
    
    double ascent = LEADING_VALUE;
    double descent = LEADING_VALUE;
    double leading = LEADING_VALUE;
    std::vector<float> widthArr = { 290.939697, 498.239380, 458.309509, 0.0, 497.952301, 409.497314, 51.300049 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_EQ(leading, 0);
        if (index == NUM_4) {
            EXPECT_NEAR(ascent, ASCENT_VALUE, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, DESCENT_VALUE_ALT_2, FLOAT_DATA_EPSILON);
        } else if (index == NUM_5) {
            EXPECT_NEAR(ascent, ASCENT_VALUE_ALT, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, DESCENT_VALUE_ALT, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_NEAR(ascent, ASCENT_VALUE, FLOAT_DATA_EPSILON);
            EXPECT_NEAR(descent, DESCENT_VALUE, FLOAT_DATA_EPSILON);
        }
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest014
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1400
 * @tc.desc   test for the textLine GetTypographicBounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest014()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);

    double ascent = LEADING_VALUE;
    double descent = LEADING_VALUE;
    double leading = LEADING_VALUE;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        EXPECT_NEAR(ascent, ASCENT_VALUE, FLOAT_DATA_EPSILON);
        EXPECT_NEAR(descent, DESCENT_VALUE, FLOAT_DATA_EPSILON);
        EXPECT_EQ(leading, 0);
        EXPECT_EQ(width, 0);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest015
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1500
 * @tc.desc   test for the textLine GetTypographicBounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest015()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
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
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest016
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1600
 * @tc.desc   test for the textLine GetTrailingSpaceWidth
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest016()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    std::vector<float> widthArr = { 8.099991, 8.099976, 16.199951 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        EXPECT_NEAR(width, widthArr[index], FLOAT_DATA_EPSILON);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest017
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1700
 * @tc.desc   test for the textLine GetTrailingSpaceWidth
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest017()
{
    const float expectedWidthSmall = 8.099976;
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        if (index < NUM_3) {
            EXPECT_NEAR(width, expectedWidthSmall, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(width, LEADING_VALUE);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest018
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1800
 * @tc.desc   test for the textLine GetTrailingSpaceWidth
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest018()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
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
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest019
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_1900
 * @tc.desc   test for the textLine GetOffsetForStringIndex
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest019()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    const float expectedOffsetIndex10 = 161.939835;
    const int maxCharacterNum = 88;
    std::vector<float> offSetArr = { 206.639786, 490.139404, 459.509460 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0);
        EXPECT_EQ(offset, LEADING_VALUE);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NUM_10);
        if (index == 0) {
            EXPECT_NEAR(offset, expectedOffsetIndex10, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(offset, LEADING_VALUE);
        }
        EXPECT_LE(offset, MAX_OFFSET_LIMIT);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, maxCharacterNum);
        EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NEGATIVE_INDEX);
        EXPECT_EQ(offset, LEADING_VALUE);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest020
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2000
 * @tc.desc   test for the textLine GetOffsetForStringIndex
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest020()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    const int maxCharacterNum = 88;
    std::vector<float> offSetArr = { 290.939697, 498.239380, 458.309509 };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0);
        EXPECT_EQ(offset, LEADING_VALUE);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NUM_10);
        if (index == 0) {
            EXPECT_NEAR(offset, EXPECTED_OFFSET_FIRST_LINE, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(offset, LEADING_VALUE);
        }
        EXPECT_LE(offset, MAX_OFFSET_LIMIT);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, maxCharacterNum);
        if (index <= NUM_2) {
            EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        } else {
            EXPECT_EQ(offset, LEADING_VALUE);
        }
        EXPECT_LE(offset, MAX_OFFSET_LIMIT);
        offset = OH_Drawing_TextLineGetOffsetForStringIndex(textLine, NEGATIVE_INDEX);
        EXPECT_EQ(offset, LEADING_VALUE);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest021
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2100
 * @tc.desc   test for the textLine EnumerateCaretOffsets
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest021()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("H测😀مرحب\n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);
    OH_Drawing_TextLine* textLine1 = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_TextLineEnumerateCaretOffsets(textLine1, [](double offset, int32_t index, bool leadingEdge) {
        static int offsetNum = 0;
        int32_t data1 = TEXT_LINE_TEST_DATA_1;
        int32_t data2 = TEXT_LINE_TEST_DATA_2;
        if (index == 0 && leadingEdge) {
            EXPECT_NEAR(offset, 0.0, FLOAT_DATA_EPSILON);
        } else if (index == NUM_1 && leadingEdge) {
            EXPECT_NEAR(offset, EXPECTED_OFFSET_INDEX_1, FLOAT_DATA_EPSILON);
        } else if (index == NUM_2 && leadingEdge) {
            EXPECT_NEAR(offset, EXPECTED_OFFSET_INDEX_2, FLOAT_DATA_EPSILON);
        } else {
            EXPECT_LE(offset, MAX_OFFSET_LIMIT);
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
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest022
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2200
 * @tc.desc   test for the textLine EnumerateCaretOffsets
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest022()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        OH_Drawing_TextLineEnumerateCaretOffsets(textLine, [](double offset, int32_t index, bool leadingEdge) {
            EXPECT_GE(index, 0);
            EXPECT_EQ(offset, LEADING_VALUE);
            EXPECT_TRUE(leadingEdge);
            return true;
        });
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest023
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2300
 * @tc.desc   test for the textLine EnumerateCaretOffsets
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest023()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_3);

    OH_Drawing_TextLine* textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    EXPECT_TRUE(textLine != nullptr);
    OH_Drawing_TextLineEnumerateCaretOffsets(textLine, nullptr);
    OH_Drawing_TextLineEnumerateCaretOffsets(nullptr,
                                             [](double offset, int32_t index, bool leadingEdge) { return false; });
    OH_Drawing_TextLineEnumerateCaretOffsets(nullptr, nullptr);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest024
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2400
 * @tc.desc   test for the textLine GetAlignmentOffset
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest024()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine(
        "Hello \t 中国 测 World \n !@#$%^&*~(){}[] 123 4567890 - = ,. < >、/ Drawing testlp 试 "
        "Drawing \n\n   \u231A \u513B"
        " \u00A9\uFE0F aaa clp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测 "
        "World测试文本\n123");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_7);

    std::vector<float> offSetArr = {
        208.580139, 104.930298, 124.895233, 350.000000, 101.023849, 145.251343, 324.349976
    };
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_ZERO, NUM_600);
        EXPECT_EQ(offset, ALIGNMENT_OFFSET_ZERO);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_HALF, NUM_700);
        EXPECT_NEAR(offset, offSetArr[index], FLOAT_DATA_EPSILON);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_NEGATIVE, NUM_700);
        EXPECT_EQ(offset, ALIGNMENT_OFFSET_ZERO);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_TWO, NUM_20);
        if (index == NUM_3) {
            EXPECT_EQ(offset, EXPECTED_ALIGNMENT_OFFSET_TWO);
        } else {
            EXPECT_EQ(offset, LEADING_VALUE);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   TextLineTest025
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_TEXT_LINE_TEST_2500
 * @tc.desc   test for the textLine GetAlignmentOffset
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int TextLineTest025()
{
    NativeTextLineTestContext ctx;
    ctx.PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    EXPECT_EQ(size, NUM_5);

    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);

        double offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_ZERO, NUM_600);
        EXPECT_EQ(offset, ALIGNMENT_OFFSET_ZERO);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_HALF, NUM_700);
        EXPECT_EQ(offset, EXPECTED_ALIGNMENT_OFFSET_HALF);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_NEGATIVE, NEGATIVE_WIDTH);
        EXPECT_EQ(offset, ALIGNMENT_OFFSET_ZERO);
        offset = OH_Drawing_TextLineGetAlignmentOffset(textLine, ALIGNMENT_OFFSET_TWO, NUM_20);
        EXPECT_EQ(offset, EXPECTED_ALIGNMENT_OFFSET_TWO);
    }
    OH_Drawing_DestroyTextLines(textLines);

    double offset = OH_Drawing_TextLineGetAlignmentOffset(nullptr, ALIGNMENT_OFFSET_ZERO, ALIGNMENT_OFFSET_ZERO);
    EXPECT_EQ(offset, ALIGNMENT_OFFSET_ZERO);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS