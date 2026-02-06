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
#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

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

// TextLine test constants
constexpr int MAX_CHARACTER_NUM = 88;
constexpr double MAX_OFFSET_LIMIT = 500.0;
constexpr int NEGATIVE_INDEX = -2;
constexpr double EXPECTED_OFFSET_FIRST_LINE = 155.129852;
constexpr double EXPECTED_OFFSET_INDEX_1 = 22.349976;
constexpr double EXPECTED_OFFSET_INDEX_2 = 52.349945;
constexpr double ALIGNMENT_OFFSET_ZERO = 0.0;
constexpr double ALIGNMENT_OFFSET_HALF = 0.5;
constexpr double ALIGNMENT_OFFSET_NEGATIVE = -1.0;
constexpr double ALIGNMENT_OFFSET_TWO = 2.0;
constexpr double EXPECTED_ALIGNMENT_OFFSET_HALF = 350.0;
constexpr double EXPECTED_ALIGNMENT_OFFSET_TWO = 20.0;
constexpr int NEGATIVE_WIDTH = -700;
constexpr int TEXT_LINE_TEST_DATA_1 = 51;
constexpr int TEXT_LINE_TEST_DATA_2 = 50;
constexpr int GLYPH_COUNT_LINE_0 = 13;
constexpr int GLYPH_COUNT_LINE_1 = 34;
constexpr int GLYPH_COUNT_LINE_2 = 29;
constexpr int TEXT_RANGE_DATA_1 = 16;
constexpr int TEXT_RANGE_DATA_2 = 17;
constexpr int TEXT_RANGE_DATA_3 = 51;
constexpr int TEXT_RANGE_DATA_4 = 52;
constexpr int TEXT_RANGE_DATA_5 = 87;
constexpr int TEXT_RANGE_START_INIT = 0;
constexpr int TEXT_RANGE_END_INIT = 0;
constexpr int RUN_SIZE_ARRAY_0 = 4;
constexpr int RUN_SIZE_ARRAY_1 = 1;
constexpr int RUN_SIZE_ARRAY_2 = 6;
constexpr int RUN_SIZE_ARRAY_3 = 0;
constexpr int RUN_SIZE_ARRAY_4 = 7;
constexpr int RUN_SIZE_ARRAY_5 = 8;
constexpr double ASCENT_VALUE = -27.84;
constexpr double DESCENT_VALUE = 7.32;
constexpr double ASCENT_VALUE_ALT = -35.369999;
constexpr double DESCENT_VALUE_ALT = 9.690001;
constexpr double DESCENT_VALUE_ALT_2 = 7.431193;
constexpr double LEADING_VALUE = 0.0;

struct NativeTextLineTestContext {
    OH_Drawing_TypographyStyle* typoStyle;
    OH_Drawing_TextStyle* txtStyle;
    OH_Drawing_FontCollection* fontCollection;
    OH_Drawing_TypographyCreate* handler;
    OH_Drawing_Typography* typography;

    NativeTextLineTestContext()
        : fontCollection(nullptr), txtStyle(nullptr), handler(nullptr), typography(nullptr), typoStyle(nullptr)
    {
    }

    ~NativeTextLineTestContext()
    {
        if (typography != nullptr) {
            OH_Drawing_DestroyTypography(typography);
            typography = nullptr;
        }
        if (handler != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler);
            handler = nullptr;
        }
        if (txtStyle != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle);
            txtStyle = nullptr;
        }
        if (typoStyle != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle);
            typoStyle = nullptr;
        }
        if (fontCollection != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection);
            fontCollection = nullptr;
        }
    }

    void PrepareCreateTextLine(const std::string& text)
    {
        double maxWidth = 500.0;
        typoStyle = OH_Drawing_CreateTypographyStyle();
        EXPECT_TRUE(typoStyle != nullptr);
        txtStyle = OH_Drawing_CreateTextStyle();
        EXPECT_TRUE(txtStyle != nullptr);
        fontCollection = OH_Drawing_CreateFontCollection();
        EXPECT_TRUE(fontCollection != nullptr);
        handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
        EXPECT_TRUE(handler != nullptr);
        OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
        double fontSize = 30;
        OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
        OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
        bool halfLeading = true;
        OH_Drawing_SetTextStyleHalfLeading(txtStyle, halfLeading);
        const char* fontFamilies[] = { "Roboto" };
        OH_Drawing_SetTextStyleFontFamilies(txtStyle, NUM_1, fontFamilies);
        OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
        OH_Drawing_TypographyHandlerAddText(handler, text.c_str());
        OH_Drawing_TypographyHandlerPopTextStyle(handler);
        typography = OH_Drawing_CreateTypography(handler);
        EXPECT_TRUE(typography != nullptr);
        OH_Drawing_TypographyLayout(typography, maxWidth);
    }
};

namespace OHOS {
namespace Rosen {
namespace Drawing {
int TextLineTest001();
int TextLineTest002();
int TextLineTest003();
int TextLineTest004();
int TextLineTest005();
int TextLineTest006();
int TextLineTest007();
int TextLineTest008();
int TextLineTest009();
int TextLineTest010();
int TextLineTest011();
int TextLineTest012();
int TextLineTest013();
int TextLineTest014();
int TextLineTest015();
int TextLineTest016();
int TextLineTest017();
int TextLineTest018();
int TextLineTest019();
int TextLineTest020();
int TextLineTest021();
int TextLineTest022();
int TextLineTest023();
int TextLineTest024();
int TextLineTest025();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETEXTLINETEST_H
