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
#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVEUNDEFINEDGLYPHDISPLAYTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVEUNDEFINEDGLYPHDISPLAYTEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

// Undefined glyph display test constants
constexpr double UNDEFINED_GLYPH_MAX_WIDTH = 500.0;
constexpr double UNDEFINED_GLYPH_FONT_SIZE = 30.0;

namespace OHOS {
namespace Rosen {
struct NativeUndefinedGlyphDisplayTestContext {
    NativeUndefinedGlyphDisplayTestContext() {}

    OH_Drawing_Typography*
        PrepareCreateTypography(const std::string& text, const char** fontFamilies = nullptr, int fontCount = 0)
    {
        double maxWidth = UNDEFINED_GLYPH_MAX_WIDTH;
        OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
        EXPECT_NE(typoStyle, nullptr);
        OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
        EXPECT_NE(txtStyle, nullptr);
        OH_Drawing_SetTextStyleFontFamilies(txtStyle, fontCount, fontFamilies);
        OH_Drawing_FontCollection* fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
        EXPECT_NE(fontCollection, nullptr);
        OH_Drawing_TypographyCreate* handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
        EXPECT_NE(handler, nullptr);
        OH_Drawing_SetTextStyleColor(
            txtStyle, OH_Drawing_ColorSetArgb(COLOR_ALPHA_OPAQUE, COLOR_RGB_BLACK, COLOR_RGB_BLACK, COLOR_RGB_BLACK));
        double fontSize = UNDEFINED_GLYPH_FONT_SIZE;
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

    void BoundsResult(OH_Drawing_Typography* typography, const float rectResult[][4], size_t size)
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
};

namespace Drawing {

constexpr const char* TEST_TEXT =
    "Hello 测 World \uffff\n!@#$%^&*~(){\uffff\uffff}[]90 - = ,.\n\uffff"
    "testlp\uffff试\uffff Drawing\uffff";
constexpr const char* NO_GLYPH_TEXT = "\uffff";
constexpr float DEFAULT_RESULT[][4] = { { 2.0, 2.0, 206.63979, 29.0 },
                                        { 1.0, 5.0, 388.10962, 37.0 },
                                        { 0, 8.0, 319.4397, 42.0 } };
constexpr float TOFU_RESULT[][4] = { { 2.0, 2.0, 228.63979, 29.0 },
                                     { 1.0, 5.0, 388.10962, 37.0 },
                                     { 8.0, 8.0, 341.4397, 42.0 } };
constexpr float NO_TO_RESULT[][4] = { { 2.0, 2.0, 232.20976, 29.0 },
                                      { 2.0, 5.0, 388.43961, 33.0 },
                                      { 8.0, 8.0, 347.76962, 42.0 } };
constexpr float NO_GLYPH_TOFU_RESULT[][4] = { { 8.0, 0, 22.0, 22.0 } };
constexpr float NO_GLYPH_DEFAULT_RESULT[][4] = { { 0, 0, 0, 0 } };
constexpr float NO_GLYPH_NO_TO_RESULT[][4] = { { 0, 0, 0, 0 } };

int OHDrawingSetTextUndefinedGlyphDisplay001();
int OHDrawingSetTextUndefinedGlyphDisplay002();
int OHDrawingSetTextUndefinedGlyphDisplay003();
int OHDrawingSetTextUndefinedGlyphDisplay004();
int OHDrawingSetTextUndefinedGlyphDisplay005();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVEUNDEFINEDGLYPHDISPLAYTEST_H
