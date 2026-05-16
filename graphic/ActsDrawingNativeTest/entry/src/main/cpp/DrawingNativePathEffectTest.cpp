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

#include "include/DrawingNativePathEffectTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativePathEffectTestSetUp()
{
    std::cout << "DrawingNativePathEffectTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathEffectTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathEffectTestTearDown()
{
    std::cout << "DrawingNativePathEffectTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathEffectTest errorCodeReset after each test case." << std::endl;
}

int TestCreateDashPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateDashPathEffect
    float intervals[] = {DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_3, 0.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDashPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    float intervals[] = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    // 1. OH_Drawing_CreateDashPathEffect with nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(nullptr, DRAWING_NUMBER_2, 1.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_CreateDashPathEffect with 0 as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, 0, 1.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with 0.0 as the third parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_2, 0.0f);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDashPathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();
    float intervals[] = {DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    // 1. OH_Drawing_CreateDashPathEffect with the first parameter not being even
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_3, 1.0f);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDashPathEffect with the second parameter being negative, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, -DRAWING_NUMBER_3, 1.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with the second parameter being 1
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_1, 1.0f);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDashPathEffect with the third parameter being negative
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_3, -1.0f);
    // add assert
    EXPECT_NE(pathEffect4, nullptr);
    // 5. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDashPathEffectMultipleCalls()
{
    DrawingNativePathEffectTestSetUp();
    float intervals[] = {DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    // 1. Call OH_Drawing_CreateDashPathEffect 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_2, 1.0f);
        // add assert
        EXPECT_NE(pathEffect, nullptr);
        // 2. Free memory
        OH_Drawing_PathEffectDestroy(pathEffect);
    }
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathEffectDestroyNormal()
{
    DrawingNativePathEffectTestSetUp();
    float intervals[] = {DRAWING_NUMBER_1, DRAWING_NUMBER_1, DRAWING_NUMBER_1};
    // 1. OH_Drawing_CreateDashPathEffect
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, DRAWING_NUMBER_3, 0.0f);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. OH_Drawing_PathEffectDestroy
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathEffectDestroyNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_PathEffectDestroy with nullptr as the parameter
    OH_Drawing_PathEffect *pathEffect = nullptr;
    OH_Drawing_PathEffectDestroy(nullptr);
    EXPECT_EQ(pathEffect, nullptr);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateCornerPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect with normal parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateCornerPathEffect(10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateCornerPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect with 0 as the parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateCornerPathEffect(0);
    // add assert
    EXPECT_EQ(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateCornerPathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect with 0xFFFFFFFF as the parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateCornerPathEffect(DRAWING_NUMBER_0XFFFFFFFF);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateCornerPathEffect with 0.0001 as the parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateCornerPathEffect(0.0001f);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateCornerPathEffect with -0.1 as the parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateCornerPathEffect(-0.1f);
    // add assert
    EXPECT_EQ(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateCornerPathEffect with -1 as the parameter
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateCornerPathEffect(-DRAWING_NUMBER_1);
    // add assert
    EXPECT_EQ(pathEffect4, nullptr);
    // 5. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDiscreatePathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateDiscretePathEffect with normal parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDiscretePathEffect(10.0f, 2.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDiscreatePathEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateDiscretePathEffect with 0 as the first parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDiscretePathEffect(0, 2.0f);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0 as the second parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDiscretePathEffect(10.0f, 0);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateDiscreatePathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first and second parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDiscretePathEffect(DRAWING_NUMBER_0XFFFFFFFF,
        DRAWING_NUMBER_0XFFFFFFFF);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDiscretePathEffect(DRAWING_NUMBER_0XFFFFFFFF, 2.0f);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDiscretePathEffect(DRAWING_NUMBER_0XFFFFFFFF, -0.1f);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateDiscretePathEffect(DRAWING_NUMBER_0XFFFFFFFF,
        -DRAWING_NUMBER_1);
    // add assert
    EXPECT_NE(pathEffect4, nullptr);
    // 5. OH_Drawing_CreateDiscretePathEffect with -0.1 as the first parameter
    OH_Drawing_PathEffect *pathEffect5 = OH_Drawing_CreateDiscretePathEffect(-0.1f, 2.0f);
    // add assert
    EXPECT_NE(pathEffect5, nullptr);
    // 6. OH_Drawing_CreateDiscretePathEffect with -1 as the first parameter
    OH_Drawing_PathEffect *pathEffect6 = OH_Drawing_CreateDiscretePathEffect(-DRAWING_NUMBER_1, 2.0f);
    // add assert
    EXPECT_NE(pathEffect6, nullptr);
    // 8. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
    OH_Drawing_PathEffectDestroy(pathEffect5);
    OH_Drawing_PathEffectDestroy(pathEffect6);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateComposePathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *cornerPathEffect = OH_Drawing_CreateCornerPathEffect(10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect *discretePathEffect = OH_Drawing_CreateDiscretePathEffect(10.0f, 2.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(discretePathEffect, nullptr);

    // 3. OH_Drawing_CreateComposePathEffect with normal parameters
    OH_Drawing_PathEffect *composePathEffect = OH_Drawing_CreateComposePathEffect(cornerPathEffect,
        discretePathEffect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(composePathEffect, nullptr);

    // 4. Free memory
    OH_Drawing_PathEffectDestroy(cornerPathEffect);
    OH_Drawing_PathEffectDestroy(discretePathEffect);
    OH_Drawing_PathEffectDestroy(composePathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateComposePathEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *cornerPathEffect = OH_Drawing_CreateCornerPathEffect(10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect *discretePathEffect = OH_Drawing_CreateDiscretePathEffect(10.0f, 2.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(discretePathEffect, nullptr);

    // 3. OH_Drawing_CreateComposePathEffect with first parameter as nullptr
    OH_Drawing_PathEffect *composePathEffect1 = OH_Drawing_CreateComposePathEffect(nullptr, discretePathEffect);
    EXPECT_EQ(composePathEffect1, nullptr);

    // 4. OH_Drawing_CreateComposePathEffect with second parameter as nullptr
    OH_Drawing_PathEffect *composePathEffect2 = OH_Drawing_CreateComposePathEffect(cornerPathEffect, nullptr);
    EXPECT_EQ(composePathEffect2, nullptr);

    // 5. Free memory
    OH_Drawing_PathEffectDestroy(cornerPathEffect);
    OH_Drawing_PathEffectDestroy(discretePathEffect);
    OH_Drawing_PathEffectDestroy(composePathEffect1);
    OH_Drawing_PathEffectDestroy(composePathEffect2);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreatePathDashEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, 50.0f, 50.0f);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, 100.0f, 50.0f);
    // 6. OH_Drawing_CreatePathDashEffect 参数正常入参并且遍历第四个枚举参数
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreatePathDashEffect(path2, 50.0f, 50.0f,
        DRAWING_PATH_DASH_STYLE_TRANSLATE);
        EXPECT_NE(pathEffect, nullptr);
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 50.0f, 50.0f, DRAWING_PATH_DASH_STYLE_ROTATE);
    EXPECT_NE(pathEffect, nullptr);
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 50.0f, 50.0f, DRAWING_PATH_DASH_STYLE_MORPH);
    EXPECT_NE(pathEffect, nullptr);
    // 7. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreatePathDashEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, 50.0f, 50.0f);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, 100.0f, 50.0f);
    // 6. OH_Drawing_CreatePathDashEffect第一个参数传nullptr
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreatePathDashEffect(nullptr, 50.0f, 50.0f,
        DRAWING_PATH_DASH_STYLE_TRANSLATE);
        EXPECT_EQ(pathEffect, nullptr);
    // 7. OH_Drawing_CreatePathDashEffect第二个参数传0
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 0, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 8. OH_Drawing_CreatePathDashEffect第三个参数传0
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 50.0f, 0, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 9. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreatePathDashEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_10, DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, 50.0f, 50.0f);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, 100.0f, 50.0f);
    // 6. OH_Drawing_CreatePathDashEffect第二个参数传0xFFFFFFFF
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreatePathDashEffect(path2, DRAWING_NUMBER_0XFFFFFFFF,
        50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
        EXPECT_NE(pathEffect, nullptr);
    // 7. OH_Drawing_CreatePathDashEffect第二个参数传0.0001
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 0.0001f, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 8. OH_Drawing_CreatePathDashEffect第二个参数传-0.1
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, -0.1f, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 9. OH_Drawing_CreatePathDashEffect第二个参数传-1
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, -DRAWING_NUMBER_1, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 10. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateSumPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *firstPathEffect = OH_Drawing_CreateCornerPathEffect(50.0f);
    EXPECT_NE(firstPathEffect, nullptr);
    // 2. OH_Drawing_CreateDiscreatePathEffect
    OH_Drawing_PathEffect *secondPathEffect = OH_Drawing_CreateDiscretePathEffect(50.0f, 50.0f);
    EXPECT_NE(secondPathEffect, nullptr);
    // 3. OH_Drawing_CreateSumPathEffect正常入参
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateSumPathEffect(firstPathEffect, secondPathEffect);
    EXPECT_NE(pathEffect, nullptr);
    // 4. 释放内存
    OH_Drawing_PathEffectDestroy(firstPathEffect);
    OH_Drawing_PathEffectDestroy(secondPathEffect);
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestCreateSumPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *firstPathEffect = OH_Drawing_CreateCornerPathEffect(50.0f);
    EXPECT_NE(firstPathEffect, nullptr);
    // 2. OH_Drawing_CreateDiscreatePathEffect
    OH_Drawing_PathEffect *secondPathEffect = OH_Drawing_CreateDiscretePathEffect(50.0f, 50.0f);
    EXPECT_NE(secondPathEffect, nullptr);
    // 3. OH_Drawing_CreateSumPathEffect 第一个参数传nullptr
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateSumPathEffect(nullptr, secondPathEffect);
    EXPECT_EQ(pathEffect, nullptr);
    // 4. OH_Drawing_CreateSumPathEffect 第二个参数传nullptr
    pathEffect = OH_Drawing_CreateSumPathEffect(firstPathEffect, nullptr);
    EXPECT_EQ(pathEffect, nullptr);
    // 5. 释放内存
    OH_Drawing_PathEffectDestroy(firstPathEffect);
    OH_Drawing_PathEffectDestroy(secondPathEffect);
    OH_Drawing_PathEffectDestroy(pathEffect);
    DrawingNativePathEffectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS