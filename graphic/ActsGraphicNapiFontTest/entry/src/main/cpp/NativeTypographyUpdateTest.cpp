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

#include "include/NativeTypographyUpdateTest.h"
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/NativeCopyStyleTest.h"
#include "include/NativeTextRunTest.h"
#include "include/NativeTypographyAutoSpaceTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {

namespace Drawing {
namespace {
constexpr uint8_t COLOR_ALPHA_FF = 0xFF;
constexpr uint8_t COLOR_RGB_00 = 0x00;
constexpr double DECORATION_THICKNESS_DOUBLE = 2.0;
} // namespace

/**
 * @tc.name   OHDrawingTypographyUpdate001
 * @tc.number OHDrawingTypographyUpdate001
 * @tc.desc   test the nullptr input value for updating the paint attribute
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingTypographyUpdate001()
{
    OH_Drawing_TypographyUpdateFontColor(
        nullptr, OH_Drawing_ColorSetArgb(COLOR_ALPHA_FF, COLOR_RGB_00, COLOR_ALPHA_FF, COLOR_ALPHA_FF));
    OH_Drawing_TypographyUpdateDecoration(nullptr, TEXT_DECORATION_LINE_THROUGH);
    OH_Drawing_TypographyUpdateDecorationThicknessScale(nullptr, DECORATION_THICKNESS_DOUBLE);
    OH_Drawing_TypographyUpdateDecorationStyle(nullptr, TEXT_DECORATION_STYLE_DOTTED);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyTextTrailingSpaceOptimized001
 * @tc.number OHDrawingSetTypographyTextTrailingSpaceOptimized001
 * @tc.desc   test for setting the different value of trailingSpaceOptimized and improve code coverage
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTypographyTextTrailingSpaceOptimized001()
{
    NativeTypographyUpdateTestContext ctx;
    OH_Drawing_SetTypographyTextAlign(ctx.fTypoStyle, TEXT_ALIGN_RIGHT);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(nullptr, true);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(nullptr, false);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(ctx.fTypoStyle, true);
    OH_Drawing_SetTypographyTextTrailingSpaceOptimized(ctx.fTypoStyle, false);
    ctx.PrepareWorkForAlignmentTest();
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTypographyVerticalAlignment001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTypographyVerticalAlignment_001
 * @tc.desc   Test for vertical align valid params
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTypographyVerticalAlignment001()
{
    EXPECT_NO_FATAL_FAILURE(OH_Drawing_SetTypographyVerticalAlignment(
        nullptr, OH_Drawing_TextVerticalAlignment::TEXT_VERTICAL_ALIGNMENT_BOTTOM));
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS