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

#include "include/NativeUndefinedGlyphDisplayTest.h"
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_global.h>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace {
const int NUM_1 = 1;
const int NUM_3 = 3;
const int NUM_100 = 100;
} // namespace

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
bool ExistNotdef()
{
    std::string existFontPathStr = std::string("/system/fonts/") + GetSystemDefaultFont(true) + "_Notdef.ttf";
    const char* existFontPath = existFontPathStr.c_str();
    std::ifstream file(existFontPath);
    return file.is_open();
}

bool ExistNotoSans()
{
    std::ifstream file("/system/fonts/NotoSans[wdth,wght].ttf");
    return file.is_open();
}
} // namespace

/**
 * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay001
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_001
 * @tc.desc   Test undefined glyph display use tofu
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTextUndefinedGlyphDisplay001()
{
    NativeUndefinedGlyphDisplayTestContext ctx;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_TOFU);
    OH_Drawing_Typography* typography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::TEST_TEXT);
    EXPECT_NE(typography, nullptr);
    if (ExistNotdef()) {
        ctx.BoundsResult(typography, OHOS::Rosen::Drawing::TOFU_RESULT, NUM_3);
    } else {
        ctx.BoundsResult(typography, OHOS::Rosen::Drawing::DEFAULT_RESULT, NUM_3);
    }
    OH_Drawing_DestroyTypography(typography);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay002
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_002
 * @tc.desc   Test undefined glyph display use default
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTextUndefinedGlyphDisplay002()
{
    NativeUndefinedGlyphDisplayTestContext ctx;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_DEFAULT);
    OH_Drawing_Typography* typography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::TEST_TEXT);
    EXPECT_NE(typography, nullptr);
    ctx.BoundsResult(typography, OHOS::Rosen::Drawing::DEFAULT_RESULT, NUM_3);
    OH_Drawing_DestroyTypography(typography);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay003
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_003
 * @tc.desc   Test undefined glyph display use invalid input
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTextUndefinedGlyphDisplay003()
{
    NativeUndefinedGlyphDisplayTestContext ctx;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_DEFAULT);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* defaultTypography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::TEST_TEXT);
    EXPECT_NE(defaultTypography, nullptr);
    ctx.BoundsResult(defaultTypography, OHOS::Rosen::Drawing::DEFAULT_RESULT, NUM_3);
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_TOFU);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* tofuTypography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::TEST_TEXT);
    EXPECT_NE(tofuTypography, nullptr);
    if (ExistNotdef()) {
        ctx.BoundsResult(tofuTypography, OHOS::Rosen::Drawing::TOFU_RESULT, NUM_3);
    } else {
        ctx.BoundsResult(tofuTypography, OHOS::Rosen::Drawing::DEFAULT_RESULT, NUM_3);
    }
    OH_Drawing_DestroyTypography(defaultTypography);
    OH_Drawing_DestroyTypography(tofuTypography);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay004
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_004
 * @tc.desc   Test undefined glyph display use only no glyph
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTextUndefinedGlyphDisplay004()
{
    NativeUndefinedGlyphDisplayTestContext ctx;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_DEFAULT);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* defaultTypography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::NO_GLYPH_TEXT);
    EXPECT_NE(defaultTypography, nullptr);
    ctx.BoundsResult(defaultTypography, OHOS::Rosen::Drawing::NO_GLYPH_DEFAULT_RESULT, NUM_1);
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_TOFU);
    OH_Drawing_SetTextUndefinedGlyphDisplay(static_cast<OH_Drawing_TextUndefinedGlyphDisplay>(NUM_100));
    OH_Drawing_Typography* tofuTypography = ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::NO_GLYPH_TEXT);
    EXPECT_NE(tofuTypography, nullptr);
    if (ExistNotdef()) {
        ctx.BoundsResult(tofuTypography, OHOS::Rosen::Drawing::NO_GLYPH_TOFU_RESULT, NUM_1);
    } else {
        ctx.BoundsResult(defaultTypography, OHOS::Rosen::Drawing::NO_GLYPH_DEFAULT_RESULT, NUM_1);
    }
    OH_Drawing_DestroyTypography(defaultTypography);
    OH_Drawing_DestroyTypography(tofuTypography);
    return TEST_SUCCESS_CODE;
}

/**
 * @tc.name   OHDrawingSetTextUndefinedGlyphDisplay005
 * @tc.number SUB_GRAPHIC_GRAPHIC_2D_SetTextUndefinedGlyphDisplay_005
 * @tc.desc   Test set family name, but still force tofu
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHDrawingSetTextUndefinedGlyphDisplay005()
{
    NativeUndefinedGlyphDisplayTestContext ctx;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_TOFU);
    const char* fontFamilies[] = { "Noto Sans" };
    OH_Drawing_Typography* typography =
        ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::TEST_TEXT, fontFamilies, NUM_1);
    EXPECT_NE(typography, nullptr);
    if (ExistNotoSans()) {
        ctx.BoundsResult(typography, OHOS::Rosen::Drawing::NO_TO_RESULT, NUM_3);
    } else {
        ctx.BoundsResult(typography, OHOS::Rosen::Drawing::DEFAULT_RESULT, NUM_3);
    }
    OH_Drawing_Typography* onlyTypography =
        ctx.PrepareCreateTypography(OHOS::Rosen::Drawing::NO_GLYPH_TEXT, fontFamilies, NUM_1);
    EXPECT_NE(onlyTypography, nullptr);
    if (ExistNotdef()) {
        ctx.BoundsResult(onlyTypography, OHOS::Rosen::Drawing::NO_GLYPH_TOFU_RESULT, NUM_1);
    } else {
        ctx.BoundsResult(onlyTypography, OHOS::Rosen::Drawing::NO_GLYPH_DEFAULT_RESULT, NUM_1);
    }
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_DEFAULT);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypography(onlyTypography);
    return TEST_SUCCESS_CODE;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS