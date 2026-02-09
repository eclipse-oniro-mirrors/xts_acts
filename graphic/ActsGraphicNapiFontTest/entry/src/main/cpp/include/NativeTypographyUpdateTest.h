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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace OHOS {

struct NativeTypographyUpdateTestContext {
    const int defaultFontSize = 50;
    const char* defaultText = "text";

    OH_Drawing_TypographyCreate* fHandler{ nullptr };
    OH_Drawing_Typography* fTypography{ nullptr };
    OH_Drawing_TypographyStyle* fTypoStyle{ nullptr };
    OH_Drawing_TextStyle* fTxtStyle{ nullptr };
    int fLayoutWidth{ defaultFontSize };

    NativeTypographyUpdateTestContext()
        : fHandler(nullptr),
          fTypography(nullptr),
          fTypoStyle(nullptr),
          fTxtStyle(nullptr),
          fLayoutWidth(defaultFontSize)
    {
        fTypoStyle = OH_Drawing_CreateTypographyStyle();
        ASSERT_NE(fTypoStyle, nullptr);
        OH_Drawing_SetTypographyTextFontSize(fTypoStyle, defaultFontSize);
        fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
        ASSERT_NE(fHandler, nullptr);
        fTxtStyle = OH_Drawing_CreateTextStyle();
        ASSERT_NE(fTxtStyle, nullptr);
        OH_Drawing_SetTextStyleFontSize(fTxtStyle, defaultFontSize);
        OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
        OH_Drawing_TypographyHandlerAddText(fHandler, defaultText);
        fTypography = OH_Drawing_CreateTypography(fHandler);
        ASSERT_NE(fTypography, nullptr);
        OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
    }

    ~NativeTypographyUpdateTestContext()
    {
        if (fHandler != nullptr) {
            OH_Drawing_DestroyTypographyHandler(fHandler);
            fHandler = nullptr;
        }
        if (fTypography != nullptr) {
            OH_Drawing_DestroyTypography(fTypography);
            fTypography = nullptr;
        }
        if (fTypoStyle != nullptr) {
            OH_Drawing_DestroyTypographyStyle(fTypoStyle);
            fTypoStyle = nullptr;
        }
        if (fTxtStyle != nullptr) {
            OH_Drawing_DestroyTextStyle(fTxtStyle);
            fTxtStyle = nullptr;
        }
    }

    void PrepareWorkForAlignmentTest()
    {
        fHandler = OH_Drawing_CreateTypographyHandler(fTypoStyle, OH_Drawing_CreateFontCollection());
        ASSERT_NE(fHandler, nullptr);
        fTxtStyle = OH_Drawing_CreateTextStyle();
        ASSERT_NE(fTxtStyle, nullptr);
        OH_Drawing_SetTextStyleFontSize(fTxtStyle, defaultFontSize);
        OH_Drawing_TypographyHandlerPushTextStyle(fHandler, fTxtStyle);
        OH_Drawing_TypographyHandlerAddText(fHandler, defaultText);
        fTypography = OH_Drawing_CreateTypography(fHandler);
        ASSERT_NE(fTypography, nullptr);
        OH_Drawing_TypographyLayout(fTypography, fLayoutWidth);
    }
};

namespace Rosen {

namespace SPText {
class TextStyle {
public:
    uint32_t color;
};
} // namespace SPText

class RunMetrics {
public:
    const SPText::TextStyle* textStyle;
};

struct LineMetrics {
    std::map<size_t, RunMetrics> runMetrics;
};

class Typography {
public:
    virtual std::vector<LineMetrics> GetLineMetrics();
};

namespace Drawing {
int OHDrawingTypographyUpdate001();
int OHDrawingSetTypographyTextTrailingSpaceOptimized001();
int OHDrawingSetTypographyVerticalAlignment001();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYUPDATETEST_H
