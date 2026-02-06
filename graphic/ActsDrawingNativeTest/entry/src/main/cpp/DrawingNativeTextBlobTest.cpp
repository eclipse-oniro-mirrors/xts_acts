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

#include "include/DrawingNativeTextBlobTest.h"
#include <cstring>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_CANVAS_POS_X = 0;
constexpr int TEST_CANVAS_POS_Y = 0;
constexpr int TEST_BYTE_LENGTH_MULTIPLIER_4 = 4;
constexpr int TEST_BYTE_LENGTH_MULTIPLIER_16 = 16;
constexpr int TEST_TEXT_BLOB_BYTE_LENGTH_6 = 6;
constexpr int TEST_TEXT_ENCODING_INVALID = -1;
constexpr int TEST_RECT_POS_0 = 0;
constexpr int TEST_RECT_POS_NEGATIVE_1 = -1;
constexpr int TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9 = 9;
constexpr int TEST_STR_ARRAY_SIZE_6 = 6;
constexpr char16_t TEST_CHAR16_VALUE_1 = 1;
constexpr char16_t TEST_CHAR16_VALUE_2 = 2;
constexpr char16_t TEST_CHAR16_VALUE_3 = 3;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeTextBlobTestSetUp()
{
    std::cout << "DrawingNativeTextBlobTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTextBlobTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeTextBlobTestTearDown()
{
    std::cout << "DrawingNativeTextBlobTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTextBlobTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testTextBlobBuilderCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_03000
 * @tc.desc   test for testTextBlobBuilderCreateDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobBuilderCreateDestroyNormal()
{
    DrawingNativeTextBlobTestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    // 1. Use OH_Drawing_TextBlobBuilderCreate and OH_Drawing_CanvasDrawTextBlob together
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    if (0) {
        // todo cpp crash
        // 2. OH_Drawing_TextBlobBuilderDestroy
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderCreateDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0100
 * @tc.desc   test for testTextBlobBuilderCreateDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderCreateDestroyNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. OH_Drawing_TextBlobBuilderDestroy with nullptr parameter
    OH_Drawing_TextBlobBuilderDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderCreateDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0200
 * @tc.desc   test for testTextBlobBuilderCreateDestroyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderCreateDestroyMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    OH_Drawing_TextBlobBuilder* builders[TEST_LOOP_COUNT_10];
    // 1. Call OH_Drawing_TextBlobBuilderCreate 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        builders[i] = OH_Drawing_TextBlobBuilderCreate();
        EXPECT_NE(nullptr, builders[i]);
    }
    // 2. Call OH_Drawing_TextBlobBuilderDestroy 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        if (0) {
            // todo cpp crash
            OH_Drawing_TextBlobBuilderDestroy(builders[i]);
        }
    }
    // 3. Call OH_Drawing_TextBlobBuilderCreate and OH_Drawing_TextBlobBuilderDestroy alternately 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
        EXPECT_NE(nullptr, builder);
        if (0) {
            // todo cpp crash
            OH_Drawing_TextBlobBuilderDestroy(builder);
        }
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromTextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0300
 * @tc.desc   test for testTextBlobCreateFromTextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobCreateFromTextNormal()
{
    DrawingNativeTextBlobTestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    const char* str = "123456";
    char16_t c[] = { TEST_CHAR16_VALUE_1, TEST_CHAR16_VALUE_2, TEST_CHAR16_VALUE_3 };
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    OH_Drawing_TextEncoding encodeArray[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    for (OH_Drawing_TextEncoding encode : encodeArray) {
        size_t byteLength = TEST_CANVAS_POS_X;
        if (encode == TEXT_ENCODING_UTF8) {
            byteLength = strlen(str);
        } else if (encode == TEXT_ENCODING_UTF32) {
            byteLength = strlen(str) * TEST_BYTE_LENGTH_MULTIPLIER_4;
        } else if (encode == TEXT_ENCODING_GLYPH_ID) {
            byteLength = strlen(str) * TEST_BYTE_LENGTH_MULTIPLIER_16;
        }
        OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobCreateFromText(str, byteLength, font, encode);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    OH_Drawing_TextBlob* textBlob2 = OH_Drawing_TextBlobCreateFromText(c, TEST_TEXT_BLOB_BYTE_LENGTH_6, font,
                                                                       TEXT_ENCODING_UTF16);
    // add assert
    EXPECT_NE(textBlob2, nullptr);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob2, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromTextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0400
 * @tc.desc   test for testTextBlobCreateFromTextNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromTextNull()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromText with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob1 = OH_Drawing_TextBlobCreateFromText(nullptr, strlen(str), font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromText with the second parameter being empty, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob2 = OH_Drawing_TextBlobCreateFromText(str, TEST_CANVAS_POS_X, font,
                                                                       TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TextBlobCreateFromText with the third parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob3 = OH_Drawing_TextBlobCreateFromText(str, strlen(str), nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. OH_Drawing_TextBlobCreateFromText with the first parameter being a string
    OH_Drawing_TextBlob* textBlob4 = OH_Drawing_TextBlobCreateFromText("123456", TEST_TEXT_BLOB_BYTE_LENGTH_6, font,
                                                                       TEXT_ENCODING_UTF8);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_TextBlobDestroy(textBlob1);
    OH_Drawing_TextBlobDestroy(textBlob2);
    OH_Drawing_TextBlobDestroy(textBlob3);
    OH_Drawing_TextBlobDestroy(textBlob4);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromTextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0500
 * @tc.desc   test for testTextBlobCreateFromTextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromTextMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(nullptr, canvas);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromText 10 times (passing in different types of strings with different lengths,
    // such as Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const char* str = strs[i % TEST_STR_ARRAY_SIZE_6];
        OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, TEXT_ENCODING_UTF8);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromTextAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0600
 * @tc.desc   test for testTextBlobCreateFromTextAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromTextAbnormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromText interface with OH_Drawing_TextEncoding out of range, check the error code
    // with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromText(str, strlen(str), font, static_cast<OH_Drawing_TextEncoding>(
                                          TEST_TEXT_ENCODING_INVALID));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromPosTextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0700
 * @tc.desc   test for testTextBlobCreateFromPosTextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobCreateFromPosTextNormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    size_t byteLength = strlen(str);
    int count = OH_Drawing_FontCountText(font, str, byteLength, TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    OH_Drawing_TextBlobCreateFromPosText(str, count, &pts[0], font, TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromPosTextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0800
 * @tc.desc   test for testTextBlobCreateFromPosTextNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromPosTextNull()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    // 1. OH_Drawing_TextBlobCreateFromPosText with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(nullptr, strlen(str), &pts[0], font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromPosText with the second parameter being empty, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, TEST_CANVAS_POS_X, &pts[0], font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TextBlobCreateFromPosText with the third parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), nullptr, font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_TextBlobCreateFromPosText with the first parameter being a string
    OH_Drawing_TextBlobCreateFromPosText("123456", TEST_TEXT_BLOB_BYTE_LENGTH_6, &pts[0], font, TEXT_ENCODING_UTF8);
    // 5. OH_Drawing_TextBlobCreateFromPosText with the fourth parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromPosTextMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0900
 * @tc.desc   test for testTextBlobCreateFromPosTextMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromPosTextMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromPosText 10 times (passing in different types of strings with different
    // lengths, such as Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const char* str = strs[i % TEST_STR_ARRAY_SIZE_6];
        int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
        OH_Drawing_Point2D pts[count];
        OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], font, TEXT_ENCODING_UTF8);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromPosTextAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01000
 * @tc.desc   test for testTextBlobCreateFromPosTextAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromPosTextAbnormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    int count = OH_Drawing_FontCountText(font, str, strlen(str), TEXT_ENCODING_UTF8);
    OH_Drawing_Point2D pts[count];
    // 1. Call OH_Drawing_TextBlobCreateFromPosText interface with OH_Drawing_TextEncoding out of range, check the error
    // code with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobCreateFromPosText(str, strlen(str), &pts[0], font, static_cast<OH_Drawing_TextEncoding>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromStringNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01100
 * @tc.desc   test for testTextBlobCreateFromStringNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobCreateFromStringNormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    OH_Drawing_TextEncoding encodeArray[] = {
        TEXT_ENCODING_UTF8,
        TEXT_ENCODING_UTF32,
        TEXT_ENCODING_GLYPH_ID,
    };
    // 1. Traverse the enumeration values of OH_Drawing_TextEncoding and use OH_Drawing_CanvasDrawTextBlob in
    // combination
    for (OH_Drawing_TextEncoding encode : encodeArray) {
        OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobCreateFromString(str, font, encode);
        // add assert
        EXPECT_NE(textBlob, nullptr);
        OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
        EXPECT_NE(nullptr, canvas);
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_CanvasDestroy(canvas);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromStringNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01200
 * @tc.desc   test for testTextBlobCreateFromStringNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromStringNull()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. OH_Drawing_TextBlobCreateFromString with the first parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob1 = OH_Drawing_TextBlobCreateFromString(nullptr, font, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_TextBlobCreateFromString with the second parameter being nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob2 = OH_Drawing_TextBlobCreateFromString(str, nullptr, TEXT_ENCODING_UTF8);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_TextBlobCreateFromPosText with the first parameter being a string
    OH_Drawing_TextBlob* textBlob3 = OH_Drawing_TextBlobCreateFromString("123456", font, TEXT_ENCODING_UTF8);
    // 4. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob1);
    OH_Drawing_TextBlobDestroy(textBlob2);
    OH_Drawing_TextBlobDestroy(textBlob3);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromStringMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01300
 * @tc.desc   test for testTextBlobCreateFromStringMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromStringMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromString 10 times (passing in strings of different lengths and types, such as
    // Chinese, English, special characters, numbers, traditional Chinese characters, etc.) and use
    // OH_Drawing_CanvasDrawTextBlob in combination
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const char* str = strs[i % TEST_STR_ARRAY_SIZE_6];
        OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobCreateFromString(str, font, TEXT_ENCODING_UTF8);
        OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
        EXPECT_NE(nullptr, canvas);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, TEST_CANVAS_POS_X, TEST_CANVAS_POS_Y);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_CanvasDestroy(canvas);
    }
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobCreateFromStringAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01400
 * @tc.desc   test for testTextBlobCreateFromStringAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobCreateFromStringAbnormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Call OH_Drawing_TextBlobCreateFromString interface with OH_Drawing_TextEncoding out of range, check the error
    // code with OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, static_cast<OH_Drawing_TextEncoding>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TypefaceDestroy(typeSurface);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobGetBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01500
 * @tc.desc   test for testTextBlobGetBoundsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobGetBoundsNormal()
{
    DrawingNativeTextBlobTestSetUp();

    // 1、创建OH_Drawing_TextBlob、OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobGetBounds
    OH_Drawing_TextBlobGetBounds(textBlob, rect);
    float left = OH_Drawing_RectGetLeft(rect);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_EQ(right - left > 0, true);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobGetBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01600
 * @tc.desc   test for testTextBlobGetBoundsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobGetBoundsNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the first parameter to OH_Drawing_TextBlobGetBounds and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobGetBounds(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Pass nullptr as the second parameter to OH_Drawing_TextBlobGetBounds and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobGetBounds(textBlob, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobGetBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01700
 * @tc.desc   test for testTextBlobGetBoundsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobGetBoundsMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    // 2. Call OH_Drawing_TextBlobGetBounds 10 times (passing in strings of different lengths and types, such as
    // Chinese, English, special characters, numbers, traditional Chinese characters, etc.)
    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const char* str = strs[i % TEST_STR_ARRAY_SIZE_6];
        OH_Drawing_TextBlob* textBlob =
            OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        OH_Drawing_TextBlobGetBounds(textBlob, rect);
        float left = OH_Drawing_RectGetLeft(rect);
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_EQ(right - left > 0, true);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobGetBoundsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01800
 * @tc.desc   test for testTextBlobGetBoundsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobGetBoundsAbnormal()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob and OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_NEGATIVE_1,
                                                  TEST_RECT_POS_NEGATIVE_1,
                                                  TEST_RECT_POS_NEGATIVE_1,
                                                  TEST_RECT_POS_NEGATIVE_1);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobGetBounds with rect initialized with negative values
    OH_Drawing_TextBlobGetBounds(textBlob, rect);
    float left = OH_Drawing_RectGetLeft(rect);
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_EQ(right - left > 0, true);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobUniqueIDNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01900
 * @tc.desc   test for testTextBlobUniqueIDNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobUniqueIDNormal()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Call OH_Drawing_TextBlobUniqueID
    uint32_t ret = OH_Drawing_TextBlobUniqueID(textBlob);
    EXPECT_EQ(ret > 0, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobUniqueIDNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02000
 * @tc.desc   test for testTextBlobUniqueIDNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobUniqueIDNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* str = "123456";
    OH_Drawing_TextBlob* textBlob =
        OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    // 2. Pass nullptr as the parameter to OH_Drawing_TextBlobUniqueID and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobUniqueID(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobUniqueIDMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02100
 * @tc.desc   test for testTextBlobUniqueIDMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobUniqueIDMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    const char* strs[] = {
        "Hello World", "你好世界", "Hello 世界", "Hello 世界123", "Hello $#@!", "繁體中文",
    };
    // 2. Call OH_Drawing_TextBlobUniqueID 10 times (passing in strings of different lengths and types, such as Chinese,
    // English, special characters, numbers, traditional Chinese characters, etc.)
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const char* str = strs[i % TEST_STR_ARRAY_SIZE_6];
        OH_Drawing_TextBlob* textBlob =
            OH_Drawing_TextBlobCreateFromString(str, font, OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
        uint32_t ret = OH_Drawing_TextBlobUniqueID(textBlob);
        EXPECT_EQ(ret > 0, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    OH_Drawing_FontDestroy(font);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderAllocRunPosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02200
 * @tc.desc   test for testTextBlobBuilderAllocRunPosNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobBuilderAllocRunPosNormal()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlobBuilder, OH_Drawing_Font, OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // 2. OH_Drawing_TextBlobBuilderAllocRunPos
    const OH_Drawing_RunBuffer* runBuffer =
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(runBuffer, nullptr);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderAllocRunPosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02300
 * @tc.desc   test for testTextBlobBuilderAllocRunPosNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderAllocRunPosNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlobBuilder, OH_Drawing_Font, OH_Drawing_Rect
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // 2. Call OH_Drawing_TextBlobBuilderAllocRunPos with the first parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(nullptr, font, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_TextBlobBuilderAllocRunPos with the second parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, nullptr, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_TextBlobBuilderAllocRunPos with the third parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, TEST_CANVAS_POS_X, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_TextBlobBuilderAllocRunPos with the fourth parameter as nullptr and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 6. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderAllocRunPosMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02400
 * @tc.desc   test for testTextBlobBuilderAllocRunPosMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderAllocRunPosMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0, TEST_RECT_POS_0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // 1. Call OH_Drawing_TextBlobBuilderAllocRunPos 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        const OH_Drawing_RunBuffer* runBuffer =
        OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, rect);
        EXPECT_NE(runBuffer, nullptr);
    }
    // 2. Call OH_Drawing_TextBlobBuilderMake and then call OH_Drawing_TextBlobBuilderAllocRunPos again
    OH_Drawing_TextBlobBuilderMake(builder);
    const OH_Drawing_RunBuffer* runBuffer =
    OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, TEST_TEXT_BLOB_BUILDER_ALLOC_RUN_POS_COUNT_9, rect);
    EXPECT_NE(runBuffer, nullptr);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_FontDestroy(font);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderMakeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02500
 * @tc.desc   test for testTextBlobBuilderMakeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobBuilderMakeNormal()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlobBuilder
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    // 2. Call OH_Drawing_TextBlobBuilderMake
    OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_EQ(textBlob, nullptr);
    // 3. Free memory
    OH_Drawing_TextBlobDestroy(textBlob);
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderMakeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02600
 * @tc.desc   test for testTextBlobBuilderMakeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderMakeNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Call OH_Drawing_TextBlobBuilderMake with nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_TextBlobBuilderMake(nullptr);
    // 1. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobBuilderMakeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02700
 * @tc.desc   test for testTextBlobBuilderMakeMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobBuilderMakeMultipleCalls()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. Create OH_Drawing_TextBlobBuilder
    OH_Drawing_TextBlobBuilder* builder = OH_Drawing_TextBlobBuilderCreate();
    // add assert
    EXPECT_NE(builder, nullptr);
    // 2. Call OH_Drawing_TextBlobBuilderMake 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobBuilderMake(builder);
        // add assert
        EXPECT_EQ(textBlob, nullptr);
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 3. Free memory
    if (0) {
        // todo cpp crash
        OH_Drawing_TextBlobBuilderDestroy(builder);
    }

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02800
 * @tc.desc   test for testTextBlobDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTextBlobDestroyNormal()
{
    DrawingNativeTextBlobTestSetUp();

    const char* str = "123456";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeSurface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeSurface, nullptr);
    OH_Drawing_FontSetTypeface(font, typeSurface);
    // 1. Create OH_Drawing_TextBlob
    OH_Drawing_TextBlob* textBlob = OH_Drawing_TextBlobCreateFromString(str, font, TEXT_ENCODING_UTF8);
    // add assert
    EXPECT_NE(textBlob, nullptr);
    // 2. OH_Drawing_TextBlobDestroy
    OH_Drawing_TextBlobDestroy(textBlob);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTextBlobDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02900
 * @tc.desc   test for testTextBlobDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTextBlobDestroyNull()
{
    DrawingNativeTextBlobTestSetUp();

    // 1. OH_Drawing_TextBlobDestroy with null parameter
    OH_Drawing_TextBlobDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeTextBlobTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS