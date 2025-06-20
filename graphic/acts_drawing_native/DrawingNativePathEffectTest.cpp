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

#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_image.h"
#include "drawing_matrix.h"
#include "drawing_path.h"
#include "drawing_path_effect.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "utils/scalar.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePathEffectTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativePathEffectTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePathEffectTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativePathEffectTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePathEffectTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0100
 * @tc.name: testCreateDashPathEffectNormal
 * @tc.desc: test for testCreateDashPathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CreateDashPathEffect
    float intervals[] = {1, 1, 1};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0101
 * @tc.name: testCreateDashPathEffectNull
 * @tc.desc: test for testCreateDashPathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectNull, TestSize.Level3) {
    float intervals[] = {1, 1};
    // 1. OH_Drawing_CreateDashPathEffect with nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(nullptr, 2, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_CreateDashPathEffect with 0 as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, 0, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with 0.0 as the third parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, 2, 0.0);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0102
 * @tc.name: testCreateDashPathEffectAbnormal
 * @tc.desc: test for testCreateDashPathEffectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectAbnormal, TestSize.Level3) {
    float intervals[] = {1, 1, 1};
    // 1. OH_Drawing_CreateDashPathEffect with the first parameter not being even
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDashPathEffect(intervals, 3, 1.0);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDashPathEffect with the second parameter being negative, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDashPathEffect(intervals, -3, 1.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CreateDashPathEffect with the second parameter being 1
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDashPathEffect(intervals, 1, 1.0);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDashPathEffect with the third parameter being negative
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateDashPathEffect(intervals, 3, -1.0);
    // add assert
    EXPECT_NE(pathEffect4, nullptr);
    // 5. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0104
 * @tc.name: testCreateDashPathEffectMultipleCalls
 * @tc.desc: test for testCreateDashPathEffectMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDashPathEffectMultipleCalls, TestSize.Level3) {
    float intervals[] = {1, 1};
    // 1. Call OH_Drawing_CreateDashPathEffect 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 2, 1.0);
        // add assert
        EXPECT_NE(pathEffect, nullptr);
        // 2. Free memory
        OH_Drawing_PathEffectDestroy(pathEffect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0200
 * @tc.name: testPathEffectDestroyNormal
 * @tc.desc: test for testPathEffectDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testPathEffectDestroyNormal, TestSize.Level0) {
    float intervals[] = {1, 1, 1};
    // 1. OH_Drawing_CreateDashPathEffect
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 3, 0.0);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 2. OH_Drawing_PathEffectDestroy
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0201
 * @tc.name: testPathEffectDestroyNull
 * @tc.desc: test for testPathEffectDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testPathEffectDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_PathEffectDestroy with nullptr as the parameter
    OH_Drawing_PathEffectDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0300
 * @tc.name: testCreateCornerPathEffectNormal
 * @tc.desc: test for testCreateCornerPathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateCornerPathEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CreateCornerPathEffect with normal parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateCornerPathEffect(10.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0301
 * @tc.name: testCreateCornerPathEffectNull
 * @tc.desc: test for testCreateCornerPathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateCornerPathEffectNull, TestSize.Level3) {
    // 1. OH_Drawing_CreateCornerPathEffect with 0 as the parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateCornerPathEffect(0);
    // add assert
    EXPECT_EQ(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0302
 * @tc.name: testCreateCornerPathEffectAbnormal
 * @tc.desc: test for testCreateCornerPathEffectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateCornerPathEffectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CreateCornerPathEffect with 0xFFFFFFFF as the parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateCornerPathEffect(0xFFFFFFFF);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateCornerPathEffect with 0.0001 as the parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateCornerPathEffect(0.0001);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateCornerPathEffect with -0.1 as the parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateCornerPathEffect(-0.1);
    // add assert
    EXPECT_EQ(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateCornerPathEffect with -1 as the parameter
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateCornerPathEffect(-1);
    // add assert
    EXPECT_EQ(pathEffect4, nullptr);
    // 5. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0400
 * @tc.name: testCreateDiscreatePathEffectNormal
 * @tc.desc: test for testCreateDiscreatePathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDiscreatePathEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CreateDiscretePathEffect with normal parameter
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDiscretePathEffect(10.0, 2.0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(pathEffect, nullptr);
    // 2. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0401
 * @tc.name: testCreateDiscreatePathEffectNull
 * @tc.desc: test for testCreateDiscreatePathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDiscreatePathEffectNull, TestSize.Level3) {
    // 1. OH_Drawing_CreateDiscretePathEffect with 0 as the first parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDiscretePathEffect(0, 2.0);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0 as the second parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDiscretePathEffect(10.0, 0);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0402
 * @tc.name: testCreateDiscreatePathEffectAbnormal
 * @tc.desc: test for testCreateDiscreatePathEffectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateDiscreatePathEffectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first and second parameter
    OH_Drawing_PathEffect *pathEffect1 = OH_Drawing_CreateDiscretePathEffect(0xFFFFFFFF, 0xFFFFFFFF);
    // add assert
    EXPECT_NE(pathEffect1, nullptr);
    // 2. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect2 = OH_Drawing_CreateDiscretePathEffect(0xFFFFFFFF, 2.0);
    // add assert
    EXPECT_NE(pathEffect2, nullptr);
    // 3. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect3 = OH_Drawing_CreateDiscretePathEffect(0xFFFFFFFF, -0.1);
    // add assert
    EXPECT_NE(pathEffect3, nullptr);
    // 4. OH_Drawing_CreateDiscretePathEffect with 0xFFFFFFFF as the first parameter
    OH_Drawing_PathEffect *pathEffect4 = OH_Drawing_CreateDiscretePathEffect(0xFFFFFFFF, -1);
    // add assert
    EXPECT_NE(pathEffect4, nullptr);
    // 5. OH_Drawing_CreateDiscretePathEffect with -0.1 as the first parameter
    OH_Drawing_PathEffect *pathEffect5 = OH_Drawing_CreateDiscretePathEffect(-0.1, 2.0);
    // add assert
    EXPECT_NE(pathEffect5, nullptr);
    // 6. OH_Drawing_CreateDiscretePathEffect with -1 as the first parameter
    OH_Drawing_PathEffect *pathEffect6 = OH_Drawing_CreateDiscretePathEffect(-1, 2.0);
    // add assert
    EXPECT_NE(pathEffect6, nullptr);
    // 8. Free memory
    OH_Drawing_PathEffectDestroy(pathEffect1);
    OH_Drawing_PathEffectDestroy(pathEffect2);
    OH_Drawing_PathEffectDestroy(pathEffect3);
    OH_Drawing_PathEffectDestroy(pathEffect4);
    OH_Drawing_PathEffectDestroy(pathEffect5);
    OH_Drawing_PathEffectDestroy(pathEffect6);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0500
 * @tc.name: testCreateComposePathEffectNormal
 * @tc.desc: test for testCreateComposePathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateComposePathEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *cornerPathEffect = OH_Drawing_CreateCornerPathEffect(10.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect *discretePathEffect = OH_Drawing_CreateDiscretePathEffect(10.0, 2.0);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0501
 * @tc.name: testCreateComposePathEffectNull
 * @tc.desc: test for testCreateComposePathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateComposePathEffectNull, TestSize.Level3) {
    // 1. OH_Drawing_CreateCornerPathEffect
    OH_Drawing_PathEffect *cornerPathEffect = OH_Drawing_CreateCornerPathEffect(10.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(cornerPathEffect, nullptr);

    // 2. OH_Drawing_CreateDiscretePathEffect
    OH_Drawing_PathEffect *discretePathEffect = OH_Drawing_CreateDiscretePathEffect(10.0, 2.0);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0600
 * @tc.name: testCreatePathDashEffectNormal
 * @tc.desc: test for testCreatePathDashEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreatePathDashEffectNormal, TestSize.Level0) {
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, 10, 10, 100, 100, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0601
 * @tc.name: testCreatePathDashEffectNull
 * @tc.desc: test for testCreatePathDashEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreatePathDashEffectNull, TestSize.Level3) {
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, 10, 10, 100, 100, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0602
 * @tc.name: testCreatePathDashEffectAbnormal
 * @tc.desc: test for testCreatePathDashEffectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreatePathDashEffectAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, 10, 10, 100, 100, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 3. OH_Drawing_PathCreate
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    // 4. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path2, 50.0f, 50.0f);
    // 5. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path2, 100.0f, 50.0f);
    // 6. OH_Drawing_CreatePathDashEffect第二个参数传0xFFFFFFFF
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreatePathDashEffect(path2, 0xFFFFFFFF,
        50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
        EXPECT_NE(pathEffect, nullptr);
    // 7. OH_Drawing_CreatePathDashEffect第二个参数传0.0001
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, 0.0001, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_NE(pathEffect, nullptr);
    // 8. OH_Drawing_CreatePathDashEffect第二个参数传-0.1
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, -0.1, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 9. OH_Drawing_CreatePathDashEffect第二个参数传-1
    pathEffect = OH_Drawing_CreatePathDashEffect(path2, -1, 50.0f, DRAWING_PATH_DASH_STYLE_TRANSLATE);
    EXPECT_EQ(pathEffect, nullptr);
    // 10. 释放内存
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_PathEffectDestroy(pathEffect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0700
 * @tc.name: testCreateSumPathEffectNormal
 * @tc.desc: test for testCreateSumPathEffectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateSumPathEffectNormal, TestSize.Level0) {
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_EFFECT_0701
 * @tc.name: testCreateSumPathEffectNull
 * @tc.desc: test for testCreateSumPathEffectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathEffectTest, testCreateSumPathEffectNull, TestSize.Level3) {
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
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS