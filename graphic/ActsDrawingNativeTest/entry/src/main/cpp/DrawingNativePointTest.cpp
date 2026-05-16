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

#include <cfloat>
#include <random>
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

// 用于 Point 创建、获取和设置的坐标值
constexpr float TEST_POINT_X_DEFAULT = 100.0f;
constexpr float TEST_POINT_Y_DEFAULT = 60.0f;
constexpr float TEST_POINT_X_FLOAT = 100.5f;
constexpr float TEST_POINT_Y_FLOAT = 60.0f;
constexpr float TEST_POINT_X_NEGATIVE = -100.0f;
constexpr float TEST_POINT_Y_NEGATIVE = -60.0f;
constexpr float TEST_POINT_X_NEW = 10.0f;
constexpr float TEST_POINT_Y_NEW = 10.0f;
constexpr float TEST_POINT_X_NEW_FLOAT = 20.0f;
constexpr float TEST_POINT_Y_NEW_FLOAT = 20.0f;

// 用于随机数生成的范围
constexpr float TEST_POINT_RANDOM_MIN = 0.0f;
constexpr float TEST_POINT_RANDOM_MAX = 100.0f;

} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativePointTestSetUp()
{
    std::cout << "DrawingNativePointTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePointTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePointTestTearDown()
{
    std::cout << "DrawingNativePointTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePointTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testPointCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0100
 * @tc.desc   test for testPointCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPointCreateNormal()
{
    DrawingNativePointTestSetUp();

    // 1. Pass integer values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Pass floating-point values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(TEST_POINT_X_FLOAT, TEST_POINT_Y_FLOAT);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0200
 * @tc.desc   test for testPointCreateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointCreateNull()
{
    DrawingNativePointTestSetUp();

    // 1. The first parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_NUMBER_0, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_NUMBER_0);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0300
 * @tc.desc   test for testPointCreateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointCreateAbnormal()
{
    DrawingNativePointTestSetUp();

    // 1. The first parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_NEGATIVE, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_NEGATIVE);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointCreateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0400
 * @tc.desc   test for testPointCreateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointCreateMaximum()
{
    DrawingNativePointTestSetUp();

    // 1. The first parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point* point = OH_Drawing_PointCreate(FLT_MAX, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point* point2 = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, FLT_MAX);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0500
 * @tc.desc   test for testPointCreateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointCreateMultipleCalls()
{
    DrawingNativePointTestSetUp();

    // 1. Call OH_Drawing_PointCreate 10 times with random values for X and Y coordinates
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(TEST_POINT_RANDOM_MIN, TEST_POINT_RANDOM_MAX);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Point* point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_PointDestroy(point);
    }

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0600
 * @tc.desc   test for testPointDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPointDestroyNormal()
{
    DrawingNativePointTestSetUp();

    // 1. Call OH_Drawing_PointCreate
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Call OH_Drawing_PointDestroy
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0700
 * @tc.desc   test for testPointDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointDestroyNull()
{
    DrawingNativePointTestSetUp();

    // 1. The parameter of OH_Drawing_PointDestroy is nullptr
    OH_Drawing_PointDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetXNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0800
 * @tc.desc   test for testPointGetXNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPointGetXNormal()
{
    DrawingNativePointTestSetUp();

    // 1. Pass integer values to OH_Drawing_PointGetX interface
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    OH_Drawing_PointGetX(point, &x);
    // 2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point* point1 = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point1, nullptr);
    OH_Drawing_PointGetX(point1, &x);
    // 3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetXNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0900
 * @tc.desc   test for testPointGetXNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointGetXNull()
{
    DrawingNativePointTestSetUp();

    // 1. OH_Drawing_PointGetX with the first parameter as null
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    EXPECT_EQ(OH_Drawing_PointGetX(nullptr, &x), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_PointGetX with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetX(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. free memory
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetXMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1000
 * @tc.desc   test for testPointGetXMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointGetXMultipleCalls()
{
    DrawingNativePointTestSetUp();

    // 1. Call OH_Drawing_PointGetX 10 times with random values
    float x;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_X_DEFAULT);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(point, &x);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(x, TEST_POINT_X_DEFAULT);
        OH_Drawing_PointDestroy(point);
    }

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetYNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1100
 * @tc.desc   test for testPointGetYNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPointGetYNormal()
{
    DrawingNativePointTestSetUp();

    // 1. Pass integer values to OH_Drawing_PointGetY interface
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, TEST_POINT_Y_DEFAULT);
    // 2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point* point1 = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point1, nullptr);
    errorCode = OH_Drawing_PointGetY(point1, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, TEST_POINT_Y_DEFAULT);
    // 3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetYNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1200
 * @tc.desc   test for testPointGetYNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointGetYNull()
{
    DrawingNativePointTestSetUp();

    // 1. OH_Drawing_PointGetY with the first parameter as null
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    EXPECT_EQ(OH_Drawing_PointGetY(nullptr, &y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_PointGetY with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetY(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. free memory
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointGetYMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1300
 * @tc.desc   test for testPointGetYMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointGetYMultipleCalls()
{
    DrawingNativePointTestSetUp();

    // 1. Call OH_Drawing_PointGetX 10 times with random values
    float y;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_X_DEFAULT);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(y, TEST_POINT_X_DEFAULT);
        OH_Drawing_PointDestroy(point);
    }

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointSetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1400
 * @tc.desc   test for testPointSetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPointSetNormal()
{
    DrawingNativePointTestSetUp();

    // 1. Pass integar point values to OH_Drawing_PointSet interface
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, TEST_POINT_X_NEW, TEST_POINT_Y_NEW), OH_DRAWING_SUCCESS);
    // 2. Pass floating-point values to OH_Drawing_PointSet interface
    //  add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, TEST_POINT_X_NEW_FLOAT, TEST_POINT_Y_NEW_FLOAT), OH_DRAWING_SUCCESS);
    // 3. free memory
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointSetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1500
 * @tc.desc   test for testPointSetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointSetNull()
{
    DrawingNativePointTestSetUp();

    // 1. OH_Drawing_PointSet with the first parameter as null
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    OH_Drawing_ErrorCode code = OH_Drawing_PointSet(nullptr, TEST_POINT_X_NEW, TEST_POINT_Y_NEW);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_PointSet with the second parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, TEST_NUMBER_0, TEST_POINT_Y_NEW), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_PointSet with the third parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, TEST_POINT_X_NEW, TEST_NUMBER_0), OH_DRAWING_SUCCESS);
    // 4. free memory
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPointSetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1600
 * @tc.desc   test for testPointSetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPointSetMultipleCalls()
{
    DrawingNativePointTestSetUp();

    // 1. Call OH_Drawing_PointSet 10 times with random values
    OH_Drawing_Point* point = OH_Drawing_PointCreate(TEST_POINT_X_DEFAULT, TEST_POINT_Y_DEFAULT);
    // add assert
    EXPECT_NE(point, nullptr);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(TEST_POINT_RANDOM_MIN, TEST_POINT_RANDOM_MAX);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_PointSet(point, dis(gen), dis(gen)), OH_DRAWING_SUCCESS);
    }
    // 2. free memory
    OH_Drawing_PointDestroy(point);

    DrawingNativePointTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS