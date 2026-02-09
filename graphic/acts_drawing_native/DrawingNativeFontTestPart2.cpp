/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "gtest/gtest.h"
#include <random>

#define NUMBER_10 10
#define NUMBER_100 100
#define NUMBER_400_1 400.1
#define NUMBER_900 900
#define NUMBER_1000000 1000000


using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeFontPart2Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeFontPart2Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFontPart2Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeFontPart2Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeFontPart2Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testFontArgumentsCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2000
 * @tc.desc   Test for testFontArgumentsCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsCreateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    OH_Drawing_FontArgumentsDestroy(fontArguments);
}

/**
 * @tc.name   testFontArgumentsAddVariationNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2100
 * @tc.desc   test for testFontArgumentsAddVariationNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsAddVariationNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -1);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_400_1);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_900);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_1000000);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
}

/**
 * @tc.name   testFontArgumentsAddVariationNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2101
 * @tc.desc   test for testFontArgumentsAddVariationNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsAddVariationNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the first parameter is nullptr
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(nullptr, "wght", NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is nullptr
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, nullptr, NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   testFontArgumentsAddVariationAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2102
 * @tc.desc   test for testFontArgumentsAddVariationAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsAddVariationAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "WGHT", NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "w", NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   testFontArgumentsAddVariationMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2103
 * @tc.desc   test for testFontArgumentsAddVariationMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsAddVariationMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_900);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0.0f);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -1);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
}

/**
 * @tc.name   testFontArgumentsDestoryNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2200
 * @tc.desc   test for testFontArgumentsDestoryNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsDestoryNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(fontArguments);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
}

/**
 * @tc.name   testFontArgumentsDestoryNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2201
 * @tc.desc   test for testFontArgumentsDestoryNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsDestoryNull, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy, parameter is null
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontArgumentsDestroy(fontArguments);
}

/**
 * @tc.name   testFontArgumentsDestoryMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2202
 * @tc.desc   test for testFontArgumentsDestoryMultiplieCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsDestoryMultiplieCalls, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_FontArguments *fontArguments = nullptr;
    for (int i = 0; i < NUMBER_10; i++)
    {
        fontArguments = OH_Drawing_FontArgumentsCreate();
    }
    // 2. OH_Drawing_FontCreate, OH_Drawing_FontArgumentsAddVariation
    OH_Drawing_ErrorCode drawingErrorCode1 = OH_DRAWING_ERROR_INVALID_PARAMETER;
    for (size_t i = 0; i < NUMBER_10; i++)
    {
        OH_Drawing_FontArguments *fontArguments1 = OH_Drawing_FontArgumentsCreate();
        drawingErrorCode1 = OH_Drawing_FontArgumentsDestroy(fontArguments1);
        EXPECT_EQ(drawingErrorCode1, OH_DRAWING_SUCCESS);
    }
}
/**
 * @tc.name   testFontSetThemeFontFollowedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2300
 * @tc.desc   test for testFontSetThemeFontFollowedNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontSetThemeFontFollowedNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, false);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}
/**
 * @tc.name   testFontSetThemeFontFollowedMuitipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2301
 * @tc.desc   test for testFontSetThemeFontFollowedMuitipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontSetThemeFontFollowedMuitipleCalls, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
        drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    }
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}
/**
 * @tc.name   testFontSetThemeFontFollowedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2302
 * @tc.desc   test for testFontSetThemeFontFollowedNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontSetThemeFontFollowedNull, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(nullptr, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}
/**
 * @tc.name   testFontIsThemeFontFollowedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2400
 * @tc.desc   test for testFontIsThemeFontFollowedNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontIsThemeFontFollowedNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, false);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, true);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, false);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(followed, false);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontIsThemeFontFollowedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2401
 * @tc.desc   test for testFontIsThemeFontFollowedNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontIsThemeFontFollowedNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    OH_Drawing_ErrorCode drawingErrorCode1 = OH_DRAWING_SUCCESS;
    OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_SUCCESS;
    drawingErrorCode1 = OH_Drawing_FontIsThemeFontFollowed(nullptr, &followed);
    EXPECT_EQ(drawingErrorCode1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, nullptr);
    EXPECT_EQ(drawingErrorCode2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontIsThemeFontFollowedMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2402
 * @tc.desc   test for testFontIsThemeFontFollowedMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontIsThemeFontFollowedMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    bool isFollowed[] = {true, false, false, true, true, true, false, false, true, false};
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
        OH_Drawing_ErrorCode drawingErrorCode2 = OH_DRAWING_ERROR_INVALID_PARAMETER;
        drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, isFollowed[i]);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
        drawingErrorCode2 = OH_Drawing_FontIsThemeFontFollowed(font, &followed);
        EXPECT_EQ(drawingErrorCode2, OH_DRAWING_SUCCESS);
        EXPECT_EQ(followed, isFollowed[i]);
    }
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetMetricsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2500
 * @tc.desc   test for testFontGetMetricsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetMetricsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, 100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. Get font measurement information
    float lineSpace = OH_Drawing_FontGetMetrics(font, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_FLOAT_EQ(lineSpace, 117.2);
    EXPECT_EQ(metrics->flags, 31);
    EXPECT_FLOAT_EQ(metrics->top, -105.6);
    EXPECT_FLOAT_EQ(metrics->ascent, -92.7999954);
    EXPECT_FLOAT_EQ(metrics->descent, 24.4);
    EXPECT_FLOAT_EQ(metrics->bottom, 27.1);
    EXPECT_FLOAT_EQ(metrics->leading, 0.000000);
    EXPECT_FLOAT_EQ(metrics->avgCharWidth, 50.000000);
    EXPECT_FLOAT_EQ(metrics->maxCharWidth, 248.6);
    EXPECT_FLOAT_EQ(metrics->xMin, -54.8);
    EXPECT_FLOAT_EQ(metrics->xMax, 193.8);
    EXPECT_FLOAT_EQ(metrics->xHeight, 50.000000);
    EXPECT_FLOAT_EQ(metrics->capHeight, 70.000000);
    EXPECT_FLOAT_EQ(metrics->underlineThickness, 5.000000);
    EXPECT_FLOAT_EQ(metrics->underlinePosition, 20.7);
    EXPECT_FLOAT_EQ(metrics->strikeoutThickness, 5.000000);
    EXPECT_FLOAT_EQ(metrics->strikeoutPosition, -30.0000019);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testFontGetMetricsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2501
 * @tc.desc   test for testFontGetMetricsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetMetricsNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, 100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics passes a null pointer to the first argument
    float lineSpace = OH_Drawing_FontGetMetrics(nullptr, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -1);
    // 5. The function OH_Drawing_FontGetMetrics passes a null pointer to the second argument
    lineSpace = OH_Drawing_FontGetMetrics(font, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -1);
    // 6. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testFontGetMetricsMultiplies
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2502
 * @tc.desc   test for testFontGetMetricsMultiplies
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetMetricsMultiplies, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, 100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics is called 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_FontGetMetrics(font, metrics);
    }
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2600
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureTextWithBrushOrPenNormal1, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0, 0.0, 200.0, 200.0);
    OH_Drawing_Font *font2 = OH_Drawing_FontCreate();
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font2, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth), OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (OH_Drawing_TextEncoding encode : encodes) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        encode, brush, nullptr, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), 100); // Inspection textwidth
    const char* text1 = "hello world";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text1, strlen(text1),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), 126); // Inspection textwidth
    const char* text2 = "1234567890 !@#$%^&*(";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text2),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), 277); // Inspection textwidth
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2601
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureTextWithBrushOrPenNormal2, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0, 0.0, 200.0, 200.0);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Pass in the styled brush
    OH_Drawing_BrushSetColor(brush, 0xFF00FFFF);
    OH_Drawing_BrushSetAlpha(brush, 100); // Alpha 100
    OH_Drawing_BrushSetAntiAlias(brush, true);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Pass in the styled pen
    OH_Drawing_PenSetWidth(pen, 10.0f);
    OH_Drawing_PenSetColor(pen, 0xFF00FFFF);
    OH_Drawing_PenSetAlpha(pen, 100); // Alpha 100
    OH_Drawing_PenSetAntiAlias(pen, true);
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // Verify the bounds
    const char* text1 = "hello world";
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text1, strlen(text1),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetLeft(bounds)), 3); // left 3
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetRight(bounds)), 251); // right 251
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetBottom(bounds)), 1); // bottom 1
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2602
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureTextWithBrushOrPenNull, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0, 0.0, 200.0, 200.0);
    // font passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(nullptr, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // text passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, nullptr, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // text passes to null
    const char* text2 = "";
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text),
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // text's length mismatch
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, 0,
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, nullptr, bounds, &textWidth), OH_DRAWING_SUCCESS);
    // textWidth passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, bounds, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // bounds passes to nullptr
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, nullptr, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2603
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureTextWithBrushOrPenAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0, 0.0, 200.0, 200.0);
    // byteLength passes to 0
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, 0,
        TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, brush, pen, bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2604
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureTextWithBrushOrPenMultiCalls, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(0.0, 0.0, 200.0, 200.0);
    // OH_Drawing_FontMeasureTextWithBrushOrPen is called 20 times.
    for (int i = 0; i < 20; i++) { //Number of cycles: 20
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
        TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetWidthsBoundsNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2700
 * @tc.desc   test for testFontGetWidthsBoundsNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetWidthsBoundsNormal1, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // Font does not set any attributes
    OH_Drawing_Font *font2 = OH_Drawing_FontCreate();
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font2, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    // Font set some attributes
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetWidthsBoundsNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2701
 * @tc.desc   test for testFontGetWidthsBoundsNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetWidthsBoundsNormal2, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    std::vector<int> widthArr = {50, 50, 50, 50}; // num of four to font
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetWidthsBounds(
        font, glyphs, glyphsCount, brush, nullptr, widths, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count; i++) {
        EXPECT_EQ((int)widths[i], widthArr[i]);
    }
    errorCode = OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, outRectarr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    std::vector<std::array<int, 4>> arr = { { 0, -42, 48, 3 }, { 1, -42, 48, 3 }, { 2, -42, 47, 2 }, { 1, -40, 48, 3 }};
    for (int i = 0; i < count; i++) {
        OH_Drawing_Rect* iter = nullptr;
        EXPECT_EQ(OH_Drawing_RectGetArrayElement(outRectarr, i, &iter), OH_DRAWING_SUCCESS);
        ASSERT_NE(iter, nullptr);
        EXPECT_EQ((int)OH_Drawing_RectGetLeft(iter), arr[i][0]);
        EXPECT_EQ((int)OH_Drawing_RectGetTop(iter), arr[i][1]);
        EXPECT_EQ((int)OH_Drawing_RectGetRight(iter), arr[i][2]);
        EXPECT_EQ((int)OH_Drawing_RectGetBottom(iter), arr[i][3]);
        EXPECT_EQ(OH_Drawing_RectGetBottom(iter) - OH_Drawing_RectGetTop(iter), OH_Drawing_RectGetHeight(iter));
        EXPECT_EQ(OH_Drawing_RectGetRight(iter) - OH_Drawing_RectGetLeft(iter), OH_Drawing_RectGetWidth(iter));
    }
    OH_Drawing_BrushSetColor(brush, 0xFF00FFFF);
    OH_Drawing_BrushSetAlpha(brush, 100); // Alpha 100
    OH_Drawing_BrushSetAntiAlias(brush, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    OH_Drawing_PenSetWidth(pen, 10.0f);
    OH_Drawing_PenSetColor(pen, 0xFF00FFFF);
    OH_Drawing_PenSetAlpha(pen, 100); // Alpha 100
    OH_Drawing_PenSetAntiAlias(pen, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetWidthsBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2702
 * @tc.desc   test for testFontGetWidthsBoundsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetWidthsBoundsNull, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // Font passes to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(nullptr, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Glyphs passes to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, nullptr, glyphsCount, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Both brush and pen pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, nullptr, widths, outRectarr),
        OH_DRAWING_SUCCESS);
    // Widths pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, outRectarr),
        OH_DRAWING_SUCCESS);
    // Bounds pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, widths, nullptr),
        OH_DRAWING_SUCCESS);
    // Widths and Bounds pass to nullptr
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, nullptr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetWidthsBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2703
 * @tc.desc   test for testFontGetWidthsBoundsAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetWidthsBoundsAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // count passes to 0
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, 0, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // count passes to negative number
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, -1, nullptr, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // The input parameter of count is less than the length of the glyphs array
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, sizeof(glyphs)/sizeof(glyphs[0]) - 1, nullptr,
        pen, widths, nullptr), OH_DRAWING_SUCCESS);
    // Both brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, pen, widths, outRectarr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetWidthsBoundsMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2704
 * @tc.desc   test for testFontGetWidthsBoundsMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetWidthsBoundsMultiCalls, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[50] = {0.f}; // 50 means widths array number
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count);
    // OH_Drawing_FontGetWidthsBounds is called 20 times
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 20; i++) { //Number of cycles: 20
        errorCode = OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGePosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2800
 * @tc.desc   test for testFontGePosNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGePosNormal, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    //font Different words
    const char* text = "你好世界";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0, 10.0);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    //font does not set any attributes
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    std::vector<std::array<int, 2>> testPoints = {{10, 10}, {60, 10}, {110, 10}, {160, 10}};
    for (int i = 0; i < count; i++) {
        EXPECT_EQ((int)points[i].x, testPoints[i][0]);
        EXPECT_EQ((int)points[i].y, testPoints[i][1]);
    }
    //length count < glyphs
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs, sizeof(glyphs)/sizeof(glyphs[0])-1,
        point, points);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    //font set some attributes
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGetPosNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2801
 * @tc.desc   test for testFontGetPosNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGetPosNormal1, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "1234";
    uint32_t count1 = 0;
    count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.0, 0.0);
    std::vector<std::array<int, 2>> testPoints1 = {{100, 0}, {129, 0}, {158, 0}, {187, 0}};
    uint16_t glyphs1[count1];
    int glyphsCount1 = 0;
    glyphsCount1 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    OH_Drawing_Point2D* points1 = new OH_Drawing_Point2D[count1];
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count1; i++) {
        EXPECT_EQ((int)points1[i].x, testPoints1[i][0]);
        EXPECT_EQ((int)points1[i].y, testPoints1[i][1]);
    }
    uint32_t count2 = 0;
    count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(0.0, 100.0);
    std::vector<std::array<int, 2>> testPoints2 = {{0, 100}, {29, 100}, {58, 100}, {87, 100}};
    uint16_t glyphs2[count2];
    int glyphsCount2 = 0;
    glyphsCount2 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count2; i++) {
        EXPECT_EQ((int)points2[i].x, testPoints2[i][0]);
        EXPECT_EQ((int)points2[i].y, testPoints2[i][1]);
    }
    OH_Drawing_PointDestroy(point1);
    OH_Drawing_PointDestroy(point2);
    if (points1 != nullptr || points2 != nullptr) {
        delete[] points1;
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGePosNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2802
 * @tc.desc   test for testFontGePosNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGePosNormal2, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "1234";
    uint32_t count1 = 0;
    count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.25, 200.585);
    std::vector<std::array<float, 2>> testPoints1 = {{100.25, 200.585007}, {129.25, 200.585007},
        {158.25, 200.585007}, {187.25, 200.585007}};
    uint16_t glyphs1[count1];
    int glyphsCount1 = 0;
    glyphsCount1 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    OH_Drawing_Point2D* points1 = new OH_Drawing_Point2D[count1];
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count1; i++) {
        EXPECT_EQ(points1[i].x, testPoints1[i][0]);
        EXPECT_EQ(points1[i].y, testPoints1[i][1]);
    }
    uint32_t count2 = 0;
    count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(-100.0, -100.0);
    std::vector<std::array<int, 2>> testPoints2 = {{-100, -100}, {-71, -100}, {-42, -100}, {-13, -100}};
    uint16_t glyphs2[count2];
    int glyphsCount2 = 0;
    glyphsCount2 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count2; i++) {
        EXPECT_EQ((int)points2[i].x, testPoints2[i][0]);
        EXPECT_EQ((int)points2[i].y, testPoints2[i][1]);
    }
    OH_Drawing_PointDestroy(point1);
    OH_Drawing_PointDestroy(point2);
    if (points1 != nullptr || points2 != nullptr) {
        delete[] points1;
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
}
/**
 * @tc.name   testFontGePosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2803
 * @tc.desc   test for testFontGePosNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGePosNull, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0, 10.0);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    EXPECT_EQ(OH_Drawing_FontGetPos(nullptr, glyphs, glyphsCount, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, nullptr, glyphsCount, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, nullptr, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(0.0, 0.0);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point1, points), OH_DRAWING_SUCCESS);
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGePosMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2804
 * @tc.desc   test for testFontGePosMultiplieCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGePosMultiplieCalls, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0, 10.0);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    for (int i = 0; i < 20; i++) { //Number of cycles: 20
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points), OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
}

/**
 * @tc.name   testFontGePosAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2805
 * @tc.desc   test for testFontGePosAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGePosAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    const char* text = "你好";
    uint32_t count = 0;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0, 10.0);
    uint16_t glyphs[count];
    int glyphsCount = 0;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, 0, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, -1, point, points), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
}
/**
 * @tc.name   testFontGeSpacingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2900
 * @tc.desc   test for testFontGeSpacingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGeSpacingNormal, Function | SmallTest | Level0) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    float spacing = 0.0f;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetTextSize(font, 30.0f);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, 0.5f);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    EXPECT_EQ(std::fabs(spacing - 35.16) < 1e-6, true);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGeSpacingMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2901
 * @tc.desc   test for testFontGeSpacingMultiplieCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGeSpacingMultiplieCalls, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 30.0f);
    float spacing = 0.0f;
    for (int i = 0; i < 20; i++) { //Number of cycles: 20
        EXPECT_EQ(OH_Drawing_FontGetSpacing(font, &spacing), OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(std::fabs(spacing - 35.16) < 1e-6, true);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontGeSpacingNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2902
 * @tc.desc   test for testFontGeSpacingNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontGeSpacingNull, Function | SmallTest | Level3) {
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 30.0f);
    float spacing = 0.0f;
    EXPECT_EQ(OH_Drawing_FontGetSpacing(nullptr, &spacing), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetSpacing(font, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
}

/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3000
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureSingleChaWithFeaturesNormal, Function | SmallTest | Level0) {
    const char *str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0.0f;
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 37.0f);
    str = "你";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    str = "（";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    str = "｛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    str = "《";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    str = "8";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 29.0f);
    str = "乂";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    str = "飛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, 50.0f);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3001
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureSingleChaWithFeaturesAbNormal, Function | SmallTest | Level3) {
    const char *str = "（";
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, 0xFF0000FF);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0.0f;
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(nullptr, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, nullptr, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, nullptr, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, "", features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3002
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontMeasureSingleChaWithFeaturesCalls, Function | SmallTest | Level2) {
    const char *str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface *fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, 50.0f);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = 0.0f;
    int count = 10;
    for (int i = 0; i < count; i++) {
    OH_Drawing_ErrorCode code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(textWidth, 37.0f);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);
}
/**
 * @tc.name   testFontFeaturesAddFeatureNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3100
 * @tc.desc   test for testFontFeaturesAddFeatureNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontFeaturesAddFeatureNormal, Function | SmallTest | Level2) {
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    int count = 10;
    for (int i = 0; i < count; i++) {
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaa", 1.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaaa", 1.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);
}
/**
 * @tc.name   testFontFeaturesAddFeatureAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3101
 * @tc.desc   test for testFontFeaturesAddFeatureAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontFeaturesAddFeatureAbNormal, Function | SmallTest | Level3) {
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(nullptr, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, nullptr, 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, "", 0.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);
}
/**
 * @tc.name   testFontFeaturesandFeatureDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_3200
 * @tc.desc   test for testFontFeaturesandFeatureDestroyNULL
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontFeaturesandFeatureDestroyNULL, Function | SmallTest | Level3) {
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesDestroy(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    int count = 10;
    for (int i = 0; i < count; i++) {
        OH_Drawing_FontFeatures* features1 = OH_Drawing_FontFeaturesCreate();
        OH_Drawing_ErrorCode code1 = OH_Drawing_FontFeaturesDestroy(features1);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontFeaturesDestroy(features);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS