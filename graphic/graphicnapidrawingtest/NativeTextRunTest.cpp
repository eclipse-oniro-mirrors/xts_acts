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

#include "drawing_font_collection.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_text_line.h"
#include "drawing_text_run.h"
#include "drawing_types.h"
#include "drawing_text_typography.h"
#include "gtest/gtest.h"
#include "string"

#ifdef RS_ENABLE_VK
#include "platform/ohos/backend/rs_vulkan_context.h"
#endif

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace {
    constexpr static float FLOAT_DATA_EPSILON = 1e-6f;
}

class NativeTextRunTest : public testing::Test {
public:
    static void SetUpTestCase()
    {
#ifdef RS_ENABLE_VK
        Rosen::RsVulkanContext::SetRecyclable(false);
#endif
    }
    static void TearDownTestCase() {}
    void SetUp() override {};
    void TearDown() override;
    void PrepareCreateTextLine();
    void PrepareCreateTextLineForGlyphDrawing();

    OH_Drawing_TypographyStyle* typeStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Array* runs_ = nullptr;
    OH_Drawing_Array* textLines_ = nullptr;
    std::string text_;
};

void NativeTextRunTest::PrepareCreateTextLine()
{
    double maxWidth = 500.0;
    typeStyle_ = OH_Drawing_CreateTypographyStyle();
    EXPECT_TRUE(typeStyle_ != nullptr);
    txtStyle_ = OH_Drawing_CreateTextStyle();
    EXPECT_TRUE(txtStyle_ != nullptr);
    fontCollection_ = OH_Drawing_CreateFontCollection();
    EXPECT_TRUE(fontCollection_ != nullptr);
    handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
    EXPECT_TRUE(handler_ != nullptr);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char* fontFamilies[] = { "Roboto" };
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text_.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_TRUE(typography_ != nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
}

void NativeTextRunTest::PrepareCreateTextLineForGlyphDrawing()
{
    double maxWidth = 1200.0;
    typeStyle_ = OH_Drawing_CreateTypographyStyle();
    EXPECT_NE(typeStyle_, nullptr);
    txtStyle_ = OH_Drawing_CreateTextStyle();
    EXPECT_NE(txtStyle_, nullptr);
    fontCollection_ = OH_Drawing_CreateFontCollection();
    EXPECT_NE(fontCollection_, nullptr);
    handler_ = OH_Drawing_CreateTypographyHandler(typeStyle_, fontCollection_);
    EXPECT_NE(handler_, nullptr);
    double fontSize = 100;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text_.c_str());
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_NE(typography_, nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    textLines_ = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_NE(textLines_, nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines_);
    EXPECT_TRUE(size != 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines_, 0);
    EXPECT_NE(textLine, nullptr);
    runs_ = OH_Drawing_TextLineGetGlyphRuns(textLine);
    EXPECT_NE(runs_, nullptr);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs_);
    EXPECT_TRUE(runsSize != 0);
}

void NativeTextRunTest::TearDown()
{
    OH_Drawing_DestroyTypography(typography_);
    typography_ = nullptr;
    OH_Drawing_DestroyTypographyHandler(handler_);
    handler_ = nullptr;
    OH_Drawing_DestroyFontCollection(fontCollection_);
    fontCollection_ = nullptr;
    OH_Drawing_DestroyTextStyle(txtStyle_);
    txtStyle_ = nullptr;
    OH_Drawing_DestroyTypographyStyle(typeStyle_);
    typeStyle_ = nullptr;
    text_ = "";
    if (textLines_ != nullptr) {
        OH_Drawing_DestroyTextLines(textLines_);
        textLines_ = nullptr;
    }
    if (runs_ != nullptr) {
        OH_Drawing_DestroyRuns(runs_);
        runs_ = nullptr;
    }
}

/**
 * @tc.name   RunTest001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_001
 * @tc.desc   Test for get run by index
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest001, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);

    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);

    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(nullptr, 0);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, -1);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, runsSize);
    EXPECT_EQ(run, nullptr);
    run = OH_Drawing_GetRunByIndex(runs, 0);
    uint32_t countData = 6;
    uint32_t count = OH_Drawing_GetRunGlyphCount(run);
    EXPECT_EQ(count, countData);

    // branchCoverage
    auto nullCount = OH_Drawing_GetDrawingArraySize(nullptr);
    EXPECT_EQ(nullCount, 0);
    OH_Drawing_DestroyRuns(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
}

/**
 * @tc.name   RunTest002
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_002
 * @tc.desc   Test for get run glyph count
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest002, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
 
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    std::vector<int32_t> countArr = {6, 2, 1, 5, 5, 5};
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        uint32_t count = OH_Drawing_GetRunGlyphCount(run);
        EXPECT_EQ(count, countArr[i]);
    }

    // branchCoverage
    OH_Drawing_GetRunGlyphCount(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
}

/**
 * @tc.name   RunTest003
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_003
 * @tc.desc   Test for get glyph index in paragraph
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest003, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
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
    std::vector<int32_t> indexndexArr = {6, 7};
    for (int j = 0; j < glyphIndexArrSize; j++) {
        auto glyphIndex = OH_Drawing_GetRunStringIndicesByIndex(glyphIndexArr, j);
        EXPECT_EQ(glyphIndex, indexndexArr[j]);
    }
    // branchCoverage
    OH_Drawing_GetRunStringIndices(nullptr, -1, -1);
    OH_Drawing_GetRunStringIndicesByIndex(glyphIndexArr, glyphIndexArrSize);
    OH_Drawing_DestroyRunStringIndices(glyphIndexArr);
    OH_Drawing_GetRunGlyphCount(nullptr);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
}

/**
 * @tc.name   RunTest004
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_004
 * @tc.desc   Test for get run string range
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest004, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
   
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    
    std::vector<int32_t> locationArr = {0, 6, 8, 9, 14, 19};
    std::vector<int32_t> lengthArr = {6, 2, 1, 5, 5, 5};
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        uint64_t location = 0;
        uint64_t length = 0;
        OH_Drawing_GetRunStringRange(run, &location, &length);
        EXPECT_EQ(location, locationArr[i]);
        EXPECT_EQ(length, lengthArr[i]);
        // branchCoverage
        OH_Drawing_GetRunStringRange(run, nullptr, nullptr);
    }
    
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
}

/**
 * @tc.name   RunTest005
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_005
 * @tc.desc   Test for get run typographic bounds
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest005, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    
    std::vector<float> widthArr = {78.929932, 59.999939, 8.099991, 81.509903, 187.187500, 64.349945};
    std::vector<float> ascentArr = {-27.840000, -27.840000, -27.840000, -27.840000, -27.798166, -35.369999};
    std::vector<float> descentArr = {7.320000, 7.320000, 7.320000, 7.320000, 7.431193, 9.690001};
    for (int i = 0; i < runsSize; i++) {
        OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, i);
        float ascent = 0.0;
        float descent = 0.0;
        float leading = 0.0;
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
}

/**
 * @tc.name   RunTest006
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_006
 * @tc.desc   Test for get run glyphs
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest006, Function | MediumTest | Level0)
{
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
      
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    
    std::vector<int32_t> glyphSizeArr = {6, 2, 1, 5, 5, 5};
    std::vector<int32_t> glyphArr = {7824, 10413};
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
}

 /**
  * @tc.name   RunTest007
  * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_007
  * @tc.desc   Test for get run positions
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL0
  */
 HWTEST_F(NativeTextRunTest, RunTest007, Function | MediumTest | Level0)
 {
    text_ = "Hello 你好 World⌚😀👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
    EXPECT_TRUE(textLines != nullptr);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    ASSERT_GT(size, 0);
    OH_Drawing_TextLine* textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
       
    OH_Drawing_Array* runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
    ASSERT_GT(runsSize, 0);
    
    std::vector<int32_t> positionSizeArr = {6, 2, 1, 5, 5, 5};
    std::vector<float> posXArr = {0, 29.999969};
    OH_Drawing_Run* run = OH_Drawing_GetRunByIndex(runs, 1);
    uint32_t count = OH_Drawing_GetRunGlyphCount(run);
    OH_Drawing_Array* positions = OH_Drawing_GetRunPositions(run, 0, count);
    EXPECT_TRUE(positions != nullptr);
    size_t positionSize = OH_Drawing_GetDrawingArraySize(positions);
    for (size_t posIndex = 0; posIndex < positionSize; posIndex++) {
        OH_Drawing_Point* pos = OH_Drawing_GetRunPositionsByIndex(positions, posIndex);
        EXPECT_TRUE(pos != nullptr);
    }
    EXPECT_EQ(positionSize, 2);
    
    // branchCoverage
    OH_Drawing_GetRunPositionsByIndex(positions, positionSize);
    OH_Drawing_DestroyRunPositions(positions);
    OH_Drawing_GetRunPositions(nullptr, -1, -1);
    OH_Drawing_DestroyRuns(runs);
    OH_Drawing_DestroyTextLines(textLines);
}

/**
 * @tc.name   RunTest008
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_008
 * @tc.desc   Test for special value input parameters testing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest008, Function | MediumTest | Level0)
{
    text_ = "Hello\t中国 World \n !@#%^&*){}[] 123456789 -= ,."
        "< >、/ Draclp11⌚😀😁🤣👨‍🔬👩‍👩‍👧‍👦👭مرحبا中国 测文本\n 123";
    PrepareCreateTextLine();
    OH_Drawing_Array* textLines = OH_Drawing_TypographyGetTextLines(typography_);
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
}

/**
 * @tc.name   RunTest009
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_RunTest_009
 * @tc.desc   Test for the run of nullptr pointer testing
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(NativeTextRunTest, RunTest009, Function | MediumTest | Level0)
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
    float ascent = 0.0;
    float descent = 0.0;
    float leading = 0.0;
    float width = OH_Drawing_GetRunTypographicBounds(nullptr, &ascent, &descent, &leading);
    EXPECT_EQ(ascent, 0.0);
    EXPECT_EQ(descent, 0.0);
    EXPECT_EQ(leading, 0.0);
    EXPECT_EQ(width, 0.0);
}
}  // namespace OHOS