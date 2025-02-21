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
class DrawingNativePointTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0100
 * @tc.name: testPointCreateNormal
 * @tc.desc: test for testPointCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePointTest, testPointCreateNormal, TestSize.Level0) {
    // 1. Pass integer values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // 2. Pass floating-point values for X and Y coordinates to OH_Drawing_PointCreate interface
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100.5f, 60.0f);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0101
 * @tc.name: testPointCreateNull
 * @tc.desc: test for testPointCreateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateNull, TestSize.Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point = OH_Drawing_PointCreate(0, 60);
    // 2. The second parameter of OH_Drawing_PointCreate is empty
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, 0);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0102
 * @tc.name: testPointCreateAbnormal
 * @tc.desc: test for testPointCreateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateAbnormal, TestSize.Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point = OH_Drawing_PointCreate(-100, 60);
    // 2. The second parameter of OH_Drawing_PointCreate is negative
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, -60);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0103
 * @tc.name: testPointCreateMaximum
 * @tc.desc: test for testPointCreateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateMaximum, TestSize.Level3) {
    // 1. The first parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point = OH_Drawing_PointCreate(FLT_MAX, 60);
    // 2. The second parameter of OH_Drawing_PointCreate is FLT_MAX
    OH_Drawing_Point *point2 = OH_Drawing_PointCreate(100, FLT_MAX);
    // 3. Free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0104
 * @tc.name: testPointCreateMultipleCalls
 * @tc.desc: test for testPointCreateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointCreateMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_PointCreate 10 times with random values for X and Y coordinates
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        OH_Drawing_PointDestroy(point);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0200
 * @tc.name: testPointDestroyNormal
 * @tc.desc: test for testPointDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePointTest, testPointDestroyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_PointCreate
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    // 2. Call OH_Drawing_PointDestroy
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0201
 * @tc.name: testPointDestroyNull
 * @tc.desc: test for testPointDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointDestroyNull, TestSize.Level3) {
    // 1. The parameter of OH_Drawing_PointDestroy is nullptr
    OH_Drawing_PointDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0300
 * @tc.name: testPointGetXNormal
 * @tc.desc: test for testPointGetXNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePointTest, testPointGetXNormal, TestSize.Level0) {
    //1. Pass integer values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    float x;
    OH_Drawing_PointGetX(point, &x);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.0f, 60.0f);
    OH_Drawing_PointGetX(point1, &x);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0301
 * @tc.name: testPointGetXNull
 * @tc.desc: test for testPointGetXNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointGetXNull, TestSize.Level3) {
    //1. OH_Drawing_PointGetX with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    float x;
    OH_Drawing_PointGetX(nullptr, &x);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetX with the second parameter as null
    OH_Drawing_PointGetX(point, nullptr);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0302
 * @tc.name: testPointGetXMultipleCalls
 * @tc.desc: test for testPointGetXMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointGetXMultipleCalls, TestSize.Level3) {
    //1. Call OH_Drawing_PointGetX 10 times with random values
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    float x;
    OH_Drawing_Point *point = nullptr;
    for (int i = 0; i < 10; i++) {
        point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        OH_Drawing_PointGetX(point, &x);
    }
    //2. free memory
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0400
 * @tc.name: testPointGetYNormal
 * @tc.desc: test for testPointGetYNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePointTest, testPointGetYNormal, TestSize.Level0) {
    //1. Pass integer values to OH_Drawing_PointGetY interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    float y;
    OH_Drawing_PointGetX(nullptr, &y);
    //2. Pass floating-point values to OH_Drawing_PointGetX interface
    OH_Drawing_Point *point1 = OH_Drawing_PointCreate(100.0f, 60.0f);
    OH_Drawing_PointGetX(point1, &y);
    //3. free memory
    OH_Drawing_PointDestroy(point);
    OH_Drawing_PointDestroy(point1);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0401
 * @tc.name: testPointGetYNull
 * @tc.desc: test for testPointGetYNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointGetYNull, TestSize.Level3) {
    //1. OH_Drawing_PointGetY with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    float y;
    OH_Drawing_PointGetX(nullptr, &y);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointGetY with the second parameter as null
    OH_Drawing_PointGetX(point, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. free memory
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0402
 * @tc.name: testPointGetYMultipleCalls
 * @tc.desc: test for testPointGetYMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointGetYMultipleCalls, TestSize.Level3) {
    //1. Call OH_Drawing_PointGetX 10 times with random values
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    float y;
    OH_Drawing_Point *point = nullptr;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point *point = OH_Drawing_PointCreate(dis(gen), dis(gen));
        OH_Drawing_PointGetX(point, &y);
    }
    //2. free memory
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0400
 * @tc.name: testPointSetNormal
 * @tc.desc: test for testPointSetNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePointTest, testPointSetNormal, TestSize.Level0) {
    //1. Pass integar point values to OH_Drawing_PointSet interface
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    OH_Drawing_PointSet(point, 10, 10);
    //2. Pass floating-point values to OH_Drawing_PointSet interface
    OH_Drawing_PointSet(point, 20.f, 20.f);
    //3. free memory
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0401
 * @tc.name: testPointSetNull
 * @tc.desc: test for testPointSetNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointSetNull, TestSize.Level3) {
    //1. OH_Drawing_PointSet with the first parameter as null
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    OH_Drawing_PointSet(nullptr, 10, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //2. OH_Drawing_PointSet with the second parameter as 0
    OH_Drawing_PointSet(point, 0, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //3. OH_Drawing_PointSet with the third parameter as 0
    OH_Drawing_PointSet(point, 10, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    //4. free memory
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_POINT_0402
 * @tc.name: testPointSetMultipleCalls
 * @tc.desc: test for testPointSetMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePointTest, testPointSetMultipleCalls, TestSize.Level3) {
    //1. Call OH_Drawing_PointSet 10 times with random values
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PointSet(point, dis(gen), dis(gen));
    }
    //2. free memory
    OH_Drawing_PointDestroy(point);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS