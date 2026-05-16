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

#include "include/NativeTextRunTest.h"
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
#include "include/NativeCopyStyleTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
namespace {
constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
constexpr int TEXT_RANGE_START_INIT = 0;
constexpr int TEXT_RANGE_END_INIT = 0;
constexpr float LEADING_VALUE = 0.0;
} // namespace

/**
 * @tc.name   RunTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0100
 * @tc.desc   Test for get run by index
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest001()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(nullptr, 0);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, TEXT_RUN_NEGATIVE_INDEX);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, runsSize);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, 0);
    uint32_t countData = TEXT_RUN_GLYPH_COUNT;
    uint32_t count = OH_Drawing_GetRunGlyphCount(run);
    EXPECT_EQ(count, countData);

    // branchCoverage
    auto nullCount = OH_Drawing_GetDrawingArraySize(nullptr);
    EXPECT_EQ(nullCount, 0);
    OH_Drawing_DestroyRuns(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0200
 * @tc.desc   Test for get run glyph count
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest002()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    std::vector<int32_t> countArr = { TEXT_RUN_GLYPH_COUNT,   TEXT_RUN_GLYPH_COUNT_2, TEXT_RUN_GLYPH_COUNT_1,
                                      TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5 };
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        uint32_t count = OH_Drawing_GetRunGlyphCount(run);
        EXPECT_EQ(count, countArr[i]);
    }

    // branchCoverage
    OH_Drawing_GetRunGlyphCount(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0300
 * @tc.desc   Test for get glyph index in paragraph
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest003()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    OH_Drawing_Run* run1 = OH_Drawing_GetRunByIndex(runs, 1);
    uint32_t count = OH_Drawing_GetRunGlyphCount(run1);
    auto glyphIndexArr = OH_Drawing_GetRunStringIndices(run1, 0, count);
    auto glyphIndexArrSize = OH_Drawing_GetDrawingArraySize(glyphIndexArr);
    std::vector<int32_t> indexndexArr = { TEXT_RUN_STRING_INDEX_6, TEXT_RUN_STRING_INDEX_7 };
    for (int j = 0; j < glyphIndexArrSize; j++) {
        auto glyphIndex = OH_Drawing_GetRunStringIndicesByIndex(glyphIndexArr, j);
        EXPECT_EQ(glyphIndex, indexndexArr[j]);
    }
    // branchCoverage
    OH_Drawing_GetRunStringIndices(nullptr, TEXT_RUN_NEGATIVE_INDEX, TEXT_RUN_NEGATIVE_INDEX);
    OH_Drawing_GetRunStringIndicesByIndex(glyphIndexArr, glyphIndexArrSize);
    OH_Drawing_DestroyRunStringIndices(glyphIndexArr);
    OH_Drawing_GetRunGlyphCount(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0400
 * @tc.desc   Test for get run string range
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest004()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    std::vector<int32_t> locationArr = { TEXT_RUN_LOCATION_0, TEXT_RUN_LOCATION_6,  TEXT_RUN_LOCATION_8,
                                         TEXT_RUN_LOCATION_9, TEXT_RUN_LOCATION_14, TEXT_RUN_LOCATION_19 };
    std::vector<int32_t> lengthArr = { TEXT_RUN_GLYPH_COUNT,   TEXT_RUN_GLYPH_COUNT_2, TEXT_RUN_GLYPH_COUNT_1,
                                       TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5 };
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        uint64_t location = TEXT_RANGE_START_INIT;
        uint64_t length = TEXT_RANGE_END_INIT;
        OH_Drawing_GetRunStringRange(run, &location, &length);
        EXPECT_EQ(location, locationArr[i]);
        EXPECT_EQ(length, lengthArr[i]);
        // branchCoverage
        OH_Drawing_GetRunStringRange(run, nullptr, nullptr);
    }

    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest005
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0500
 * @tc.desc   Test for get run typographic bounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest005()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    std::vector<float> widthArr = { 78.929932, 59.999939, 8.099991, 81.509903, 187.187500, 64.349945 };
    std::vector<float> ascentArr = { -27.840000, -27.840000, -27.840000, -27.840000, -27.798166, -35.369999 };
    std::vector<float> descentArr = { 7.320000, 7.320000, 7.320000, 7.320000, 7.431193, 9.690001 };
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        float ascent = LEADING_VALUE;
        float descent = LEADING_VALUE;
        float leading = LEADING_VALUE;
        float width = OH_Drawing_GetRunTypographicBounds(run, &ascent, &descent, &leading);
        EXPECT_EQ(leading, 0);
        EXPECT_NEAR(ascent, ascentArr[i], FLOAT_DATA_EPSILON);
        EXPECT_NEAR(descent, descentArr[i], FLOAT_DATA_EPSILON);
        EXPECT_NEAR(width, widthArr[i], FLOAT_DATA_EPSILON);
        // branchCoverage
        OH_Drawing_GetRunTypographicBounds(run, nullptr, nullptr, nullptr);
        OH_Drawing_GetRunTypographicBounds(nullptr, &ascent, &descent, &leading);
    }

    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest006
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0600
 * @tc.desc   Test for get run glyphs
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest006()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    std::vector<int32_t> glyphSizeArr = { 6, 2, 1, 5, 5, 5 };
    std::vector<int32_t> glyphArr = { 7824, 10413 };
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        uint32_t count = OH_Drawing_GetRunGlyphCount(run);
        OH_Drawing_Array* glyphs = OH_Drawing_GetRunGlyphs(run, 0, count);
        size_t glyphSize = OH_Drawing_GetDrawingArraySize(glyphs);
        EXPECT_EQ(glyphSize, glyphSizeArr[i]);
        if (i == 1) {
            for (int j = 0; j < glyphSize; j++) {
                EXPECT_EQ(OH_Drawing_GetRunGlyphsByIndex(glyphs, j), glyphArr[j]);
            }
        }
        // branchCoverage
        OH_Drawing_GetRunGlyphsByIndex(glyphs, glyphSize);
        OH_Drawing_DestroyRunGlyphs(glyphs);
    }
    // branchCoverage
    OH_Drawing_GetRunGlyphs(nullptr, -1, -1);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest007
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0700
 * @tc.desc   Test for get run positions
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest007()
{
    NativeTextRunTestContext ctx;
    ctx.text = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    std::vector<int32_t> positionSizeArr = { TEXT_RUN_GLYPH_COUNT,   TEXT_RUN_GLYPH_COUNT_2, TEXT_RUN_GLYPH_COUNT_1,
                                             TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5, TEXT_RUN_GLYPH_COUNT_5 };
    std::vector<float> posXArr = { TEXT_RUN_POS_X_0, TEXT_RUN_POS_X_29 };
    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, 1);
    uint32_t count = OH_Drawing_GetRunGlyphCount(run);
    OH_Drawing_Array* positions = OH_Drawing_GetRunPositions(run, 0, count);
    EXPECT_TRUE(positions != nullptr);
    size_t positionSize = OH_Drawing_GetDrawingArraySize(positions);
    for (size_t posIndex = 0; posIndex < positionSize; posIndex++) {
        OH_Drawing_Point* pos = OH_Drawing_GetRunPositionsByIndex(positions, posIndex);
        EXPECT_TRUE(pos != nullptr);
    }
    const int positionSizeExpect = 2;
    EXPECT_EQ(positionSize, positionSizeExpect);

    // branchCoverage
    OH_Drawing_GetRunPositionsByIndex(positions, positionSize);
    OH_Drawing_DestroyRunPositions(positions);
    OH_Drawing_GetRunPositions(nullptr, -1, -1);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest008
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0800
 * @tc.desc   Test for special value input parameters testing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest008()
{
    NativeTextRunTestContext ctx;
    ctx.text =
        "Hello\t中国 World \n !@#%^&*){}[] 123456789 -= ,."
        "< >、/ Draclp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    ctx.PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(ctx.typography);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        EXPECT_TRUE(textLine != nullptr);
        OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        EXPECT_TRUE(runs != nullptr);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, runIndex);
            EXPECT_TRUE(run != nullptr);
            // Get the actual size of the run
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            EXPECT_TRUE(count > 0);
            // If both start and end are 0, all data of the current run
            OH_Drawing_Array* positions = OH_Drawing_GetRunPositions(run, 0, 0);
            EXPECT_TRUE(positions != nullptr);
            size_t positionSize = OH_Drawing_GetDrawingArraySize(positions);
            EXPECT_EQ(positionSize, count);
            OH_Drawing_DestroyRunPositions(positions);

            // If both start and end are 0, all data of the current run
            OH_Drawing_Array* glyphs = OH_Drawing_GetRunGlyphs(run, 0, 0);
            EXPECT_TRUE(glyphs != nullptr);
            size_t glyphSize = OH_Drawing_GetDrawingArraySize(glyphs);
            EXPECT_EQ(glyphSize, count);
            OH_Drawing_DestroyRunGlyphs(glyphs);

            // If both start and end are 0, all data of the current run
            OH_Drawing_Array* indices = OH_Drawing_GetRunStringIndices(run, 0, 0);
            EXPECT_TRUE(indices != nullptr);
            size_t indiceSize = OH_Drawing_GetDrawingArraySize(indices);
            EXPECT_EQ(indiceSize, count);
            OH_Drawing_DestroyRunStringIndices(indices);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   RunTest009
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_RUN_TEST_0900
 * @tc.desc   Test for the run of nullptr pointer testing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int RunTest009()
{
    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(nullptr, 0);
    EXPECT_TRUE(run == nullptr);
    uint32_t count = OH_Drawing_GetRunGlyphCount(nullptr);
    EXPECT_EQ(count, 0);
    uint64_t location = 0;
    uint64_t length = 0;
    OH_Drawing_GetRunStringRange(nullptr, &location, &length);
    EXPECT_EQ(location, 0);
    EXPECT_EQ(length, 0);
    EXPECT_TRUE(OH_Drawing_GetRunStringIndices(nullptr, 0, 0) == nullptr);
    EXPECT_TRUE(OH_Drawing_GetRunGlyphs(nullptr, 0, 0) == nullptr);
    EXPECT_TRUE(OH_Drawing_GetRunPositions(nullptr, 0, 0) == nullptr);
    EXPECT_TRUE(OH_Drawing_GetRunImageBounds(nullptr) == nullptr);
    OH_Drawing_RunPaint(nullptr, nullptr, 0, 0);
    float ascent = LEADING_VALUE;
    float descent = LEADING_VALUE;
    float leading = LEADING_VALUE;
    float width = OH_Drawing_GetRunTypographicBounds(nullptr, &ascent, &descent, &leading);
    EXPECT_EQ(ascent, LEADING_VALUE);
    EXPECT_EQ(descent, LEADING_VALUE);
    EXPECT_EQ(leading, LEADING_VALUE);
    EXPECT_EQ(width, LEADING_VALUE);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS