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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_7 7
#define DRAWING_NUMBER_8 8
#define DRAWING_NUMBER_9 9
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_257 257
#define DRAWING_NUMBER_0XFF000000 0xFF000000
#define DRAWING_NUMBER_0XFFFF0000 0xFFFF0000
#define DRAWING_NUMBER_0XFF00FFFF 0xFF00FFFF
#define DRAWING_NUMBER_0XFFFF00FF 0xFFFF00FF
#define DRAWING_NUMBER_0XFFFFFF00 0xFFFFFF00
#define DRAWING_NUMBER_0XFF00FF00 0xFF00FF00
#define DRAWING_NUMBER_0XFF0000FF 0xFF0000FF
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestShaderEffectCreateColorShaderNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. OH_Drawing_ShaderEffectCreateColorShader
    uint32_t color = DRAWING_NUMBER_0XFFFF0000;
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(color);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateColorShaderNull()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. OH_Drawing_ShaderEffectCreateColorShader with empty parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(0);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateColorShaderAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. OH_Drawing_ShaderEffectCreateColorShader with a negative parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(-DRAWING_NUMBER_0XFFFF0000);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateColorShaderMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. OH_Drawing_ShaderEffectCreateColorShader with maximum value as parameter
    OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(UINT32_MAX);
    // add assert
    EXPECT_NE(colorShaderEffect, nullptr);
    // 2. Free memory
    OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateColorShaderMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Call OH_Drawing_ShaderEffectCreateColorShader 10 times with different colors
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *colorShaderEffect = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF000000
            + i);
        // add assert
        EXPECT_NE(colorShaderEffect, nullptr);
        // 2. Free memory
        OH_Drawing_ShaderEffectDestroy(colorShaderEffect);
    }
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateLinearGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL
    };
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Enumerate OH_Drawing_TileMode values for OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix, and test
    // with both identity and non-identity matrix
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, DRAWING_NUMBER_3,
                mode, matrix);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }

    // 2. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with pos set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, nullptr, DRAWING_NUMBER_3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Test OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with matrix set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect2 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(
        &start, &end, colors, pos, DRAWING_NUMBER_3, OH_Drawing_TileMode::CLAMP, nullptr);
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

int TestShaderEffectCreateLinearGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
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
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(nullptr, &end, colors, pos, DRAWING_NUMBER_3,
            modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the second parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, nullptr, colors, pos, DRAWING_NUMBER_3,
            modes[0], matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix with the third parameter set to nullptr, check the
    // error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, nullptr, pos, DRAWING_NUMBER_3,
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

int TestShaderEffectCreateLinearGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
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
    start = {-DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *linearGradientEffect = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for endPt
    start = {0, 0};
    end = {-DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *linearGradientEffect2 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for colors
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *linearGradientEffect3 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with negative values for pos
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *linearGradientEffect4 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
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

int TestShaderEffectCreateLinearGradientWithLocalMatrixMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
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
    OH_Drawing_ShaderEffect *linearGradientEffect = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with endPt set to maximum value
    start = {0, 0};
    end = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *linearGradientEffect2 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with colors set to maximum value
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect3 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix interface with pos set to maximum value
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect4 = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start,
        &end, colors, pos, DRAWING_NUMBER_3, modes[0], matrix);
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

int TestShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D start = {0, 0};
    OH_Drawing_Point2D end = {100.f, 0};
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, DRAWING_NUMBER_3,
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

int TestShaderEffectCreateLinearGradienNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateLinearGradient
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, mode);
            // add assert
            EXPECT_NE(linearGradientEffect, nullptr);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(linearGradientEffect);
    }
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to NULL
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, nullptr, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateLinearGradienNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(nullptr, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient with the second parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, nullptr, colors, pos, DRAWING_NUMBER_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient with the third parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, nullptr, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateLinearGradienAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    // 1. OH_Drawing_ShaderEffectCreateLinearGradient interface with startPt set to negative values
    OH_Drawing_Point *startPt2 = OH_Drawing_PointCreate(-DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_ShaderEffectCreateLinearGradient interface with endPt set to negative values
    OH_Drawing_Point *endPt2 = OH_Drawing_PointCreate(-DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_ShaderEffectCreateLinearGradient interface with colors set to negative values
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ShaderEffectCreateLinearGradient interface with pos set to negative values
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateLinearGradienMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient with startPt set to maximum values
    OH_Drawing_Point *startPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *linearGradientEffect =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt2, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateLinearGradient with endPt set to maximum values
    OH_Drawing_Point *endPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *linearGradientEffect2 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt2, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateLinearGradient with colors set to maximum values
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect3 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(linearGradientEffect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateLinearGradient with pos set to maximum values
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *linearGradientEffect4 =
        OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateLinearGradienMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *startPt = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *endPt = OH_Drawing_PointCreate(100.f, 0);
    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    // 1. Call OH_Drawing_ShaderEffectCreateLinearGradient 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *linearGradientEffect =
            OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateRadialGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateRadialGradient
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors,
            pos, DRAWING_NUMBER_3, mode);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with pos set to nullptr
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors, nullptr, DRAWING_NUMBER_3, CLAMP)
            ;
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateRadialGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. OH_Drawing_ShaderEffectCreateRadialGradient with the first parameter set to nullptr, check the error code
    // using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(nullptr, DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_ShaderEffectCreateRadialGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, nullptr,
        pos, DRAWING_NUMBER_3, CLAMP);
    EXPECT_EQ(effect2, nullptr);
    // 3. OH_Drawing_ShaderEffectCreateRadialGradient with the third parameter set to nullptr
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors, nullptr, DRAWING_NUMBER_3, CLAMP)
            ;
    EXPECT_NE(effect3, nullptr);
    // 4. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    OH_Drawing_ShaderEffectDestroy(effect3);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateRadialGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to negative values
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(-DRAWING_NUMBER_100, -DRAWING_NUMBER_100);
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to negative values
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradient(point, -DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to negative values
    colors[0] = -DRAWING_NUMBER_0XFFFF0000;
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to negative values
    colors[0] = DRAWING_NUMBER_0XFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateRadialGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient with centerPt set to maximum values
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradient(point2, DRAWING_NUMBER_100, colors,
        pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradient with radius set to maximum values
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradient(point, FLT_MAX, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradient with colors set to maximum values
    uint32_t colors2[] = {UINT32_MAX, UINT32_MAX, UINT32_MAX};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors2,
        pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradient with pos set to maximum values
    float pos2[] = {FLT_MAX, FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors,
        pos2, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateRadialGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradient 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *effect =
            OH_Drawing_ShaderEffectCreateRadialGradient(point, DRAWING_NUMBER_100, colors, pos, DRAWING_NUMBER_3, CLAMP)
                ;
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

int TestShaderEffectCreateRadialGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    float pos[] = {0.0f, 0.5f, 1.0f};      // 0.5f: gradien    float pos[] = {0.0f, 0.5f, 1.0f};
    float radius = DRAWING_NUMBER_5;
    OH_Drawing_Point2D start = {100.f, 0};
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
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
            OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, pos, DRAWING_NUMBER_3,
                mode, matrix);
        EXPECT_NE(effect, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, nullptr, DRAWING_NUMBER_3, OH_Drawing_TileMode::CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with matrix set to nullptr
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
        &start, radius, colors, pos, DRAWING_NUMBER_3, OH_Drawing_TileMode::CLAMP, nullptr);
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

int TestShaderEffectCreateRadialGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectTestSetUp();
    float pos[] = {0.0f, 0.5f, 1.0f};      // 0.5f: gradien    float pos[] = {0.0f, 0.5f, 1.0f};
    float radius = DRAWING_NUMBER_5;
    OH_Drawing_Point2D start = {100.f, 0};
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the first parameter set to nullptr and
    // check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(nullptr, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, nullptr, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with the third parameter set to nullptr
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&start, radius, colors, nullptr, DRAWING_NUMBER_3,
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

int TestShaderEffectCreateRadialGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to negative values
    OH_Drawing_Point2D centerPt = {-DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    float radius = DRAWING_NUMBER_5;
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to negative values
    centerPt = {DRAWING_NUMBER_100, 0};
    radius = -5.0f;
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to negative values
    colors[0] = -DRAWING_NUMBER_0XFFFF0000;
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to negative values
    colors[0] = DRAWING_NUMBER_0XFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateRadialGradientWithLocalMatrixMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with centerPt set to a large number
    OH_Drawing_Point2D centerPt = {FLT_MAX, FLT_MAX};
    float radius = DRAWING_NUMBER_5;
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with radius set to a large number
    centerPt = {DRAWING_NUMBER_100, 0};
    radius = FLT_MAX;
    OH_Drawing_ShaderEffect *effect2 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with colors set to a large number
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *effect3 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix with pos set to a large number
    colors[0] = DRAWING_NUMBER_0XFFFF0000;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *effect4 =
        OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(&centerPt, radius, colors, pos, DRAWING_NUMBER_3,
            CLAMP, matrix);
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D centerPt = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    float radius = DRAWING_NUMBER_5;
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0.0f, 0.5f, 1.0f};
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateRadialGradientWithLocalMatrix(
            &centerPt, radius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
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

int TestShaderEffectCreateSweepGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ShaderEffectCreateSweepGradient
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    OH_Drawing_TileMode modes[] = {
        CLAMP,
        REPEAT,
        MIRROR,
        DECAL,
    };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos,
            DRAWING_NUMBER_3, mode);
        EXPECT_NE(effect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ShaderEffectDestroy(effect);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to nullptr
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, nullptr,
        DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with the first parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateSweepGradient(nullptr, colors, pos, DRAWING_NUMBER_3,
        CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with the second parameter set to nullptr and check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, nullptr, pos,
        DRAWING_NUMBER_3, CLAMP);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to negative values
    OH_Drawing_Point *centerPt2 = OH_Drawing_PointCreate(-DRAWING_NUMBER_1, -DRAWING_NUMBER_1);
    OH_Drawing_ShaderEffect *sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to negative values
    colors[0] = -DRAWING_NUMBER_0XFFFF0000;
    OH_Drawing_ShaderEffect *sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to negative values
    colors[0] = DRAWING_NUMBER_0XFFFF0000;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateSweepGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient with centerPt set to a large number
    OH_Drawing_Point *centerPt2 = OH_Drawing_PointCreate(FLT_MAX, FLT_MAX);
    OH_Drawing_ShaderEffect *sweepGradientEffect =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt2, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateSweepGradient with colors set to a large number
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *sweepGradientEffect2 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
    // add assert
    EXPECT_NE(sweepGradientEffect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateSweepGradient with pos set to a large number
    colors[0] = DRAWING_NUMBER_0XFFFF0000;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *sweepGradientEffect3 =
        OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateSweepGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    uint32_t colors[] = {DRAWING_NUMBER_0XFFFF0000, DRAWING_NUMBER_0XFF00FF00, DRAWING_NUMBER_0XFF0000FF};
    float pos[] = {0, 0.5f, 1.0f};
    // 1. Call OH_Drawing_ShaderEffectCreateSweepGradient 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *sweepGradientEffect =
            OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors, pos, DRAWING_NUMBER_3, CLAMP);
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

int TestShaderEffectCreateImageShaderNormal()
{
    DrawingNativeShaderEffectTestSetUp();
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateImageShaderNull()
{
    DrawingNativeShaderEffectTestSetUp();
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateImageShaderMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
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
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *effect =
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

int TestShaderEffectCreateTwoPointConicalGradientNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
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
            &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, mode, matrix);
        EXPECT_NE(effect1, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect1);

        OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, DRAWING_NUMBER_1, 0, 0, 0, 0, 0);
        OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, mode, matrix);
        EXPECT_NE(effect2, nullptr);
        OH_Drawing_ShaderEffectDestroy(effect2);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to nullptr
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, DRAWING_NUMBER_3, CLAMP, matrix);
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with matrix set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, nullptr);
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(effect);
    OH_Drawing_ShaderEffectDestroy(effect2);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateTwoPointConicalGradientNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the first parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        nullptr, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the second parameter set to nullptr
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, 0, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the third parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, nullptr, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fourth parameter set to nullptr
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, 0, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the fifth parameter set to nullptr and check
    // the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, nullptr, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with the sixth parameter set to nullptr
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, nullptr, DRAWING_NUMBER_3, CLAMP, matrix);
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

int TestShaderEffectCreateTwoPointConicalGradientAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a negative value
    OH_Drawing_Point2D startPt2 = {-DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a negative value
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, -5.0f, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a negative value
    OH_Drawing_Point2D endPt2 = {-DRAWING_NUMBER_1, -DRAWING_NUMBER_1};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt2, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a negative value
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, -10.0f, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a negative value
    colors[0] = -0xFF00FFFF;
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect5, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a negative value
    colors[0] = 0xFF00FFFF;
    pos[0] = -0.1f;
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateTwoPointConicalGradientMaximum()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startPt set to a maximum value
    OH_Drawing_Point2D startPt2 = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt2, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with startRadius set to a maximum value
    OH_Drawing_ShaderEffect *effect2 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, FLT_MAX, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endPt set to a maximum value
    OH_Drawing_Point2D endPt2 = {FLT_MAX, FLT_MAX};
    OH_Drawing_ShaderEffect *effect3 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt2, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with endRadius set to a maximum value
    OH_Drawing_ShaderEffect *effect4 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, FLT_MAX, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect4, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with colors set to a maximum value
    colors[0] = UINT32_MAX;
    OH_Drawing_ShaderEffect *effect5 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_NE(effect5, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient with pos set to a maximum value
    colors[0] = 0xFF00FFFF;
    pos[0] = FLT_MAX;
    OH_Drawing_ShaderEffect *effect6 = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateTwoPointConicalGradientMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
            &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
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

int TestShaderEffectDestroyNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point2D startPt = {0, 0};
    OH_Drawing_Point2D endPt = {100.f, 0};
    uint32_t colors[DRAWING_NUMBER_3] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFF00FF,
        DRAWING_NUMBER_0XFFFFFF00};
    float pos[3] = {0.0f, 0.5f, 1.0f};           // 0.5f: g    float pos[DRAWING_NUMBER_3] = {0.0f, 0.5f, 1.0f};
    float startRadius = DRAWING_NUMBER_5;
    float endRadius = DRAWING_NUMBER_10;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 1. Call OH_Drawing_ShaderEffectCreateTwoPointConicalGradient
    OH_Drawing_ShaderEffect *effect = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(
        &startPt, startRadius, &endPt, endRadius, colors, pos, DRAWING_NUMBER_3, CLAMP, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(effect, nullptr);
    // 2. Call OH_Drawing_ShaderEffectDestroy
    OH_Drawing_ShaderEffectDestroy(effect);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectDestroyNull()
{
    DrawingNativeShaderEffectTestSetUp();
    // 1. OH_Drawing_ShaderEffectDestroy parameter is null
    OH_Drawing_ShaderEffect *shaderEffect = nullptr;
    OH_Drawing_ShaderEffectDestroy(nullptr);
    EXPECT_EQ(shaderEffect, nullptr);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientWithLocalMatrixNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    uint32_t colors[] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFFFF00};
    float pos[] = {0.0f, 1.0f};
    uint32_t size = DRAWING_NUMBER_2;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // 1. OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix enumeration traversal and sets the unit matrix.
    OH_Drawing_ShaderEffect *shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect1, nullptr);
    OH_Drawing_ShaderEffect *shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    OH_Drawing_ShaderEffect *shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_NE(shaderEffect3, nullptr);
    OH_Drawing_ShaderEffect *shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::DECAL, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    // 2. OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix sets the non-identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_2, DRAWING_NUMBER_3, DRAWING_NUMBER_4,
        DRAWING_NUMBER_5, DRAWING_NUMBER_6, DRAWING_NUMBER_7, DRAWING_NUMBER_8, DRAWING_NUMBER_9);
    OH_Drawing_ShaderEffect *shaderEffect5 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    // 3.The last parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect6 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientWithLocalMatrixNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt1 = OH_Drawing_PointCreate(0, 0);
    OH_Drawing_Point *centerPt2 = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    uint32_t colors[] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFFFF00};
    float pos[] = {0.0f, 1.0f};
    uint32_t size = DRAWING_NUMBER_2;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // 1.The first parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        nullptr, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_EQ(shaderEffect1, nullptr);
    // 2.The first parameter of the interface passes to 0.
    OH_Drawing_ShaderEffect *shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt1, colors, pos, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    // 3.The second parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, nullptr, pos, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_EQ(shaderEffect3, nullptr);
    // 4.The third parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, colors, nullptr, size, OH_Drawing_TileMode::DECAL, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    // 5.The forth parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect5 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt2, colors, pos, 0, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    // 6.The last parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect6 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientWithLocalMatrixAbnormal()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    uint32_t colors1[] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFFFF00};
    uint32_t colors2[] = {DRAWING_NUMBER_0XFFFFFFFF};
    float pos1[] = {0.0f, 1.0f};
    float pos2[] = {-1.0f}; //     float pos2[] = {-1.0f};
    float pos3[] = {0xFFFFFFFF};
    uint32_t size = DRAWING_NUMBER_2;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // 1.The second parameter of the interface passes to maximum value.
    OH_Drawing_ShaderEffect *shaderEffect1 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors2, pos1, size, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect1, nullptr);
    // 2.The third parameter of the interface passes to negative value.
    OH_Drawing_ShaderEffect *shaderEffect2 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos2, size, OH_Drawing_TileMode::REPEAT, matrix);
    EXPECT_NE(shaderEffect2, nullptr);
    // 3.The third parameter of the interface passes to maximum value.
    OH_Drawing_ShaderEffect *shaderEffect3 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos3, size, OH_Drawing_TileMode::MIRROR, matrix);
    EXPECT_NE(shaderEffect3, nullptr);
    // 4.The fourth parameter of the interface does not match the second parameter.
    OH_Drawing_ShaderEffect *shaderEffect4 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos1, DRAWING_NUMBER_3, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect4, nullptr);
    OH_Drawing_ShaderEffect *shaderEffect5 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos1, 256, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    OH_Drawing_ShaderEffect *shaderEffect6 = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
        centerPt, colors1, pos1, 257, OH_Drawing_TileMode::CLAMP, matrix);
    EXPECT_NE(shaderEffect5, nullptr);
    // 5. Destroy objects.
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);
    OH_Drawing_ShaderEffectDestroy(shaderEffect3);
    OH_Drawing_ShaderEffectDestroy(shaderEffect4);
    OH_Drawing_ShaderEffectDestroy(shaderEffect5);
    OH_Drawing_ShaderEffectDestroy(shaderEffect6);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_Point *centerPt = OH_Drawing_PointCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    uint32_t colors[] = {DRAWING_NUMBER_0XFF00FFFF, DRAWING_NUMBER_0XFFFFFF00};
    float pos[] = {0.0f, 1.0f};
    uint32_t size = DRAWING_NUMBER_2;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1);
    // 1.OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix is called multiple times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreateSweepGradientWithLocalMatrix(
            centerPt, colors, pos, size, OH_Drawing_TileMode::CLAMP, matrix);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_PointDestroy(centerPt);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateComposeEnumTraversal()
{
    DrawingNativeShaderEffectTestSetUp();
    std::vector<OH_Drawing_BlendMode > blendMode = {
        BLEND_MODE_CLEAR,
        BLEND_MODE_SRC,
        BLEND_MODE_DST,
        BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,
        BLEND_MODE_SRC_IN,
        BLEND_MODE_DST_IN,
        BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,
        BLEND_MODE_SRC_ATOP,
        BLEND_MODE_DST_ATOP,
        BLEND_MODE_XOR,
        BLEND_MODE_PLUS,
        BLEND_MODE_MODULATE,
        BLEND_MODE_SCREEN,
        BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,
        BLEND_MODE_LIGHTEN,
        BLEND_MODE_COLOR_DODGE,
        BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT,
        BLEND_MODE_SOFT_LIGHT,
        BLEND_MODE_DIFFERENCE,
        BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,
        BLEND_MODE_HUE,
        BLEND_MODE_SATURATION,
        BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY
    };
    OH_Drawing_ShaderEffect *src = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF00FF00);
    OH_Drawing_ShaderEffect *dst = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF0000FF);
    // 1.OH_Drawing_ShaderEffectCreateCompose passes parameters normally and traversals enumeration.
    for (int i = 0; i < blendMode.size(); i++) {
        OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreateCompose(dst, src, blendMode[i]);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateComposeNull()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_ShaderEffect *src = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF00FF00);
    OH_Drawing_ShaderEffect *dst = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF0000FF);
    // 1. The first parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect1 =
        OH_Drawing_ShaderEffectCreateCompose(nullptr, src, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_EQ(shaderEffect1, nullptr);
    // 2. The second parameter of the interface passes to nullptr.
    OH_Drawing_ShaderEffect *shaderEffect2 =
        OH_Drawing_ShaderEffectCreateCompose(dst, nullptr, OH_Drawing_BlendMode::BLEND_MODE_SRC);
    EXPECT_EQ(shaderEffect2, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);
    OH_Drawing_ShaderEffectDestroy(shaderEffect1);
    OH_Drawing_ShaderEffectDestroy(shaderEffect2);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreateComposeMultipleCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    OH_Drawing_ShaderEffect *src = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF00FF00);
    OH_Drawing_ShaderEffect *dst = OH_Drawing_ShaderEffectCreateColorShader(DRAWING_NUMBER_0XFF0000FF);
    // 1. The interface is called multiple times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ShaderEffect *shaderEffect =
        OH_Drawing_ShaderEffectCreateCompose(dst, src, OH_Drawing_BlendMode::BLEND_MODE_SRC);
        EXPECT_NE(shaderEffect, nullptr);
        OH_Drawing_ShaderEffectDestroy(shaderEffect);
    }
    // 2. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(src);
    OH_Drawing_ShaderEffectDestroy(dst);
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreatePixelMapShaderNormal()
{
    DrawingNativeShaderEffectTestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = DRAWING_NUMBER_0XFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called normally.
    OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreatePixelMapShaderNull()
{
    DrawingNativeShaderEffectTestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = DRAWING_NUMBER_0XFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. Pass each interface parameter nullptr for verification one by one.
    OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreatePixelMapShader(
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShaderEffectCreatePixelMapShaderMultiCalls()
{
    DrawingNativeShaderEffectTestSetUp();
    uint32_t imageWidth = DRAWING_NUMBER_200;
    uint32_t imageHeight = DRAWING_NUMBER_200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, DRAWING_NUMBER_3);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, DRAWING_NUMBER_2);
    size_t bufferSize = imageWidth * imageHeight * DRAWING_NUMBER_4;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return -DRAWING_NUMBER_1;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = DRAWING_NUMBER_0XFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called 10 times.
    OH_Drawing_ShaderEffect *shaderEffect = nullptr;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    DrawingNativeShaderEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
