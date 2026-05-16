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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestTypefaceCreateDefaultNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateDefaultNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 2. OH_Drawing_FontSetTypeface, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_FontSetTypeface(nullptr, typeface);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_FontSetTypeface, pass nullptr as the second parameter
    OH_Drawing_FontSetTypeface(font, nullptr);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
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

int TestTypefaceCreateFromFileNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_Typeface *typefaceFromFile =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    // 3. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typefaceFromFile);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. When the index value is negative, count from the end of the sequence
    OH_Drawing_Typeface *typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", -DRAWING_NUMBER_1);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface *typefaceGet2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet2, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromFileNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typefaceFromFile = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the second parameter
    OH_Drawing_Typeface *typefaceFromFile2 =
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFile, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typefaceFromFile3 = OH_Drawing_TypefaceCreateFromFile(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
    OH_Drawing_TypefaceDestroy(typefaceFromFile3);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromStreamNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_MemoryStream
    char testData[] = "Hello";
    size_t length = sizeof(testData) - DRAWING_NUMBER_1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    EXPECT_NE(memoryStream, nullptr);
    // 3. OH_Drawing_TypefaceCreateFromStream
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromStream(memoryStream, DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromStreamNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    char testData[] = "Hello";
    size_t length = sizeof(testData) - DRAWING_NUMBER_1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    // 2. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromStream(nullptr, DRAWING_NUMBER_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the second parameter
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromStream(memoryStream, 0);
    // 4. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface3 = OH_Drawing_TypefaceCreateFromStream(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    OH_Drawing_TypefaceDestroy(typeface3);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateDestroyNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 2. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateDestroyNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_TypefaceDestroy
    OH_Drawing_Typeface *typeface = nullptr;
    OH_Drawing_TypefaceDestroy(nullptr);
    EXPECT_EQ(typeface, nullptr);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromFileWithArugumentsNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFileWithArguments(
        "/system/fonts/NotoSansBengaliUI-Regular", fontArguments);
    // 4. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 5. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromFileWithArugumentsNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments,the first parameter is nullptr,return nullptr
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFileWithArguments(nullptr, fontArguments);
    EXPECT_EQ(typeface, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFileWithArguments,the second parameter is nullptr,return nullptr
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFileWithArguments(
        "/system/fonts/NotoSansBengaliUI-Regular", nullptr);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 6. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromFileWithArugumentsAbnormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments,the first parameter is nullptr,return nullptr
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFileWithArguments("", fontArguments);
    EXPECT_EQ(typeface, nullptr);
    // 4. OH_Drawing_TypefaceCreateFromFileWithArguments,the second parameter is nullptr,return nullptr
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFileWithArguments("aaa", nullptr);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 6. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromFileWithArugumentsMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", 0);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_TypefaceCreateFromFileWithArguments
    OH_Drawing_Typeface *typeface = nullptr;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        typeface = OH_Drawing_TypefaceCreateFromFileWithArguments(
            "/system/fonts/NotoSansBengaliUI-Regular", fontArguments);
    }
    // 4. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 5. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceCreateFromCurrentNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromCurrent(typeface, fontArguments);
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

int TestTypefaceCreateFromCurrentNull()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent,the first parameter is nullptr
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromCurrent(nullptr, fontArguments);
    EXPECT_EQ(typeface1, nullptr);
    // 5. OH_Drawing_TypefaceCreateFromCurrent,the second parameter is nullptr
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromCurrent(typeface, nullptr);
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

int TestTypefaceCreateFromCurrentMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();
    // 1. OH_Drawing_TypefaceCreateFromFile
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 3. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", DRAWING_NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent
    OH_Drawing_Typeface *typeface1 = nullptr;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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

int TestTypefaceIsBoldNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isBold = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(typeface1, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isBold, true);
    errorCode = OH_Drawing_TypefaceIsBold(typeface2, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isBold, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceIsBoldNull()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isBold = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(nullptr, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isBold, false);
    errorCode = OH_Drawing_TypefaceIsBold(typeface2, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isBold, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceIsBoldMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    bool isBold = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(typeface, &isBold);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isBold, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceIsItalicNormal()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isItalic = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(typeface1, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isItalic, false);
    errorCode = OH_Drawing_TypefaceIsItalic(typeface2, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isItalic, true);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceIsItalicNull()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    OH_Drawing_Typeface *typeface2 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isItalic = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(nullptr, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isItalic, false);
    errorCode = OH_Drawing_TypefaceIsItalic(typeface2, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isItalic, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestTypefaceIsItalicMultipleCalls()
{
    DrawingNativeTypeFaceTestSetUp();
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isItalic = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(typeface, &isItalic);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isItalic, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);
    DrawingNativeTypeFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS