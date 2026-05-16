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

#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_60 60
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_19937 19937

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestPointCreateNormal()
{
    DrawingNativePointTestSetUp();
    // 1. Pass integer values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Pass floating-point values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100.5f, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointCreateNull()
{
    DrawingNativePointTestSetUp();
    // 1. The first parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point = OH_Drawing_PointCreate(0, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, 0);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointCreateAbnormal()
{
    DrawingNativePointTestSetUp();
    // 1. The first parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point = OH_Drawing_PointCreate(-DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, -DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointCreateMaximum()
{
    DrawingNativePointTestSetUp();
    // 1. The first parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point = OH_Drawing_PointCreate(FLT_MAX, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, FLT_MAX);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointCreateMultipleCalls()
{
    DrawingNativePointTestSetUp();
    // 1. Call OH_Drawing_PointCreate 10 times with random values for X and Y coordinates
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_PointDestroy(point);
    }
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointDestroyNormal()
{
    DrawingNativePointTestSetUp();
    // 1. Call OH_Drawing_PointCreate
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Call OH_Drawing_PointDestroy
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointDestroyNull()
{
    DrawingNativePointTestSetUp();
    // 1. The parameter of OH_Drawing_PointDestroy is nullptr
    OH_Drawing_Point *point = nullptr;
    OH_Drawing_PointDestroy(nullptr);
    EXPECT_EQ(point, nullptr);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetXNormal()
{
    DrawingNativePointTestSetUp();
    //1. Pass integer values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    OH_Drawing_PointGetX(point, &x);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point1, nullptr);
    OH_Drawing_PointGetX(point1, &x);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetXNull()
{
    DrawingNativePointTestSetUp();
    //1. OH_Drawing_PointGetX with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    EXPECT_EQ(OH_Drawing_PointGetX(nullptr, &x), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetX with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetX(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetXMultipleCalls()
{
    DrawingNativePointTestSetUp();
    //1. Call OH_Drawing_PointGetX 10 times with random values
    float x;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(point, &x);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(x, DRAWING_NUMBER_100);
        OH_Drawing_PointDestroy(point);
    }
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetYNormal()
{
    DrawingNativePointTestSetUp();
    //1. Pass integer values to OH_Drawing_PointGetY interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, DRAWING_NUMBER_60);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point1, nullptr);
    errorCode = OH_Drawing_PointGetY(point1, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, DRAWING_NUMBER_60);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetYNull()
{
    DrawingNativePointTestSetUp();
    //1. OH_Drawing_PointGetY with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    EXPECT_EQ(OH_Drawing_PointGetY(nullptr, &y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetY with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetY(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointGetYMultipleCalls()
{
    DrawingNativePointTestSetUp();
    //1. Call OH_Drawing_PointGetX 10 times with random values
    float y;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(y, DRAWING_NUMBER_100);
        OH_Drawing_PointDestroy(point);
    }
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointSetNormal()
{
    DrawingNativePointTestSetUp();
    //1. Pass integar point values to OH_Drawing_PointSet interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, DRAWING_NUMBER_10, DRAWING_NUMBER_10), OH_DRAWING_SUCCESS);
    //2. Pass floating-point values to OH_Drawing_PointSet interface
    // add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, DRAWING_NUMBER_20, DRAWING_NUMBER_20), OH_DRAWING_SUCCESS);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointSetNull()
{
    DrawingNativePointTestSetUp();
    //1. OH_Drawing_PointSet with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    EXPECT_EQ(OH_Drawing_PointSet(nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointSet with the second parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, 0, DRAWING_NUMBER_10), OH_DRAWING_SUCCESS);
    //3. OH_Drawing_PointSet with the third parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, DRAWING_NUMBER_10, 0), OH_DRAWING_SUCCESS);
    //4. free memory
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointSetMultipleCalls()
{
    DrawingNativePointTestSetUp();
    //1. Call OH_Drawing_PointSet 10 times with random values
    OH_Drawing_Point *point = OH_Drawing_PointCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_60);
    // add assert
    EXPECT_NE(point, nullptr);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_PointSet(point, dis(gen), dis(gen)), OH_DRAWING_SUCCESS);
    }
    //2. free memory
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointNegateNormal()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointNegate(point);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    float x = 0;
    float y = 0;
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, -10.0f);
    EXPECT_EQ(y, -10.0f);
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointNegateNull()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointNegate(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    float x = 0;
    float y = 0;
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, 10.0f);
    EXPECT_EQ(y, 10.0f);
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointNegateMultipleCalls()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointNegate(point);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointOffsetNormal()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointOffset(point, 10.0f, 10.0f);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    float x = 0;
    float y = 0;
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, 20.0f);
    EXPECT_EQ(y, 20.0f);
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointOffsetNull()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointOffset(nullptr, 10.0f, 10.0f);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    float x = 0;
    float y = 0;
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, 10.0f);
    EXPECT_EQ(y, 10.0f);
    errorCode = OH_Drawing_PointOffset(point, 0, 10.0f);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, 10.0f);
    EXPECT_EQ(y, 20.0f);
    errorCode = OH_Drawing_PointOffset(point, 10.0f, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_PointGetX(point, &x);
    OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(x, 20.0f);
    EXPECT_EQ(y, 20.0f);
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPointOffsetMultipleCalls()
{
    DrawingNativePointTestSetUp();
    OH_Drawing_Point *point = OH_Drawing_PointCreate(10.0f, 10.0f);
    EXPECT_NE(point, nullptr);
    float x = 0;
    float y = 0;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointOffset(point, 10.0f, 10.0f);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        OH_Drawing_PointGetX(point, &x);
        OH_Drawing_PointGetY(point, &y);
        EXPECT_EQ(x, 20.0f + i * 10.0f);
        EXPECT_EQ(y, 20.0f + i * 10.0f);
    }
    OH_Drawing_PointDestroy(point);
    DrawingNativePointTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS