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

#include "gtest/gtest.h"

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
#include "drawing_shadow_layer.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeBrushTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeBrushTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeBrushTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeBrushTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeBrushTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testBrushCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0100
 * @tc.desc   test for testBrushCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCreateNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0200
 * @tc.desc   test for testBrushCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object 1 by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush1, nullptr);
    // 2. Set the color of brush 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, 0x12345678);
    // 3. Copy brush 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(brush2, nullptr);
    // 4. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 5. Modify the color of brush object 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, 0x87654321);
    // 6. Get the color of brush object 2 again by calling OH_Drawing_BrushGetColor
    color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 7. Free memory
    OH_Drawing_BrushDestroy(brush1);
    OH_Drawing_BrushDestroy(brush2);
}

/**
 * @tc.name   testBrushCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0201
 * @tc.desc   test for testBrushCopyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Copy a brush object by calling OH_Drawing_BrushCopy with nullptr as parameter
    OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BrushDestroy(brushCopy);
}

/**
 * @tc.name   testBrushCopyInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0202
 * @tc.desc   test for testBrushCopyInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyInputDestroyed, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object 1
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush1, nullptr);
    // 2. Copy brush object 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(brush2, nullptr);
    // 3. Destroy brush object 1 by calling OH_Drawing_BrushDestroy
    OH_Drawing_BrushDestroy(brush1);
    // 4. Set the color of brush object 2 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush2, 0x12345678);
    // 5. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, 0x12345678);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush2);
}

/**
 * @tc.name   testBrushCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0203
 * @tc.desc   test for testBrushCopyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushCopy ten times in a loop
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(brush);
        // add assert
        EXPECT_NE(brushCopy, nullptr);
        OH_Drawing_BrushDestroy(brushCopy);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0300
 * @tc.desc   test for testBrushDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy to destroy the object
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0301
 * @tc.desc   test for testBrushDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy with nullptr as parameter
    OH_Drawing_BrushDestroy(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushIsAntiAliasNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0400
 * @tc.desc   test for testBrushIsAntiAliasNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
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
}

/**
 * @tc.name   testBrushIsAntiAliasNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0401
 * @tc.desc   test for testBrushIsAntiAliasNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushIsAntiAlias with nullptr as parameter
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(isAntiAlias, false);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetAntiAliasNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0500
 * @tc.desc   test for testBrushSetAntiAliasNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
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
}

/**
 * @tc.name   testBrushSetAntiAliasNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0501
 * @tc.desc   test for testBrushSetAntiAliasNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAntiAlias with nullptr as the first parameter
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0600
 * @tc.desc   Test for testBrushGetColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0601
 * @tc.desc   Test for testBrushGetColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushGetColor with nullptr as parameter
    OH_Drawing_BrushGetColor(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0700
 * @tc.desc   Test for testBrushSetColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0701
 * @tc.desc   Test for testBrushSetColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with nullptr as the first parameter
    OH_Drawing_BrushSetColor(nullptr, 0x12345678);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetColor with 0 as the second parameter
    OH_Drawing_BrushSetColor(brush, 0);
    // 4. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 5. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColorAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0702
 * @tc.desc   Test for testBrushSetColorAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorAbnormal, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with a negative number or a non-uint32_t type parameter as the second argument
    OH_Drawing_BrushSetColor(brush, -1);
    // Ignoring the test for passing a floating-point number, as it will result in an error
    // 3. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, std::pow(2, 32) - 1);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColorMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0703
 * @tc.desc   Test for testBrushSetColorMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorMaximum, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor with a value greater than the maximum
    // value of uint32_t (0xFFFFFFFF)
    OH_Drawing_BrushSetColor(brush, 0xFFFFFFFF + 1);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetAlphaNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0800
 * @tc.desc   Test for testBrushGetAlphaNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetAlphaNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0801
 * @tc.desc   Test for testBrushGetAlphaNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushGetAlpha with nullptr as parameter
    OH_Drawing_BrushGetAlpha(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetAlphaNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0900
 * @tc.desc   Test for testBrushSetAlphaNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetAlphaNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0901
 * @tc.desc   Test for testBrushSetAlphaNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with nullptr as the first parameter
    OH_Drawing_BrushSetAlpha(nullptr, 128);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetAlpha with 0 as the second parameter
    OH_Drawing_BrushSetAlpha(brush, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetAlphaAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0902
 * @tc.desc   Test for testBrushSetAlphaAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaAbnormal, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with a negative number or a non-uint8_t type parameter as the second argument
    OH_Drawing_BrushSetAlpha(brush, -1);
    // 3. Call OH_Drawing_BrushGetAlpha to get the alpha value
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0xff);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetAlphaMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0903
 * @tc.desc   Test for testBrushSetAlphaMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaMaximum, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha with a value greater than the
    // maximum value of uint8_t (0xFFFFFFFF + 1)
    OH_Drawing_BrushSetAlpha(brush, 0xFFFFFFFF + 1);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetShaderEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1000
 * @tc.desc   Test for testBrushSetShaderEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shader object by calling OH_Drawing_ShaderEffectCreate
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
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
}

/**
 * @tc.name   testBrushSetShaderEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1001
 * @tc.desc   Test for testBrushSetShaderEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
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
}

/**
 * @tc.name   testBrushSetShadowLayerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1100
 * @tc.desc   Test for testBrushSetShadowLayerNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shadow layer object by calling OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
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
}

/**
 * @tc.name   testBrushSetShadowLayerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1101
 * @tc.desc   Test for testBrushSetShadowLayerNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
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
}

/**
 * @tc.name   testBrushSetFilterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1200
 * @tc.desc   Test for testBrushSetFilterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetFilterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1201
 * @tc.desc   Test for testBrushSetFilterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
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
}

/**
 * @tc.name   testBrushGetFilterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1300
 * @tc.desc   Test for testBrushGetFilterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Get the filter by calling OH_Drawing_BrushGetFilter
    OH_Drawing_Filter *tmpFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(tmpFilter, nullptr);
    OH_Drawing_BrushGetFilter(brush, tmpFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(tmpFilter);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetFilterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1301
 * @tc.desc   Test for testBrushGetFilterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
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
}

/**
 * @tc.name   testBrushSetBlendModeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1400
 * @tc.desc   Test for testBrushSetBlendModeNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
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
}

/**
 * @tc.name   testBrushSetBlendModeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1401
 * @tc.desc   Test for testBrushSetBlendModeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetBlendMode with nullptr as the first parameter
    OH_Drawing_BrushSetBlendMode(nullptr, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1500
 * @tc.desc   Test for testBrushResetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNormal, Function | SmallTest | Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    uint32_t color1 = OH_Drawing_BrushGetColor(brush);
    // 2. Set the color for the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color2 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color2, 0x12345678);
    // 4. Reset the state of the brush object by calling OH_Drawing_BrushReset
    OH_Drawing_BrushReset(brush);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color3 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color3, color1);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1501
 * @tc.desc   Test for testBrushResetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNull, Function | SmallTest | Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushReset with nullptr as the parameter
    OH_Drawing_BrushReset(nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetAlphaFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1600
 * @tc.desc   Test for testBrushGetAlphaFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaFloatNormal, Function | SmallTest | Level2) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, &a), OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, 1.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetAlphaFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1601
 * @tc.desc   Test for testBrushGetAlphaFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaFloatAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(nullptr, &a), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(a, 0.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetRedFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1700
 * @tc.desc   Test for testBrushGetRedFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetRedFloatNormal, Function | SmallTest | Level2) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float r = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, &r), OH_DRAWING_SUCCESS);
    EXPECT_EQ(r, 0.4f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetRedFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1701
 * @tc.desc   Test for testBrushGetRedFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetRedFloatAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float r = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(nullptr, &r), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(r, 0.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetGreenFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1800
 * @tc.desc   Test for testBrushGetGreenFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetGreenFloatNormal, Function | SmallTest | Level2) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float g = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, &g), OH_DRAWING_SUCCESS);
    EXPECT_EQ(g, 1.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetGreenFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1801
 * @tc.desc   Test for testBrushGetGreenFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetGreenFloatAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float g = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(nullptr, &g), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(g, 0.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetBlueFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1900
 * @tc.desc   Test for testBrushGetBlueFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetBlueFloatNormal, Function | SmallTest | Level2) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float b = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, &b), OH_DRAWING_SUCCESS);
    EXPECT_EQ(b, 0.2f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushGetBlueFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1901
 * @tc.desc   Test for testBrushGetBlueFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetBlueFloatAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float b = 0.f;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(nullptr, &b), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(b, 0.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColor4fNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2000
 * @tc.desc   Test for testBrushSetColor4fNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColor4fNormal, Function | SmallTest | Level2) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0.f;
    float r = 0.f;
    float g = 0.f;
    float b = 0.f;
    int num = 201;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, 1.0f);
    EXPECT_EQ(r, 0.4f);
    EXPECT_EQ(g, 1.0f);
    EXPECT_EQ(b, 0.2f);
    EXPECT_EQ(num, OH_DRAWING_ERROR_NO_PERMISSION);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColor4fNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2001
 * @tc.desc   Test for testBrushSetColor4fNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColor4fNull, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0.f;
    float r = 0.f;
    float g = 0.f;
    float b = 0.f;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BrushSetColor4f(nullptr, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_BrushSetColor4f(brush, 0.0f, 0.4f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, 0.0f);
    errorCode = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.0f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, 0.0f);
    errorCode = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 0.0f, 0.2f, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, 0.0f);
    errorCode = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.0f, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, 0.0f);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testBrushSetColor4fAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_2002
 * @tc.desc   Test for testBrushSetColor4fAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColor4fAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0.f;
    float r = 0.f;
    float g = 0.f;
    float b = 0.f;
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_BrushSetColor4f(brush, 2.0f, 0.4f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(a, 1.0f);
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_BrushSetColor4f(brush, -1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetAlphaFloat(brush, &a);
    EXPECT_EQ(a, 0.0f);
    OH_Drawing_ErrorCode errorCode3 = OH_Drawing_BrushSetColor4f(brush, 1.0f, 2.0f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, 1.0f);
    OH_Drawing_ErrorCode errorCode4 = OH_Drawing_BrushSetColor4f(brush, 1.0f, -1.0f, 1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetRedFloat(brush, &r);
    EXPECT_EQ(r, 0.0f);
    OH_Drawing_ErrorCode errorCode5 = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 2.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, 1.0f);
    OH_Drawing_ErrorCode errorCode6 = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, -1.0f, 0.2f, nullptr);
    OH_Drawing_BrushGetGreenFloat(brush, &g);
    EXPECT_EQ(g, 0.0f);
    OH_Drawing_ErrorCode errorCode7 = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 2.0f, nullptr);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, 1.0f);
    OH_Drawing_ErrorCode errorCode8 = OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, -1.0f, nullptr);
    OH_Drawing_BrushGetBlueFloat(brush, &b);
    EXPECT_EQ(b, 0.0f);
    EXPECT_EQ(errorCode1, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode3, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode4, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode5, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode6, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode7, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode8, OH_DRAWING_SUCCESS);
    OH_Drawing_BrushDestroy(brush);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS