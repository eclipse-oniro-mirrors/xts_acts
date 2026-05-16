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
#include "include/log_common.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_32 32
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_128 128
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_201 201
#define DRAWING_NUMBER_255 255
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_12345678 12345678
#define DRAWING_NUMBER_87654321 87654321
#define DRAWING_NUMBER_0X12345678 0X12345678
#define DRAWING_NUMBER_0X87654321 0x87654321
#define DRAWING_NUMBER_0XFFFF0000 0xFFFF0000
#define DRAWING_NUMBER_0XFF00FF00 0xFF00FF00
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestBrushCreateNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushCopyNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object 1 by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush1 = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush1, nullptr);
    // 2. Set the color of brush 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, DRAWING_NUMBER_12345678);
    // 3. Copy brush 1 to create brush object 2 by calling OH_Drawing_BrushCopy
    OH_Drawing_Brush *brush2 = OH_Drawing_BrushCopy(brush1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(brush2, nullptr);
    // 4. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, DRAWING_NUMBER_12345678);
    // 5. Modify the color of brush object 1 by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush1, DRAWING_NUMBER_87654321);
    // 6. Get the color of brush object 2 again by calling OH_Drawing_BrushGetColor
    color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, DRAWING_NUMBER_12345678);
    // 7. Free memory
    OH_Drawing_BrushDestroy(brush1);
    OH_Drawing_BrushDestroy(brush2);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushCopyNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushCopyInputDestroyed()
{
    DrawingNativeBrushTestSetUp();
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
    OH_Drawing_BrushSetColor(brush2, DRAWING_NUMBER_12345678);
    // 5. Get the color of brush object 2 by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush2);
    EXPECT_EQ(color, DRAWING_NUMBER_12345678);
    // 6. Free memory
    OH_Drawing_BrushDestroy(brush2);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushCopyMultipleCalls()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushCopy ten times in a loop
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Brush *brushCopy = OH_Drawing_BrushCopy(brush);
        // add assert
        EXPECT_NE(brushCopy, nullptr);
        OH_Drawing_BrushDestroy(brushCopy);
    }
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushDestroyNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Call OH_Drawing_BrushCreate to create a brush object
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy to destroy the object
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushDestroyNull()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushDestroy with nullptr as parameter
    OH_Drawing_BrushDestroy(nullptr);
    // 3. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushIsAntiAliasNormal()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushIsAntiAliasNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAntiAliasNormal()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAntiAliasNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetColorNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_12345678);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, DRAWING_NUMBER_12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetColorNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColorNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_12345678);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, DRAWING_NUMBER_12345678);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColorNull()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with nullptr as the first parameter
    OH_Drawing_BrushSetColor(nullptr, DRAWING_NUMBER_12345678);
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

int TestBrushSetColorAbnormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetColor with a negative number or a non-uint32_t type parameter as the second argument
    OH_Drawing_BrushSetColor(brush, -DRAWING_NUMBER_1);
    // Ignoring the test for passing a floating-point number, as it will result in an error
    // 3. Call OH_Drawing_BrushGetColor to get the brush color
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, std::pow(DRAWING_NUMBER_2, DRAWING_NUMBER_32) - DRAWING_NUMBER_1);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColorMaximum()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the color of the brush object by calling OH_Drawing_BrushSetColor with a value greater than the maximum
    // value of uint32_t (0xFFFFFFFF)
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_0XFFFFFFFF + DRAWING_NUMBER_1);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetAlphaNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, DRAWING_NUMBER_128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, DRAWING_NUMBER_128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetAlphaNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAlphaNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha
    OH_Drawing_BrushSetAlpha(brush, DRAWING_NUMBER_128);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, DRAWING_NUMBER_128);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAlphaNull()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with nullptr as the first parameter
    OH_Drawing_BrushSetAlpha(nullptr, DRAWING_NUMBER_128);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_BrushSetAlpha with 0 as the second parameter
    OH_Drawing_BrushSetAlpha(brush, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAlphaAbnormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Call OH_Drawing_BrushSetAlpha with a negative number or a non-uint8_t type parameter as the second argument
    OH_Drawing_BrushSetAlpha(brush, -DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_BrushGetAlpha to get the alpha value
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, DRAWING_NUMBER_255);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetAlphaMaximum()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Set the alpha value of the brush object by calling OH_Drawing_BrushSetAlpha with a value greater than the
    // maximum value of uint8_t (0xFFFFFFFF + 1)
    OH_Drawing_BrushSetAlpha(brush, DRAWING_NUMBER_0XFFFFFFFF + DRAWING_NUMBER_1);
    // 3. Get the alpha value of the brush object by calling OH_Drawing_BrushGetAlpha
    uint8_t alpha = OH_Drawing_BrushGetAlpha(brush);
    EXPECT_EQ(alpha, 0);
    // 4. Free memory
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetShaderEffectNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shader object by calling OH_Drawing_ShaderEffectCreate
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500);
    uint32_t color[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00};
    float pos[] = {0, DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2.0f, OH_Drawing_TileMode::CLAMP);
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

int TestBrushSetShaderEffectNull()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_400);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_500);
    uint32_t color[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00};
    float pos[] = {0, DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *linearGradient =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, color, pos, 2.0f, OH_Drawing_TileMode::CLAMP);
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

int TestBrushSetShadowLayerNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 2. Create a shadow layer object by calling OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer *shadowLayer =
        OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_12345678);
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

int TestBrushSetShadowLayerNull()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    OH_Drawing_ShadowLayer *shadowLayer =
        OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_12345678);
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

int TestBrushSetFilterNormal()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetFilterNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetFilterNormal()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetFilterNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetBlendModeNormal()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetBlendModeNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushResetNormal()
{
    DrawingNativeBrushTestSetUp();
    // 1. Create a brush object by calling OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    uint32_t color1 = OH_Drawing_BrushGetColor(brush);
    // 2. Set the color for the brush object by calling OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_12345678);
    // 3. Get the color of the brush object by calling OH_Drawing_BrushGetColor
    uint32_t color2 = OH_Drawing_BrushGetColor(brush);
    EXPECT_EQ(color2, DRAWING_NUMBER_12345678);
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

int TestBrushResetNull()
{
    DrawingNativeBrushTestSetUp();
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetAlphaFloatNormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, &a), OH_DRAWING_SUCCESS);
    EXPECT_EQ(a, 1.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetAlphaFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(nullptr, &a), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetAlphaFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(a, 0.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetRedFloatNormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float r = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 1.0f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, &r), OH_DRAWING_SUCCESS);
    EXPECT_EQ(r, 1.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetRedFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float r = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(nullptr, &r), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetRedFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(r, 0.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetGreenFloatNormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float g = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, &g), OH_DRAWING_SUCCESS);
    EXPECT_EQ(g, 1.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetGreenFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float g = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(nullptr, &g), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetGreenFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(g, 0.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetBlueFloatNormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float b = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, &b), OH_DRAWING_SUCCESS);
    EXPECT_EQ(b, 0.2f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushGetBlueFloatAbnormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float b = 0;
    OH_Drawing_BrushSetColor4f(brush, 1.0f, 0.4f, 1.0f, 0.2f, nullptr);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(nullptr, &b), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_BrushGetBlueFloat(brush, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(b, 0.0f);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColor4fNormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0;
    float r = 0;
    float g = 0;
    float b = 0;
    int num = DRAWING_NUMBER_201;
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColor4fNull()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0;
    float r = 0;
    float g = 0;
    float b = 0;
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBrushSetColor4fAbnormal()
{
    DrawingNativeBrushTestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    float a = 0;
    float r = 0;
    float g = 0;
    float b = 0;
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
    DrawingNativeBrushTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS