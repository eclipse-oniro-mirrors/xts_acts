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

#include "include/NativeTypographyAutoSpaceTest.h"
#include <cstring>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/NativeCopyStyleTest.h"
#include "include/NativeTextRunTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {
namespace {
const double DEFAULT_FONT_SIZE = 40;
const double DEFAULT_LAYOUT_WIDTH = 1000;
const double BOUNDARY_LAYOUT_WIDTH_SINGLE_RUN = 388.319641;
const double BOUNDARY_LAYOUT_WIDTH_MULTI_LINE = 956.159546;
const int LINE_INDEX_0 = 0;
const int LINE_INDEX_1 = 1;
const int LINE_INDEX_2 = 2;
const int LINE_INDEX_3 = 3;
const int AUTO_SPACE_DIVISOR = 8;
const int AUTO_SPACE_MULTIPLIER_2 = 2;
const int AUTO_SPACE_MULTIPLIER_3 = 3;
const int LINE_COUNT_OFFSET = 1;

struct ParagraphMetrics {
    double longestLine;
    double line1;
    double line2;
    size_t lineCount;
};

ParagraphMetrics CreateParagraphWithAutoSpace(NativeTypographyAutoSpaceTestContext& ctx,
                                              const std::string& text,
                                              double layoutWidth,
                                              bool autoSpace)
{
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, autoSpace);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography_, layoutWidth);

    ParagraphMetrics metrics;
    metrics.longestLine = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    metrics.line1 = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_0);
    metrics.line2 = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_1);
    metrics.lineCount = OH_Drawing_TypographyGetLineCount(ctx.typography_);
    return metrics;
}

ParagraphMetrics CreateParagraph2WithAutoSpace(NativeTypographyAutoSpaceTestContext& ctx,
                                               const std::string& text,
                                               double layoutWidth,
                                               bool autoSpace)
{
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle2_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, autoSpace);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler2_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    ASSERT_NE(ctx.typography2_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography2_, layoutWidth);

    ParagraphMetrics metrics;
    metrics.longestLine = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    metrics.line1 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_0);
    metrics.line2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_1);
    metrics.lineCount = OH_Drawing_TypographyGetLineCount(ctx.typography2_);
    return metrics;
}
} // namespace

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest001
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0100
 * @tc.desc   test for set auto space when paragraph with single run
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest001()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "SingRun©2002-2001";
    ctx.PrepareWorkForTypographyStyleTest();

    // paragraph1
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography_, DEFAULT_LAYOUT_WIDTH);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_0);
    EXPECT_NEAR(longestLineTrue, line1True, FLOAT_DATA_EPSILON);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle2_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler2_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    ASSERT_NE(ctx.typography2_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography2_, DEFAULT_LAYOUT_WIDTH);
    double longestLineFalse = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_0);
    EXPECT_NEAR(longestLineFalse, line1False, FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_NEAR(longestLineTrue,
                longestLineFalse + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_2,
                FLOAT_DATA_EPSILON);
    EXPECT_NEAR(
        line1True, line1False + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_2, FLOAT_DATA_EPSILON);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest002
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0200
 * @tc.desc   test for set auto space when paragraph with single run and the layout width is at the boundary value.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest002()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "SingRun©2002-2001";
    ctx.PrepareWorkForTypographyStyleTest();

    // test boundary value：Use longestline without autospace as layout width when autospace enabled, line count + 1
    double layoutWidth = BOUNDARY_LAYOUT_WIDTH_SINGLE_RUN; // boundary value
    ParagraphMetrics metrics1 = CreateParagraphWithAutoSpace(ctx, text, layoutWidth, true);
    EXPECT_NEAR(metrics1.longestLine, std::max(metrics1.line1, metrics1.line2), FLOAT_DATA_EPSILON);
    EXPECT_GT(layoutWidth, metrics1.longestLine);
    EXPECT_GT(layoutWidth, metrics1.line1);
    EXPECT_GT(metrics1.line2, ZERO);

    ParagraphMetrics metrics2 = CreateParagraph2WithAutoSpace(ctx, text, layoutWidth, false);
    EXPECT_NEAR(metrics2.longestLine, metrics2.line1, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(metrics2.longestLine, layoutWidth, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(metrics2.line1, layoutWidth, FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_GT(metrics2.longestLine, metrics1.longestLine);
    EXPECT_GT(metrics2.line1, metrics1.line1);
    EXPECT_EQ(metrics1.lineCount, metrics2.lineCount + LINE_COUNT_OFFSET);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest003
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0300
 * @tc.desc   test for set auto space when paragraph with many lines
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest003()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "嫌疑者X的牺牲\n版权所有©2002-2001华为技术有限公司保留一切权利\n卸载USB设备";
    ctx.PrepareWorkForTypographyStyleTest();

    // paragraph1
    ctx.typoStyle_ = OH_Drawing_CreateTypographyStyle();
    ASSERT_NE(ctx.typoStyle_, nullptr);
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle_, true);
    ctx.handler_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle_, ctx.fontCollection_);
    ASSERT_NE(ctx.handler_, nullptr);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler_, text.c_str());
    ctx.typography_ = OH_Drawing_CreateTypography(ctx.handler_);
    ASSERT_NE(ctx.typography_, nullptr);
    OH_Drawing_TypographyLayout(ctx.typography_, DEFAULT_LAYOUT_WIDTH);
    double longestLineTrue = OH_Drawing_TypographyGetLongestLine(ctx.typography_);
    double line1True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_0);
    double line2True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_1);
    double line3True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_2);
    EXPECT_NEAR(longestLineTrue, std::max(line1True, std::max(line2True, line3True)), FLOAT_DATA_EPSILON);

    // paragraph2
    ctx.typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextAutoSpace(ctx.typoStyle2_, false);
    ctx.handler2_ = OH_Drawing_CreateTypographyHandler(ctx.typoStyle2_, ctx.fontCollection_);
    OH_Drawing_TypographyHandlerPushTextStyle(ctx.handler2_, ctx.txtStyle_);
    OH_Drawing_TypographyHandlerAddText(ctx.handler2_, text.c_str());
    ctx.typography2_ = OH_Drawing_CreateTypography(ctx.handler2_);
    OH_Drawing_TypographyLayout(ctx.typography2_, DEFAULT_LAYOUT_WIDTH);
    double longestLineFalse = OH_Drawing_TypographyGetLongestLine(ctx.typography2_);
    double line1False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_0);
    double line2False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_1);
    double line3False = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_2);
    EXPECT_NEAR(longestLineFalse, std::max(line1False, std::max(line2False, line3False)), FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_NEAR(longestLineTrue,
                longestLineFalse + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_3,
                FLOAT_DATA_EPSILON);
    EXPECT_NEAR(
        line1True, line1False + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_2, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(
        line2True, line2False + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_3, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(
        line3True, line3False + DEFAULT_FONT_SIZE / AUTO_SPACE_DIVISOR * AUTO_SPACE_MULTIPLIER_2, FLOAT_DATA_EPSILON);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextAutoSpaceTest004
 * @tc.number SUB_GRAPHIC_NAPI_OH_DRAWING_SET_TYPOGRAPHY_TEXT_AUTO_SPACE_TEST_0400
 * @tc.desc   test for set auto space when paragraph is many lines and the layout width is at the boundary value.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int OHDrawingSetTypographyTextAutoSpaceTest004()
{
    NativeTypographyAutoSpaceTestContext ctx;
    std::string text = "嫌疑者X的牺牲\n版权所有©2002-2001华为技术有限公司保留一切权利\n卸载USB设备";
    ctx.PrepareWorkForTypographyStyleTest();

    // test boundary value：Use longestline without autospace as layout width when autospace enabled, line count + 1
    double layoutWidth = BOUNDARY_LAYOUT_WIDTH_MULTI_LINE; // boundary value
    ParagraphMetrics metrics1 = CreateParagraphWithAutoSpace(ctx, text, layoutWidth, true);
    double line3True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_2);
    double line4True = OH_Drawing_TypographyGetLineWidth(ctx.typography_, LINE_INDEX_3);
    EXPECT_GT(layoutWidth, metrics1.longestLine);
    EXPECT_GT(layoutWidth, metrics1.line1);
    EXPECT_GT(line3True, ZERO);

    ParagraphMetrics metrics2 = CreateParagraph2WithAutoSpace(ctx, text, layoutWidth, false);
    double line2False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_1);
    double line3False2 = OH_Drawing_TypographyGetLineWidth(ctx.typography2_, LINE_INDEX_2);
    EXPECT_NEAR(metrics2.longestLine, layoutWidth, FLOAT_DATA_EPSILON);
    EXPECT_NEAR(line2False2, layoutWidth, FLOAT_DATA_EPSILON);

    // compare paragraph1 and paragraph2
    EXPECT_GT(metrics2.longestLine, metrics1.longestLine);
    EXPECT_GT(metrics1.line1, metrics2.line1);
    // The critical width value squeezed the second line down, so the characters are fewer, and the width is shorter.
    EXPECT_GT(line2False2, metrics1.line2);
    EXPECT_GT(line4True, line3False2);
    EXPECT_EQ(metrics1.lineCount, metrics2.lineCount + LINE_COUNT_OFFSET);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS