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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2000
 * @tc.name: testFontArgumentsCreateNormal
 * @tc.desc: Test for testFontArgumentsCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontArgumentsCreateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    OH_Drawing_FontArgumentsDestroy(fontArguments);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2100
 * @tc.name: testFontArgumentsAddVariationNormal
 * @tc.desc: test for testFontArgumentsAddVariationNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2101
 * @tc.name: testFontArgumentsAddVariationNull
 * @tc.desc: test for testFontArgumentsAddVariationNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2102
 * @tc.name: testFontArgumentsAddVariationAbnormal
 * @tc.desc: test for testFontArgumentsAddVariationAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2103
 * @tc.name: testFontArgumentsAddVariationMultipleCalls
 * @tc.desc: test for testFontArgumentsAddVariationMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2200
 * @tc.name: testFontArgumentsDestoryNormal
 * @tc.desc: test for testFontArgumentsDestoryNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2201
 * @tc.name: testFontArgumentsDestoryNull
 * @tc.desc: test for testFontArgumentsDestoryNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2202
 * @tc.name: testFontArgumentsDestoryMultiplieCalls
 * @tc.desc: test for testFontArgumentsDestoryMultiplieCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2300
 * @tc.name: testFontSetThemeFontFollowedNormal
 * @tc.desc: test for testFontSetThemeFontFollowedNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2301
 * @tc.name: testFontSetThemeFontFollowedMuitipleCalls
 * @tc.desc: test for testFontSetThemeFontFollowedMuitipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2302
 * @tc.name: testFontSetThemeFontFollowedNull
 * @tc.desc: test for testFontSetThemeFontFollowedNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2100
 * @tc.name: testFontIsThemeFontFollowedNormal
 * @tc.desc: test for testFontIsThemeFontFollowedNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2101
 * @tc.name: testFontIsThemeFontFollowedMultipleCalls
 * @tc.desc: test for testFontIsThemeFontFollowedMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontIsThemeFontFollowedMultipleCalls, Function | SmallTest | Level0) {
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
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2400
 * @tc.name: testFontIsThemeFontFollowedNull
 * @tc.desc: test for testFontIsThemeFontFollowedNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeFontPart2Test, testFontIsThemeFontFollowedNull, Function | SmallTest | Level0) {
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2500
 * @tc.name: testFontGetMetricsNormal
 * @tc.desc: test for testFontGetMetricsNormal
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2501
 * @tc.name: testFontGetMetricsNull
 * @tc.desc: test for testFontGetMetricsNull
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_FONT_2502
 * @tc.name: testFontGetMetricsMultiplies
 * @tc.desc: test for testFontGetMetricsMultiplies
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS