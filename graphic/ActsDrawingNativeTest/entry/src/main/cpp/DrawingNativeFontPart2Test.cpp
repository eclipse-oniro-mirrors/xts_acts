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

#include <cmath>
#include <random>
#include <vector>
#include "include/DrawingNativeFontTest.h"
#include "include/OhosCommonTest.h"

// 数字宏定义
#define NUMBER_ZERO 0
#define NUMBER_ONE 1
#define NUMBER_TWO 2
#define NUMBER_THREE 3
#define NUMBER_FOUR 4
#define NUMBER_TEN 10
#define NUMBER_TWELVE 12
#define NUMBER_THIRTEEN 13
#define NUMBER_TWENTY 20
#define NUMBER_TWENTY_FOUR 24
#define NUMBER_TWENTY_NINE 29
#define NUMBER_THIRTY 30
#define NUMBER_THIRTY_SEVEN 37
#define NUMBER_FORTY 40
#define NUMBER_FORTY_TWO 42
#define NUMBER_FORTY_SEVEN 47
#define NUMBER_FORTY_EIGHT 48
#define NUMBER_FIFTY 50
#define NUMBER_FIFTY_EIGHT 58
#define NUMBER_SIXTY 60
#define NUMBER_SEVENTY 70
#define NUMBER_SEVENTY_ONE 71
#define NUMBER_EIGHTY_SEVEN 87
#define NUMBER_NINETY 90
#define NUMBER_ONE_HUNDRED 100
#define NUMBER_ONE_HUNDRED_TEN 110
#define NUMBER_ONE_HUNDRED_TWENTY_SIX 126
#define NUMBER_ONE_HUNDRED_TWENTY_NINE 129
#define NUMBER_ONE_HUNDRED_FIFTY_EIGHT 158
#define NUMBER_ONE_HUNDRED_SIXTY 160
#define NUMBER_ONE_HUNDRED_EIGHTY_SEVEN 187
#define NUMBER_TWO_HUNDRED 200
#define NUMBER_TWO_HUNDRED_ONE 201
#define NUMBER_TWO_HUNDRED_TWO 202
#define NUMBER_TWO_HUNDRED_FIFTY_ONE 251
#define NUMBER_TWO_HUNDRED_SEVENTY_SEVEN 277
#define NUMBER_TWO_HUNDRED_EIGHTY_FOUR 284
#define NUMBER_THREE_HUNDRED 300
#define NUMBER_FOUR_HUNDRED_ONE 400.1f
#define NUMBER_FOUR_HUNDRED_FOUR 404
#define NUMBER_NINE_HUNDRED 900
#define NUMBER_ONE_THOUSAND 1000
#define NUMBER_ONE_MILLION 1000000
#define FONT_BOUNDS_2_1 (2)
// 字体大小相关宏
#define FONT_SIZE_ZERO 0.0f
#define FONT_SIZE_SCALEX 0.5f
#define FONT_SIZE_TWELVE 12.0f
#define FONT_SIZE_TWENTY_FOUR 24.0f
#define FONT_SIZE_THIRTY 30.0f
#define FONT_SIZE_THIRTY_SIX 36.0f
#define FONT_SIZE_FIFTY 50.0f
#define FONT_SIZE_SPECIAL 50.255f

// 字体度量相关宏
#define FONT_LINE_SPACE 117.2f
#define FONT_METRICS_FLAGS_DEFAULT 31

// 字体垂直度量
#define FONT_METRIC_TOP (-105.6f)
#define FONT_METRIC_ASCENT (-92.7999954f)
#define FONT_METRIC_DESCENT 24.4f
#define FONT_METRIC_BOTTOM 27.1f

// 字体其他度量
#define FONT_METRIC_LEADING 0.0f
#define FONT_METRIC_AVG_CHAR_WIDTH 50.0f
#define FONT_METRIC_MAX_CHAR_WIDTH 248.6f
#define FONT_METRIC_X_MIN (-54.8f)
#define FONT_METRIC_X_MAX 193.8f
#define FONT_METRIC_X_HEIGHT 50.0f
#define FONT_METRIC_CAP_HEIGHT 70.0f
#define FONT_METRIC_UNDERLINE_THICKNESS 5.0f
#define FONT_METRIC_UNDERLINE_POSITION 20.7f
#define FONT_METRIC_STRIKEOUT_THICKNESS 5.0f
#define FONT_METRIC_STRIKEOUT_POSITION (-30.0000019f)

// 坐标和尺寸相关宏
#define COORD_X_ZERO 0.0f
#define COORD_Y_ZERO 0.0f
#define COORD_X_TEN 10.0f
#define COORD_Y_TEN 10.0f
#define COORD_X_HUNDRED 100.0f
#define COORD_Y_HUNDRED 100.0f
#define COORD_X_NEG_HUNDRED (-100.0f)
#define COORD_Y_NEG_HUNDRED (-100.0f)
#define COORD_X_100_25 100.25f
#define COORD_Y_200_585 200.585f

// 矩形相关宏
#define RECT_LEFT_ZERO 0.0f
#define RECT_TOP_ZERO 0.0f
#define RECT_RIGHT_TWO_HUNDRED 200.0f
#define RECT_BOTTOM_TWO_HUNDRED 200.0f
#define RECT_WIDTH_TWO_HUNDRED 200.0f
#define RECT_HEIGHT_TWO_HUNDRED 200.0f

// 画笔和画刷相关宏
#define PEN_WIDTH_TEN 10.0f
#define BRUSH_ALPHA_HUNDRED 100
#define PEN_ALPHA_HUNDRED 100

// 颜色相关宏
#define COLOR_CYAN_TRANSPARENT 0xFF00FFFF
#define COLOR_BLUE_ALPHA 0xFF0000FF

// 浮点比较精度
#define FLOAT_COMPARE_EPSILON (1e-6f)

// 数组大小宏
#define ARRAY_SIZE_FIFTY 50
#define WIDTHS_ARRAY_SIZE 50
#define TEST_CYCLE_COUNT_TEN 10
#define TEST_CYCLE_COUNT_TWENTY 20

// 文本宽度期望值
#define EXPECTED_WIDTH_HUNDRED 100
#define EXPECTED_WIDTH_TWENTY_NINE 29
#define EXPECTED_WIDTH_THIRTY_SEVEN 37
#define EXPECTED_WIDTH_FIFTY 50
#define EXPECTED_WIDTH_126 126
#define EXPECTED_WIDTH_277 277

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeFontPart2TestSetUp()
{
    std::cout << "DrawingNativeFontPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeFontPart2TestTearDown()
{
    std::cout << "DrawingNativeFontPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testFontArgumentsCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3700
 * @tc.desc   Test for testFontArgumentsCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontArgumentsCreateNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsAddVariationNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3800
 * @tc.desc   test for testFontArgumentsAddVariationNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontArgumentsAddVariationNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ZERO);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -NUMBER_ONE);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ONE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_FOUR_HUNDRED_ONE);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_NINE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ONE_MILLION);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsAddVariationNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3900
 * @tc.desc   test for testFontArgumentsAddVariationNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontArgumentsAddVariationNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the first parameter is nullptr
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(nullptr, "wght", NUMBER_ONE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is nullptr
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, nullptr, NUMBER_ONE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsAddVariationAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4000
 * @tc.desc   test for testFontArgumentsAddVariationAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontArgumentsAddVariationAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "WGHT", NUMBER_ONE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_FontArgumentsAddVariation, the second parameter is error
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "w", NUMBER_ONE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsAddVariationMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4100
 * @tc.desc   test for testFontArgumentsAddVariationMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontArgumentsAddVariationMultipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ONE_HUNDRED);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_NINE_HUNDRED);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ONE_HUNDRED);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", FONT_SIZE_ZERO);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_ONE_HUNDRED);
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", -NUMBER_ONE);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsDestoryNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4200
 * @tc.desc   test for testFontArgumentsDestoryNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontArgumentsDestoryNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(fontArguments);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsDestoryNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4300
 * @tc.desc   test for testFontArgumentsDestoryNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontArgumentsDestoryNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsDestroy, parameter is null
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontArgumentsDestroy(nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontArgumentsDestoryMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4400
 * @tc.desc   test for testFontArgumentsDestoryMultiplieCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontArgumentsDestoryMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_FontArguments* fontArguments = nullptr;
    for (int i = NUMBER_ZERO; i < NUMBER_TEN; i++) {
        fontArguments = OH_Drawing_FontArgumentsCreate();
    }
    // 2. OH_Drawing_FontCreate, OH_Drawing_FontArgumentsAddVariation
    OH_Drawing_ErrorCode drawingErrorCode1 = OH_DRAWING_ERROR_INVALID_PARAMETER;
    for (size_t i = NUMBER_ZERO; i < NUMBER_TEN; i++) {
        OH_Drawing_FontArguments* fontArguments1 = OH_Drawing_FontArgumentsCreate();
        drawingErrorCode1 = OH_Drawing_FontArgumentsDestroy(fontArguments1);
        EXPECT_EQ(drawingErrorCode1, OH_DRAWING_SUCCESS);
    }

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetThemeFontFollowedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4500
 * @tc.desc   test for testFontSetThemeFontFollowedNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetThemeFontFollowedNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, false);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetThemeFontFollowedMuitipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4600
 * @tc.desc   test for testFontSetThemeFontFollowedMuitipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetThemeFontFollowedMuitipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    for (int i = NUMBER_ZERO; i < NUMBER_TEN; i++) {
        OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
        drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(font, true);
        EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    }
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetThemeFontFollowedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4700
 * @tc.desc   test for testFontSetThemeFontFollowedNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetThemeFontFollowedNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontSetThemeFontFollowed(nullptr, true);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsThemeFontFollowedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4800
 * @tc.desc   test for testFontIsThemeFontFollowedNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontIsThemeFontFollowedNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
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

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsThemeFontFollowedMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4900
 * @tc.desc   test for testFontIsThemeFontFollowedMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontIsThemeFontFollowedMultipleCalls()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    bool followed = true;
    bool isFollowed[] = { true, false, false, true, true, true, false, false, true, false };
    for (int i = NUMBER_ZERO; i < NUMBER_TEN; i++) {
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

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsThemeFontFollowedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5000
 * @tc.desc   test for testFontIsThemeFontFollowedNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontIsThemeFontFollowedNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
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

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetMetricsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5100
 * @tc.desc   test for testFontGetMetricsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGetMetricsNormal()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, NUMBER_ONE_HUNDRED);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics* metrics = (OH_Drawing_Font_Metrics*)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. Get font measurement information
    float lineSpace = OH_Drawing_FontGetMetrics(font, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    EXPECT_FLOAT_EQ(lineSpace, FONT_LINE_SPACE);
    EXPECT_EQ(metrics->flags, FONT_METRICS_FLAGS_DEFAULT);
    EXPECT_FLOAT_EQ(metrics->top, FONT_METRIC_TOP);
    EXPECT_FLOAT_EQ(metrics->ascent, FONT_METRIC_ASCENT);
    EXPECT_FLOAT_EQ(metrics->descent, FONT_METRIC_DESCENT);
    EXPECT_FLOAT_EQ(metrics->bottom, FONT_METRIC_BOTTOM);
    EXPECT_FLOAT_EQ(metrics->leading, FONT_METRIC_LEADING);
    EXPECT_FLOAT_EQ(metrics->avgCharWidth, FONT_METRIC_AVG_CHAR_WIDTH);
    EXPECT_FLOAT_EQ(metrics->maxCharWidth, FONT_METRIC_MAX_CHAR_WIDTH);
    EXPECT_FLOAT_EQ(metrics->xMin, FONT_METRIC_X_MIN);
    EXPECT_FLOAT_EQ(metrics->xMax, FONT_METRIC_X_MAX);
    EXPECT_FLOAT_EQ(metrics->xHeight, FONT_METRIC_X_HEIGHT);
    EXPECT_FLOAT_EQ(metrics->capHeight, FONT_METRIC_CAP_HEIGHT);
    EXPECT_FLOAT_EQ(metrics->underlineThickness, FONT_METRIC_UNDERLINE_THICKNESS);
    EXPECT_FLOAT_EQ(metrics->underlinePosition, FONT_METRIC_UNDERLINE_POSITION);
    EXPECT_FLOAT_EQ(metrics->strikeoutThickness, FONT_METRIC_STRIKEOUT_THICKNESS);
    EXPECT_FLOAT_EQ(metrics->strikeoutPosition, FONT_METRIC_STRIKEOUT_POSITION);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    free(metrics);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetMetricsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5200
 * @tc.desc   test for testFontGetMetricsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetMetricsNull()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, NUMBER_ONE_HUNDRED);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics* metrics = (OH_Drawing_Font_Metrics*)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics passes a null pointer to the first argument
    float lineSpace = OH_Drawing_FontGetMetrics(nullptr, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -NUMBER_ONE);
    // 5. The function OH_Drawing_FontGetMetrics passes a null pointer to the second argument
    lineSpace = OH_Drawing_FontGetMetrics(font, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -NUMBER_ONE);
    // 6. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    free(metrics);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetMetricsMultiplies
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5300
 * @tc.desc   test for testFontGetMetricsMultiplies
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetMetricsMultiplies()
{
    DrawingNativeFontPart2TestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, NUMBER_ONE_HUNDRED);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics* metrics = (OH_Drawing_Font_Metrics*)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics is called 10 times
    for (int i = NUMBER_ZERO; i < NUMBER_TEN; i++) {
        OH_Drawing_FontGetMetrics(font, metrics);
    }
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    free(metrics);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5400
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontMeasureTextWithBrushOrPenNormal1_1(OH_Drawing_Font* font, const char* text, OH_Drawing_Pen* pen)
{
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureTextWithBrushOrPenNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds =
        OH_Drawing_RectCreate(RECT_LEFT_ZERO, RECT_TOP_ZERO, RECT_RIGHT_TWO_HUNDRED, RECT_BOTTOM_TWO_HUNDRED);
    OH_Drawing_Font* font2 = OH_Drawing_FontCreate();
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font2,
                                                                              text, strlen(text), TEXT_ENCODING_UTF8,
                                                                              nullptr, pen, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, FONT_SIZE_SCALEX);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8, brush,
                                                         nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_TextEncoding encodes[] = {TEXT_ENCODING_UTF8, TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32, TEXT_ENCODING_GLYPH_ID};
    for (OH_Drawing_TextEncoding encode : encodes) {
        errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), encode, brush,
                                                             nullptr, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8, brush,
                                                         nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), EXPECTED_WIDTH_HUNDRED);
    const char* text1 = "hello world";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text1, strlen(text1), TEXT_ENCODING_UTF8,
                                                         brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), EXPECTED_WIDTH_126);
    const char* text2 = "1234567890 !@#$%^&*(";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text2),
                                                         TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(textWidth), EXPECTED_WIDTH_277);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontDestroy(font2);
    OH_Drawing_TypefaceDestroy(typeface);
    return TestFontMeasureTextWithBrushOrPenNormal1_1(font, text, pen);
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5500
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontMeasureTextWithBrushOrPenNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds =
        OH_Drawing_RectCreate(RECT_LEFT_ZERO, RECT_TOP_ZERO, RECT_RIGHT_TWO_HUNDRED, RECT_BOTTOM_TWO_HUNDRED);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text,
                                                                              strlen(text), TEXT_ENCODING_UTF8,
                                                                              nullptr, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushSetColor(brush, COLOR_CYAN_TRANSPARENT);
    OH_Drawing_BrushSetAlpha(brush, BRUSH_ALPHA_HUNDRED);
    OH_Drawing_BrushSetAntiAlias(brush, true);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8, brush,
                                                         nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // Pass in the styled pen
    OH_Drawing_PenSetWidth(pen, PEN_WIDTH_TEN);
    OH_Drawing_PenSetColor(pen, COLOR_CYAN_TRANSPARENT);
    OH_Drawing_PenSetAlpha(pen, PEN_ALPHA_HUNDRED);
    OH_Drawing_PenSetAntiAlias(pen, true);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
                                                         TEXT_ENCODING_UTF8, nullptr, pen, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // Verify the bounds
    const char* text1 = "hello world";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(
        font, text1, strlen(text1), TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetLeft(bounds)), NUMBER_THREE);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetRight(bounds)), NUMBER_TWO_HUNDRED_FIFTY_ONE);
    EXPECT_EQ(static_cast<int>(OH_Drawing_RectGetBottom(bounds)), NUMBER_ONE);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5600
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureTextWithBrushOrPenNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds =
        OH_Drawing_RectCreate(RECT_LEFT_ZERO, RECT_TOP_ZERO, RECT_RIGHT_TWO_HUNDRED, RECT_BOTTOM_TWO_HUNDRED);
    OH_Drawing_ErrorCode errorCode =
    OH_Drawing_FontMeasureTextWithBrushOrPen(nullptr, text, strlen(text),
                                             TEXT_ENCODING_UTF8, brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // text passes to nullptr
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, nullptr, strlen(text), TEXT_ENCODING_UTF8,
                                                         brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    const char* text2 = "";
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text2, strlen(text), TEXT_ENCODING_UTF8,
                                                         brush, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, NUMBER_ZERO, TEXT_ENCODING_UTF8, brush,
                                                         nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text),
                                                         TEXT_ENCODING_UTF8, nullptr, nullptr, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // textWidth passes to nullptr
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8,
                                                         brush, pen, bounds, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8,
                                                         brush, pen, nullptr, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5700
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureTextWithBrushOrPenAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds =
        OH_Drawing_RectCreate(RECT_LEFT_ZERO, RECT_TOP_ZERO, RECT_RIGHT_TWO_HUNDRED, RECT_BOTTOM_TWO_HUNDRED);
    // byteLength passes to 0
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, NUMBER_ZERO, TEXT_ENCODING_UTF8, brush, nullptr,
        bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontMeasureTextWithBrushOrPen(font, text, strlen(text), TEXT_ENCODING_UTF8, brush, pen,
        bounds, &textWidth), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureTextWithBrushOrPenMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5800
 * @tc.desc   test for testFontMeasureTextWithBrushOrPenMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureTextWithBrushOrPenMultiCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好世界";
    float textWidth;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect* bounds =
        OH_Drawing_RectCreate(RECT_LEFT_ZERO, RECT_TOP_ZERO, RECT_RIGHT_TWO_HUNDRED, RECT_BOTTOM_TWO_HUNDRED);
    // OH_Drawing_FontMeasureTextWithBrushOrPen is called 20 times.
    for (int i = NUMBER_ZERO; i < NUMBER_TWENTY; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_FontMeasureTextWithBrushOrPen(font, text,
                                                                                  strlen(text), TEXT_ENCODING_UTF8,
                                                                                  nullptr, pen, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(bounds);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsBoundsNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5900
 * @tc.desc   test for testFontGetWidthsBoundsNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGetWidthsBoundsNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[WIDTHS_ARRAY_SIZE] = { FONT_SIZE_ZERO };
    OH_Drawing_Array* outRectarr = OH_Drawing_RectCreateArray(count);
    // Font does not set any attributes
    OH_Drawing_Font* font2 = OH_Drawing_FontCreate();
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font2, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
              OH_DRAWING_SUCCESS);
    // Font set some attributes
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, FONT_SIZE_SCALEX);
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
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

void InitializeFontAndBrush(OH_Drawing_Font* font, OH_Drawing_Brush* brush, OH_Drawing_Pen*  pen)
{
    const char* text = "你好世界";
    uint32_t count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[WIDTHS_ARRAY_SIZE] = { FONT_SIZE_ZERO };
    OH_Drawing_Array* outRectarr = OH_Drawing_RectCreateArray(count);
    std::vector<int> widthArr = { NUMBER_FIFTY, NUMBER_FIFTY, NUMBER_FIFTY, NUMBER_FIFTY };
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    for (int i = NUMBER_ZERO; i < count; i++) {EXPECT_EQ((int)widths[i], widthArr[i]);}
    errorCode = OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, nullptr, outRectarr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    std::vector<std::array<int, NUMBER_FOUR>> arr = {
        { NUMBER_ZERO, -NUMBER_FORTY_TWO, NUMBER_FORTY_EIGHT, NUMBER_THREE },
        { NUMBER_ONE, -NUMBER_FORTY_TWO, NUMBER_FORTY_EIGHT, NUMBER_THREE },
        { NUMBER_TWO, -NUMBER_FORTY_TWO, NUMBER_FORTY_SEVEN, NUMBER_TWO },
        { NUMBER_ONE, -NUMBER_FORTY, NUMBER_FORTY_EIGHT, NUMBER_THREE }
    };
    for (int i = NUMBER_ZERO; i < count; i++) {
        OH_Drawing_Rect* iter = nullptr;
        EXPECT_EQ(OH_Drawing_RectGetArrayElement(outRectarr, i, &iter), OH_DRAWING_SUCCESS);
        EXPECT_NE(iter, nullptr);
        EXPECT_EQ((int)OH_Drawing_RectGetLeft(iter), arr[i][NUMBER_ZERO]);
        EXPECT_EQ((int)OH_Drawing_RectGetTop(iter), arr[i][NUMBER_ONE]);
        EXPECT_EQ((int)OH_Drawing_RectGetRight(iter), arr[i][NUMBER_TWO]);
        EXPECT_EQ((int)OH_Drawing_RectGetBottom(iter), arr[i][NUMBER_THREE]);
        EXPECT_EQ(OH_Drawing_RectGetBottom(iter) - OH_Drawing_RectGetTop(iter), OH_Drawing_RectGetHeight(iter));
        EXPECT_EQ(OH_Drawing_RectGetRight(iter) - OH_Drawing_RectGetLeft(iter), OH_Drawing_RectGetWidth(iter));
    }
    OH_Drawing_BrushSetColor(brush, COLOR_CYAN_TRANSPARENT);
    OH_Drawing_BrushSetAlpha(brush, BRUSH_ALPHA_HUNDRED);
    OH_Drawing_BrushSetAntiAlias(brush, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr),
              OH_DRAWING_SUCCESS);
    OH_Drawing_PenSetWidth(pen, PEN_WIDTH_TEN);
    OH_Drawing_PenSetColor(pen, COLOR_CYAN_TRANSPARENT);
    OH_Drawing_PenSetAlpha(pen, PEN_ALPHA_HUNDRED);
    OH_Drawing_PenSetAntiAlias(pen, true);
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, nullptr, pen, widths, outRectarr),
              OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroyArray(outRectarr);
}
/**
 * @tc.name   testFontGetWidthsBoundsNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6000
 * @tc.desc   test for testFontGetWidthsBoundsNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGetWidthsBoundsNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    InitializeFontAndBrush(font, brush, pen);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6100
 * @tc.desc   test for testFontGetWidthsBoundsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsBoundsNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[WIDTHS_ARRAY_SIZE] = { FONT_SIZE_ZERO };
    OH_Drawing_Array* outRectarr = OH_Drawing_RectCreateArray(count);
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
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6200
 * @tc.desc   test for testFontGetWidthsBoundsAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsBoundsAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[WIDTHS_ARRAY_SIZE] = { FONT_SIZE_ZERO };
    OH_Drawing_Array* outRectarr = OH_Drawing_RectCreateArray(count);
    // count passes to 0
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, NUMBER_ZERO, nullptr, pen, widths, outRectarr),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // count passes to negative number
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, -NUMBER_ONE, nullptr, pen, widths, outRectarr),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    // The input parameter of count is less than the length of the glyphs array
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font,
                                             glyphs,
                                             sizeof(glyphs) / sizeof(glyphs[NUMBER_ZERO]) - NUMBER_ONE,
                                             nullptr,
                                             pen,
                                             widths,
                                             nullptr),
              OH_DRAWING_SUCCESS);
    // Both brush and pen are not empty
    EXPECT_EQ(OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, pen, widths, outRectarr),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsBoundsMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6300
 * @tc.desc   test for testFontGetWidthsBoundsMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsBoundsMultiCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    const char* text = "你好世界";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    float widths[WIDTHS_ARRAY_SIZE] = { FONT_SIZE_ZERO };
    OH_Drawing_Array* outRectarr = OH_Drawing_RectCreateArray(count);
    // OH_Drawing_FontGetWidthsBounds is called 20 times
    OH_Drawing_ErrorCode errorCode;
    for (int i = NUMBER_ZERO; i < NUMBER_TWENTY; i++) {
        errorCode =
            OH_Drawing_FontGetWidthsBounds(font, glyphs, glyphsCount, brush, nullptr, widths, outRectarr);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroyArray(outRectarr);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGePosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6400
 * @tc.desc   test for testFontGePosNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGePosNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    // font Different words
    const char* text = "你好世界";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count <= NUMBER_ZERO || count > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point = OH_Drawing_PointCreate(COORD_X_TEN, COORD_Y_TEN);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    // font does not set any attributes
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    std::vector<std::array<int, NUMBER_TWO>> testPoints = { { NUMBER_TEN, NUMBER_TEN },
                                                            { NUMBER_SIXTY, NUMBER_TEN },
                                                            { NUMBER_ONE_HUNDRED_TEN, NUMBER_TEN },
                                                            { NUMBER_ONE_HUNDRED_SIXTY, NUMBER_TEN } };
    for (int i = NUMBER_ZERO; i < count; i++) {
        EXPECT_EQ((int)points[i].x, testPoints[i][NUMBER_ZERO]);
        EXPECT_EQ((int)points[i].y, testPoints[i][NUMBER_ONE]);
    }
    // length count < glyphs
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(
        font, glyphs, sizeof(glyphs) / sizeof(glyphs[NUMBER_ZERO]) - NUMBER_ONE, point, points);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, FONT_SIZE_SCALEX);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    // font set some attributes
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetPosNormal1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6500
 * @tc.desc   test for testFontGetPosNormal1
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */

static int TestFontGetPosNormal1_2(OH_Drawing_Font* font, const char* text)
{
    uint32_t count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count2 <= NUMBER_ZERO || count2 > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(COORD_X_ZERO, COORD_Y_HUNDRED);
    std::vector<std::array<int, FONT_BOUNDS_2_1>> testPoints2 = { { NUMBER_ZERO, NUMBER_ONE_HUNDRED },
        { NUMBER_TWENTY_NINE, NUMBER_ONE_HUNDRED },
        { NUMBER_FIFTY_EIGHT, NUMBER_ONE_HUNDRED },
        { NUMBER_EIGHTY_SEVEN, NUMBER_ONE_HUNDRED } };
    uint16_t glyphs2[count2];
    int glyphsCount2 = OH_Drawing_FontTextToGlyphs(font, text, strlen(text),
                                                   OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    // Check the validity of count2 before memory allocation
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count2; i++) {
        EXPECT_EQ((int)points2[i].x, testPoints2[i][0]);
        EXPECT_EQ((int)points2[i].y, testPoints2[i][1]);
    }
    OH_Drawing_PointDestroy(point2);
    if (points2 != nullptr) {
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetPosNormal1()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_METRIC_AVG_CHAR_WIDTH);
    const char* text = "1234";
    uint32_t count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count1 <= NUMBER_ZERO || count1 > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point1 = OH_Drawing_PointCreate(COORD_X_HUNDRED, COORD_Y_ZERO);
    std::vector<std::array<int, FONT_BOUNDS_2_1>> testPoints1 = { { NUMBER_ONE_HUNDRED, NUMBER_ZERO },
                                                                  { NUMBER_ONE_HUNDRED_TWENTY_NINE, NUMBER_ZERO },
                                                                  { NUMBER_ONE_HUNDRED_FIFTY_EIGHT, NUMBER_ZERO },
                                                                  { NUMBER_ONE_HUNDRED_EIGHTY_SEVEN, NUMBER_ZERO } };
    uint16_t glyphs1[count1];
    int glyphsCount1 = OH_Drawing_FontTextToGlyphs(font, text, strlen(text),
                                                   OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    if (count1 <= 0) {
        EXPECT_EQ(count1, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_Point2D* points1 = new OH_Drawing_Point2D[count1];
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    for (int i = 0; i < count1; i++) {
        EXPECT_EQ((int)points1[i].x, testPoints1[i][0]);
        EXPECT_EQ((int)points1[i].y, testPoints1[i][1]);
    }
    OH_Drawing_PointDestroy(point1);
    if (points1 != nullptr) {
        delete[] points1;
    }
    return TestFontGetPosNormal1_2(font, text);
}

/**
 * @tc.name   testFontGePosNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6600
 * @tc.desc   test for testFontGePosNormal2
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGePosNormal2()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "1234";
    uint32_t count1 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count1 <= NUMBER_ZERO || count1 > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point1 = OH_Drawing_PointCreate(COORD_X_100_25, COORD_Y_200_585);
    std::vector<std::array<float, NUMBER_TWO>> testPoints1 = {
        { 100.25f, 200.585007f }, { 129.25f, 200.585007f }, { 158.25f, 200.585007f }, { 187.25f, 200.585007f }
    };
    uint16_t glyphs1[count1];
    int glyphsCount1 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs1, count1);
    OH_Drawing_Point2D* points1 = new OH_Drawing_Point2D[count1];
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetPos(font, glyphs1, glyphsCount1, point1, points1);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    for (int i = NUMBER_ZERO; i < count1; i++) {
        EXPECT_EQ(points1[i].x, testPoints1[i][NUMBER_ZERO]);
        EXPECT_EQ(points1[i].y, testPoints1[i][NUMBER_ONE]);
    }
    uint32_t count2 = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count2 <= NUMBER_ZERO || count2 > strlen(text)) { return OH_DRAWING_ERROR_INVALID_PARAMETER;}
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(COORD_X_NEG_HUNDRED, COORD_Y_NEG_HUNDRED);
    std::vector<std::array<int, NUMBER_TWO>> testPoints2 = { { -NUMBER_ONE_HUNDRED, -NUMBER_ONE_HUNDRED },
                                                             { -NUMBER_SEVENTY_ONE, -NUMBER_ONE_HUNDRED },
                                                             { -NUMBER_FORTY_TWO, -NUMBER_ONE_HUNDRED },
                                                             { -NUMBER_THIRTEEN, -NUMBER_ONE_HUNDRED } };
    uint16_t glyphs2[count2];
    int glyphsCount2 = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs2, count2);
    OH_Drawing_Point2D* points2 = new OH_Drawing_Point2D[count2];
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_FontGetPos(font, glyphs2, glyphsCount2, point2, points2);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    for (int i = NUMBER_ZERO; i < count2; i++) {
        EXPECT_EQ((int)points2[i].x, testPoints2[i][NUMBER_ZERO]);
        EXPECT_EQ((int)points2[i].y, testPoints2[i][NUMBER_ONE]);
    }
    OH_Drawing_PointDestroy(point1);
    OH_Drawing_PointDestroy(point2);
    if (points1 != nullptr || points2 != nullptr) {
        delete[] points1;
        delete[] points2;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGePosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6700
 * @tc.desc   test for testFontGePosNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGePosNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count <= NUMBER_ZERO || count > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point = OH_Drawing_PointCreate(COORD_X_TEN, COORD_Y_TEN);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    EXPECT_EQ(OH_Drawing_FontGetPos(nullptr, glyphs, glyphsCount, point, points),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, nullptr, glyphsCount, point, points),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, nullptr, nullptr),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_Point* point1 = OH_Drawing_PointCreate(COORD_X_ZERO, COORD_Y_ZERO);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point1, points), OH_DRAWING_SUCCESS);
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
    if (points != nullptr) {
        delete[] points;
    }
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGePosMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6800
 * @tc.desc   test for testFontGePosMultiplieCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGePosMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count <= NUMBER_ZERO || count > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point = OH_Drawing_PointCreate(COORD_X_TEN, COORD_Y_TEN);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    for (int i = NUMBER_ZERO; i < NUMBER_TWENTY; i++) {
        EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, glyphsCount, point, points), OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGePosAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6900
 * @tc.desc   test for testFontGePosAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGePosAbnormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    const char* text = "你好";
    uint32_t count = NUMBER_ZERO;
    count = OH_Drawing_FontCountText(font, text, strlen(text), TEXT_ENCODING_UTF8);
    if (count <= NUMBER_ZERO || count > strlen(text)) {
        return OH_DRAWING_ERROR_INVALID_PARAMETER;
    }
    OH_Drawing_Point* point = OH_Drawing_PointCreate(COORD_X_TEN, COORD_Y_TEN);
    uint16_t glyphs[count];
    int glyphsCount = NUMBER_ZERO;
    glyphsCount = OH_Drawing_FontTextToGlyphs(
        font, text, strlen(text), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8, glyphs, count);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D[count];
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, NUMBER_ZERO, point, points),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetPos(font, glyphs, -NUMBER_ONE, point, points),
              OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_PointDestroy(point);
    if (points != nullptr) {
        delete[] points;
    }
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGeSpacingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7000
 * @tc.desc   test for testFontGeSpacingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGeSpacingNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    float spacing = FONT_SIZE_ZERO;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_THIRTY);
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetScaleX(font, FONT_SIZE_SCALEX);
    OH_Drawing_FontSetHinting(font, FONT_HINTING_SLIGHT);
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_FontGetSpacing(font, &spacing);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    EXPECT_EQ(std::fabs(spacing - 35.16f) < FLOAT_COMPARE_EPSILON, true);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGeSpacingMultiplieCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7100
 * @tc.desc   test for testFontGeSpacingMultiplieCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGeSpacingMultiplieCalls()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_THIRTY);
    float spacing = FONT_SIZE_ZERO;
    for (int i = NUMBER_ZERO; i < NUMBER_TWENTY; i++) {
        EXPECT_EQ(OH_Drawing_FontGetSpacing(font, &spacing), OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(std::fabs(spacing - 35.16f) < FLOAT_COMPARE_EPSILON, true);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGeSpacingNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7200
 * @tc.desc   test for testFontGeSpacingNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGeSpacingNull()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_THIRTY);
    float spacing = FONT_SIZE_ZERO;
    EXPECT_EQ(OH_Drawing_FontGetSpacing(nullptr, &spacing), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_FontGetSpacing(font, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7300
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontMeasureSingleChaWithFeaturesNormal()
{
    DrawingNativeFontPart2TestSetUp();
    const char* str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface* fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = FONT_SIZE_ZERO;
    OH_Drawing_ErrorCode code =
        OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_THIRTY_SEVEN);
    str = "你";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    str = "（";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    str = "｛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    str = "《";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    str = "8";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_TWENTY_NINE);
    str = "乂";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    str = "飛";
    code = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_FIFTY);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_TypefaceDestroy(fileTypeface);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7400
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontMeasureSingleChaWithFeaturesAbNormal()
{
    DrawingNativeFontPart2TestSetUp();
    const char* str = "（";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, COLOR_BLUE_ALPHA);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = FONT_SIZE_ZERO;
    OH_Drawing_ErrorCode code =
        OH_Drawing_FontMeasureSingleCharacterWithFeatures(nullptr, str, features, &textWidth);
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

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontMeasureSingleChaWithFeaturesCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7500
 * @tc.desc   test for testFontMeasureSingleChaWithFeaturesCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestFontMeasureSingleChaWithFeaturesCalls()
{
    DrawingNativeFontPart2TestSetUp();
    const char* str = "H";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_Typeface* fileTypeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTextSize(font, FONT_SIZE_FIFTY);
    OH_Drawing_FontSetTypeface(font, fileTypeface);
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    float textWidth = FONT_SIZE_ZERO;
    int count = TEST_CYCLE_COUNT_TEN;
    for (int i = NUMBER_ZERO; i < count; i++) {
        OH_Drawing_ErrorCode code =
            OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, features, &textWidth);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(textWidth, EXPECTED_WIDTH_THIRTY_SEVEN);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_TypefaceDestroy(fileTypeface);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontFeaturesAddFeatureNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7600
 * @tc.desc   test for testFontFeaturesAddFeatureNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestFontFeaturesAddFeatureNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    int count = TEST_CYCLE_COUNT_TEN;
    for (int i = NUMBER_ZERO; i < count; i++) {
        code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", 0.1f);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaa", 1.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaaa", 1.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontFeaturesAddFeatureAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7700
 * @tc.desc   test for testFontFeaturesAddFeatureAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontFeaturesAddFeatureAbNormal()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesAddFeature(nullptr, "aaaa", 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, nullptr, 0.1f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_FontFeaturesAddFeature(features, "aaaa", FONT_SIZE_ZERO);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_FontFeaturesDestroy(features);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontFeaturesandFeatureDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7800
 * @tc.desc   test for testFontFeaturesandFeatureDestroyNULL
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontFeaturesandFeatureDestroyNULL()
{
    DrawingNativeFontPart2TestSetUp();
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_FontFeaturesDestroy(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    int count = TEST_CYCLE_COUNT_TEN;
    for (int i = NUMBER_ZERO; i < count; i++) {
        OH_Drawing_FontFeatures* features1 = OH_Drawing_FontFeaturesCreate();
        OH_Drawing_ErrorCode code1 = OH_Drawing_FontFeaturesDestroy(features1);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontFeaturesDestroy(features);

    DrawingNativeFontPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS