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

#include "include/DrawingNativeColorFilterTest.h"
#include "include/OhosCommonTest.h"
#include <random>

#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_19 19
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_21 21
#define DRAWING_NUMBER_28 28
#define DRAWING_NUMBER_19937 19937
#define DRAWING_NUMBER_0X0000FFFF 0x0000FFFF
#define DRAWING_NUMBER_0X00FFFFFF 0x00FFFFFF
#define DRAWING_NUMBER_0XFF0000FF 0xFF0000FF
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeColorFilterTestSetUp()
{
    std::cout << "DrawingNativeColorFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeColorFilterTestTearDown()
{
    std::cout << "DrawingNativeColorFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorFilterTest errorCodeReset after each test case." << std::endl;
}

int TestColorFilterCreateBlendModeNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Enumerate OH_Drawing_BlendMode values in OH_Drawing_ColorFilterCreateBlendMode interface
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY
    };
    for (int i = 0; i < sizeof(blendMode) / sizeof(blendMode[0]); i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0XFF0000FF,
            blendMode[i]);
        EXPECT_NE(colorFilter, nullptr);
        // 2. Free memory
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateBlendModeNULL()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Pass an empty value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateBlendModeMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateBlendMode, random value between 0x00000000 and 0xFFFFFFFF
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0x00000000, 0xFFFFFFFF);
        uint32_t randomNumber = dis(gen);
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(randomNumber, BLEND_MODE_CLEAR);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }

    // 2. Randomly select OH_Drawing_BlendMode values, call 10 times
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0, DRAWING_NUMBER_28);
        uint32_t randomNumber = dis(gen);
        OH_Drawing_ColorFilter *colorFilter =
            OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0XFF0000FF, blendMode[randomNumber]);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateBlendModeAbnormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Pass a negative value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(-1.0f, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateBlendModeMaximum()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Pass 0xFFFFFFFF as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xFFFFFFFF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateComposeNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Call OH_Drawing_ColorFilterCreateBlendMode to create colorFilter1 and colorFilter2
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0X00FFFFFF,
        BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter1, nullptr);
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0X0000FFFF,
        BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter2, nullptr);
    // 2. Call OH_Drawing_ColorFilterCreateCompose with colorFilter1 and colorFilter2
    OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ColorFilterCreateBlendMode to create colorFilter3
    OH_Drawing_ColorFilter *colorFilter3 = OH_Drawing_ColorFilterCreateBlendMode(0x000000FF, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter3, nullptr);
    // 4. Call OH_Drawing_ColorFilterCreateCompose with colorFilter1 and colorFilter3
    OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter3);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ColorFilterCreateLuma to create colorFilter4
    OH_Drawing_ColorFilter *colorFilter4 = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(colorFilter4, nullptr);
    // 6. Call OH_Drawing_ColorFilterCreateMatrix to create colorFilter5
    const float matrix[DRAWING_NUMBER_20] = {1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0};
    OH_Drawing_ColorFilter *colorFilter5 = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_NE(colorFilter5, nullptr);
    // 7. Call OH_Drawing_ColorFilterCreateCompose with colorFilter4 and colorFilter5
    OH_Drawing_ColorFilterCreateCompose(colorFilter4, colorFilter5);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter1);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
    OH_Drawing_ColorFilterDestroy(colorFilter3);
    OH_Drawing_ColorFilterDestroy(colorFilter4);
    OH_Drawing_ColorFilterDestroy(colorFilter5);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateComposeNULL()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Pass an empty value as the first parameter to OH_Drawing_ColorFilterCreateBlendMode
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(0, BLEND_MODE_CLEAR);
    // add assert
    EXPECT_NE(colorFilter1, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter1);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateComposeMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateBlendMode with a random value between 0x00000000 and 0xFFFFFFFF
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0x00000000, 0xFFFFFFFF);
        uint32_t randomNumber = dis(gen);
        OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateBlendMode(randomNumber, BLEND_MODE_CLEAR);
        // add assert
        EXPECT_NE(colorFilter1, nullptr);
        OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateBlendMode(randomNumber, BLEND_MODE_CLEAR);
        // add assert
        EXPECT_NE(colorFilter2, nullptr);
        OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
        OH_Drawing_ColorFilterDestroy(colorFilter1);
        OH_Drawing_ColorFilterDestroy(colorFilter2);
    }
    // 2. Randomly select OH_Drawing_BlendMode values and call 10 times
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<uint32_t> dis(0, DRAWING_NUMBER_28);
        uint32_t randomNumber = dis(gen);
        OH_Drawing_ColorFilter *colorFilter1 =
            OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0XFF0000FF, blendMode[randomNumber]);
        // add assert
        EXPECT_NE(colorFilter1, nullptr);
        OH_Drawing_ColorFilter *colorFilter2 =
            OH_Drawing_ColorFilterCreateBlendMode(DRAWING_NUMBER_0XFF0000FF, blendMode[randomNumber]);
        // add assert
        EXPECT_NE(colorFilter2, nullptr);
        OH_Drawing_ColorFilterCreateCompose(colorFilter1, colorFilter2);
        OH_Drawing_ColorFilterDestroy(colorFilter1);
        OH_Drawing_ColorFilterDestroy(colorFilter2);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateMatrixNormal()
{
    DrawingNativeColorFilterTestSetUp();
    const float matrix[DRAWING_NUMBER_20] = {1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 0.5f, 0};
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(colorFilter, nullptr);

    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateMatrixNULL()
{
    DrawingNativeColorFilterTestSetUp();
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    const float matrix[DRAWING_NUMBER_20] = {};
    colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateMatrixAbnormal()
{
    DrawingNativeColorFilterTestSetUp();
    const float matrix[DRAWING_NUMBER_19] = {1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 0.5f};
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    const float matrix2[DRAWING_NUMBER_21] = {
        1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 0.5f, 0, 0};
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateMatrix(matrix2);
    // add assert
    EXPECT_NE(colorFilter2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateMatrixMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        const float matrix[DRAWING_NUMBER_20] = {
            1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 1.0f, 0, 0, 0, 0, 0, 0.5f, 0
        };
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLinearToSrgbGammaNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Call OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // add assert
    EXPECT_NE(colorFilter, nullptr);

    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLinearToSrgbGammaMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1、OH_Drawing_ColorFilterCreateLinearToSrgbGamma 调用10次
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateSrgbGammaToLinearNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Call OH_Drawing_ColorFilterCreateSrgbGammaToLinear
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateSrgbGammaToLinearMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Call OH_Drawing_ColorFilterCreateSrgbGammaToLinear 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLumaNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLuma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
    EXPECT_NE(colorFilter, nullptr);
    // 2. Free memory
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLumaMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. Call OH_Drawing_ColorFilterCreateLuma 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterDestroyNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLuma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLuma();
    EXPECT_NE(colorFilter, nullptr);
    // 2. OH_Drawing_ColorFilterDestroy()
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterDestroyNULL()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterDestroy with empty parameter
    OH_Drawing_ColorFilter *colorFilter = nullptr;
    OH_Drawing_ColorFilterDestroy(nullptr);
    EXPECT_EQ(colorFilter, nullptr);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLightingNormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLighting passes parameters normally.
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLighting(0xFF00FF00, 0XFF0000FF);
    EXPECT_NE(colorFilter, nullptr);
    // 2. Destroy colorFilter
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLightingNULL()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLighting passes NULL.
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateLighting(0, 0XFF0000FF);
    EXPECT_NE(colorFilter1, nullptr);
    // 2. OH_Drawing_ColorFilterCreateLighting passes NULL.
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateLighting(0xFF00FF00, 0);
    EXPECT_NE(colorFilter2, nullptr);
    // 3. Destroy colorFilter
    OH_Drawing_ColorFilterDestroy(colorFilter1);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLightingAbnormal()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLighting passes maximum value.
    OH_Drawing_ColorFilter *colorFilter1 = OH_Drawing_ColorFilterCreateLighting(0xFFFFFFFF, 0XFF0000FF);
    EXPECT_NE(colorFilter1, nullptr);
    // 2. OH_Drawing_ColorFilterCreateLighting passes maximum value.
    OH_Drawing_ColorFilter *colorFilter2 = OH_Drawing_ColorFilterCreateLighting(0xFF00FF00, 0xFFFFFFFF);
    EXPECT_NE(colorFilter2, nullptr);
    // 3. Destroy colorFilter
    OH_Drawing_ColorFilterDestroy(colorFilter1);
    OH_Drawing_ColorFilterDestroy(colorFilter2);
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorFilterCreateLightingMultipleCalls()
{
    DrawingNativeColorFilterTestSetUp();
    // 1. OH_Drawing_ColorFilterCreateLighting is called multiple times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLighting(DRAWING_NUMBER_0XFFFFFFFF,
            DRAWING_NUMBER_0XFF0000FF);
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeColorFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
