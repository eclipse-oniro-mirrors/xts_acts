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

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;

constexpr int TEST_NUMBER_0 = 0;
constexpr int TEST_NUMBER_1 = 1;
constexpr int TEST_NUMBER_2 = 2;
constexpr int TEST_NUMBER_3 = 3;
constexpr int TEST_NUMBER_4 = 4;
constexpr int TEST_NUMBER_5 = 5;
constexpr int TEST_NUMBER_6 = 6;
constexpr int TEST_NUMBER_7 = 7;
constexpr int TEST_NUMBER_8 = 8;
constexpr int TEST_NUMBER_10 = 10;

// ---PathEffect 测试常量 ---
constexpr float TEST_DASH_INTERVAL_1 = 1.0f;
constexpr float TEST_DASH_INTERVAL_2 = 2.0f;
constexpr float TEST_DASH_INTERVAL_50 = 50.0f;
constexpr float TEST_DASH_PHASE_0 = 0.0f;
constexpr float TEST_DASH_PHASE_1 = 1.0f;
constexpr float TEST_DASH_PHASE_NEGATIVE_1 = -1.0f;
constexpr size_t TEST_DASH_COUNT_2 = 2;
constexpr size_t TEST_DASH_COUNT_3 = 3;
constexpr size_t TEST_DASH_COUNT_1 = 1;
constexpr int TEST_DASH_COUNT_NEGATIVE_3 = -3;

constexpr float TEST_CORNER_RADIUS_NORMAL = 10.0f;
constexpr float TEST_CORNER_RADIUS_ZERO = 0.0f;
constexpr float TEST_CORNER_RADIUS_MAX_UINT = 0xFFFFFFFF;
constexpr float TEST_CORNER_RADIUS_SMALL = 0.0001f;
constexpr float TEST_CORNER_RADIUS_NEGATIVE_SMALL = -0.1f;
constexpr float TEST_CORNER_RADIUS_NEGATIVE_1 = -1.0f;

constexpr float TEST_DISCRETE_SEG_LENGTH_10 = 10.0f;
constexpr float TEST_DISCRETE_SEG_LENGTH_50 = 50.0f;
constexpr float TEST_DISCRETE_DEVIATION_2 = 2.0f;
constexpr float TEST_DISCRETE_DEVIATION_50 = 50.0f;

constexpr float TEST_PATH_DASH_INTERVAL_50 = 50.0f;
constexpr float TEST_PATH_DASH_PHASE_50 = 50.0f;
constexpr int TEST_PATH_RECT_X_10 = 10;
constexpr int TEST_PATH_RECT_Y_10 = 10;
constexpr int TEST_PATH_RECT_WIDTH_100 = 100;
constexpr int TEST_PATH_RECT_HEIGHT_100 = 100;
constexpr float TEST_PATH_MOVE_TO_X_50 = 50.0f;
constexpr float TEST_PATH_MOVE_TO_Y_50 = 50.0f;
constexpr float TEST_PATH_LINE_TO_X_100 = 100.0f;
constexpr float TEST_PATH_LINE_TO_Y_50 = 50.0f;

} // namespace

// Common SetUp and TearDown functions implementation
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

/**
 * @tc.name   testCreateDashPathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0100
 * @tc.desc   test for testCreateDashPathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreateDashPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateDashPathEffect
    float intervals[] = { TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1 };
    OH_Drawing_PathEffect* pathEffect =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_3, TEST_DASH_PHASE_0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateDashPathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0200
 * @tc.desc   test for testCreateDashPathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateDashPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    float intervals[] = { TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1 };
    // 1. OH_Drawing_CreateDashPathEffect with nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect* pathEffect1 =
        OH_Drawing_CreateDashPathEffect(nullptr, TEST_DASH_COUNT_2, TEST_DASH_PHASE_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_CreateDashPathEffect with 0 as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect* pathEffect2 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_NUMBER_0, TEST_DASH_PHASE_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with 0.0 as the third parameter
    OH_Drawing_PathEffect* pathEffect3 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_2, TEST_DASH_PHASE_0);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateDashPathEffectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0300
 * @tc.desc   test for testCreateDashPathEffectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateDashPathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();

    float intervals[] = { TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1 };
    // 1. OH_Drawing_CreateDashPathEffect with the first parameter not being even
    OH_Drawing_PathEffect* pathEffect1 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_3, TEST_DASH_PHASE_1);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDashPathEffect with the second parameter being negative, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect* pathEffect2 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_NEGATIVE_3, TEST_DASH_PHASE_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with the second parameter being 1
    OH_Drawing_PathEffect* pathEffect3 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_1, TEST_DASH_PHASE_1);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDashPathEffect with the third parameter being negative
    OH_Drawing_PathEffect* pathEffect4 =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_3, TEST_DASH_PHASE_NEGATIVE_1);
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

/**
 * @tc.name   testCreateDashPathEffectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0400
 * @tc.desc   test for testCreateDashPathEffectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateDashPathEffectMultipleCalls()
{
    DrawingNativePathEffectTestSetUp();

    float intervals[] = { TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1 };
    // 1. Call OH_Drawing_CreateDashPathEffect 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_PathEffect* pathEffect =
            OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_2, TEST_DASH_PHASE_1);
        // add assert
        EXPECT_NE(pathEffect, nullptr);
        // 2. Free memory
        OH_Drawing_PathEffectDestroy(pathEffect);
    }

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathEffectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0500
 * @tc.desc   test for testPathEffectDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathEffectDestroyNormal()
{
    DrawingNativePathEffectTestSetUp();

    float intervals[] = { TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1, TEST_DASH_INTERVAL_1 };
    // 1. OH_Drawing_CreateDashPathEffect
    OH_Drawing_PathEffect* pathEffect =
        OH_Drawing_CreateDashPathEffect(intervals, TEST_DASH_COUNT_3, TEST_DASH_PHASE_0);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. OH_Drawing_PathEffectDestroy
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathEffectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0600
 * @tc.desc   test for testPathEffectDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathEffectDestroyNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_PathEffectDestroy with nullptr as the parameter
    OH_Drawing_PathEffectDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateCornerPathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0700
 * @tc.desc   test for testCreateCornerPathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreateCornerPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect with normal parameter
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_NORMAL);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateCornerPathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0800
 * @tc.desc   test for testCreateCornerPathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateCornerPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect with 0 as the parameter
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_ZERO);
    // add assert
    EXPECT_EQ(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateCornerPathEffectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0900
 * @tc.desc   test for testCreateCornerPathEffectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateCornerPathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect with 0xFFFFFFFF as the parameter
    OH_Drawing_PathEffect* pathEffect1 = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_MAX_UINT);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateCornerPathEffect with 0.0001 as the parameter
    OH_Drawing_PathEffect* pathEffect2 = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_SMALL);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateCornerPathEffect with -0.1 as the parameter
    OH_Drawing_PathEffect* pathEffect3 = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_NEGATIVE_SMALL);
    // add assert
    EXPECT_EQ(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateCornerPathEffect with -1 as the parameter
    OH_Drawing_PathEffect* pathEffect4 = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_NEGATIVE_1);
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

/**
 * @tc.name   testCreateDiscreatePathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1000
 * @tc.desc   test for testCreateDiscreatePathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreateDiscreatePathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateDiscretePathEffect with normal parameter
    OH_Drawing_PathEffect* pathEffect =
        OH_Drawing_CreateDiscretePathEffect(TEST_DISCRETE_SEG_LENGTH_10, TEST_DISCRETE_DEVIATION_2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateDiscreatePathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1100
 * @tc.desc   test for testCreateDiscreatePathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateDiscreatePathEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateDiscretePathEffect with 0 as the first parameter
    OH_Drawing_PathEffect* pathEffect1 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_ZERO, TEST_DISCRETE_DEVIATION_2);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0 as the second parameter
    OH_Drawing_PathEffect* pathEffect2 =
        OH_Drawing_CreateDiscretePathEffect(TEST_DISCRETE_SEG_LENGTH_10, TEST_CORNER_RADIUS_ZERO);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateDiscreatePathEffectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1200
 * @tc.desc   test for testCreateDiscreatePathEffectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateDiscreatePathEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first and second parameter
    OH_Drawing_PathEffect* pathEffect1 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_MAX_UINT, TEST_CORNER_RADIUS_MAX_UINT);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect* pathEffect2 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_MAX_UINT, TEST_DISCRETE_DEVIATION_2);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect* pathEffect3 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_MAX_UINT, TEST_CORNER_RADIUS_NEGATIVE_SMALL);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect* pathEffect4 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_MAX_UINT, TEST_CORNER_RADIUS_NEGATIVE_1);
    // add assert
    EXPECT_NE(pathEffect4, nullptr);
    // 5. OH_Drawing_CreateDiscretePathEffect with -0.1 as the first parameter
    OH_Drawing_PathEffect* pathEffect5 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_NEGATIVE_SMALL, TEST_DISCRETE_DEVIATION_2);
    // add assert
    EXPECT_NE(pathEffect5, nullptr);
    // 6. OH_Drawing_CreateDiscretePathEffect with -1 as the first parameter
    OH_Drawing_PathEffect* pathEffect6 =
        OH_Drawing_CreateDiscretePathEffect(TEST_CORNER_RADIUS_NEGATIVE_1, TEST_DISCRETE_DEVIATION_2);
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

/**
 * @tc.name   testCreateComposePathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1300
 * @tc.desc   test for testCreateComposePathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreateComposePathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect* cornerPathEffect = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_NORMAL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect* discretePathEffect =
        OH_Drawing_CreateDiscretePathEffect(TEST_DISCRETE_SEG_LENGTH_10, TEST_DISCRETE_DEVIATION_2);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(discretePathEffect, nullptr);

    // 3. OH_Drawing_CreateComposePathEffect with normal parameters
    OH_Drawing_PathEffect* composePathEffect =
        OH_Drawing_CreateComposePathEffect(cornerPathEffect, discretePathEffect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(composePathEffect, nullptr);

    // 4. Free memory
    OH_Drawing_PathEffectDestroy(cornerPathEffect);
    OH_Drawing_PathEffectDestroy(discretePathEffect);
    OH_Drawing_PathEffectDestroy(composePathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateComposePathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1400
 * @tc.desc   test for testCreateComposePathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateComposePathEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect* cornerPathEffect = OH_Drawing_CreateCornerPathEffect(TEST_CORNER_RADIUS_NORMAL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect* discretePathEffect =
        OH_Drawing_CreateDiscretePathEffect(TEST_DISCRETE_SEG_LENGTH_10, TEST_DISCRETE_DEVIATION_2);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(discretePathEffect, nullptr);

    // 3. OH_Drawing_CreateComposePathEffect with first parameter as nullptr
    OH_Drawing_PathEffect* composePathEffect1 =
        OH_Drawing_CreateComposePathEffect(nullptr, discretePathEffect);
    EXPECT_EQ(composePathEffect1, nullptr);

    // 4. OH_Drawing_CreateComposePathEffect with second parameter as nullptr
    OH_Drawing_PathEffect* composePathEffect2 = OH_Drawing_CreateComposePathEffect(cornerPathEffect, nullptr);
    EXPECT_EQ(composePathEffect2, nullptr);

    // 5. Free memory
    OH_Drawing_PathEffectDestroy(cornerPathEffect);
    OH_Drawing_PathEffectDestroy(discretePathEffect);
    OH_Drawing_PathEffectDestroy(composePathEffect1);
    OH_Drawing_PathEffectDestroy(composePathEffect2);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreatePathDashEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1500
 * @tc.desc   test for testCreatePathDashEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreatePathDashEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path,
                           TEST_PATH_RECT_X_10,
                           TEST_PATH_RECT_Y_10,
                           TEST_PATH_RECT_WIDTH_100,
                           TEST_PATH_RECT_HEIGHT_100,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, TEST_PATH_MOVE_TO_X_50, TEST_PATH_MOVE_TO_Y_50);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, TEST_PATH_LINE_TO_X_100, TEST_PATH_LINE_TO_Y_50);
    // 6. OH_Drawing_CreatePathDashEffect 参数正常入参并且遍历第四个枚举参数
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_ROTATE);
    EXPECT_NE(pathEffect, nullptr);
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_MORPH);
    EXPECT_NE(pathEffect, nullptr);
    // 7. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreatePathDashEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1600
 * @tc.desc   test for testCreatePathDashEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreatePathDashEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path,
                           TEST_PATH_RECT_X_10,
                           TEST_PATH_RECT_Y_10,
                           TEST_PATH_RECT_WIDTH_100,
                           TEST_PATH_RECT_HEIGHT_100,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, TEST_PATH_MOVE_TO_X_50, TEST_PATH_MOVE_TO_Y_50);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, TEST_PATH_LINE_TO_X_100, TEST_PATH_LINE_TO_Y_50);
    // 6. OH_Drawing_CreatePathDashEffect第一个参数传nullptr
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreatePathDashEffect(
        nullptr, TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 7. OH_Drawing_CreatePathDashEffect第二个参数传0
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_CORNER_RADIUS_ZERO, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 8. OH_Drawing_CreatePathDashEffect第三个参数传0
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_PATH_DASH_INTERVAL_50, TEST_CORNER_RADIUS_ZERO, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 9. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreatePathDashEffectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1700
 * @tc.desc   test for testCreatePathDashEffectAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreatePathDashEffectAbnormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path,
                           TEST_PATH_RECT_X_10,
                           TEST_PATH_RECT_Y_10,
                           TEST_PATH_RECT_WIDTH_100,
                           TEST_PATH_RECT_HEIGHT_100,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, TEST_PATH_MOVE_TO_X_50, TEST_PATH_MOVE_TO_Y_50);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, TEST_PATH_LINE_TO_X_100, TEST_PATH_LINE_TO_Y_50);
    // 6. OH_Drawing_CreatePathDashEffect第二个参数传0xFFFFFFFF
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_CORNER_RADIUS_MAX_UINT, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 7. OH_Drawing_CreatePathDashEffect第二个参数传0.0001
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_CORNER_RADIUS_SMALL, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 8. OH_Drawing_CreatePathDashEffect第二个参数传-0.1
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_CORNER_RADIUS_NEGATIVE_SMALL, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 9. OH_Drawing_CreatePathDashEffect第二个参数传-1
    pathEffect = OH_Drawing_CreatePathDashEffect(
        path2, TEST_CORNER_RADIUS_NEGATIVE_1, TEST_PATH_DASH_PHASE_50, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 10. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateSumPathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1800
 * @tc.desc   test for testCreateSumPathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCreateSumPathEffectNormal()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect* firstPathEffect = OH_Drawing_CreateCornerPathEffect(TEST_PATH_DASH_INTERVAL_50);
    EXPECT_NE(firstPathEffect, nullptr);
    // 2. OH_Drawing_CreateDiscreatePathEffect
    OH_Drawing_PathEffect* secondPathEffect =
        OH_Drawing_CreateDiscretePathEffect(TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_INTERVAL_50);
    EXPECT_NE(secondPathEffect, nullptr);
    // 3. OH_Drawing_CreateSumPathEffect正常入参
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateSumPathEffect(firstPathEffect, secondPathEffect);
    EXPECT_NE(pathEffect, nullptr);
    // 4. 释放内存
    OH_Drawing_PathEffectDestroy(firstPathEffect);
    OH_Drawing_PathEffectDestroy(secondPathEffect);
    OH_Drawing_PathEffectDestroy(pathEffect);

    DrawingNativePathEffectTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCreateSumPathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1900
 * @tc.desc   test for testCreateSumPathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCreateSumPathEffectNull()
{
    DrawingNativePathEffectTestSetUp();

    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect* firstPathEffect = OH_Drawing_CreateCornerPathEffect(TEST_PATH_DASH_INTERVAL_50);
    EXPECT_NE(firstPathEffect, nullptr);
    // 2. OH_Drawing_CreateDiscreatePathEffect
    OH_Drawing_PathEffect* secondPathEffect =
        OH_Drawing_CreateDiscretePathEffect(TEST_PATH_DASH_INTERVAL_50, TEST_PATH_DASH_INTERVAL_50);
    EXPECT_NE(secondPathEffect, nullptr);
    // 3. OH_Drawing_CreateSumPathEffect 第一个参数传nullptr
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateSumPathEffect(nullptr, secondPathEffect);
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