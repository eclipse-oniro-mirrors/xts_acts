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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

struct NativeTypographyAutoSpaceTestContext {
    const double defaultFontSize = 40;

    OH_Drawing_FontCollection* fontCollection_{ nullptr };
    OH_Drawing_TextStyle* txtStyle_{ nullptr };
    OH_Drawing_TypographyCreate* handler_{ nullptr };
    OH_Drawing_Typography* typography_{ nullptr };
    OH_Drawing_TypographyStyle* typoStyle_{ nullptr };
    OH_Drawing_TypographyCreate* handler2_{ nullptr };
    OH_Drawing_Typography* typography2_{ nullptr };
    OH_Drawing_TypographyStyle* typoStyle2_{ nullptr };

    NativeTypographyAutoSpaceTestContext()
        : fontCollection_(nullptr),
          typoStyle_(nullptr),
          handler_(nullptr),
          typography_(nullptr),
          txtStyle_(nullptr),
          handler2_(nullptr),
          typography2_(nullptr),
          typoStyle2_(nullptr)
    {
    }

    ~NativeTypographyAutoSpaceTestContext()
    {
        if (fontCollection_ != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection_);
            fontCollection_ = nullptr;
        }
        if (txtStyle_ != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle_);
            txtStyle_ = nullptr;
        }
        if (handler_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler_);
            handler_ = nullptr;
        }
        if (typography_ != nullptr) {
            OH_Drawing_DestroyTypography(typography_);
            typography_ = nullptr;
        }
        if (typoStyle_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle_);
            typoStyle_ = nullptr;
        }
        if (handler2_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler2_);
            handler2_ = nullptr;
        }
        if (typography2_ != nullptr) {
            OH_Drawing_DestroyTypography(typography2_);
            typography2_ = nullptr;
        }
        if (typoStyle2_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle2_);
            typoStyle2_ = nullptr;
        }
    }

    void PrepareWorkForTypographyStyleTest()
    {
        txtStyle_ = OH_Drawing_CreateTextStyle();
        ASSERT_NE(txtStyle_, nullptr);
        fontCollection_ = OH_Drawing_CreateSharedFontCollection();
        ASSERT_NE(fontCollection_, nullptr);
        OH_Drawing_SetTextStyleFontSize(txtStyle_, defaultFontSize);
    }
};

namespace OHOS {
namespace Rosen {
namespace Drawing {
int OHDrawingSetTypographyTextAutoSpaceTest001();
int OHDrawingSetTypographyTextAutoSpaceTest002();
int OHDrawingSetTypographyTextAutoSpaceTest003();
int OHDrawingSetTypographyTextAutoSpaceTest004();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVETYPOGRAPHYTESTAUTOSPACETEST_H
