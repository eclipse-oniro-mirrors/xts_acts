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
#ifndef ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

struct OHDrawingTypographyTestContext {
    OH_Drawing_TypographyStyle* typoStyle_{ nullptr };
    OH_Drawing_TextStyle* txtStyle_{ nullptr };
    OH_Drawing_FontCollection* fontCollection_{ nullptr };
    OH_Drawing_TypographyCreate* handler_{ nullptr };
    OH_Drawing_Typography* typography_{ nullptr };
    OH_Drawing_Bitmap* cBitmap_{ nullptr };
    OH_Drawing_Canvas* canvas_{ nullptr };

    OHDrawingTypographyTestContext() {}

    ~OHDrawingTypographyTestContext()
    {
        if (canvas_ != nullptr) {
            OH_Drawing_CanvasDestroy(canvas_);
            canvas_ = nullptr;
        }
        if (typography_ != nullptr) {
            OH_Drawing_DestroyTypography(typography_);
            typography_ = nullptr;
        }
        if (handler_ != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler_);
            handler_ = nullptr;
        }
        if (txtStyle_ != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle_);
            txtStyle_ = nullptr;
        }
        if (typoStyle_ != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle_);
            typoStyle_ = nullptr;
        }
        if (cBitmap_ != nullptr) {
            OH_Drawing_BitmapDestroy(cBitmap_);
            cBitmap_ = nullptr;
        }
        if (fontCollection_ != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection_);
            fontCollection_ = nullptr;
        }
    }

    void PrepareCreateTextLine(const std::string& text)
    {
        double maxWidth = 500.0;
        uint32_t height = 40;
        typoStyle_ = OH_Drawing_CreateTypographyStyle();
        EXPECT_TRUE(typoStyle_ != nullptr);
        txtStyle_ = OH_Drawing_CreateTextStyle();
        EXPECT_TRUE(txtStyle_ != nullptr);
        fontCollection_ = OH_Drawing_CreateFontCollection();
        EXPECT_TRUE(fontCollection_ != nullptr);
        handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
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
        OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
        OH_Drawing_TypographyHandlerPopTextStyle(handler_);
        typography_ = OH_Drawing_CreateTypography(handler_);
        EXPECT_TRUE(typography_ != nullptr);
        OH_Drawing_TypographyLayout(typography_, maxWidth);
        double position[2] = { 10.0, 15.0 };
        cBitmap_ = OH_Drawing_BitmapCreate();
        EXPECT_TRUE(cBitmap_ != nullptr);
        OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
        uint32_t width = 20;
        OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
        canvas_ = OH_Drawing_CanvasCreate();
        EXPECT_TRUE(canvas_ != nullptr);
        OH_Drawing_CanvasBind(canvas_, cBitmap_);
        OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
        OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
    }
};

// OH_Drawing_TypographyTest functions (001-086, 102-105, WithIndent)
int OHDrawingTypographyTest001();
int OHDrawingTypographyTest002();
int OHDrawingTypographyTest003();
int OHDrawingTypographyTest004();
int OHDrawingTypographyTest005();
int OHDrawingTypographyTest006();
int OHDrawingTypographyTest007();
int OHDrawingTypographyTest008();
int OHDrawingTypographyTest009();
int OHDrawingTypographyTest010();
int OHDrawingTypographyTest012();
int OHDrawingTypographyTest013();
int OHDrawingTypographyTest014();
int OHDrawingTypographyTest015();
int OHDrawingTypographyTest016();
int OHDrawingTypographyTest017();
int OHDrawingTypographyTest018();
int OHDrawingTypographyTest019();
int OHDrawingTypographyTest020();
int OHDrawingTypographyTest021();
int OHDrawingTypographyTest022();
int OHDrawingTypographyTest023();
int OHDrawingTypographyTest024();
int OHDrawingTypographyTest025();
int OHDrawingTypographyTest026();
int OHDrawingTypographyTest027();
int OHDrawingTypographyTest028();
int OHDrawingTypographyTest029();
int OHDrawingTypographyTest030();
int OHDrawingTypographyTest031();
int OHDrawingTypographyTest032();
int OHDrawingTypographyTest033();
int OHDrawingTypographyTest034();
int OHDrawingTypographyTest035();
int OHDrawingTypographyTest036();
int OHDrawingTypographyTest037();
int OHDrawingTypographyTest038();
int OHDrawingTypographyTest039();
int OHDrawingTypographyTest040();
int OHDrawingTypographyTest041();
int OHDrawingTypographyTest042();
int OHDrawingTypographyTest043();
int OHDrawingTypographyTest044();
int OHDrawingTypographyTest045();
int OHDrawingTypographyTest046();
int OHDrawingTypographyTest047();
int OHDrawingTypographyTest048();
int OHDrawingTypographyTest049();
int OHDrawingTypographyTest050();
int OHDrawingTypographyTest051();
int OHDrawingTypographyTest052();
int OHDrawingTypographyTest053();
int OHDrawingTypographyTest054();
int OHDrawingTypographyTest055();
int OHDrawingTypographyTest056();
int OHDrawingTypographyTest057();
int OHDrawingTypographyTest058();
int OHDrawingTypographyTest059();
int OHDrawingTypographyTest060();
int OHDrawingTypographyTest061();
int OHDrawingTypographyTest062();
int OHDrawingTypographyTest063();
int OHDrawingTypographyTest064();
int OHDrawingTypographyTest065();
int OHDrawingTypographyTest066();
int OHDrawingTypographyTest067();
int OHDrawingTypographyTest068();
int OHDrawingTypographyTest069();
int OHDrawingTypographyTest070();
int OHDrawingTypographyTest071();
int OHDrawingTypographyTest072();
int OHDrawingTypographyTest073();
int OHDrawingTypographyTest074();
int OHDrawingTypographyTest075();
int OHDrawingTypographyTest077();
int OHDrawingTypographyTest078();
int OHDrawingTypographyTest080();
int OHDrawingTypographyTest081();
int OHDrawingTypographyTest082();
int OHDrawingTypographyTest083();
int OHDrawingTypographyTest084();
int OHDrawingTypographyTest085();
int OHDrawingTypographyTest086();
int OHDrawingTypographyTest102();
int OHDrawingTypographyTest103();
int OHDrawingTypographyTest104();
int OHDrawingTypographyTest105();
int OHDrawingTypographyTestWithIndent();
// Other functions
int OHDrawingAddTextStyleDecoration001();
int OHDrawingTextLineEnumerateCaretOffsets001();
int TestOHDrawingUnregisterFont001();
int TestOHDrawingUnregisterFont002();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_OHDRAWINGTYPOGRAPHYTEST_H
