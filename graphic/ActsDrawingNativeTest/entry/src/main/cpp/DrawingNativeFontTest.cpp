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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_8 8
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_11 11
#define DRAWING_NUMBER_12 12
#define DRAWING_NUMBER_24 24
#define DRAWING_NUMBER_27 27
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_31 31
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_54 54
#define DRAWING_NUMBER_55 55
#define DRAWING_NUMBER_92 92
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_105 105
#define DRAWING_NUMBER_117 117
#define DRAWING_NUMBER_123 123
#define DRAWING_NUMBER_193 193
#define DRAWING_NUMBER_248 248
#define DRAWING_NUMBER_19937 19937
#define DRAWING_NUMBER_7999954 7999954

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestFontCreateDestroyNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontCreateDestroyNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontDestroy with nullptr as parameter
    OH_Drawing_Font *font = nullptr;
    OH_Drawing_FontDestroy(nullptr);
    EXPECT_EQ(font, nullptr);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontCreateDestroyMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    OH_Drawing_Font *fonts[DRAWING_NUMBER_10];
    // 1. Call OH_Drawing_FontCreate 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        EXPECT_NE(fonts[i], nullptr);
    }
    // 2. Call OH_Drawing_FontDestroy 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    // 3. Call OH_Drawing_FontCreate and OH_Drawing_FontDestroy alternately 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Font *font = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(font, nullptr);
        OH_Drawing_FontDestroy(font);
    }
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetBaselineSnapNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to false,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, false);
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_EQ(isBaselineSnap, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetBaselineSnap with isForce parameter set to true,
    // verify by calling OH_Drawing_FontIsBaselineSnap to check if the font baseline is aligned with pixels
    OH_Drawing_FontSetBaselineSnap(font, true);
    isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_EQ(isBaselineSnap, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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

int TestFontSetBaselineSnapMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetBaselineSnap 10 times, and call OH_Drawing_FontIsBaselineSnap each time to check if the
    // font baseline is aligned with pixels
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetBaselineSnap(font, i % DRAWING_NUMBER_2 == 0);
        bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
        EXPECT_EQ(isBaselineSnap, i % DRAWING_NUMBER_2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsBaselineSnapWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsBaselineSnap
    bool isBaselineSnap = OH_Drawing_FontIsBaselineSnap(font);
    EXPECT_EQ(isBaselineSnap, true);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetSubpixelNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to false,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_EQ(isSubpixel, false);
    // 3. Call OH_Drawing_FontSetSubpixel with isSubpixel parameter set to true,
    // verify by calling OH_Drawing_FontIsSubpixel to check if the glyph is rendered using subpixels
    OH_Drawing_FontSetSubpixel(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_EQ(isSubpixel, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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

int TestFontSetSubpixelMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel 10 times, and call OH_Drawing_FontIsSubpixel each time to check if the glyph is
    // rendered using subpixels
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetSubpixel(font, i % DRAWING_NUMBER_2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
        EXPECT_EQ(isSubpixel, i % DRAWING_NUMBER_2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsSubpixelWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsSubpixel
    bool isSubpixel = OH_Drawing_FontIsSubpixel(font);
    EXPECT_EQ(isSubpixel, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetForceAutoHintingNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to false,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically adjusted
    OH_Drawing_FontSetForceAutoHinting(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_EQ(isForceAutoHinting, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontSetForceAutoHinting with isForceAutoHinting parameter set to true,
    // verify by calling OH_Drawing_FontIsForceAutoHinting to check if the glyph outlines are automatically adjusted
    OH_Drawing_FontSetForceAutoHinting(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_EQ(isForceAutoHinting, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetForceAutoHintingNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetForceAutoHinting with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
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

int TestFontSetForceAutoHintingMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetForceAutoHinting 10 times, and call OH_Drawing_FontIsForceAutoHinting each time to
    // check if the glyph outlines are automatically adjusted
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetForceAutoHinting(font, i % DRAWING_NUMBER_2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
        EXPECT_EQ(isForceAutoHinting, i % DRAWING_NUMBER_2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsForceAutoHintingWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontIsForceAutoHinting
    bool isForceAutoHinting = OH_Drawing_FontIsForceAutoHinting(font);
    EXPECT_EQ(isForceAutoHinting, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTypefaceNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typefaceDRAWING_NUMBER_1 = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typefaceDRAWING_NUMBER_1, nullptr);
    // 3. Call OH_Drawing_FontSetTypeface, and call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_FontSetTypeface(font, typefaceDRAWING_NUMBER_1);
    OH_Drawing_Typeface *typefaceDRAWING_NUMBER_2 = OH_Drawing_FontGetTypeface(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(typefaceDRAWING_NUMBER_2, nullptr);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceDRAWING_NUMBER_1);
    OH_Drawing_TypefaceDestroy(typefaceDRAWING_NUMBER_2);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTypefaceNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTypeface with nullptr as the second parameter, call OH_Drawing_FontGetTypeface to get
    // the default value
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface *typefaceDRAWING_NUMBER_2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceDRAWING_NUMBER_2, nullptr);
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

int TestFontSetTypefaceMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTypeface 10 times (with different typefaces), and call OH_Drawing_FontGetTypeface each
    // time to get the glyph object
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
        // add assert
        EXPECT_NE(typeface, nullptr);
        OH_Drawing_FontSetTypeface(font, typeface);
        OH_Drawing_Typeface *typefaceDRAWING_NUMBER_2 = OH_Drawing_FontGetTypeface(font);
        // add assert
        EXPECT_NE(typefaceDRAWING_NUMBER_2, nullptr);
        EXPECT_EQ(typeface, typefaceDRAWING_NUMBER_2);
        OH_Drawing_TypefaceDestroy(typeface);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetTypefaceWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTypeface to get the glyph object
    OH_Drawing_Typeface *typeface = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typeface, nullptr);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSizeNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to 100, and call OH_Drawing_FontGetTextSize to get
    // the text size
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_100);
    float textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(textSize, DRAWING_NUMBER_100);
    // 3. Call OH_Drawing_FontSetTextSize with textSize parameter set to 50.255, and call OH_Drawing_FontGetTextSize to
    // get the text size
    OH_Drawing_FontSetTextSize(font, 50.255f);
    textSize = OH_Drawing_FontGetTextSize(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(textSize, 50.255f), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSizeNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSize(nullptr, DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetTextSize with 0 as the second parameter
    OH_Drawing_FontSetTextSize(font, 0);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, 0);
    // 4. Call OH_Drawing_FontGetTextSize with nullptr as the parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSize(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSizeMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize 10 times (with random textSize parameter), and call OH_Drawing_FontGetTextSize
    // each time to get the text size
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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

int TestFontGetTextSizeWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetTextSize to get the text size
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, DRAWING_NUMBER_12);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSizeAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -100, and call OH_Drawing_FontGetTextSize to
    // get the text size
    OH_Drawing_FontSetTextSize(font, -DRAWING_NUMBER_100);
    float textSize = OH_Drawing_FontGetTextSize(font);
    EXPECT_EQ(textSize, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontCountTextNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // 2. Enumerate through the encoding values in OH_Drawing_FontCountText
    const char *str = "Hello World";
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
                EXPECT_EQ(count, DRAWING_NUMBER_11);
                break;
            case TEXT_ENCODING_UTF16:
                EXPECT_EQ(count, -DRAWING_NUMBER_1);
                break;
            case TEXT_ENCODING_UTF32:
                EXPECT_EQ(count, DRAWING_NUMBER_2);
                break;
            case TEXT_ENCODING_GLYPH_ID:
                EXPECT_EQ(count, DRAWING_NUMBER_5);
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

int TestFontCountTextNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(nullptr, str, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_FontCountText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontCountText(font, nullptr, strlen(str), TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Pass an empty string as the second parameter and NULL as the third parameter to OH_Drawing_FontCountText
    int count = OH_Drawing_FontCountText(font, "", 0, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, 0);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontCountTextMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontCountText 10 times (with different lengths and types of strings, such as Chinese, English,
    // traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    for (const char *str : strs) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        if (strcmp(str, "Hello World") == 0) { // Use strcmp for string comparison
            EXPECT_EQ(count, DRAWING_NUMBER_11);
        } else if (strcmp(str, "你好世界") == 0) {
            EXPECT_EQ(count, DRAWING_NUMBER_4);
        } else if (strcmp(str, "Hello 世界") == 0) {
            EXPECT_EQ(count, DRAWING_NUMBER_8);
        } else if (strcmp(str, "Hello 世界123") == 0) {
            EXPECT_EQ(count, DRAWING_NUMBER_11);
        } else if (strcmp(str, "Hello $#@!") == 0) {
            EXPECT_EQ(count, DRAWING_NUMBER_10);
        } else if (strcmp(str, "繁體中文") == 0) {
            EXPECT_EQ(count, DRAWING_NUMBER_4);
        }
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontCountTextAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSize with textSize parameter set to -1
    const char *str = "Hello World";
    int count = OH_Drawing_FontCountText(font, str, -DRAWING_NUMBER_1, TEXT_ENCODING_UTF8);
    EXPECT_EQ(count, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontTextToGlyphsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Enumerate through the encoding values in OH_Drawing_FontTextToGlyphs
    const char *str = "Hello World";
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    for (OH_Drawing_TextEncoding encode : encodes) {
        int count = OH_Drawing_FontCountText(font, str, strlen(str), encode);
        OH_Drawing_FontTextToGlyphs(font, str, strlen(str), encode, glyphs, count);
    }
    // 3. Pass floating-point values for maxGlyphCount and byteLength parameters in OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, str, DRAWING_NUMBER_11, TEXT_ENCODING_UTF8, glyphs, DRAWING_NUMBER_11);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontTextToGlyphsNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
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
    // 4. Pass an empty string as the third parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, 0, TEXT_ENCODING_UTF8, glyphs, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Pass nullptr as the fifth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, nullptr, count);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 6. Pass 0 as the sixth parameter to OH_Drawing_FontTextToGlyphs and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. Pass an empty string as the second parameter to OH_Drawing_FontTextToGlyphs
    OH_Drawing_FontTextToGlyphs(font, "", 0, TEXT_ENCODING_UTF8, glyphs, count);
    // 8. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontTextToGlyphsMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontTextToGlyphs 10 times (with different lengths and types of strings, such as Chinese,
    // English, traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    for (const char *str : strs) {
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

int TestFontTextToGlyphsAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with byteLength parameter set to -1
    // 3. Set maxGlyphCount parameter to -1 for OH_Drawing_FontTextToGlyphs interface and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, -DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontTextToGlyphsMaximum()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    // 2. Set byteLength parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    // Ignore, no need to test the case with maximum byteLength parameter
    // 3. Set maxGlyphCount parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, INT32_MAX);
    // 4. Set glyphs parameter to maximum value for OH_Drawing_FontTextToGlyphs interface
    uint16_t glyphs2[DRAWING_NUMBER_50] = {UINT16_MAX};
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs2, count);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontGetWidths
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_GT(widths[0], 0.f);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    float widths[DRAWING_NUMBER_50] = {0.f};
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
    OH_Drawing_FontGetWidths(font, glyphs, 0, widths);
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

int TestFontGetWidthsMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetWidths 10 times (with different lengths and types of strings, such as Chinese, English,
    // traditional characters, special characters, numbers, etc.)
    const char *strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    float widths[DRAWING_NUMBER_50] = {0.f};
    for (const char *str : strs) {
        OH_Drawing_ErrorCodeReset();
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
        OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_GT(widths[0], 0.f);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    float widths[DRAWING_NUMBER_50] = {0.f};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Set byteLength parameter to -1 for OH_Drawing_FontGetWidths interface
    // There is no byteLength parameter
    // 3. Set count parameter to -1 for OH_Drawing_FontGetWidths interface and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetWidths(font, glyphs, -DRAWING_NUMBER_1, widths);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Set widths parameter to -1 for OH_Drawing_FontGetWidths interface
    float widths2[DRAWING_NUMBER_50] = {-DRAWING_NUMBER_1};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // 5. Set count parameter to a floating-point value greater than 0 for OH_Drawing_FontGetWidths interface
    OH_Drawing_FontGetWidths(font, glyphs, DRAWING_NUMBER_2, widths);
    // 6. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetWidthsMaximum()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    const char *str = "Hello World";
    uint16_t glyphs[DRAWING_NUMBER_50] = {0};
    float widths[DRAWING_NUMBER_50] = {0.f};
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    int glyphsCount = OH_Drawing_FontTextToGlyphs(font, str, strlen(str), TEXT_ENCODING_UTF8, glyphs, count);
    // 2. Call OH_Drawing_FontGetWidths interface with maximum value for glyphs parameter
    uint16_t glyphs2[DRAWING_NUMBER_50] = {UINT16_MAX};
    OH_Drawing_FontGetWidths(font, glyphs2, glyphsCount, widths);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_FontGetWidths interface with maximum value for count parameter
    // Ignore, no need to test the case with maximum count parameter
    // 4. Call OH_Drawing_FontGetWidths interface with maximum value for widths parameter
    float widths2[DRAWING_NUMBER_50] = {FLT_MAX};
    OH_Drawing_FontGetWidths(font, glyphs, glyphsCount, widths2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetLinearTextNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to false, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, false);
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, false);
    // 3. Call OH_Drawing_FontSetLinearText with isLinearText parameter set to true, and then call
    // OH_Drawing_FontIsLinearText to check if the glyphs are scaled linearly
    OH_Drawing_FontSetLinearText(font, true);
    isLinearText = OH_Drawing_FontIsLinearText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isLinearText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetLinearTextNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetLinearText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsLinearText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsLinearText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetLinearTextMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetLinearText 10 times, and call OH_Drawing_FontIsLinearText to check if the glyphs are
    // scaled linearly
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetLinearText(font, i % DRAWING_NUMBER_2 == 0);
        bool isLinearText = OH_Drawing_FontIsLinearText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isLinearText, i % DRAWING_NUMBER_2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsLinearTextWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsLinearText
    bool isLinearText = OH_Drawing_FontIsLinearText(font);
    EXPECT_EQ(isLinearText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSkewXNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 10, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, DRAWING_NUMBER_10);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, DRAWING_NUMBER_10);
    // 3. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to 0.55, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, 0.55f);
    skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(skewX, 0.55f), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSkewXNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Pass nullptr as the first parameter to OH_Drawing_FontSetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTextSkewX(nullptr, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass 0 as the second parameter to OH_Drawing_FontSetTextSkewX
    OH_Drawing_FontSetTextSkewX(font, 0);
    // 4. Pass nullptr as the parameter to OH_Drawing_FontGetTextSkewX and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTextSkewX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSkewXMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX 10 times (with random skewX values), and call OH_Drawing_FontGetTextSkewX to
    // get the text skew on the x-axis each time
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_30);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetTextSkewX(font, val);
        float skewX = OH_Drawing_FontGetTextSkewX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(skewX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetTextSkewXWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(skewX, 0);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSkewXAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to -1, and then call
    // OH_Drawing_FontGetTextSkewX to get the text skew on the x-axis
    OH_Drawing_FontSetTextSkewX(font, -DRAWING_NUMBER_1);
    float skewX = OH_Drawing_FontGetTextSkewX(font);
    EXPECT_EQ(skewX, -DRAWING_NUMBER_1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetTextSkewXMaximum()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetTextSkewX interface with skewX parameter set to FLT_MAX
    OH_Drawing_FontSetTextSkewX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetFakeBoldTextNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to false, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, false);
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Call OH_Drawing_FontSetFakeBoldText interface with isFakeBoldText parameter set to true, and then call
    // OH_Drawing_FontIsFakeBoldText to check if the stroke width is increased to approximate bold text
    OH_Drawing_FontSetFakeBoldText(font, true);
    isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isFakeBoldText, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetFakeBoldTextNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Pass nullptr as the first parameter to OH_Drawing_FontSetFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetFakeBoldText(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Pass nullptr as the parameter to OH_Drawing_FontIsFakeBoldText and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsFakeBoldText(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetFakeBoldTextMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetFakeBoldText 10 times, and call OH_Drawing_FontIsFakeBoldText each time to check if the
    // stroke width is increased to approximate bold text
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetFakeBoldText(font, i % DRAWING_NUMBER_2 == 0);
        bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isFakeBoldText, i % DRAWING_NUMBER_2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsFakeBoldTextWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsFakeBoldText
    bool isFakeBoldText = OH_Drawing_FontIsFakeBoldText(font);
    EXPECT_EQ(isFakeBoldText, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetScaleXNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 10, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(scaleX, DRAWING_NUMBER_10);
    // 3. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to 0.55, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, 0.55f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    scaleX = OH_Drawing_FontGetScaleX(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(IsScalarAlmostEqual(scaleX, 0.55f), true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetScaleXNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetScaleX(nullptr, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_FontSetScaleX with 0 as the second parameter
    OH_Drawing_FontSetScaleX(font, 0);
    // 4. Call OH_Drawing_FontGetScaleX with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetScaleX(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetScaleXMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX 10 times (with random values for scaleX parameter), and call
    // OH_Drawing_FontGetScaleX each time to get the text scale on the x-axis
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_30);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        float val = dis(gen);
        OH_Drawing_FontSetScaleX(font, val);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        float scaleX = OH_Drawing_FontGetScaleX(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(scaleX, val);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetScaleXWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, DRAWING_NUMBER_1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetScaleXAbnormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to -1, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, -DRAWING_NUMBER_1);
    float scaleX = OH_Drawing_FontGetScaleX(font);
    EXPECT_EQ(scaleX, -DRAWING_NUMBER_1);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetScaleXMaximum()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetScaleX interface with scaleX parameter set to FLT_MAX, and then call
    // OH_Drawing_FontGetScaleX to get the text scale on the x-axis
    OH_Drawing_FontSetScaleX(font, FLT_MAX);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetHintingNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetHinting enum value OH_Drawing_FontHinting coverage verification, call
    // OH_Drawing_FontGetHinting to get the font outline effect enum type
    OH_Drawing_FontHinting hinting[] = {
        FONT_HINTING_NONE,
        FONT_HINTING_SLIGHT,
        FONT_HINTING_NORMAL,
        FONT_HINTING_FULL,
    };
    for (OH_Drawing_FontHinting h : hinting) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetHinting(font, h);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(hinting2, h);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetHintingNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetHinting with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetHinting(nullptr, FONT_HINTING_NONE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetHinting with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetHinting(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetHintingMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetHinting 10 times (with random enum values), and call OH_Drawing_FontGetHinting each
    // time to get the font outline effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, DRAWING_NUMBER_3);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontHinting hinting = static_cast<OH_Drawing_FontHinting>(dis(gen));
        OH_Drawing_FontSetHinting(font, hinting);
        OH_Drawing_FontHinting hinting2 = OH_Drawing_FontGetHinting(font);
        EXPECT_EQ(hinting2, hinting);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetHintingWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetHinting
    OH_Drawing_FontHinting hinting = OH_Drawing_FontGetHinting(font);
    EXPECT_EQ(hinting, FONT_HINTING_NORMAL);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEmbeddedBitmapsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps with false as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Call OH_Drawing_FontSetEmbeddedBitmaps with true as the isEmbeddedBitmaps parameter, and call
    // OH_Drawing_FontIsEmbeddedBitmaps to check if the glyph is converted to a bitmap
    OH_Drawing_FontSetEmbeddedBitmaps(font, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmbeddedBitmaps, true);
    // 4. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEmbeddedBitmapsNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetEmbeddedBitmaps with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEmbeddedBitmaps(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontIsEmbeddedBitmaps(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEmbeddedBitmapsMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEmbeddedBitmaps 10 times, and call OH_Drawing_FontIsEmbeddedBitmaps each time to check
    // if the glyph is converted to a bitmap
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEmbeddedBitmaps(font, i % DRAWING_NUMBER_2 == 0);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmbeddedBitmaps, i % DRAWING_NUMBER_2 == 0);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontIsEmbeddedBitmapsWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontIsEmbeddedBitmaps
    bool isEmbeddedBitmaps = OH_Drawing_FontIsEmbeddedBitmaps(font);
    EXPECT_EQ(isEmbeddedBitmaps, false);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEdgingNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_FontSetEdging enum value OH_Drawing_FontEdging coverage verification, call OH_Drawing_FontGetEdging
    // to get the font edge effect enum type
    OH_Drawing_FontEdging edging[] = {
        FONT_EDGING_ALIAS,
        FONT_EDGING_ANTI_ALIAS,
        FONT_EDGING_SUBPIXEL_ANTI_ALIAS,
    };
    for (OH_Drawing_FontEdging e : edging) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontSetEdging(font, e);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging eDRAWING_NUMBER_2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(eDRAWING_NUMBER_2, e);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEdgingNULL()
{
    DrawingNativeFontTestSetUp();
    // 1. Call OH_Drawing_FontSetEdging with nullptr as the first parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetEdging(nullptr, FONT_EDGING_ALIAS);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_FontGetEdging with nullptr as the parameter and check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetEdging(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontSetEdgingMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontSetEdging 10 times (with random enum values), and call OH_Drawing_FontGetEdging each time
    // to get the font edge effect enum type
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, DRAWING_NUMBER_2);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_FontEdging edging = static_cast<OH_Drawing_FontEdging>(dis(gen));
        OH_Drawing_FontSetEdging(font, edging);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_FontEdging edgingDRAWING_NUMBER_2 = OH_Drawing_FontGetEdging(font);
        EXPECT_EQ(edgingDRAWING_NUMBER_2, edging);
    }
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetEdgingWhenNoSet()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_FontGetEdging
    OH_Drawing_FontEdging edging = OH_Drawing_FontGetEdging(font);
    EXPECT_EQ(edging, FONT_EDGING_ANTI_ALIAS);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Release memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetMetricsNormal()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. Get font measurement information
    float lineSpace = OH_Drawing_FontGetMetrics(font, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_FLOAT_EQ(lineSpace, 117.2f);
    EXPECT_EQ(metrics->flags, DRAWING_NUMBER_31);
    EXPECT_FLOAT_EQ(metrics->top, -105.6f);
    EXPECT_FLOAT_EQ(metrics->ascent, -92.7999954f);
    EXPECT_FLOAT_EQ(metrics->descent, 24.4f);
    EXPECT_FLOAT_EQ(metrics->bottom, 27.1f);
    EXPECT_FLOAT_EQ(metrics->leading, 0.000000f);
    EXPECT_FLOAT_EQ(metrics->avgCharWidth, 50.000000f);
    EXPECT_FLOAT_EQ(metrics->maxCharWidth, 248.6f);
    EXPECT_FLOAT_EQ(metrics->xMin, -54.8f);
    EXPECT_FLOAT_EQ(metrics->xMax, 193.8f);
    EXPECT_FLOAT_EQ(metrics->xHeight, 50.000000f);
    EXPECT_FLOAT_EQ(metrics->capHeight, 70.000000f);
    EXPECT_FLOAT_EQ(metrics->underlineThickness, 5.000000f);
    EXPECT_FLOAT_EQ(metrics->underlinePosition, 20.7f);
    EXPECT_FLOAT_EQ(metrics->strikeoutThickness, 5.000000f);
    EXPECT_FLOAT_EQ(metrics->strikeoutPosition, -30.0000019f);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetMetricsNull()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics passes a null pointer to the first argument
    float lineSpace = OH_Drawing_FontGetMetrics(nullptr, metrics);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -DRAWING_NUMBER_1);
    // 5. The function OH_Drawing_FontGetMetrics passes a null pointer to the second argument
    lineSpace = OH_Drawing_FontGetMetrics(font, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(lineSpace, -DRAWING_NUMBER_1);
    // 6. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontGetMetricsMultiplies()
{
    DrawingNativeFontTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Set font size
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_100);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // 3. Set default typeface
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Font_Metrics *metrics = (OH_Drawing_Font_Metrics *)malloc(sizeof(OH_Drawing_Font_Metrics));
    // 4. The function OH_Drawing_FontGetMetrics is called 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontGetMetrics(font, metrics);
    }
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. OH_Drawing_FontDestroy
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleCharacterNormal()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str single character,
    // UTF8 encoded Chinese/English characters
    float textWidth = 0;
    const char* strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    strOne = "我";
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    //3. All OH_Drawing_FontMeasureSingleCharacter parameters are entered normally, including str multi-character,
    // UTF8 encoded Chinese/English characters
    const char* strTwo = "你好";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    strTwo = "baby";
    OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    //4. free memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleCharacterNull()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. OH_Drawing_FontMeasureSingleCharacter with the parameter font as null
    float textWidth = 0;
    const char *strOne = "a";
    OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    //3. OH_Drawing_FontMeasureSingleCharacter with the parameter str as null
    OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    //4. OH_Drawing_FontMeasureSingleCharacter with the parameter textWidth as null
    OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    //5. free memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleCharacterMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    //2. OH_Drawing_FontMeasureSingleCharacter API is called 10 times as a normal input parameter
    const char *str[] = {
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"
    };
    float textWidth = 0;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontMeasureSingleCharacter(font, str[i], &textWidth);
    }
    //3. free memory
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasuretextNormal()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    //2. OH_Drawing_FontMeasureText enumeration traversal
    const void *text = "abc";
    const size_t byteLength = DRAWING_NUMBER_3;
    float textWidth = 0;
    OH_Drawing_TextEncoding encodes[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF16,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_4; i++) {
        errorCode = OH_Drawing_FontMeasureText(font, text, byteLength, encodes[i], bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    //3. OH_Drawing_FontMeasureText with the fifth parameter as null(normally)
    errorCode = OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    //4. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasuretextNull()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    // 2. Call OH_Drawing_FontMeasureText with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    const void *text = "abc";
    const size_t byteLength = DRAWING_NUMBER_3;
    float textWidth = 0;
    EXPECT_EQ(OH_Drawing_FontMeasureText(nullptr, text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_FontMeasureText with nullptr as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, nullptr, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_FontMeasureText with nullptr or 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, 0, TEXT_ENCODING_UTF8, bounds, &textWidth),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_FontMeasureText with nullptr as the sixth parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_FontMeasureText(font, text, byteLength, TEXT_ENCODING_UTF8, bounds, nullptr),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasuretextMultipleCalls()
{
    DrawingNativeFontTestSetUp();
    //1. OH_Drawing_FontCreate
    OH_Drawing_Font *fonts[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        fonts[i] = OH_Drawing_FontCreate();
        // add assert
        EXPECT_NE(fonts[i], nullptr);
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(bounds, nullptr);
    //2. Call OH_Drawing_FontMeasureText 10 times
    const void *text = "abc";
    const size_t byteLength = DRAWING_NUMBER_3;
    float textWidth = 0;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_FontMeasureText(fonts[i], text, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    //3. free memory
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_FontDestroy(fonts[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(bounds);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFontMeasureSingleCharacter()
{
    DrawingNativeFontTestSetUp();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_FontSetTextSize(font, DRAWING_NUMBER_50);
    const char* strOne = "a";
    const char* strTwo = "你好";
    float textWidth = 0;
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_SUCCESS;
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(nullptr, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, nullptr, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, nullptr);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    const char* strThree = "";
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strThree, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(textWidth, 0.f);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strOne, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    drawingErrorCode = OH_Drawing_FontMeasureSingleCharacter(font, strTwo, &textWidth);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    EXPECT_TRUE(textWidth > 0);
    OH_Drawing_FontDestroy(font);
    DrawingNativeFontTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
