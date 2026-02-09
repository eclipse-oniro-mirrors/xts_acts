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
void DrawingNativeShaderEffectTestSetUp()
{
    std::cout << "DrawingNativeShaderEffectTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShaderEffectTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeShaderEffectTestTearDown()
{
    std::cout << "DrawingNativeShaderEffectTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShaderEffectTest errorCodeReset after each test case." << std::endl;
}

// Helper structure for TwoPointConicalGradient test common data
struct TwoPointConicalGradientTestData {
    OH_Drawing_Point2D startPt;
    OH_Drawing_Point2D endPt;
    uint32_t colors[TEST_COLOR_COUNT_3];
    float pos[TEST_COLOR_COUNT_3];
    float startRadius;
    float endRadius;
    OH_Drawing_Matrix* matrix;
};

// Initialize common test data for TwoPointConicalGradient tests
TwoPointConicalGradientTestData InitTwoPointConicalGradientTestData()
{
    TwoPointConicalGradientTestData data;
    data.startPt = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    data.endPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    data.colors[TEST_ARRAY_INDEX_0] = TEST_SHADER_COLOR_CYAN;
    data.colors[TEST_ARRAY_INDEX_1] = TEST_SHADER_COLOR_MAGENTA;
    data.colors[TEST_ARRAY_INDEX_2] = TEST_SHADER_COLOR_YELLOW;
    data.pos[TEST_ARRAY_INDEX_0] = TEST_POS_0;
    data.pos[TEST_ARRAY_INDEX_1] = TEST_POS_0_5;
    data.pos[TEST_ARRAY_INDEX_2] = TEST_POS_1;
    data.startRadius = TEST_RADIUS_5;
    data.endRadius = TEST_RADIUS_10;
    data.matrix = OH_Drawing_MatrixCreate();
    return data;
}

// Cleanup common test data for TwoPointConicalGradient tests
void CleanupTwoPointConicalGradientTestData(TwoPointConicalGradientTestData& data,
    OH_Drawing_ShaderEffect* effects[TEST_EFFECT_COUNT_6])
{
    OH_Drawing_MatrixDestroy(data.matrix);
    for (int i = TEST_ARRAY_INDEX_0; i < TEST_EFFECT_COUNT_6; i++) {
        OH_Drawing_ShaderEffectDestroy(effects[i]);
    }
    DrawingNativeShaderEffectTestTearDown();
}

/**
 * @tc.name   testShaderEffectCreateColorShaderNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0100
 * @tc.desc   test for testShaderEffectCreateColorShaderNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateColorShaderNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. OH_Drawing_ShaderEffectCreateColorShader
    uint32_t color = TEST_SHADER_COLOR_RED;
    OH_Drawing_ShaderEffect* colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(color);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateColorShaderNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0200
 * @tc.desc   test for testShaderEffectCreateColorShaderNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateColorShaderNull()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. OH_Drawing_ShaderEffectCreateColorShader with empty parameter
    OH_Drawing_ShaderEffect* colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_0);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateColorShaderAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0300
 * @tc.desc   test for testShaderEffectCreateColorShaderAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateColorShaderAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. OH_Drawing_ShaderEffectCreateColorShader with a negative parameter
    OH_Drawing_ShaderEffect* colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(-TEST_SHADER_COLOR_RED);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateColorShaderMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0400
 * @tc.desc   test for testShaderEffectCreateColorShaderMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateColorShaderMaximum()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. OH_Drawing_ShaderEffectCreateColorShader with maximum value as parameter
    OH_Drawing_ShaderEffect* colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(UINT32_MAX_VALUE);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateColorShaderMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0500
 * @tc.desc   test for testShaderEffectCreateColorShaderMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateColorShaderMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Call OH_Drawing_ShaderEffectCreateColorShader 10 times with different colors
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* colorShaderEffect =
        OH_Drawing_ShaderEffectCreateColorShader(TEST_SHADER_COLOR_BLACK + i);
        // add assert
        EXPECT_NE(colorShaderEffect, nullptr);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0600
 * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateLinearGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D end = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Enumerate OH_Drawing_TileMode values for OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix, and test
    // with both identity and non-identity matrix
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect* linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                       mode, matrix);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }

    // 2. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with pos set to NULL
    OH_Drawing_ShaderEffect* linearGradientEffect = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, nullptr, TEST_COLOR_COUNT_3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with matrix set to NULL
    OH_Drawing_ShaderEffect* linearGradientEffect2 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, pos, TEST_COLOR_COUNT_3, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0700
 * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D end = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the first parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect1 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(nullptr, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the second parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, nullptr, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the third parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, nullptr, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect1);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0800
 * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D end = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for startPt
    start = { TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1 };
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_NE(linearGradientEffect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for endPt
    start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    end = { TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1 };
    OH_Drawing_ShaderEffect* linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_NE(linearGradientEffect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for colors
    colors[0] = -TEST_SHADER_COLOR_CYAN;
    OH_Drawing_ShaderEffect* linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_NE(linearGradientEffect3, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for pos
    colors[0] = TEST_SHADER_COLOR_CYAN;
    pos[0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    EXPECT_NE(linearGradientEffect4, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect4);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0900
 * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradientWithLocalMatrixMaximum()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D end = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with startPt set to maximum value
    start = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with endPt set to maximum value
    start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    end = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    OH_Drawing_ShaderEffect* linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with colors set to maximum value
    colors[0] = UINT32_MAX_VALUE;
    OH_Drawing_ShaderEffect* linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with pos set to maximum value
    colors[0] = TEST_SHADER_COLOR_CYAN;
    pos[0] = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                   modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect4);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01000
 * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D start = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D end = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, TEST_COLOR_COUNT_3,
                                                                       CLAMP, matrix);
        // add assert
        EXPECT_NE(linearGradientEffect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradienNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01100
 * @tc.desc   test for testShaderEffectCreateLinearGradienNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateLinearGradienNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateLinearGradient
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_0);
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect* linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, mode);
        // add assert
        EXPECT_NE(linearGradientEffect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to NULL
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, nullptr, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradienNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01200
 * @tc.desc   test for testShaderEffectCreateLinearGradienNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradienNull()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_0);
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(nullptr, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient with the second parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, nullptr, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient with the third parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, nullptr, pos, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradienAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01300
 * @tc.desc   test for testShaderEffectCreateLinearGradienAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradienAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_0);
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient interface with startPt set to negative values
    OH_Drawing_Point* startPt2 = OH_Drawing_PointCreate(TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1);
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with endPt set to negative values
    OH_Drawing_Point* endPt2 = OH_Drawing_PointCreate(TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1);
    OH_Drawing_ShaderEffect* linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient interface with colors set to negative values
    colors[0] = -TEST_SHADER_COLOR_CYAN;
    OH_Drawing_ShaderEffect* linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to negative values
    colors[0] = TEST_SHADER_COLOR_CYAN;
    pos[0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_PointDestroy(startPt2);
    OH_Drawing_PointDestroy(endPt2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect4);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradienMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01400
 * @tc.desc   test for testShaderEffectCreateLinearGradienMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradienMaximum()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_0);
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient with startPt set to maximum values
    OH_Drawing_Point* startPt2 = OH_Drawing_PointCreate(SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE);
    OH_Drawing_ShaderEffect* linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateLinearGradient with endPt set to maximum values
    OH_Drawing_Point* endPt2 = OH_Drawing_PointCreate(SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE);
    OH_Drawing_ShaderEffect* linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateLinearGradient with colors set to maximum values
    colors[0] = UINT32_MAX_VALUE;
    OH_Drawing_ShaderEffect* linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateLinearGradient with pos set to maximum values
    colors[0] = TEST_SHADER_COLOR_CYAN;
    pos[0] = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_PointDestroy(startPt2);
    OH_Drawing_PointDestroy(endPt2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect4);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateLinearGradienMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01500
 * @tc.desc   test for testShaderEffectCreateLinearGradienMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateLinearGradienMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(TEST_POINT_X_0, TEST_POINT_Y_0);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_0);
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
        // add assert
        EXPECT_NE(linearGradientEffect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01600
 * @tc.desc   test for testShaderEffectCreateRadialGradientNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateRadialGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateRadialGradient
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors,
                                                                                      pos, TEST_COLOR_COUNT_3, mode);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with pos set to nullptr
    OH_Drawing_ShaderEffect* effect =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors, nullptr, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01700
 * @tc.desc   test for testShaderEffectCreateRadialGradientNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. OH_Drawing_ShaderEffectCreateRadialGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateRadialGradient(nullptr, TEST_RADIUS_100, colors,
                                                                                  pos, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, nullptr,
                                                                                   pos, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(effect2, nullptr);
    // 3. OH_Drawing_ShaderEffectCreateRadialGradient with the third parameter set to nullptr
    OH_Drawing_ShaderEffect* effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors, nullptr, TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_NE(effect3, nullptr);
    // 4. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01800
 * @tc.desc   test for testShaderEffectCreateRadialGradientAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to negative values
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(TEST_POINT_NEGATIVE_100, TEST_POINT_NEGATIVE_100);
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, TEST_RADIUS_100, colors, pos,
                                                                                  TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to negative values
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_NEGATIVE_100,
                                                                                   colors, pos, TEST_COLOR_COUNT_3,
                                                                                   CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to negative values
    colors[0] = -TEST_SHADER_COLOR_RED;
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors,
                                                                                   pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to negative values
    colors[0] = TEST_SHADER_COLOR_RED;
    pos[0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors,
                                                                                   pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01900
 * @tc.desc   test for testShaderEffectCreateRadialGradientMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to maximum values
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE);
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, TEST_RADIUS_100, colors, pos,
                                                                                  TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to maximum values
    OH_Drawing_ShaderEffect* effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, SHADER_FLT_MAX_VALUE, colors, pos,
                                                    TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to maximum values
    uint32_t colors2[] = { UINT32_MAX_VALUE, UINT32_MAX_VALUE, UINT32_MAX_VALUE };
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors2,
                                                                                   pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to maximum values
    float pos2[] = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    OH_Drawing_ShaderEffect* effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors,
                                                                                   pos2, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02000
 * @tc.desc   test for testShaderEffectCreateRadialGradientMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* effect =
            OH_Drawing_ShaderEffectCreateRadialGradient(point, TEST_RADIUS_100, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
        // add assert
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02100
 * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateRadialGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float radius = TEST_RADIUS_5;
    OH_Drawing_Point2D start = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix, covering
    // both the identity matrix and non-identity matrices for matrix
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect* effect =
            OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                       mode, matrix);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to nullptr
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, nullptr, TEST_COLOR_COUNT_3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with matrix set to nullptr
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, pos, TEST_COLOR_COUNT_3, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);

    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02200
 * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectTestSetUp();

    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float radius = TEST_RADIUS_5;
    OH_Drawing_Point2D start = { TEST_POINT_X_100, TEST_POINT_Y_0 }; // 100.f: start point's x
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the first parameter set to nullptr and
    // check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(nullptr, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the second parameter set to nullptr
    OH_Drawing_ShaderEffect* effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, nullptr, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the third parameter set to nullptr
    OH_Drawing_ShaderEffect* effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, nullptr, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02300
 * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to negative values
    OH_Drawing_Point2D centerPt = { TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1 };
    float radius = TEST_RADIUS_5;
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect* effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to negative values
    centerPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    radius = TEST_RADIUS_NEGATIVE_5;
    OH_Drawing_ShaderEffect* effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to negative values
    colors[0] = -TEST_SHADER_COLOR_RED;
    OH_Drawing_ShaderEffect* effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect3, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to negative values
    colors[0] = TEST_SHADER_COLOR_RED;
    pos[0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect4, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02400
 * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientWithLocalMatrixMaximum()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to a large number
    OH_Drawing_Point2D centerPt = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    float radius = TEST_RADIUS_5;
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect* effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to a large number
    centerPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    radius = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to a large number
    colors[0] = UINT32_MAX_VALUE;
    OH_Drawing_ShaderEffect* effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect3, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to a large number
    colors[0] = TEST_SHADER_COLOR_RED;
    pos[0] = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, TEST_COLOR_COUNT_3,
                                                                   CLAMP, matrix);
    EXPECT_NE(effect4, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);

    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02500
 * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D centerPt = { TEST_POINT_X_100, TEST_POINT_Y_100 };
    float radius = TEST_RADIUS_5;
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
            &centerPt, radius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
        // add assert
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02600
 * @tc.desc   test for testShaderEffectCreateSweepGradientNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateSweepGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateSweepGradient
    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos,
                                                                                     TEST_COLOR_COUNT_3, mode);
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to nullptr
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, nullptr,
                                                                                 TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02700
 * @tc.desc   test for testShaderEffectCreateSweepGradientNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with the first parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateSweepGradient(nullptr, colors, pos,
                                                                                 TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with the second parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, nullptr, pos,
                                                                                  TEST_COLOR_COUNT_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02800
 * @tc.desc   test for testShaderEffectCreateSweepGradientAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to negative values
    OH_Drawing_Point* centerPt2 = OH_Drawing_PointCreate(TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1);
    OH_Drawing_ShaderEffect* sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to negative values
    colors[0] = -TEST_SHADER_COLOR_RED;
    OH_Drawing_ShaderEffect* sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to negative values
    colors[0] = TEST_SHADER_COLOR_RED;
    pos[0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_PointDestroy(centerPt2);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02900
 * @tc.desc   test for testShaderEffectCreateSweepGradientMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to a large number
    OH_Drawing_Point* centerPt2 = OH_Drawing_PointCreate(SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE);
    OH_Drawing_ShaderEffect* sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to a large number
    colors[0] = UINT32_MAX_VALUE;
    OH_Drawing_ShaderEffect* sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to a large number
    colors[0] = TEST_SHADER_COLOR_RED;
    pos[0] = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_PointDestroy(centerPt2);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(sweepGradientEffect3);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateSweepGradientMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03000
 * @tc.desc   test for testShaderEffectCreateSweepGradientMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateSweepGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(TEST_POINT_X_100, TEST_POINT_Y_100);
    uint32_t colors[] = { TEST_SHADER_COLOR_RED, TEST_SHADER_COLOR_GREEN, TEST_SHADER_COLOR_BLUE };
    float pos[] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* sweepGradientEffect =
            OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, TEST_COLOR_COUNT_3, CLAMP);
        // add assert
        EXPECT_NE(sweepGradientEffect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(sweepGradientEffect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateImageShaderNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03100
 * @tc.desc   test for testShaderEffectCreateImageShaderNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateImageShaderNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Call OH_Drawing_ImageCreate
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. Call OH_Drawing_SamplingOptionsCreate
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    // 3. Call OH_Drawing_ShaderEffectCreateImageShader with different OH_Drawing_TileMode values for tileX and tileY
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode tileX : modes) {
        for (OH_Drawing_TileMode tileY : modes) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_ShaderEffect* effect =
                OH_Drawing_ShaderEffectCreateImageShader(image, tileX, tileY, options, matrix);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            EXPECT_NE(effect, nullptr);
            OH_Drawing_ShaderEffectDestroy(effect);
        }
    }
    // 4. Call OH_Drawing_ShaderEffectCreateImageShader with null matrix
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, options, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 5. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ShaderEffectDestroy(effect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateImageShaderNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03200
 * @tc.desc   test for testShaderEffectCreateImageShaderNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateImageShaderNull()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. Call OH_Drawing_ShaderEffectCreateImageShader with the first parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_ShaderEffectCreateImageShader(nullptr, CLAMP, CLAMP, options, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateImageShader with the fourth parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_MatrixDestroy(matrix);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateImageShaderMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03300
 * @tc.desc   test for testShaderEffectCreateImageShaderMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateImageShaderMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateImageShader 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* effect =
            OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, options, matrix);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_MatrixDestroy(matrix);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateTwoPointConicalGradientNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03400
 * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectCreateTwoPointConicalGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D startPt = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D endPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float startRadius = TEST_RADIUS_5;
    float endRadius = TEST_RADIUS_10;
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    // 1. Enumerate OH_Drawing_TileMode values for OH_Drawing_ShaderEffectCreateTwoPointConicalGradient, and cover both
    // the identity matrix and non-identity matrix for the matrix parameter
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
        OH_Drawing_ShaderEffect* effect1 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, mode, matrix);
        EXPECT_NE(effect1, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect1);
        OH_Drawing_MatrixSetMatrix(matrix, SHADER_TEST_MATRIX_VALUE_1, TEST_POINT_X_0, TEST_POINT_X_0,
                                   SHADER_TEST_MATRIX_VALUE_1, TEST_POINT_X_0, TEST_POINT_X_0, TEST_POINT_X_0,
                                   TEST_POINT_X_0, TEST_POINT_X_0);
        OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, mode, matrix);
        EXPECT_NE(effect2, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect2);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to nullptr
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, TEST_COLOR_COUNT_3, CLAMP, matrix);
    EXPECT_NE(effect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with matrix set to nullptr
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, nullptr);
    EXPECT_NE(effect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);

    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateTwoPointConicalGradientNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03500
 * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateTwoPointConicalGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D startPt = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D endPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float startRadius = TEST_RADIUS_5;
    float endRadius = TEST_RADIUS_10;
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the first parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        nullptr, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, TEST_POINT_X_0, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the third parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, nullptr, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fourth parameter set to nullptr
    OH_Drawing_ShaderEffect* effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, TEST_POINT_X_0, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fifth parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect* effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, nullptr, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the sixth parameter set to nullptr
    OH_Drawing_ShaderEffect* effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, TEST_COLOR_COUNT_3, CLAMP, matrix);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    OH_Drawing_ShaderEffectDestroy(effect5);
    OH_Drawing_ShaderEffectDestroy(effect6);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateTwoPointConicalGradientAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03600
 * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateTwoPointConicalGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    TwoPointConicalGradientTestData testData = InitTwoPointConicalGradientTestData();
    EXPECT_NE(testData.matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a negative value
    OH_Drawing_Point2D startPt2 = { TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1 };
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a negative value
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, TEST_RADIUS_NEGATIVE_5, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a negative value
    OH_Drawing_Point2D endPt2 = { TEST_POINT_NEGATIVE_1, TEST_POINT_NEGATIVE_1 };
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &endPt2, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect3, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a negative value
    OH_Drawing_ShaderEffect* effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, -TEST_RADIUS_10, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect4, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a negative value
    testData.colors[TEST_ARRAY_INDEX_0] = -TEST_SHADER_COLOR_CYAN;
    OH_Drawing_ShaderEffect* effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect5, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a negative value
    testData.colors[TEST_ARRAY_INDEX_0] = TEST_SHADER_COLOR_CYAN;
    testData.pos[TEST_ARRAY_INDEX_0] = TEST_POS_NEGATIVE_0_1;
    OH_Drawing_ShaderEffect* effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect6, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_ShaderEffect* effects[TEST_EFFECT_COUNT_6] = { effect, effect2, effect3, effect4, effect5, effect6 };
    CleanupTwoPointConicalGradientTestData(testData, effects);
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateTwoPointConicalGradientMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03700
 * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateTwoPointConicalGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    TwoPointConicalGradientTestData testData = InitTwoPointConicalGradientTestData();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a maximum value
    OH_Drawing_Point2D startPt2 = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a maximum value
    OH_Drawing_ShaderEffect* effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, SHADER_FLT_MAX_VALUE, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect2, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a maximum value
    OH_Drawing_Point2D endPt2 = { SHADER_FLT_MAX_VALUE, SHADER_FLT_MAX_VALUE };
    OH_Drawing_ShaderEffect* effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &endPt2, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect3, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a maximum value
    OH_Drawing_ShaderEffect* effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, SHADER_FLT_MAX_VALUE, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect4, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a maximum value
    testData.colors[TEST_ARRAY_INDEX_0] = UINT32_MAX_VALUE;
    OH_Drawing_ShaderEffect* effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect5, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a maximum value
    testData.colors[TEST_ARRAY_INDEX_0] = TEST_SHADER_COLOR_CYAN;
    testData.pos[TEST_ARRAY_INDEX_0] = SHADER_FLT_MAX_VALUE;
    OH_Drawing_ShaderEffect* effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &testData.startPt, testData.startRadius, &testData.endPt, testData.endRadius, testData.colors, testData.pos,
        TEST_COLOR_COUNT_3, CLAMP, testData.matrix);
    EXPECT_NE(effect6, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free memory
    OH_Drawing_ShaderEffect* effects[TEST_EFFECT_COUNT_6] = { effect, effect2, effect3, effect4, effect5, effect6 };
    CleanupTwoPointConicalGradientTestData(testData, effects);
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectCreateTwoPointConicalGradientMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03800
 * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectCreateTwoPointConicalGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D startPt = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D endPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float startRadius = TEST_RADIUS_5;
    float endRadius = TEST_RADIUS_10;
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient 10 times
    for (int i = 0; i < SHADER_TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
        // add assert
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03900
 * @tc.desc   test for testShaderEffectDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShaderEffectDestroyNormal()
{
    DrawingNativeShaderEffectTestSetUp();

    OH_Drawing_Point2D startPt = { TEST_POINT_X_0, TEST_POINT_Y_0 };
    OH_Drawing_Point2D endPt = { TEST_POINT_X_100, TEST_POINT_Y_0 };
    uint32_t colors[TEST_COLOR_COUNT_3] = { TEST_SHADER_COLOR_CYAN, TEST_SHADER_COLOR_MAGENTA,
        TEST_SHADER_COLOR_YELLOW };
    float pos[TEST_COLOR_COUNT_3] = { TEST_POS_0, TEST_POS_0_5, TEST_POS_1 };
    float startRadius = TEST_RADIUS_5;
    float endRadius = TEST_RADIUS_10;
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient
    OH_Drawing_ShaderEffect* effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, TEST_COLOR_COUNT_3, CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 2. Call OH_Drawing_ShaderEffectDestroy
    OH_Drawing_ShaderEffectDestroy(effect);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShaderEffectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04000
 * @tc.desc   test for testShaderEffectDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShaderEffectDestroyNull()
{
    DrawingNativeShaderEffectTestSetUp();

    // 1. OH_Drawing_ShaderEffectDestroy parameter is null
    OH_Drawing_ShaderEffectDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeShaderEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS