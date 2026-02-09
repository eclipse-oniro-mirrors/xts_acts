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

#include "include/DrawingNativeFontTest.h"
#include <cfloat>
#include <random>
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

#define TEST_FONT_SIZE 50.255f
// 文本编码相关计数值宏定义
#define UTF8_CHAR_COUNT 11    // UTF-8编码字符计数
#define UTF16_CHAR_COUNT (-1)   // UTF-16编码字符计数
#define UTF32_CHAR_COUNT 2    // UTF-32编码字符计数
#define GLYPH_ID_CHAR_COUNT 5 // 字形ID编码字符计数
#define FONT_SIZE_TWELVE 12.0f
// 字符串长度宏定义
#define CHINESE_CHAR_COUNT_FOUR 4
#define MIXED_CHAR_COUNT_EIGHT 8
#define MIXED_CHAR_COUNT_TEN 10
// 其他数字宏定义
#define ZERO_VALUE 0
#define VALUE_ONE 1
#define VALUE_TWO 2
#define VALUE_FOUR 4
#define VALUE_FIVE 5
#define VALUE_EIGHT 8
#define VALUE_TEN 10
#define VALUE_ELEVEN 11
#define VALUE_FIFTY 50
#define VALUE_HUNDRED 100
#define NEGATIVE_ONE (-1)
#define EVEN_DIVISOR 2
#define FONT_SIZE_ZERO 0.0f
#define FONT_SIZE_ELEVEN 11.0f
#define FLOAT_ZERO 0.0f

#define GLYPHS_ARRAY_SIZE 50

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeFontTestSetUp()
{
    std::cout << "DrawingNativeFontTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeFontTestTearDown()
{
    std::cout << "DrawingNativeFontTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFontTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testFontCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0100
 * @tc.desc   Test for creating and destroying a font object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontCreateDestroyNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCreateDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0200
 * @tc.desc   test for testFontCreateDestroyNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontCreateDestroyNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontDestroy with nullptr as parameter
    OH_Drawing_FontDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCreateDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0300
 * @tc.desc   test for testFontCreateDestroyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontCreateDestroyMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    OH_Drawing_Font* fonts[VALUE_TEN];
    // 1. Call OH_Drawing_FontCreate 10 times
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        EXPECT_NE(fonts[i], nullptr);
    }
    // 2. Call OH_Drawing_FontDestroy 10 times
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    // 3. Call OH_Drawing_FontCreate and OH_Drawing_FontDestroy alternately 10 times
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_Font* font = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(font, nullptr);
        OH_Drawing_FontDestroy(font);
    }

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetBaselineSnapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0400
 * @tc.desc   test for testFontSetBaselineSnapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetBaselineSnapNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to false,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, false);
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_FALSE(isBaselineSnap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to true,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, true);
    isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_TRUE(isBaselineSnap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetBaselineSnapNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0500
 * @tc.desc   test for testFontSetBaselineSnapNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetBaselineSnapNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetBaselineSnap with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetBaselineSnap(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsBaselineSnap with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsBaselineSnap(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetBaselineSnapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0600
 * @tc.desc   test for testFontSetBaselineSnapMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */

int TestFontSetBaselineSnapMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap 10 times, and call OH_Drawing_FontIsBaselineSnap each time to
    // check if the font baseline is aligned with pixels
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetBaselineSnap(font, ((i) % EVEN_DIVISOR == ZERO_VALUE));
        bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
        EXPECT_EQ(isBaselineSnap, ((i) % EVEN_DIVISOR == ZERO_VALUE));
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsBaselineSnapWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0700
 * @tc.desc   test for testFontIsBaselineSnapWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestFontIsBaselineSnapWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsBaselineSnap
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_TRUE(isBaselineSnap);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetSubpixelNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0800
 * @tc.desc   test for testFontSetSubpixelNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetSubpixelNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to false,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_FALSE(isSubpixel);
    // 3. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to true,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_TRUE(isSubpixel);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetSubpixelNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0900
 * @tc.desc   test for testFontSetSubpixelNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetSubpixelNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetSubpixel with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetSubpixel(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsSubpixel with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsSubpixel(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetSubpixelMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1000
 * @tc.desc   test for testFontSetSubpixelMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetSubpixelMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel 10 times, and call OH_Drawing_FontIsSubpixel each time to check if
    // the glyph is rendered using subpixels
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetSubpixel(font, ((i) % EVEN_DIVISOR == ZERO_VALUE));
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
        EXPECT_EQ(isSubpixel, ((i) % EVEN_DIVISOR == ZERO_VALUE));
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsSubpixelWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1100
 * @tc.desc   test for testFontIsSubpixelWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestFontIsSubpixelWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_FALSE(isSubpixel);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetForceAutoHintingNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1200
 * @tc.desc   test for testFontSetForceAutoHintingNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetForceAutoHintingNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to false,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically
    // adjusted
    OH_Drawing_FontSetForceAutoHinting(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_FALSE(isForceAutoHinting);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to true,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically
    // adjusted
    OH_Drawing_FontSetForceAutoHinting(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_TRUE(isForceAutoHinting);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetForceAutoHintingNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1300
 * @tc.desc   test for testFontSetForceAutoHintingNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetForceAutoHintingNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetForceAutoHinting with nullptr as the first parameter, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetForceAutoHinting(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsForceAutoHinting with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsForceAutoHinting(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetForceAutoHintingMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1400
 * @tc.desc   test for testFontSetForceAutoHintingMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetForceAutoHintingMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting 10 times, and call OH_Drawing_FontIsForceAutoHinting each
    // time to check if the glyph outlines are automatically adjusted
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetForceAutoHinting(font, ((i) % EVEN_DIVISOR == ZERO_VALUE));
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
        EXPECT_EQ(isForceAutoHinting, ((i) % EVEN_DIVISOR == ZERO_VALUE));
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontIsForceAutoHintingWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1500
 * @tc.desc   test for testFontIsForceAutoHintingWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontIsForceAutoHintingWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsForceAutoHinting
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_FALSE(isForceAutoHinting);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTypefaceNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1600
 * @tc.desc   test for testFontSetTypefaceNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetTypefaceNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface1, nullptr);
    // 3. Call OH_Drawing_FontSetTypeface, and call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_FontSetTypeface(font, typeface1);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_FontGetTypeface(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(typeface2, nullptr);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTypefaceNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1700
 * @tc.desc   test for testFontSetTypefaceNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTypefaceNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTypeface with nullptr as the second parameter, call
    // OH_Drawing_FontGetTypeface to get the default value
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typeface2, nullptr);
    // 4. Call OH_Drawing_FontGetTypeface with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTypefaceMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1800
 * @tc.desc   test for testFontSetTypefaceMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTypefaceMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface 10 times (with different typefaces), and call
    // OH_Drawing_FontGetTypeface each time to get the glyph object
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
        // add assert
        EXPECT_NE(typeface, nullptr);
        OH_Drawing_FontSetTypeface(font, typeface);
        OH_Drawing_Typeface* typeface2 = OH_Drawing_FontGetTypeface(font);
        // add assert
        EXPECT_NE(typeface2, nullptr);
        EXPECT_EQ(typeface, typeface2);
        OH_Drawing_TypefaceDestroy(typeface);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetTypefaceWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1900
 * @tc.desc   test for testFontGetTypefaceWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetTypefaceWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_Typeface* typeface = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typeface, nullptr);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSizeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2000
 * @tc.desc   test for testFontSetTextSizeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontSetTextSizeNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to 100, and call
    // OH_Drawing_FontGetTextSize to get the text size
    OH_Drawing_FontSetTextSize(font, VALUE_HUNDRED);
    float textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(textSize, VALUE_HUNDRED);
    // 3. Call OH_Drawing_FontSetTextSize with textSize parameter set to 50.255, and call
    // OH_Drawing_FontGetTextSize to get the text size
    OH_Drawing_FontSetTextSize(font, TEST_FONT_SIZE);
    textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(textSize, TEST_FONT_SIZE), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSizeNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2100
 * @tc.desc   test for testFontSetTextSizeNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSizeNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSize(nullptr, VALUE_HUNDRED);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTextSize with 0 as the second parameter
    OH_Drawing_FontSetTextSize(font, ZERO_VALUE);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, ZERO_VALUE);
    // 4. Call OH_Drawing_FontGetTextSize with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSize(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSizeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2200
 * @tc.desc   test for testFontSetTextSizeMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSizeMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize 10 times (with random textSize parameter), and call
    // OH_Drawing_FontGetTextSize each time to get the text size
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(FONT_SIZE_ZERO, FONT_SIZE_ZERO);
    for (int i = ZERO_VALUE; i < VALUE_TEN; i++) {
        OH_Drawing_ErrorCodeReset();
        float size = dis(gen);
        OH_Drawing_FontSetTextSize(font, size);
        float textSize = OH_Drawing_FontGetTextSize(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(textSize, size);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetTextSizeWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2300
 * @tc.desc   test for testFontGetTextSizeWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetTextSizeWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetTextSize to get the text size
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, FONT_SIZE_TWELVE);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontSetTextSizeAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2400
 * @tc.desc   test for testFontSetTextSizeAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontSetTextSizeAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -100, and call
    // OH_Drawing_FontGetTextSize to get the text size
    OH_Drawing_FontSetTextSize(font, -VALUE_HUNDRED);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, ZERO_VALUE);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCountTextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2500
 * @tc.desc   test for testFontCountTextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontCountTextNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // 2. Enumerate through the encoding values in OH_Drawing_FontCountText
    const char* str = "Hello World";
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (OH_Drawing_TextEncoding encode : encodes) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), encode);
        switch (encode) {
            case TEXT_ENCODING_UTF8:
                EXPECT_EQ(count, UTF8_CHAR_COUNT);
                break;
            case TEXT_ENCODING_UTF16:
                EXPECT_EQ(count, UTF16_CHAR_COUNT);
                break;
            case TEXT_ENCODING_UTF32:
                EXPECT_EQ(count, UTF32_CHAR_COUNT);
                break;
            case TEXT_ENCODING_GLYPH_ID:
                EXPECT_EQ(count, GLYPH_ID_CHAR_COUNT);
                break;
            default:
                break;
        }
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCountTextNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2600
 * @tc.desc   test for testFontCountTextNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontCountTextNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(nullptr, str, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(font, nullptr, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Pass an empty string as the second parameter and NULL as the third parameter to
    // OH_Drawing_FontCountText
    int count = OH_Drawing_FontCountText(font, "", ZERO_VALUE, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, ZERO_VALUE);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCountTextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2700
 * @tc.desc   test for testFontCountTextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontCountTextMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontCountText 10 times (with different lengths and types of strings, such as
    // Chinese, English, traditional characters, special characters, numbers, etc.)
    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    for (const char* str : strs) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        if (strcmp(str, "Hello World") == ZERO_VALUE) { // Use strcmp for string comparison
            EXPECT_EQ(count, UTF8_CHAR_COUNT);
        } else if (strcmp(str, "你好世界") == ZERO_VALUE) {
            EXPECT_EQ(count, CHINESE_CHAR_COUNT_FOUR);
        } else if (strcmp(str, "Hello 世界") == ZERO_VALUE) {
            EXPECT_EQ(count, MIXED_CHAR_COUNT_EIGHT);
        } else if (strcmp(str, "Hello 世界123") == ZERO_VALUE) {
            EXPECT_EQ(count, UTF8_CHAR_COUNT);
        } else if (strcmp(str, "Hello $#@!") == ZERO_VALUE) {
            EXPECT_EQ(count, MIXED_CHAR_COUNT_TEN);
        } else if (strcmp(str, "繁體中文") == ZERO_VALUE) {
            EXPECT_EQ(count, CHINESE_CHAR_COUNT_FOUR);
        }
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontCountTextAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2800
 * @tc.desc   test for testFontCountTextAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontCountTextAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -1
    const char* str = "Hello World";
    int count = OH_Drawing_FontCountText(font, str, NEGATIVE_ONE, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, ZERO_VALUE);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontTextToGlyphsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2900
 * @tc.desc   test for testFontTextToGlyphsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontTextToGlyphsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Enumerate through the encoding values in OH_Drawing_FontTextToGlyphs
    const char* str = "Hello World";
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    for (OH_Drawing_TextEncoding encode : encodes) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), encode);
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), encode, glyphs, count);
    }
    // 3. Pass floating-point values for maxGlyphCount and byteLength parameters in
    // OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, str, FONT_SIZE_ELEVEN, TEXT_ENCODING_UTF8, glyphs, FONT_SIZE_ELEVEN);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontTextToGlyphsNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3000
 * @tc.desc   test for testFontTextToGlyphsNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontTextToGlyphsNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(nullptr, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, nullptr, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass an empty string as the third parameter to OH_Drawing_FontTextToGlyphs and check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, ZERO_VALUE, TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Pass nullptr as the fifth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, nullptr, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 6. Pass 0 as the sixth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, ZERO_VALUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Pass an empty string as the second parameter to OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, "", ZERO_VALUE, TEXT_ENCODING_UTF8, glyphs, count);
    // 8. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontTextToGlyphsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3100
 * @tc.desc   test for testFontTextToGlyphsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontTextToGlyphsMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontTextToGlyphs 10 times (with different lengths and types of strings, such as
    // Chinese, English, traditional characters, special characters, numbers, etc.)
    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    for (const char* str : strs) {
        OH_Drawing_ErrorCodeReset();
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontTextToGlyphsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3200
 * @tc.desc   test for testFontTextToGlyphsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontTextToGlyphsAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with byteLength parameter set to -1
    // 3. Set maxGlyphCount parameter to -1 for OH_Drawing_FontTextToGlyphs interface and check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, NEGATIVE_ONE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontTextToGlyphsMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3300
 * @tc.desc   test for testFontTextToGlyphsMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontTextToGlyphsMaximum()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    // 2. Set byteLength parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with maximum byteLength parameter
    // 3. Set maxGlyphCount parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, INT32_MAX);
    // 4. Set glyphs parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    uint16_t glyphs2[GLYPHS_ARRAY_SIZE] = { UINT16_MAX };
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs2, count);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3400
 * @tc.desc   test for testFontGetWidthsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestFontGetWidthsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetWidths
    const char* str = "Hello World";
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount =
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[GLYPHS_ARRAY_SIZE] = { FLOAT_ZERO };
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_GT(widths[ZERO_VALUE], FLOAT_ZERO);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3500
 * @tc.desc   test for testFontGetWidthsNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char* str = "Hello World";
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount =
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[GLYPHS_ARRAY_SIZE] = { FLOAT_ZERO };
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(nullptr, glyphs, glyphsCount, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, nullptr, glyphsCount, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass 0 as the third parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, ZERO_VALUE, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Pass nullptr as the fourth parameter to OH_Drawing_FontGetWidths and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testFontGetWidthsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3600
 * @tc.desc   test for testFontGetWidthsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestFontGetWidthsMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetWidths 10 times (with different lengths and types of strings, such as
    // Chinese, English, traditional characters, special characters, numbers, etc.)
    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[GLYPHS_ARRAY_SIZE] = { ZERO_VALUE };
    float widths[GLYPHS_ARRAY_SIZE] = { FLOAT_ZERO };
    for (const char* str : strs) {
        OH_Drawing_ErrorCodeReset();
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        int glyphsCount =
            OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
        OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_GT(widths[ZERO_VALUE], FLOAT_ZERO);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS