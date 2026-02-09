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

#include "include/DrawingNativeShaderEffectTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeShaderEffectPart2TestSetUp()
{
    std::cout << "DrawingNativeShaderEffectPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShaderEffectPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeShaderEffectPart2TestTearDown()
{
    std::cout << "DrawingNativeShaderEffectPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShaderEffectPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04100
 * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateSweepGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_200, TEST_POINT_Y_200);
    uint32_t colors[] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_YELLOW };
    float pos[] = { TEST_POS_0, TEST_POS_1 }; // 1.0f: gradient color points
    uint32_t size = TEST_COLOR_COUNT_2;            // colors' number
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1);
    // 1. OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix enumeration traversal and sets the unit matrix.
    OH_Drawing_ShaderEffect* shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect1, nullptr);
    OH_Drawing_ShaderEffect* shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    OH_Drawing_ShaderEffect* shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_NE(shaderEffect3, nullptr);
    OH_Drawing_ShaderEffect* shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::DECAL, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    // 2. OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix sets the non-identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, TEST_MATRIX_VALUE_2, TEST_MATRIX_VALUE_3,
                               TEST_MATRIX_VALUE_4, TEST_MATRIX_VALUE_5, TEST_MATRIX_VALUE_6,
                               TEST_MATRIX_VALUE_7, TEST_MATRIX_VALUE_8, TEST_MATRIX_VALUE_9);
    OH_Drawing_ShaderEffect* shaderEffect5 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    // 3.The last parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect6 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, nullptr);
    EXPECT_NE(shaderEffect6, nullptr);
    // 4. Destroy objects.
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);
    OH_Drawing_ShaderEffectDestroy(shaderEffect3);
    OH_Drawing_ShaderEffectDestroy(shaderEffect4);
    OH_Drawing_ShaderEffectDestroy(shaderEffect5);
    OH_Drawing_ShaderEffectDestroy(shaderEffect6);

    DrawingNativeShaderEffectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04200
 * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_Point* centerPt1 = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* centerPt2 = OH_Drawing_PointCreate(TEST_POINT_X_200, TEST_POINT_Y_200);
    uint32_t colors[] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_YELLOW };
    float pos[] = { TEST_POS_0, TEST_POS_1 }; // 1.0f: gradient color points
    uint32_t size = TEST_COLOR_COUNT_2;            // colors' number
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1);
    // 1.The first parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        nullptr, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_EQ(shaderEffect1, nullptr);
    // 2.The first parameter of the interface passes to 0.
    OH_Drawing_ShaderEffect* shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt1, colors, pos, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    // 3.The second parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, nullptr, pos, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_EQ(shaderEffect3, nullptr);
    // 4.The third parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, colors, nullptr, size, OH_Drawing_TileMode::DECAL, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    // 5.The forth parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect5 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, colors, pos, TEST_POINT_X_0, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    // 6.The last parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect6 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, colors, pos, size, OH_Drawing_TileMode::CLAMP, nullptr);
    EXPECT_NE(shaderEffect6, nullptr);
    // 7. Destroy objects.
    OH_Drawing_PointDestroy(centerPt1);
    OH_Drawing_PointDestroy(centerPt2);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);
    OH_Drawing_ShaderEffectDestroy(shaderEffect3);
    OH_Drawing_ShaderEffectDestroy(shaderEffect4);
    OH_Drawing_ShaderEffectDestroy(shaderEffect5);
    OH_Drawing_ShaderEffectDestroy(shaderEffect6);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04300
 * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_200, TEST_POINT_Y_200);
    uint32_t colors1[] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_YELLOW };
    uint32_t colors2[] = { TEST_SHADER_COLOR_WHITE };
    float pos1[] = { TEST_POS_0, TEST_POS_1 }; // 1.0f: gradient color points
    float pos2[] = { TEST_POS_NEGATIVE_1 };      // -1.0f: gradient color points
    float pos3[] = { static_cast<float>(TEST_POS_UINT32_MAX) };
    uint32_t size = TEST_COLOR_COUNT_2; // colors' number
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1);
    // 1.The second parameter of the interface passes to maximum value.
    OH_Drawing_ShaderEffect* shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors2, pos1, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect1, nullptr);
    // 2.The third parameter of the interface passes to negative value.
    OH_Drawing_ShaderEffect* shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos2, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    // 3.The third parameter of the interface passes to maximum value.
    OH_Drawing_ShaderEffect* shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos3, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_NE(shaderEffect3, nullptr);
    // 4.The fourth parameter of the interface does not match the second parameter.
    OH_Drawing_ShaderEffect* shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos1, TEST_SIZE_MISMATCH_3, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    // 5. Destroy objects.
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);
    OH_Drawing_ShaderEffectDestroy(shaderEffect3);
    OH_Drawing_ShaderEffectDestroy(shaderEffect4);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04400
 * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_200, TEST_POINT_Y_200);
    uint32_t colors[] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_YELLOW };
    float pos[] = { TEST_POS_0, TEST_POS_1 }; // 1.0f: gradient color points
    uint32_t size = TEST_COLOR_COUNT_2;            // colors' number
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1,
                               SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1, SHADER_TEST_MATRIX_VALUE_1);
    // 1.OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix is called multiple times.
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
            centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_MatrixDestroy(matrix);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateComposeEnumTraversal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04500
 * @tc.desc   test for testShaderEffectCreateComposeEnumTraversal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateComposeEnumTraversal()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    std::vector<OH_Drawing_BlendMode> blendMode = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY
    };
    OH_Drawing_ShaderEffect* src = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_GREEN);
    OH_Drawing_ShaderEffect* dst = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_BLUE);
    // 1.OH_Drawing_ShaderEffectCreateCompose passes parameters normally and traversals enumeration.
    for (int i = 0; i < blendMode.size(); i++) {
        OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreateCompose(dst, src, blendMode[i]);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateComposeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04600
 * @tc.desc   test for testShaderEffectCreateComposeNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateComposeNull()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_ShaderEffect* src = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_GREEN);
    OH_Drawing_ShaderEffect* dst = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_BLUE);
    // 1. The first parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect1 =
        OH_Drawing_ShaderEffectCreateCompose(nullptr, src, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_EQ(shaderEffect1, nullptr);
    // 2. The second parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect* shaderEffect2 =
        OH_Drawing_ShaderEffectCreateCompose(dst, nullptr, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_EQ(shaderEffect2, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateComposeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04700
 * @tc.desc   test for testShaderEffectCreateComposeMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateComposeMultipleCalls()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    OH_Drawing_ShaderEffect* src = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_GREEN);
    OH_Drawing_ShaderEffect* dst = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_BLUE);
    // 1. The interface is called multiple times.
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* shaderEffect =
            OH_Drawing_ShaderEffectCreateCompose(dst, src, OH_Drawing_BlendMode::BLEND_MODE_SRC);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreatePixelMapShaderNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04800
 * @tc.desc   test for testShaderEffectCreatePixelMapShaderNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreatePixelMapShaderNormal()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    uint32_t imageWidth = TEST_IMAGE_SIZE_200;
    uint32_t imageHeight = TEST_IMAGE_SIZE_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, SHADER_TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * TEST_BYTES_PER_PIXEL;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = TEST_PIXELMAP_COLOR_MAGENTA;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called normally.
    OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
        pixelMap, OH_Drawing_TileMode::CLAMP, OH_Drawing_TileMode::CLAMP, samplingOptions, matrix);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Destroy objects.
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreatePixelMapShaderNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04900
 * @tc.desc   test for testShaderEffectCreatePixelMapShaderNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreatePixelMapShaderNull()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    uint32_t imageWidth = TEST_IMAGE_SIZE_200;
    uint32_t imageHeight = TEST_IMAGE_SIZE_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, SHADER_TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * TEST_BYTES_PER_PIXEL;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = TEST_PIXELMAP_COLOR_MAGENTA;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. Pass each interface parameter nullptr for verification one by one.
    OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
        nullptr, OH_Drawing_TileMode::CLAMP, OH_Drawing_TileMode::CLAMP, samplingOptions, matrix);
    EXPECT_EQ(shaderEffect, nullptr);
    shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
        pixelMap, OH_Drawing_TileMode::CLAMP, OH_Drawing_TileMode::CLAMP, nullptr, matrix);
    EXPECT_EQ(shaderEffect, nullptr);
    shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
        pixelMap, OH_Drawing_TileMode::CLAMP, OH_Drawing_TileMode::CLAMP, samplingOptions, nullptr);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Destroy objects.
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreatePixelMapShaderMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_05000
 * @tc.desc   test for testShaderEffectCreatePixelMapShaderMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreatePixelMapShaderMultiCalls()
{
    DrawingNativeShaderEffectPart2TestSetUp();

    uint32_t imageWidth = TEST_IMAGE_SIZE_200;
    uint32_t imageHeight = TEST_IMAGE_SIZE_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, SHADER_TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, SHADER_TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * TEST_BYTES_PER_PIXEL;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = TEST_PIXELMAP_COLOR_MAGENTA;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called 10 times.
    OH_Drawing_ShaderEffect* shaderEffect = nullptr;
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
            pixelMap, OH_Drawing_TileMode::CLAMP, OH_Drawing_TileMode::CLAMP, samplingOptions, matrix);
        EXPECT_NE(shaderEffect, nullptr);
    }
    // 2. Destroy objects.
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);

    DrawingNativeShaderEffectPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}
}
} // namespace Rosen
} // namespace OHOS