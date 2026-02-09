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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeTypeFaceTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeTypeFaceTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeTypeFaceTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeTypeFaceTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeTypeFaceTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testTypefaceCreateDefaultNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0100
 * @tc.desc   test for testTypefaceCreateDefaultNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDefaultNormal, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceCreateDefaultNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0101
 * @tc.desc   test for testTypefaceCreateDefaultNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDefaultNull, Function | SmallTest | Level3) {
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
}

/**
 * @tc.name   testTypefaceCreateFromFileNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0200
 * @tc.desc   test for testTypefaceCreateFromFileNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileNormal, Function | SmallTest | Level0) {
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
        OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Regular", -1);
    OH_Drawing_FontSetTypeface(font, typefaceFromFile2);
    OH_Drawing_Typeface *typefaceGet2 = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet2, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typefaceFromFile);
    OH_Drawing_TypefaceDestroy(typefaceFromFile2);
}

/**
 * @tc.name   testTypefaceCreateFromFileNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0201
 * @tc.desc   test for testTypefaceCreateFromFileNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileNull, Function | SmallTest | Level3) {
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
}

/**
 * @tc.name   testTypefaceCreateFromStreamNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0300
 * @tc.desc   test for testTypefaceCreateFromStreamNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromStreamNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 2. OH_Drawing_MemoryStream
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    ASSERT_TRUE(memoryStream != nullptr);
    // 3. OH_Drawing_TypefaceCreateFromStream
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromStream(memoryStream, 1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_FontSetTypeface, call OH_Drawing_FontGetTypeface to get the typeface object
    OH_Drawing_FontSetTypeface(font, typeface);
    OH_Drawing_Typeface *typefaceGet = OH_Drawing_FontGetTypeface(font);
    EXPECT_NE(typefaceGet, nullptr);
    // 5. Free memory
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testTypefaceCreateFromStreamNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0301
 * @tc.desc   test for testTypefaceCreateFromStreamNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromStreamNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontCreate
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    char testData[] = "Hello";
    size_t length = sizeof(testData) - 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(testData, length, false);
    // 2. OH_Drawing_TypefaceCreateFromStream, pass nullptr as the first parameter and check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Typeface *typeface1 = OH_Drawing_TypefaceCreateFromStream(nullptr, 1);
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
}

/**
 * @tc.name   testTypefaceCreateDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0400
 * @tc.desc   test for testTypefaceCreateDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDestroyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_TypefaceCreateDefault
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    // add assert
    EXPECT_NE(typeface, nullptr);
    // 2. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testTypefaceCreateDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0401
 * @tc.desc   test for testTypefaceCreateDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateDestroyNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0500
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileWithArugumentsNormal, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0501
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileWithArugumentsNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
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
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0502
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileWithArugumentsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_FontArgumentsCreate
    OH_Drawing_FontArguments *fontArguments = OH_Drawing_FontArgumentsCreate();
    // add assert
    EXPECT_NE(fontArguments, nullptr);
    // 2. OH_Drawing_FontArgumentsAddVariation, should return OH_DRAWING_SUCCESS
    OH_Drawing_ErrorCode drawingErrorCode = OH_DRAWING_ERROR_INVALID_PARAMETER;
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
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
}

/**
 * @tc.name   testTypefaceCreateFromFileWithArugumentsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0503
 * @tc.desc   test for testTypefaceCreateFromFileWithArugumentsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromFileWithArugumentsMultipleCalls, Function | SmallTest | Level3) {
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
    for (int i = 0; i < NUMBER_10; i++)
    {
        typeface = OH_Drawing_TypefaceCreateFromFileWithArguments(
            "/system/fonts/NotoSansBengaliUI-Regular", fontArguments);
    }
    // 4. OH_Drawing_TypefaceDestroy
    OH_Drawing_TypefaceDestroy(typeface);
    // 5. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
}

/**
 * @tc.name   testTypefaceCreateFromCurrentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0600
 * @tc.desc   test for testTypefaceCreateFromCurrentNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromCurrentNormal, Function | SmallTest | Level0) {
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
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
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
}

/**
 * @tc.name   testTypefaceCreateFromCurrentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0601
 * @tc.desc   test for testTypefaceCreateFromCurrentNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromCurrentNull, Function | SmallTest | Level3) {
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
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
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
}

/**
 * @tc.name   testTypefaceCreateFromCurrentMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0602
 * @tc.desc   test for testTypefaceCreateFromCurrentMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceCreateFromCurrentMultipleCalls, Function | SmallTest | Level3) {
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
    drawingErrorCode = OH_Drawing_FontArgumentsAddVariation(fontArguments, "wght", NUMBER_100);
    EXPECT_EQ(drawingErrorCode, OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_TypefaceCreateFromCurrent
    OH_Drawing_Typeface *typeface1 = nullptr;
    for (int i = 0; i < NUMBER_10; i++)
    {
        typeface1 = OH_Drawing_TypefaceCreateFromCurrent(typeface, fontArguments);
    }
    // 5. OH_Drawing_TypefaceDestroy typeface1
    OH_Drawing_TypefaceDestroy(typeface1);
    // 6. OH_Drawing_TypefaceDestroy typeface
    OH_Drawing_TypefaceDestroy(typeface);
    // 7. OH_Drawing_FontArgumentsDestroy
    OH_Drawing_FontArgumentsDestroy(fontArguments);
}

/**
 * @tc.name   testTypefaceIsBoldNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0700
 * @tc.desc   test for testTypefaceIsBoldNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsBoldNormal, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceIsBoldNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0701
 * @tc.desc   test for testTypefaceIsBoldNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsBoldNull, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceIsBoldMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0702
 * @tc.desc   test for testTypefaceIsBoldMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsBoldMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf", 0);
    bool isBold = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(typeface, &isBold);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isBold, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);
}

/**
 * @tc.name   testTypefaceIsItalicNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0800
 * @tc.desc   test for testTypefaceIsItalicNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsItalicNormal, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceIsItalicNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0801
 * @tc.desc   test for testTypefaceIsItalicNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsItalicNull, Function | SmallTest | Level0) {
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
}

/**
 * @tc.name   testTypefaceIsItalicMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_TYPEFACE_0802
 * @tc.desc   test for testTypefaceIsItalicMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeTypeFaceTest, testTypefaceIsItalicMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/HarmonyOS_Sans_Italic.ttf", 0);
    bool isItalic = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(typeface, &isItalic);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isItalic, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS