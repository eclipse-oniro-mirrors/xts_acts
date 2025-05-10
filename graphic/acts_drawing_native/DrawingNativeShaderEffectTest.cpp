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

#include "gtest/gtest.h"

#include "drawing_color.h"
#include "drawing_error_code.h"
#include "drawing_filter.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeShaderEffectTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeShaderEffectTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeShaderEffectTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeShaderEffectTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeShaderEffectTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0100
 * @tc.name: testShaderEffectCreateColorShaderNormal
 * @tc.desc: test for testShaderEffectCreateColorShaderNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateColorShaderNormal, TestSize.Level0) {
    // 1. OH_Drawing_ShaderEffectCreateColorShader
    uint32_t color = 0xFFFF0000;
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(color);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0101
 * @tc.name: testShaderEffectCreateColorShaderNull
 * @tc.desc: test for testShaderEffectCreateColorShaderNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateColorShaderNull, TestSize.Level3) {
    // 1. OH_Drawing_ShaderEffectCreateColorShader with empty parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(0);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0102
 * @tc.name: testShaderEffectCreateColorShaderAbnormal
 * @tc.desc: test for testShaderEffectCreateColorShaderAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateColorShaderAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_ShaderEffectCreateColorShader with a negative parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(-0xFFFF0000);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0103
 * @tc.name: testShaderEffectCreateColorShaderMaximum
 * @tc.desc: test for testShaderEffectCreateColorShaderMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateColorShaderMaximum, TestSize.Level3) {
    // 1. OH_Drawing_ShaderEffectCreateColorShader with maximum value as parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(UINT32_MAX);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0104
 * @tc.name: testShaderEffectCreateColorShaderMultipleCalls
 * @tc.desc: test for testShaderEffectCreateColorShaderMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateColorShaderMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_ShaderEffectCreateColorShader 10 times with different colors
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(0xFF000000 + i);
        // add assert
        EXPECT_NE(colorShaderEffect, nullptr);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0200
 * @tc.name: testShaderEffectCreateLinearGradientWithLocalMatrixNormal
 * @tc.desc: test for testShaderEffectCreateLinearGradientWithLocalMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradientWithLocalMatrixNormal, TestSize.Level0) {
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Enumerate OH_Drawing_TileMode values for OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix, and test
    // with both identity and non-identity matrix
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, mode, matrix);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }

    // 2. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with pos set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, nullptr, 3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with matrix set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect2 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, pos, 3, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0201
 * @tc.name: testShaderEffectCreateLinearGradientWithLocalMatrixNull
 * @tc.desc: test for testShaderEffectCreateLinearGradientWithLocalMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradientWithLocalMatrixNull, TestSize.Level3) {
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the first parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect1 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(nullptr, &end, colors, pos, 3, modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the second parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, nullptr, colors, pos, 3, modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the third parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, nullptr, pos, 3, modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect1);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0202
 * @tc.name: testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal
 * @tc.desc: test for testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal, TestSize.Level3) {
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for startPt
    start = {-1, -1};
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for endPt
    start = {0, 0};
    end = {-1, -1};
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for colors
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for pos
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0203
 * @tc.name: testShaderEffectCreateLinearGradientWithLocalMatrixMaximum
 * @tc.desc: test for testShaderEffectCreateLinearGradientWithLocalMatrixMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradientWithLocalMatrixMaximum, TestSize.Level3) {
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with startPt set to maximum value
    start = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with endPt set to maximum value
    start = {0, 0};
    end = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with colors set to maximum value
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with pos set to maximum value
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, modes[0], matrix);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0204
 * @tc.name: testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls
 * @tc.desc: test for testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls,
         TestSize.Level3) {
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 3, CLAMP, matrix);
            // add assert
            EXPECT_NE(linearGradientEffect, nullptr);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0300
 * @tc.name: testShaderEffectCreateLinearGradienNormal
 * @tc.desc: test for testShaderEffectCreateLinearGradienNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradienNormal, TestSize.Level0) {
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateLinearGradient
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, mode);
            // add assert
            EXPECT_NE(linearGradientEffect, nullptr);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, nullptr, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0301
 * @tc.name: testShaderEffectCreateLinearGradienNull
 * @tc.desc: test for testShaderEffectCreateLinearGradienNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradienNull, TestSize.Level3) {
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(nullptr, endPt, colors, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient with the second parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, nullptr, colors, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient with the third parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, nullptr, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect2);
    OH_Drawing_ShaderEffectDestroy(linearGradientEffect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0302
 * @tc.name: testShaderEffectCreateLinearGradienAbnormal
 * @tc.desc: test for testShaderEffectCreateLinearGradienAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradienAbnormal, TestSize.Level3) {
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient interface with startPt set to negative values
    OH_Drawing_Point *startPt2 = OH_Drawing_PointCreate(-1, -1);
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with endPt set to negative values
    OH_Drawing_Point *endPt2 = OH_Drawing_PointCreate(-1, -1);
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient interface with colors set to negative values
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to negative values
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0303
 * @tc.name: testShaderEffectCreateLinearGradienMaximum
 * @tc.desc: test for testShaderEffectCreateLinearGradienMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradienMaximum, TestSize.Level3) {
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient with startPt set to maximum values
    OH_Drawing_Point *startPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateLinearGradient with endPt set to maximum values
    OH_Drawing_Point *endPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateLinearGradient with colors set to maximum values
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateLinearGradient with pos set to maximum values
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0304
 * @tc.name: testShaderEffectCreateLinearGradienMultipleCalls
 * @tc.desc: test for testShaderEffectCreateLinearGradienMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateLinearGradienMultipleCalls, TestSize.Level3) {
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, 3, CLAMP);
            // add assert
            EXPECT_NE(linearGradientEffect, nullptr);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0400
 * @tc.name: testShaderEffectCreateRadialGradientNormal
 * @tc.desc: test for testShaderEffectCreateRadialGradientNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientNormal, TestSize.Level0) {
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateRadialGradient
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, pos, 3, mode);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with pos set to nullptr
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, nullptr, 3, CLAMP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0401
 * @tc.name: testShaderEffectCreateRadialGradientNull
 * @tc.desc: test for testShaderEffectCreateRadialGradientNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientNull, TestSize.Level3) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. OH_Drawing_ShaderEffectCreateRadialGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(nullptr, 100, colors, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, nullptr, pos, 3, CLAMP);
    EXPECT_EQ(effect2, nullptr);
    // 3. OH_Drawing_ShaderEffectCreateRadialGradient with the third parameter set to nullptr
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, nullptr, 3, CLAMP);
    EXPECT_NE(effect3, nullptr);
    // 4. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0402
 * @tc.name: testShaderEffectCreateRadialGradientAbnormal
 * @tc.desc: test for testShaderEffectCreateRadialGradientAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientAbnormal, TestSize.Level3) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to negative values
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(-100, -100);
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, 100, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to negative values
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, -100, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to negative values
    colors[0] = -0xFFFF0000;
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to negative values
    colors[0] = 0xFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, pos, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0403
 * @tc.name: testShaderEffectCreateRadialGradientMaximum
 * @tc.desc: test for testShaderEffectCreateRadialGradientMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientMaximum, TestSize.Level3) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to maximum values
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, 100, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to maximum values
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, FLT_MAX, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to maximum values
    uint32_t colors2[] = {UINT32_MAX, UINT32_MAX, UINT32_MAX};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors2, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to maximum values
    float pos2[] = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, pos2, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0404
 * @tc.name: testShaderEffectCreateRadialGradientMultipleCalls
 * @tc.desc: test for testShaderEffectCreateRadialGradientMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientMultipleCalls, TestSize.Level3) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *effect =
            OH_Drawing_ShaderEffectCreateRadialGradient(point, 100, colors, pos, 3, CLAMP);
            // add assert
            EXPECT_NE(effect, nullptr);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0500
 * @tc.name: testShaderEffectCreateRadialGradientWithLocalMatrixNormal
 * @tc.desc: test for testShaderEffectCreateRadialGradientWithLocalMatrixNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientWithLocalMatrixNormal, TestSize.Level0) {
    float pos[] = {0.0f, 0.5f, 1.0f};      // 0.5f: gradient color points, 1.0f: gradient color points
    float radius = 5.0;                    // 5.0f: gradient color radius
    OH_Drawing_Point2D start = {100.f, 0}; // 100.f: start point's x
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
        OH_Drawing_ShaderEffect *effect =
            OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, pos, 3, mode, matrix);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, nullptr, 3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with matrix set to nullptr
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, pos, 3, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0501
 * @tc.name: testShaderEffectCreateRadialGradientWithLocalMatrixNull
 * @tc.desc: test for testShaderEffectCreateRadialGradientWithLocalMatrixNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientWithLocalMatrixNull, TestSize.Level3) {
    float pos[] = {0.0f, 0.5f, 1.0f};      // 0.5f: gradient color points, 1.0f: gradient color points
    float radius = 5.0;                    // 5.0f: gradient color radius
    OH_Drawing_Point2D start = {100.f, 0}; // 100.f: start point's x
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the first parameter set to nullptr and
    // check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(nullptr, radius, colors, pos, 3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, nullptr, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the third parameter set to nullptr
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, nullptr, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0502
 * @tc.name: testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal
 * @tc.desc: test for testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to negative values
    OH_Drawing_Point2D centerPt = {-1, -1};
    float radius = 5.0;
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to negative values
    centerPt = {100, 0};
    radius = -5.0;
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to negative values
    colors[0] = -0xFFFF0000;
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to negative values
    colors[0] = 0xFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0503
 * @tc.name: testShaderEffectCreateRadialGradientWithLocalMatrixMaximum
 * @tc.desc: test for testShaderEffectCreateRadialGradientWithLocalMatrixMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientWithLocalMatrixMaximum, TestSize.Level3) {
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to a large number
    OH_Drawing_Point2D centerPt = {FLT_MAX, FLT_MAX};
    float radius = 5.0;
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to a large number
    centerPt = {100, 0};
    radius = FLT_MAX;
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to a large number
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to a large number
    colors[0] = 0xFFFF0000;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0504
 * @tc.name: testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls
 * @tc.desc: test for testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls,
         TestSize.Level3) {
    OH_Drawing_Point2D centerPt = {100, 100};
    float radius = 5.0;
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
            &centerPt, radius, colors, pos, 3, CLAMP, matrix);
        // add assert
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0600
 * @tc.name: testShaderEffectCreateSweepGradientNormal
 * @tc.desc: test for testShaderEffectCreateSweepGradientNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateSweepGradientNormal, TestSize.Level0) {
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateSweepGradient
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, mode);
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to nullptr
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, nullptr, 3, CLAMP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0601
 * @tc.name: testShaderEffectCreateSweepGradientNull
 * @tc.desc: test for testShaderEffectCreateSweepGradientNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateSweepGradientNull, TestSize.Level3) {
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with the first parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(nullptr, colors, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with the second parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, nullptr, pos, 3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0602
 * @tc.name: testShaderEffectCreateSweepGradientAbnormal
 * @tc.desc: test for testShaderEffectCreateSweepGradientAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateSweepGradientAbnormal, TestSize.Level3) {
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to negative values
    OH_Drawing_Point *centerPt2 = OH_Drawing_PointCreate(-1, -1);
    OH_Drawing_ShaderEffect *sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to negative values
    colors[0] = -0xFFFF0000;
    OH_Drawing_ShaderEffect *sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to negative values
    colors[0] = 0xFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0603
 * @tc.name: testShaderEffectCreateSweepGradientMaximum
 * @tc.desc: test for testShaderEffectCreateSweepGradientMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateSweepGradientMaximum, TestSize.Level3) {
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to a large number
    OH_Drawing_Point *centerPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to a large number
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to a large number
    colors[0] = 0xFFFF0000;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, CLAMP);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0604
 * @tc.name: testShaderEffectCreateSweepGradientMultipleCalls
 * @tc.desc: test for testShaderEffectCreateSweepGradientMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateSweepGradientMultipleCalls, TestSize.Level3) {
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(100, 100);
    uint32_t colors[] = {0xFFFF0000, 0xFF00FF00, 0xFF0000FF};
    float pos[] = {0, 0.5, 1.0};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *sweepGradientEffect =
            OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, 3, CLAMP);
        // add assert
        EXPECT_NE(sweepGradientEffect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(sweepGradientEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0700
 * @tc.name: testShaderEffectCreateImageShaderNormal
 * @tc.desc: test for testShaderEffectCreateImageShaderNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateImageShaderNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. Call OH_Drawing_SamplingOptionsCreate
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    // 3. Call OH_Drawing_ShaderEffectCreateImageShader with different OH_Drawing_TileMode values for tileX and tileY
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
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
            OH_Drawing_ShaderEffect *effect =
                OH_Drawing_ShaderEffectCreateImageShader(image, tileX, tileY, options, matrix);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            EXPECT_NE(effect, nullptr);
            OH_Drawing_ShaderEffectDestroy(effect);
        }
    }
    // 4. Call OH_Drawing_ShaderEffectCreateImageShader with null matrix
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, options, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 5. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_ShaderEffectDestroy(effect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0701
 * @tc.name: testShaderEffectCreateImageShaderNull
 * @tc.desc: test for testShaderEffectCreateImageShaderNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateImageShaderNull, TestSize.Level3) {
    // 1. Call OH_Drawing_ShaderEffectCreateImageShader with the first parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_ShaderEffectCreateImageShader(nullptr, CLAMP, CLAMP, options, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateImageShader with the fourth parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0704
 * @tc.name: testShaderEffectCreateImageShaderMultipleCalls
 * @tc.desc: test for testShaderEffectCreateImageShaderMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateImageShaderMultipleCalls, TestSize.Level3) {
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_LINEAR);
    // add assert
    EXPECT_NE(options, nullptr);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateImageShader 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *effect =
            OH_Drawing_ShaderEffectCreateImageShader(image, CLAMP, CLAMP, options, matrix);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0800
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientNormal
 * @tc.desc: test for testShaderEffectCreateTwoPointConicalGradientNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientNormal, TestSize.Level0) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    // 1. Enumerate OH_Drawing_TileMode values for OH_Drawing_ShaderEffectCreateTwoPointConicalGradient, and cover both
    // the identity matrix and non-identity matrix for the matrix parameter
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        OH_Drawing_ShaderEffect *effect1 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, 3, mode, matrix);
        EXPECT_NE(effect1, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect1);

        OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 1, 0, 0, 0, 0, 0);
        OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, 3, mode, matrix);
        EXPECT_NE(effect2, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect2);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to nullptr
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, 3, CLAMP, matrix);
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with matrix set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, nullptr);
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0801
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientNull
 * @tc.desc: test for testShaderEffectCreateTwoPointConicalGradientNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientNull, TestSize.Level3) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the first parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        nullptr, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, 0, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the third parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, nullptr, endRadius, colors, pos, 3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fourth parameter set to nullptr
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, 0, colors, pos, 3, CLAMP, matrix);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fifth parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, nullptr, pos, 3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the sixth parameter set to nullptr
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, 3, CLAMP, matrix);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    OH_Drawing_ShaderEffectDestroy(effect5);
    OH_Drawing_ShaderEffectDestroy(effect6);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0802
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientAbnormal
 * @tc.desc: test for testShaderEffectCreateTwoPointConicalGradientAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientAbnormal, TestSize.Level3) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a negative value
    OH_Drawing_Point2D startPt2 = {-1, -1};
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a negative value
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, -5.0f, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a negative value
    OH_Drawing_Point2D endPt2 = {-1, -1};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt2, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a negative value
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, -10.0f, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a negative value
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect5, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a negative value
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect6, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    OH_Drawing_ShaderEffectDestroy(effect5);
    OH_Drawing_ShaderEffectDestroy(effect6);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0803
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientMaximum
 * @tc.desc: test for testShaderEffectCreateTwoPointConicalGradientMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientMaximum, TestSize.Level3) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a maximum value
    OH_Drawing_Point2D startPt2 = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a maximum value
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, FLT_MAX, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a maximum value
    OH_Drawing_Point2D endPt2 = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt2, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a maximum value
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, FLT_MAX, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a maximum value
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect5, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a maximum value
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect6, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    OH_Drawing_ShaderEffectDestroy(effect4);
    OH_Drawing_ShaderEffectDestroy(effect5);
    OH_Drawing_ShaderEffectDestroy(effect6);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0804
 * @tc.name: testShaderEffectCreateTwoPointConicalGradientMultipleCalls
 * @tc.desc: test for testShaderEffectCreateTwoPointConicalGradientMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectCreateTwoPointConicalGradientMultipleCalls, TestSize.Level3) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
        // add assert
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(effect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0900
 * @tc.name: testShaderEffectDestroyNormal
 * @tc.desc: test for testShaderEffectDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectDestroyNormal, TestSize.Level0) {
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0}; // 100.f: end point's x
    uint32_t colors[3] = {0xFF00FFFF, 0xFFFF00FF, 0xFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: gradient color points, 1.0f: gradient color points
    float startRadius = 5.0f, endRadius = 10.0f; // 5.0f: gradient color radius, 10.0f: gradient color radius
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, 3, CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 2. Call OH_Drawing_ShaderEffectDestroy
    OH_Drawing_ShaderEffectDestroy(effect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_EFFECT_0901
 * @tc.name: testShaderEffectDestroyNull
 * @tc.desc: test for testShaderEffectDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShaderEffectTest, testShaderEffectDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_ShaderEffectDestroy parameter is null
    OH_Drawing_ShaderEffectDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS