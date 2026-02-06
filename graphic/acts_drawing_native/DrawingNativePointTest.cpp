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

#include "drawing_point.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePointTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativePointTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePointTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativePointTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePointTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testPointCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0100
 * @tc.desc   test for testPointCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePointTest, testPointCreateNormal, Function | SmallTest | Level0) {
    // 1. Pass integer values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Pass floating-point values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100.5f, 60.0f);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/**
 * @tc.name   testPointCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0101
 * @tc.desc   test for testPointCreateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateNull, Function | SmallTest | Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point = OH_Drawing_PointCreate(0, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, 0);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/**
 * @tc.name   testPointCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0102
 * @tc.desc   test for testPointCreateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateAbnormal, Function | SmallTest | Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point = OH_Drawing_PointCreate(-100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, -60);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/**
 * @tc.name   testPointCreateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0103
 * @tc.desc   test for testPointCreateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateMaximum, Function | SmallTest | Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point = OH_Drawing_PointCreate(FLT_MAX, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. The second parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, FLT_MAX);
    // add assert
    EXPECT_NE(point2, nullptr);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/**
 * @tc.name   testPointCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0104
 * @tc.desc   test for testPointCreateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_PointCreate 10 times with random values for X and Y coordinates
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_PointDestroy(point);
    }
}

/**
 * @tc.name   testPointDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0200
 * @tc.desc   test for testPointDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePointTest, testPointDestroyNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_PointCreate
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // 2. Call OH_Drawing_PointDestroy
    OH_Drawing_PointDestroy(point);
}

/**
 * @tc.name   testPointDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0201
 * @tc.desc   test for testPointDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointDestroyNull, Function | SmallTest | Level3) {
    // 1. The parameter of OH_Drawing_PointDestroy is nullptr
    OH_Drawing_PointDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testPointGetXNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0300
 * @tc.desc   test for testPointGetXNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePointTest, testPointGetXNormal, Function | SmallTest | Level0) {
    //1. Pass integer values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    OH_Drawing_PointGetX(point, &x);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.0f, 60.0f);
    // add assert
    EXPECT_NE(point1, nullptr);
    OH_Drawing_PointGetX(point1, &x);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
}

/**
 * @tc.name   testPointGetXNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0301
 * @tc.desc   test for testPointGetXNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointGetXNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_PointGetX with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    float x;
    EXPECT_EQ(OH_Drawing_PointGetX(nullptr, &x), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetX with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetX(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. free memory
    OH_Drawing_PointDestroy(point);
}

/**
 * @tc.name   testPointGetXMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0302
 * @tc.desc   test for testPointGetXMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointGetXMultipleCalls, Function | SmallTest | Level3) {
    //1. Call OH_Drawing_PointGetX 10 times with random values
    float x;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(point, &x);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(x, 100);
        OH_Drawing_PointDestroy(point);
    }
}

/**
 * @tc.name   testPointGetYNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0400
 * @tc.desc   test for testPointGetYNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePointTest, testPointGetYNormal, Function | SmallTest | Level0) {
    //1. Pass integer values to OH_Drawing_PointGetY interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, 60);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.0f, 60.0f);
    // add assert
    EXPECT_NE(point1, nullptr);
    errorCode = OH_Drawing_PointGetY(point1, &y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(y, 60.0f);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
}

/**
 * @tc.name   testPointGetYNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0401
 * @tc.desc   test for testPointGetYNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointGetYNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_PointGetY with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    float y;
    EXPECT_EQ(OH_Drawing_PointGetY(nullptr, &y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetY with the second parameter as null
    EXPECT_EQ(OH_Drawing_PointGetY(point, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. free memory
    OH_Drawing_PointDestroy(point);
}

/**
 * @tc.name   testPointGetYMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0402
 * @tc.desc   test for testPointGetYMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointGetYMultipleCalls, Function | SmallTest | Level3) {
    //1. Call OH_Drawing_PointGetX 10 times with random values
    float y;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 100);
        // add assert
        EXPECT_NE(point, nullptr);
        OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &y);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(y, 100);
        OH_Drawing_PointDestroy(point);
    }
}

/**
 * @tc.name   testPointSetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0400
 * @tc.desc   test for testPointSetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePointTest, testPointSetNormal, Function | SmallTest | Level0) {
    //1. Pass integar point values to OH_Drawing_PointSet interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, 10, 10), OH_DRAWING_SUCCESS);
    //2. Pass floating-point values to OH_Drawing_PointSet interface
    // add assert
    EXPECT_EQ(OH_Drawing_PointSet(point, 20.f, 20.f), OH_DRAWING_SUCCESS);
    //3. free memory
    OH_Drawing_PointDestroy(point);
}

/**
 * @tc.name   testPointSetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0401
 * @tc.desc   test for testPointSetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointSetNull, Function | SmallTest | Level3) {
    //1. OH_Drawing_PointSet with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    EXPECT_EQ(OH_Drawing_PointSet(nullptr, 10, 10), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointSet with the second parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, 0, 10), OH_DRAWING_SUCCESS);
    //3. OH_Drawing_PointSet with the third parameter as 0
    EXPECT_EQ(OH_Drawing_PointSet(point, 10, 0), OH_DRAWING_SUCCESS);
    //4. free memory
    OH_Drawing_PointDestroy(point);
}

/**
 * @tc.name   testPointSetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0402
 * @tc.desc   test for testPointSetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePointTest, testPointSetMultipleCalls, Function | SmallTest | Level3) {
    //1. Call OH_Drawing_PointSet 10 times with random values
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // add assert
    EXPECT_NE(point, nullptr);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_PointSet(point, dis(gen), dis(gen)), OH_DRAWING_SUCCESS);
    }
    //2. free memory
    OH_Drawing_PointDestroy(point);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS