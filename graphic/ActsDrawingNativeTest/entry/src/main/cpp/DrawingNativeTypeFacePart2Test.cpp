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
constexpr int TEST_LOOP_COUNT_10 = 10;
} // namespace

static std::string GetItalicFontPath()
{
    std::string part1 = "Har";
    std::string part2 = "monyOS";
    std::string part3 = "_Sans_Italic.ttf";
    return "/system/fonts/" + part1 + part2 + part3;
}

// Common SetUp and TearDown functions implementation
void DrawingNativeTypeFacePart2TestSetUp()
{
    std::cout << "DrawingNativeTypeFacePart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTypeFacePart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeTypeFacePart2TestTearDown()
{
    std::cout << "DrawingNativeTypeFacePart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeTypeFacePart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testTypefaceIsBoldNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600
 * @tc.desc   test for testTypefaceIsBoldNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceIsBoldNormal()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf",
                                                                       TYPEFACE_INDEX_0);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromFile(GetItalicFontPath().c_str(),
                                                                       TYPEFACE_INDEX_0);
    bool isBold = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(typeface1, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isBold, true);
    errorCode = OH_Drawing_TypefaceIsBold(typeface2, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isBold, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceIsBoldNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700
 * @tc.desc   test for testTypefaceIsBoldNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceIsBoldNull()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf",
                                                                       TYPEFACE_INDEX_0);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromFile(GetItalicFontPath().c_str(),
                                                                       TYPEFACE_INDEX_0);
    bool isBold = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(nullptr, &isBold);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isBold, false);
    errorCode = OH_Drawing_TypefaceIsBold(typeface2, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isBold, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceIsBoldMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800
 * @tc.desc   test for testTypefaceIsBoldMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceIsBoldMultipleCalls()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf",
                                                                      TYPEFACE_INDEX_0);
    bool isBold = false;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsBold(typeface, &isBold);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isBold, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceIsItalicNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900
 * @tc.desc   test for testTypefaceIsItalicNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceIsItalicNormal()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf",
                                                                       TYPEFACE_INDEX_0);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromFile(GetItalicFontPath().c_str(),
                                                                       TYPEFACE_INDEX_0);
    bool isItalic = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(typeface1, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isItalic, false);
    errorCode = OH_Drawing_TypefaceIsItalic(typeface2, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isItalic, true);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceIsItalicNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000
 * @tc.desc   test for testTypefaceIsItalicNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestTypefaceIsItalicNull()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface1 = OH_Drawing_TypefaceCreateFromFile("/system/fonts/NotoSansBengaliUI-Bold.ttf",
                                                                       TYPEFACE_INDEX_0);
    OH_Drawing_Typeface* typeface2 = OH_Drawing_TypefaceCreateFromFile(GetItalicFontPath().c_str(),
                                                                       TYPEFACE_INDEX_0);
    bool isItalic = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(nullptr, &isItalic);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isItalic, false);
    errorCode = OH_Drawing_TypefaceIsItalic(typeface2, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isItalic, false);
    OH_Drawing_TypefaceDestroy(typeface1);
    OH_Drawing_TypefaceDestroy(typeface2);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testTypefaceIsItalicMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100
 * @tc.desc   test for testTypefaceIsItalicMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestTypefaceIsItalicMultipleCalls()
{
    DrawingNativeTypeFacePart2TestSetUp();

    OH_Drawing_Typeface* typeface = OH_Drawing_TypefaceCreateFromFile(GetItalicFontPath().c_str(),
                                                                      TYPEFACE_INDEX_0);
    bool isItalic = false;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_TypefaceIsItalic(typeface, &isItalic);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isItalic, true);
    }
    OH_Drawing_TypefaceDestroy(typeface);

    DrawingNativeTypeFacePart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS