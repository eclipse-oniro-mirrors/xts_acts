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

#include "include/DrawingNativeTypeFaceTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TYPEFACE_INDEX_0 = 0;
constexpr int TYPEFACE_INDEX_NEGATIVE_1 = -1;
constexpr int TYPEFACE_STREAM_INDEX_1 = 1;
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_FONT_VARIATION_VALUE_0 = 0;
constexpr int TEST_FONT_VARIATION_VALUE_100 = 100;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeTypeFaceTestSetUp()
{
    std::cout << "DrawingNativeTypeFaceTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTypeFaceTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeTypeFaceTestTearDown()
{
    std::cout << "DrawingNativeTypeFaceTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTypeFaceTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testTypefaceCreateDefaultNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0100
 * @tc.desc   test for testTypefaceCreateDefaultNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateDefaultNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface* typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateDefaultNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0200
 * @tc.desc   test for testTypefaceCreateDefaultNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateDefaultNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 2. OH_Drawing_FontSetTypeface, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_FontSetTypeface, pass nullptr as the second parameter
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface* typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. OH_Drawing_FontGetTypeface, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontGetTypeface(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0300
 * @tc.desc   test for testTypefaceCreateFromFileNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateFromFileNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface* typefaceFromFile =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", TYPEFACE_INDEX_0);
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typefaceFromFile);
    OH_Drawing_Typeface* typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. When the index value is negative, count from the end of the sequence
    OH_Drawing_Typeface* typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", TYPEFACE_INDEX_NEGATIVE_1);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface* typefaceGet2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet2, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0400
 * @tc.desc   test for testTypefaceCreateFromFileNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromFileNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface* typefaceFromFile = OH_Drawing_TypefaceCreateFromFile(nullptr, TYPEFACE_INDEX_0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the second parameter
    OH_Drawing_Typeface* typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", TYPEFACE_INDEX_0);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface* typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface* typefaceFromFile3 = OH_Drawing_TypefaceCreateFromFile(nullptr, TYPEFACE_INDEX_0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
    OH_Drawing_TypefaceDestroy(typefaceFromFile3);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromStreamNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0500
 * @tc.desc   test for testTypefaceCreateFromStreamNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateFromStreamNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_MemoryStream
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream* memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    EXPECT_TRUE(memoryStream != nullptr);
    // 3. OH_Drawing_TypefaceCreateFromStream
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromStream(memoryStream, TYPEFACE_STREAM_INDEX_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Typeface* typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromStreamNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0600
 * @tc.desc   test for testTypefaceCreateFromStreamNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromStreamNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream* memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    // 2. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromStream(nullptr, TYPEFACE_STREAM_INDEX_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the second parameter
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromStream(memoryStream, TYPEFACE_INDEX_0);
    // 4. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface* typeface3 = OH_Drawing_TypefaceCreateFromStream(nullptr, TYPEFACE_INDEX_0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    OH_Drawing_TypefaceDestroy(typeface3);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0700
 * @tc.desc   test for testTypefaceCreateDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateDestroyNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 2. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0800
 * @tc.desc   test for testTypefaceCreateDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateDestroyNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0900
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateFromFileWithArugumentsNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments
    OH_Drawing_Typeface* typeface =
        OH_Drawing_TypefaceCreateFromFileWithArguments("/system/fonts/NotoSansBengaliUI-Regular", fontArguments);
    // 4. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 5. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01000
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromFileWithArugumentsNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments,the first parameter is nullptr,return nullptr
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFileWithArguments(nullptr, fontArguments);
    EXPECT_EQ(typeface, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFileWithArguments,the second parameter is nullptr,return nullptr
    OH_Drawing_Typeface* typeface1 =
        OH_Drawing_TypefaceCreateFromFileWithArguments("/system/fonts/NotoSansBengaliUI-Regular", nullptr);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 6. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01100
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromFileWithArugumentsAbnormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments,the first parameter is nullptr,return nullptr
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFileWithArguments("", fontArguments);
    EXPECT_EQ(typeface, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFileWithArguments,the second parameter is nullptr,return nullptr
    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromFileWithArguments("aaa", nullptr);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 6. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01200
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromFileWithArugumentsMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments
    OH_Drawing_Typeface* typeface = nullptr;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        typeface =
            OH_Drawing_TypefaceCreateFromFileWithArguments("/system/fonts/NotoSansBengaliUI-Regular", fontArguments);
    }
    // 4. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 5. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromCurrentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01300
 * @tc.desc   test for testTypefaceCreateFromCurrentNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceCreateFromCurrentNormal()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular",
                                                                      TYPEFACE_INDEX_0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent
    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromCurrent(typeface, fontArguments);
    // add assert
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceDestroy typeface1
    OH_Drawing_TypefaceDestroy(typeface1);
    // 6. OH_Drawing_TypefaceDestroy typeface
    OH_Drawing_TypefaceDestroy(typeface);
    // 7. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromCurrentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01400
 * @tc.desc   test for testTypefaceCreateFromCurrentNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromCurrentNull()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular",
                                                                      TYPEFACE_INDEX_0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent,the first parameter is nullptr
    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromCurrent(nullptr, fontArguments);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceCreateFromCurrent,the second parameter is nullptr
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromCurrent(typeface, nullptr);
    EXPECT_EQ(typeface2, nullptr);
    // 6. OH_Drawing_TypefaceDestroy typeface1
    OH_Drawing_TypefaceDestroy(typeface1);
    // 7. OH_Drawing_TypefaceDestroy typeface
    OH_Drawing_TypefaceDestroy(typeface);
    // 8. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceCreateFromCurrentMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01500
 * @tc.desc   test for testTypefaceCreateFromCurrentMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceCreateFromCurrentMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();

    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular",
                                                                      TYPEFACE_INDEX_0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments* fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", TEST_FONT_VARIATION_VALUE_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent
    OH_Drawing_Typeface* typeface1 = nullptr;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        typeface1 = OH_Drawing_TypefaceCreateFromCurrent(typeface, fontArguments);
    }
    // 5. OH_Drawing_TypefaceDestroy typeface1
    OH_Drawing_TypefaceDestroy(typeface1);
    // 6. OH_Drawing_TypefaceDestroy typeface
    OH_Drawing_TypefaceDestroy(typeface);
    // 7. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);

    DrawingNativeTypeFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS