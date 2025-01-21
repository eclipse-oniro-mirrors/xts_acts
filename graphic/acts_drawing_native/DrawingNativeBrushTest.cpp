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
class DrawingNativeBrushTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0100
 * @tc.name: testBrushCreateNormal
 * @tc.desc: test for testBrushCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCreateNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0200
 * @tc.name: testBrushCopyNormal
 * @tc.desc: test for testBrushCopyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNormal, TestSize.Level0) {
    // 1. Create a brush object 1 by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // 2. Set the color of brush 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, 0x12345678);
    // 3. Copy brush 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0201
 * @tc.name: testBrushCopyNull
 * @tc.desc: test for testBrushCopyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Copy a brush object by calling OH_Drawing_BrushCopy with nullptr as parameter
    OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_BrushDestroy(brushCopy);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0202
 * @tc.name: testBrushCopyInputDestroyed
 * @tc.desc: test for testBrushCopyInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyInputDestroyed, TestSize.Level3) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object 1
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // 2. Copy brush object 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0203
 * @tc.name: testBrushCopyMultipleCalls
 * @tc.desc: test for testBrushCopyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushCopyMultipleCalls, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushCopy ten times in a loop
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(brush);
        OH_Drawing_BrushDestroy(brushCopy);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0300
 * @tc.name: testBrushDestroyNormal
 * @tc.desc: test for testBrushDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushDestroy to destroy the object
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0301
 * @tc.name: testBrushDestroyNull
 * @tc.desc: test for testBrushDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushDestroyNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushDestroy with nullptr as parameter
    OH_Drawing_BrushDestroy(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0400
 * @tc.name: testBrushIsAntiAliasNormal
 * @tc.desc: test for testBrushIsAntiAliasNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetAntiAlias to set the anti-aliasing property to true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // 3. Call OH_Drawing_BrushIsAntiAlias to check the return value
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0401
 * @tc.name: testBrushIsAntiAliasNull
 * @tc.desc: test for testBrushIsAntiAliasNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushIsAntiAliasNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushIsAntiAlias with nullptr as parameter
    OH_Drawing_BrushIsAntiAlias(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0500
 * @tc.name: testBrushSetAntiAliasNormal
 * @tc.desc: test for testBrushSetAntiAliasNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetAntiAlias to set the anti-aliasing property to true
    OH_Drawing_BrushSetAntiAlias(brush, true);
    // 3. Call OH_Drawing_BrushIsAntiAlias to check the return value
    bool isAntiAlias = OH_Drawing_BrushIsAntiAlias(brush);
    EXPECT_EQ(isAntiAlias, true);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0501
 * @tc.name: testBrushSetAntiAliasNull
 * @tc.desc: test for testBrushSetAntiAliasNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAntiAliasNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetAntiAlias with nullptr as the first parameter
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0600
 * @tc.name: testBrushGetColorNormal
 * @tc.desc: Test for testBrushGetColorNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0601
 * @tc.name: testBrushGetColorNull
 * @tc.desc: Test for testBrushGetColorNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetColorNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushGetColor with nullptr as parameter
    OH_Drawing_BrushGetColor(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0700
 * @tc.name: testBrushSetColorNormal
 * @tc.desc: Test for testBrushSetColorNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0x12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0701
 * @tc.name: testBrushSetColorNull
 * @tc.desc: Test for testBrushSetColorNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetColor with nullptr as the first parameter
    OH_Drawing_BrushSetColor(nullptr, 0x12345678);
    // 3. Call OH_Drawing_BrushSetColor with 0 as the second parameter
    OH_Drawing_BrushSetColor(brush, 0);
    // 4. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 5. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0702
 * @tc.name: testBrushSetColorAbnormal
 * @tc.desc: Test for testBrushSetColorAbnormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorAbnormal, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetColor with a negative number or a non-uint32_t type parameter as the second argument
    OH_Drawing_BrushSetColor(brush, -1);
    // Ignoring the test for passing a floating-point number, as it will result in an error
    // 3. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, std::pow(2, 32) - 1);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0703
 * @tc.name: testBrushSetColorMaximum
 * @tc.desc: Test for testBrushSetColorMaximum.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetColorMaximum, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor with a value greater than the maximum
    // value of uint32_t (0xFFFFFFFF)
    OH_Drawing_BrushSetColor(brush, 0xFFFFFFFF + 1);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0800
 * @tc.name: testBrushGetAlphaNormal
 * @tc.desc: Test for testBrushGetAlphaNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0801
 * @tc.name: testBrushGetAlphaNull
 * @tc.desc: Test for testBrushGetAlphaNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetAlphaNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushGetAlpha with nullptr as parameter
    OH_Drawing_BrushGetAlpha(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0900
 * @tc.name: testBrushSetAlphaNormal
 * @tc.desc: Test for testBrushSetAlphaNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, 128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0901
 * @tc.name: testBrushSetAlphaNull
 * @tc.desc: Test for testBrushSetAlphaNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetAlpha with nullptr as the first parameter
    OH_Drawing_BrushSetAlpha(nullptr, 128);
    // 3. Call OH_Drawing_BrushSetAlpha with 0 as the second parameter
    OH_Drawing_BrushSetAlpha(brush, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0902
 * @tc.name: testBrushSetAlphaAbnormal
 * @tc.desc: Test for testBrushSetAlphaAbnormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaAbnormal, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetAlpha with a negative number or a non-uint8_t type parameter as the second argument
    OH_Drawing_BrushSetAlpha(brush, -1);
    // 3. Call OH_Drawing_BrushGetAlpha to get the alpha value
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0xff);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_0903
 * @tc.name: testBrushSetAlphaMaximum
 * @tc.desc: Test for testBrushSetAlphaMaximum.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetAlphaMaximum, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha with a value greater than the
    // maximum value of uint8_t (0xFFFFFFFF + 1)
    OH_Drawing_BrushSetAlpha(brush, 0xFFFFFFFF + 1);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1000
 * @tc.name: testBrushSetShaderEffectNormal
 * @tc.desc: Test for testBrushSetShaderEffectNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Create a shader object by calling OH_Drawing_ShaderEffectCreate
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
    // 3. Set the shader effect for the brush object by calling OH_Drawing_BrushSetShaderEffect
    OH_Drawing_BrushSetShaderEffect(brush, linearGradient);
    // 4. Free memory
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1001
 * @tc.name: testBrushSetShaderEffectNull
 * @tc.desc: Test for testBrushSetShaderEffectNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShaderEffectNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2, OH_Drawing_TileMode::CLAMP);
    // 2. Call OH_Drawing_BrushSetShaderEffect with nullptr as the first parameter
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    // 3. Call OH_Drawing_BrushSetShaderEffect with nullptr as the second parameter
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    // 4. Free memory
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1100
 * @tc.name: testBrushSetShadowLayerNormal
 * @tc.desc: Test for testBrushSetShadowLayerNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Create a shadow layer object by calling OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
    // 3. Set the shadow layer for the brush object by calling OH_Drawing_BrushSetShadowLayer
    OH_Drawing_BrushSetShadowLayer(brush, shadowLayer);
    // 4. Free memory
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1101
 * @tc.name: testBrushSetShadowLayerNull
 * @tc.desc: Test for testBrushSetShadowLayerNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetShadowLayerNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(10, 10, 10, 0x12345678);
    // 2. Call OH_Drawing_BrushSetShadowLayer with nullptr as the first parameter
    OH_Drawing_BrushSetShadowLayer(nullptr, shadowLayer);
    // 3. Call OH_Drawing_BrushSetShadowLayer with nullptr as the second parameter
    OH_Drawing_BrushSetShadowLayer(brush, nullptr);
    // 4. Free memory
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1200
 * @tc.name: testBrushSetFilterNormal
 * @tc.desc: Test for testBrushSetFilterNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1201
 * @tc.name: testBrushSetFilterNull
 * @tc.desc: Test for testBrushSetFilterNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetFilterNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 2. Call OH_Drawing_BrushSetFilter with nullptr as the first parameter
    OH_Drawing_BrushSetFilter(nullptr, filter);
    // 3. Call OH_Drawing_BrushSetFilter with nullptr as the second parameter
    OH_Drawing_BrushSetFilter(brush, nullptr);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1300
 * @tc.name: testBrushGetFilterNormal
 * @tc.desc: Test for testBrushGetFilterNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Create a filter object by calling OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 3. Set the filter for the brush object by calling OH_Drawing_BrushSetFilter
    OH_Drawing_BrushSetFilter(brush, filter);
    // 4. Get the filter by calling OH_Drawing_BrushGetFilter
    OH_Drawing_Filter *tmpFilter = OH_Drawing_FilterCreate();
    OH_Drawing_BrushGetFilter(brush, tmpFilter);
    // 5. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(tmpFilter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1301
 * @tc.name: testBrushGetFilterNull
 * @tc.desc: Test for testBrushGetFilterNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushGetFilterNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // 2. Call OH_Drawing_BrushGetFilter with nullptr as the first parameter
    OH_Drawing_BrushGetFilter(nullptr, filter);
    // 3. Call OH_Drawing_BrushGetFilter with nullptr as the second parameter
    OH_Drawing_BrushGetFilter(brush, nullptr);
    // 4. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1400
 * @tc.name: testBrushSetBlendModeNormal
 * @tc.desc: Test for testBrushSetBlendModeNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
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
        OH_Drawing_BrushSetBlendMode(brush, blendMode[i]);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1401
 * @tc.name: testBrushSetBlendModeNull
 * @tc.desc: Test for testBrushSetBlendModeNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushSetBlendModeNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushSetBlendMode with nullptr as the first parameter
    OH_Drawing_BrushSetBlendMode(nullptr, BLEND_MODE_CLEAR);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1500
 * @tc.name: testBrushResetNormal
 * @tc.desc: Test for testBrushResetNormal.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 0
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNormal, TestSize.Level0) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    uint32_t color1 = OH_Drawing_BrushGetColor(brush);
    // 2. Set the color for the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, 0x12345678);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color2 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color2, 0x12345678);
    // 4. Reset the state of the brush object by calling OH_Drawing_BrushReset
    OH_Drawing_BrushReset(brush);
    // 5. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color3 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color3, color1);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BRUSH_1501
 * @tc.name: testBrushResetNull
 * @tc.desc: Test for testBrushResetNull.
 * @tc.size: SmallTest
 * @tc.type: Function
 * @tc.level: Level 3
 */
HWTEST_F(DrawingNativeBrushTest, testBrushResetNull, TestSize.Level3) {
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // 2. Call OH_Drawing_BrushReset with nullptr as the parameter
    OH_Drawing_BrushReset(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS