/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

#include "gtest/gtest.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_font.h"
#include "drawing_font_collection.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_text_declaration.h"
#include "drawing_text_typography.h"
#include "drawing_text_line.h"
#include "drawing_text_lineTypography.h"
#include "rosen_text/typography.h"
#include "rosen_text/typography_create.h"
#include "drawing_text_global.h"
#include "drawing_text_blob.h"
#include "global_config/text_global_config.h"
#include "text/text_blob.h"
#include "text_style.h"
#include "typography.h"
#include "drawing_register_font.h"

#include <string>
#include <fstream>

using namespace OHOS::Rosen;
using namespace testing;
using namespace testing::ext;

namespace OHOS {
class OH_Drawing_TypographyTest : public testing::Test {
public:
    void SetUp() override
    {
        typoStyle_ = nullptr;
        txtStyle_ = nullptr;
        fontCollection_ = nullptr;
        handler_ = nullptr;
        typography_ = nullptr;
        cBitmap_ = nullptr;
        canvas_ = nullptr;
    }

    void TearDown() override
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

    void PrepareCreateTextLine(const std::string& text);

protected:
    OH_Drawing_TypographyStyle* typoStyle_ = nullptr;
    OH_Drawing_TextStyle* txtStyle_ = nullptr;
    OH_Drawing_FontCollection* fontCollection_ = nullptr;
    OH_Drawing_TypographyCreate* handler_ = nullptr;
    OH_Drawing_Typography* typography_ = nullptr;
    OH_Drawing_Bitmap* cBitmap_ = nullptr;
    OH_Drawing_Canvas* canvas_ = nullptr;
};

const char* EXISTFONTPATH = "/system/fonts/HarmonyOS_Sans.ttf";
const char* OHOS_THEME_FONT = "OhosThemeFont";

static TextStyle* ConvertToOriginalText(OH_Drawing_TextStyle* style)
{
    return reinterpret_cast<TextStyle*>(style);
}

static uint32_t GetTextHighContrast()
{
    auto &instance = Rosen::Drawing::ProcessTextConstrast::Instance();
    return static_cast<uint32_t>(instance.GetTextContrast());
}

void OH_Drawing_TypographyTest::PrepareCreateTextLine(const std::string& text)
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
    const char* fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    EXPECT_TRUE(typography_ != nullptr);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {10.0, 15.0};
    cBitmap_ = OH_Drawing_BitmapCreate();
    EXPECT_TRUE(cBitmap_ != nullptr);
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    EXPECT_TRUE(canvas_ != nullptr);
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

/**
 * @tc.name   OH_Drawing_TypographyTest011
 * @tc.number OH_Drawing_TypographyTest011
 * @tc.desc   test for text decoration color
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest011, Function | MediumTest | Level1)
{
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFF000000);
    OH_Drawing_SetTextStyleDecorationColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    EXPECT_EQ(ConvertToOriginalText(txtStyle)->decorationColor, 0xFFFF0000);
}

/**
 * @tc.name   OH_Drawing_TypographyTest052
 * @tc.number OH_Drawing_TypographyTest052
 * @tc.desc   test for setting the mode of leading over and under text
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest052, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_ALL);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle), TEXT_HEIGHT_ALL);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle), TEXT_HEIGHT_DISABLE_FIRST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle), TEXT_HEIGHT_DISABLE_LAST_ASCENT);
    OH_Drawing_TypographyTextSetHeightBehavior(typoStyle, TEXT_HEIGHT_DISABLE_ALL);
    EXPECT_EQ(OH_Drawing_TypographyTextGetHeightBehavior(typoStyle), TEXT_HEIGHT_DISABLE_ALL);
}

/**
 * @tc.name   OH_Drawing_TypographyTest076
 * @tc.number OH_Drawing_TypographyTest076
 * @tc.desc   test for sets and gets isPlaceholder for TextStyle objects
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest076, Function | MediumTest | Level1)
{
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(nullptr), false);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), false);
    OH_Drawing_TextStyleSetPlaceholder(nullptr);
    OH_Drawing_TextStyleSetPlaceholder(txtStyle);
    EXPECT_EQ(OH_Drawing_TextStyleIsPlaceholder(txtStyle), true);
    OH_Drawing_DestroyTextStyle(txtStyle);
}

/**
 * @tc.name   OH_Drawing_TypographyTest079
 * @tc.number OH_Drawing_TypographyTest079
 * @tc.desc   test for setting the hinting of text typography
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OH_Drawing_TypographyTest079, Function | MediumTest | Level1)
{
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyStyleSetHintsEnabled(typoStyle, true);
    EXPECT_EQ(OH_Drawing_TypographyStyleIsHintEnabled(typoStyle), true);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OHDrawingSetTypographyTextTab001
 * @tc.number OHDrawingSetTypographyTextTab001
 * @tc.desc   test for Set Typography Text Tab
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTypographyTextTab001, Function | MediumTest | Level1)
{
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, -1.0);
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextTab(typoStyle, textTab);
    OH_Drawing_SetTypographyTextTab(nullptr, textTab);
    OH_Drawing_SetTypographyTextTab(typoStyle, nullptr);
    OH_Drawing_DestroyTextTab(textTab);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
}

/**
 * @tc.name   OHDrawingSetTextHighContrast001
 * @tc.number OHDrawingSetTextHighContrast001
 * @tc.desc   test for text high contrast mode
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast001, Function | MediumTest | Level1)
{
    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_DISABLE_HIGH_CONTRAST);

    OH_Drawing_SetTextHighContrast(OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
    EXPECT_EQ(GetTextHighContrast(), OH_Drawing_TextHighContrast::TEXT_APP_ENABLE_HIGH_CONTRAST);
}

/**
 * @tc.name   OHDrawingSetTextHighContrast002
 * @tc.number OHDrawingSetTextHighContrast002
 * @tc.desc   test for text high contrast mode(Invalid)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(OH_Drawing_TypographyTest, OHDrawingSetTextHighContrast002, Function | MediumTest | Level1)
{
    uint32_t preValue = GetTextHighContrast();
    OH_Drawing_SetTextHighContrast(static_cast<OH_Drawing_TextHighContrast>(Rosen::SrvText::TEXT_HIGH_CONTRAST_BUTT));
    EXPECT_EQ(GetTextHighContrast(), preValue);
}
}