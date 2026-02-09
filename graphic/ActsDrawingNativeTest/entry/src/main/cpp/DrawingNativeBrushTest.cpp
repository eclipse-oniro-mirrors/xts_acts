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

#include "include/DrawingNativeBitmapTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr uint32_t TEST_COLOR_1 = 0x12345678;
constexpr uint32_t TEST_COLOR_2 = 0x87654321;
constexpr uint8_t TEST_ALPHA_VALUE = 128;
constexpr int TEST_LOOP_COUNT = 10;
constexpr float TEST_POINT_X1 = 100.0f;
constexpr float TEST_POINT_Y1 = 400.0f;
constexpr float TEST_POINT_X2 = 200.0f;
constexpr float TEST_POINT_Y2 = 500.0f;
constexpr uint32_t TEST_COLOR_RED = 0xffff0000;
constexpr uint32_t TEST_COLOR_GREEN = 0xff00ff00;
constexpr float TEST_POS_START = 0.0f;
constexpr float TEST_POS_END = 1.0f;
constexpr int TEST_COLOR_COUNT = 2;
constexpr float TEST_SHADOW_OFFSET_X = 10.0f;
constexpr float TEST_SHADOW_OFFSET_Y = 10.0f;
constexpr float TEST_SHADOW_BLUR_RADIUS = 10.0f;
constexpr uint32_t TEST_COLOR_MAX_UINT32 = 0xFFFFFFFF;
constexpr float TEST_COLOR_FLOAT_A = 1.0f;
constexpr float TEST_COLOR_FLOAT_R = 0.4f;
constexpr float TEST_COLOR_FLOAT_G = 1.0f;
constexpr float TEST_COLOR_FLOAT_B = 0.2f;
constexpr float TEST_COLOR_FLOAT_ZERO = 0.0f;
constexpr float TEST_COLOR_FLOAT_MAX = 2.0f;
constexpr float TEST_COLOR_FLOAT_MIN = -1.0f;
constexpr uint8_t TEST_ALPHA_MAX = 0xff;

constexpr int TEST_ERROR_CODE_INDEX_0 = 0;
constexpr int TEST_ERROR_CODE_INDEX_1 = 1;
constexpr int TEST_ERROR_CODE_INDEX_2 = 2;
constexpr int TEST_ERROR_CODE_INDEX_3 = 3;
constexpr int TEST_ERROR_CODE_INDEX_4 = 4;
constexpr int TEST_ERROR_CODE_INDEX_5 = 5;
constexpr int TEST_ERROR_CODE_INDEX_6 = 6;
constexpr int TEST_ERROR_CODE_INDEX_7 = 7;
constexpr int TEST_ERROR_CODE_INDEX_8 = 8;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeBrushTestSetUp()
{
    std::cout << "DrawingNativeBrushTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeBrushTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeBrushTestTearDown()
{
    std::cout << "DrawingNativeBrushTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeBrushTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testBrushCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0100
 * @tc.desc   test for testBrushCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushCreateNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0200
 * @tc.desc   test for testBrushCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushCopyNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object 1 by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush1 = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush1, nullptr);
    // 2. Set the color of brush 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, TEST_COLOR_1);
    // 3. Copy brush 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush* brush2 = OH_Drawing_BrushCopy(brush1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(brush2, nullptr);
    // 4. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, TEST_COLOR_1);
    // 5. Modify the color of brush object 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, TEST_COLOR_2);
    // 6. Get the color of brush object 2 again by calling OH_Drawing_BrushGetColor
    color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, TEST_COLOR_1);
    // 7. Free memory
    OH_Drawing_BrushDestroy(brush1);
    OH_Drawing_BrushDestroy(brush2);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0300
 * @tc.desc   test for testBrushCopyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushCopyNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Copy a brush object by calling OH_Drawing_BrushCopy with nullptr as parameter
    OH_Drawing_Brush* brushCopy = OH_Drawing_BrushCopy(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BrushDestroy(brushCopy);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushCopyInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0400
 * @tc.desc   test for testBrushCopyInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushCopyInputDestroyed()
{
    DrawingNativeBrushTestSetUp();

    // 1. Call OH_Drawing_BrushCreate to create a brush object 1
    OH_Drawing_Brush* brush1 = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush1, nullptr);
    // 2. Copy brush object 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush* brush2 = OH_Drawing_BrushCopy(brush1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(brush2, nullptr);
    // 3. Destroy brush object 1 by calling OH_Drawing_BrushDestroy
    OH_Drawing_BrushDestroy(brush1);
    // 4. Set the color of brush object 2 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush2, TEST_COLOR_1);
    // 5. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, TEST_COLOR_1);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush2);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0500
 * @tc.desc   test for testBrushCopyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushCopyMultipleCalls()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushCopy ten times in a loop
    for (int i = 0; i < TEST_LOOP_COUNT; i++) {
        OH_Drawing_Brush* brushCopy = OH_Drawing_BrushCopy(brush);
        // add assert
        EXPECT_NE(brushCopy, nullptr);
        OH_Drawing_BrushDestroy(brushCopy);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0600
 * @tc.desc   test for testBrushDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushDestroyNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy to destroy the object
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0700
 * @tc.desc   test for testBrushDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushDestroyNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy with nullptr as parameter
    OH_Drawing_BrushDestroy(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushIsAntiAliasNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0800
 * @tc.desc   test for testBrushIsAntiAliasNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushIsAntiAliasNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, false);
    // 2. Call OH_Drawing_BrushSetAntiAlias to set the anti-aliasing property to true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_BrushIsAntiAlias to check the return value
    isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushIsAntiAliasNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_0900
 * @tc.desc   test for testBrushIsAntiAliasNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushIsAntiAliasNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushIsAntiAlias with nullptr as parameter
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(isAntiAlias, false);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAntiAliasNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1000
 * @tc.desc   test for testBrushSetAntiAliasNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetAntiAliasNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAntiAlias to set the anti-aliasing property to true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_BrushIsAntiAlias to check the return value
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAntiAliasNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1100
 * @tc.desc   test for testBrushSetAntiAliasNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetAntiAliasNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAntiAlias with nullptr as the first parameter
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1200
 * @tc.desc   Test for testBrushGetColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushGetColorNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, TEST_COLOR_1);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1300
 * @tc.desc   Test for testBrushGetColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetColorNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushGetColor with nullptr as parameter
    OH_Drawing_BrushGetColor(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1400
 * @tc.desc   Test for testBrushSetColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetColorNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, TEST_COLOR_1);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1500
 * @tc.desc   Test for testBrushSetColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetColorNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with nullptr as the first parameter
    OH_Drawing_BrushSetColor(nullptr, TEST_COLOR_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetColor with 0 as the second parameter
    OH_Drawing_BrushSetColor(brush, 0);
    // 4. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 5. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColorAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1600
 * @tc.desc   Test for testBrushSetColorAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetColorAbnormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with a negative number or a non-uint32_t type parameter as the second argument
    OH_Drawing_BrushSetColor(brush, -1);
    // Ignoring the test for passing a floating-point number, as it will result in an error
    // 3. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, TEST_COLOR_MAX_UINT32);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColorMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1700
 * @tc.desc   Test for testBrushSetColorMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetColorMaximum()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor with a value greater than the maximum
    // value of uint32_t (0xFFFFFFFF)
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_MAX_UINT32 + 1);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetAlphaNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1800
 * @tc.desc   Test for testBrushGetAlphaNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushGetAlphaNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, TEST_ALPHA_VALUE);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, TEST_ALPHA_VALUE);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetAlphaNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_1900
 * @tc.desc   Test for testBrushGetAlphaNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetAlphaNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushGetAlpha with nullptr as parameter
    OH_Drawing_BrushGetAlpha(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAlphaNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2000
 * @tc.desc   Test for testBrushSetAlphaNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetAlphaNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, TEST_ALPHA_VALUE);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, TEST_ALPHA_VALUE);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAlphaNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2100
 * @tc.desc   Test for testBrushSetAlphaNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetAlphaNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with nullptr as the first parameter
    OH_Drawing_BrushSetAlpha(nullptr, TEST_ALPHA_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetAlpha with 0 as the second parameter
    OH_Drawing_BrushSetAlpha(brush, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAlphaAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2200
 * @tc.desc   Test for testBrushSetAlphaAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetAlphaAbnormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with a negative number or a non-uint8_t type parameter as the second argument
    OH_Drawing_BrushSetAlpha(brush, -1);
    // 3. Call OH_Drawing_BrushGetAlpha to get the alpha value
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, TEST_ALPHA_MAX);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetAlphaMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2300
 * @tc.desc   Test for testBrushSetAlphaMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetAlphaMaximum()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha with a value greater than the
    // maximum value of uint8_t (0xFFFFFFFF + 1)
    OH_Drawing_BrushSetAlpha(brush, TEST_COLOR_MAX_UINT32 + 1);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetShaderEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2400
 * @tc.desc   Test for testBrushSetShaderEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetShaderEffectNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shader object by calling OH_Drawing_ShaderEffectCreate
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X1, TEST_POINT_Y1);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X2, TEST_POINT_Y2);
    uint32_t color[] = { TEST_COLOR_RED, TEST_COLOR_GREEN };
    float pos[] = { TEST_POS_START, TEST_POS_END };
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(
        startPt, endPt, color, pos, TEST_COLOR_COUNT, OH_Drawing_TileMode::CLAMP);
    // add assert
    EXPECT_NE(linearGradient, nullptr);
    // 3. Set the shader effect for the brush object by calling OH_Drawing_BrushSetShaderEffect
    OH_Drawing_BrushSetShaderEffect(brush, linearGradient);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetShaderEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2500
 * @tc.desc   Test for testBrushSetShaderEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetShaderEffectNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X1, TEST_POINT_Y1);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X2, TEST_POINT_Y2);
    uint32_t color[] = { TEST_COLOR_RED, TEST_COLOR_GREEN };
    float pos[] = { TEST_POS_START, TEST_POS_END };
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(
        startPt, endPt, color, pos, TEST_COLOR_COUNT, OH_Drawing_TileMode::CLAMP);
    // add assert
    EXPECT_NE(linearGradient, nullptr);
    // 2. Call OH_Drawing_BrushSetShaderEffect with nullptr as the first parameter
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetShaderEffect with nullptr as the second parameter
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    // 4. Free memory
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetShadowLayerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2600
 * @tc.desc   Test for testBrushSetShadowLayerNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetShadowLayerNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shadow layer object by calling OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer* shadowLayer =
        OH_Drawing_ShadowLayerCreate(TEST_SHADOW_OFFSET_X, TEST_SHADOW_OFFSET_Y, TEST_SHADOW_BLUR_RADIUS, TEST_COLOR_1);
    // add assert
    EXPECT_NE(shadowLayer, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Set the shadow layer for the brush object by calling OH_Drawing_BrushSetShadowLayer
    OH_Drawing_BrushSetShadowLayer(brush, shadowLayer);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_ShadowLayerDestroy(shadowLayer);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetShadowLayerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2700
 * @tc.desc   Test for testBrushSetShadowLayerNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetShadowLayerNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_ShadowLayer* shadowLayer =
        OH_Drawing_ShadowLayerCreate(TEST_SHADOW_OFFSET_X, TEST_SHADOW_OFFSET_Y, TEST_SHADOW_BLUR_RADIUS, TEST_COLOR_1);
    // add assert
    EXPECT_NE(shadowLayer, nullptr);
    // 2. Call OH_Drawing_BrushSetShadowLayer with nullptr as the first parameter
    OH_Drawing_BrushSetShadowLayer(nullptr, shadowLayer);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetShadowLayer with nullptr as the second parameter
    OH_Drawing_BrushSetShadowLayer(brush, nullptr);
    // 4. Free memory
    OH_Drawing_ShadowLayerDestroy(shadowLayer);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetFilterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2800
 * @tc.desc   Test for testBrushSetFilterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetFilterNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetFilterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_2900
 * @tc.desc   Test for testBrushSetFilterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetFilterNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Call OH_Drawing_BrushSetFilter with nullptr as the first parameter
    OH_Drawing_BrushSetFilter(nullptr, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetFilter with nullptr as the second parameter
    OH_Drawing_BrushSetFilter(brush, nullptr);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetFilterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3000
 * @tc.desc   Test for testBrushGetFilterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushGetFilterNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Get the filter by calling OH_Drawing_BrushGetFilter
    OH_Drawing_Filter* tmpFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(tmpFilter, nullptr);
    OH_Drawing_BrushGetFilter(brush, tmpFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(tmpFilter);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetFilterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3100
 * @tc.desc   Test for testBrushGetFilterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetFilterNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Call OH_Drawing_BrushGetFilter with nullptr as the first parameter
    OH_Drawing_BrushGetFilter(nullptr, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_BrushGetFilter with nullptr as the second parameter
    OH_Drawing_BrushGetFilter(brush, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetBlendModeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3200
 * @tc.desc   Test for testBrushSetBlendModeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushSetBlendModeNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetBlendMode with the second parameter being an enumeration
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < sizeof(blendMode) / sizeof(OH_Drawing_BlendMode); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_BrushSetBlendMode(brush, blendMode[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetBlendModeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3300
 * @tc.desc   Test for testBrushSetBlendModeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetBlendModeNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetBlendMode with nullptr as the first parameter
    OH_Drawing_BrushSetBlendMode(nullptr, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3400
 * @tc.desc   Test for testBrushResetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBrushResetNormal()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    uint32_t color1 = OH_Drawing_BrushGetColor(brush);
    // 2. Set the color for the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_1);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color2 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color2, TEST_COLOR_1);
    // 4. Reset the state of the brush object by calling OH_Drawing_BrushReset
    OH_Drawing_BrushReset(brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color3 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color3, color1);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3500
 * @tc.desc   Test for testBrushResetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushResetNull()
{
    DrawingNativeBrushTestSetUp();

    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushReset with nullptr as the parameter
    OH_Drawing_BrushReset(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetAlphaFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3600
 * @tc.desc   Test for testBrushGetAlphaFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestBrushGetAlphaFloatNormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float a = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, &a), OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_A);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetAlphaFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3700
 * @tc.desc   Test for testBrushGetAlphaFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetAlphaFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float a = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(nullptr, &a), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_ZERO);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetRedFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3800
 * @tc.desc   Test for testBrushGetRedFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestBrushGetRedFloatNormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float r = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, &r), OH_DRAWING_SUCCESS);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_R);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetRedFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_3900
 * @tc.desc   Test for testBrushGetRedFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetRedFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float r = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(nullptr, &r), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_ZERO);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetGreenFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4000
 * @tc.desc   Test for testBrushGetGreenFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestBrushGetGreenFloatNormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float g = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, &g), OH_DRAWING_SUCCESS);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_G);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetGreenFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4100
 * @tc.desc   Test for testBrushGetGreenFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetGreenFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float g = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(nullptr, &g), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_ZERO);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetBlueFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4200
 * @tc.desc   Test for testBrushGetBlueFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestBrushGetBlueFloatNormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float b = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, &b), OH_DRAWING_SUCCESS);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_B);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushGetBlueFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4300
 * @tc.desc   Test for testBrushGetBlueFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushGetBlueFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float b = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(nullptr, &b), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_ZERO);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColor4fNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4400
 * @tc.desc   Test for testBrushSetColor4fNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestBrushSetColor4fNormal()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float a = TEST_COLOR_FLOAT_ZERO;
    float r = TEST_COLOR_FLOAT_ZERO;
    float g = TEST_COLOR_FLOAT_ZERO;
    float b = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_A);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_R);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_G);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_B);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColor4fNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4500
 * @tc.desc   Test for testBrushSetColor4fNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetColor4fNull()
{
    DrawingNativeBrushTestSetUp();

    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    float a = TEST_COLOR_FLOAT_ZERO;
    float r = TEST_COLOR_FLOAT_ZERO;
    float g = TEST_COLOR_FLOAT_ZERO;
    float b = TEST_COLOR_FLOAT_ZERO;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BrushSetColor4f(
        nullptr, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_ZERO, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_ZERO);
    errorCode = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_ZERO, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_ZERO);
    errorCode = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_ZERO, TEST_COLOR_FLOAT_B, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_ZERO);
    errorCode = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_ZERO, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_ZERO);
    OH_Drawing_BrushDestroy(brush);

    DrawingNativeBrushTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBrushSetColor4fAbnormal_Part1
 * @brief     执行测试的第一部分：设置颜色并获取通道值。
 * @note      此函数包含了原函数中从创建画笔到所有颜色设置和获取的逻辑。
 * @param     brush 指向 OH_Drawing_Brush 对象的指针。
 * @param     errorCodes 用于存储每次设置颜色操作返回值的数组。
 */
void TestBrushSetColor4fAbnormal_Part1(OH_Drawing_Brush* brush,
                                       OH_Drawing_ErrorCode errorCodes[TEST_ERROR_CODE_INDEX_8])
{
    float a = TEST_COLOR_FLOAT_ZERO;
    float r = TEST_COLOR_FLOAT_ZERO;
    float g = TEST_COLOR_FLOAT_ZERO;
    float b = TEST_COLOR_FLOAT_ZERO;

    // 以下是原函数中的所有测试步骤，代码和逻辑完全未改变
    errorCodes[TEST_ERROR_CODE_INDEX_0] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_MAX, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_A);

    errorCodes[TEST_ERROR_CODE_INDEX_1] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_MIN, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(a, TEST_COLOR_FLOAT_ZERO);

    errorCodes[TEST_ERROR_CODE_INDEX_2] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_MAX, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_A);

    errorCodes[TEST_ERROR_CODE_INDEX_3] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_MIN, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, TEST_COLOR_FLOAT_ZERO);
}

/**
 * @tc.name   testBrushSetColor4fAbnormal_Part2
 * @brief     执行测试的第二部分：继续设置颜色、断言所有操作成功并清理环境。
 * @note      此函数包含了原函数中剩余的颜色设置、对所有 errorCode 的断言以及资源释放逻辑。
 * @param     brush 指向 OH_Drawing_Brush 对象的指针。
 * @param     errorCodes 包含第一部分测试中返回值的数组。
 */
void TestBrushSetColor4fAbnormal_Part2(OH_Drawing_Brush* brush,
                                       OH_Drawing_ErrorCode errorCodes[TEST_ERROR_CODE_INDEX_8])
{
    float g = TEST_COLOR_FLOAT_ZERO;
    float b = TEST_COLOR_FLOAT_ZERO;

    // 继续执行原函数中的剩余测试步骤
    errorCodes[TEST_ERROR_CODE_INDEX_4] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_MAX, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_A);

    errorCodes[TEST_ERROR_CODE_INDEX_5] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_MIN, TEST_COLOR_FLOAT_B, nullptr);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, TEST_COLOR_FLOAT_ZERO);

    errorCodes[TEST_ERROR_CODE_INDEX_6] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_MAX, nullptr);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_A);

    errorCodes[TEST_ERROR_CODE_INDEX_7] = OH_Drawing_BrushSetColor4f(
        brush, TEST_COLOR_FLOAT_A, TEST_COLOR_FLOAT_R, TEST_COLOR_FLOAT_G, TEST_COLOR_FLOAT_MIN, nullptr);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, TEST_COLOR_FLOAT_ZERO);

    // 断言所有设置操作都成功返回
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_0], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_1], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_2], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_3], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_4], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_5], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_6], OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCodes[TEST_ERROR_CODE_INDEX_7], OH_DRAWING_SUCCESS);

    // 清理测试环境
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
}

/**
 * @tc.name   testBrushSetColor4fAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BRUSH_4600
 * @tc.desc   Test for testBrushSetColor4fAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBrushSetColor4fAbnormal()
{
    // 1. 测试环境初始化
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();

    // 2. 创建一个数组来在两个拆分的函数之间传递 errorCode
    OH_Drawing_ErrorCode errorCodes[TEST_ERROR_CODE_INDEX_8];

    // 3. 按顺序调用拆分后的两个函数来执行完整的测试逻辑
    TestBrushSetColor4fAbnormal_Part1(brush, errorCodes);
    TestBrushSetColor4fAbnormal_Part2(brush, errorCodes);

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS