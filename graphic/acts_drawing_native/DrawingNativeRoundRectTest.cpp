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
#include "drawing_error_code.h"
#include "drawing_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_rect.h"
#include "drawing_round_rect.h"
#include "gtest/gtest.h"
#include <random>
#include "DrawingNativeScalarCommon.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRoundRectTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeRoundRectTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRoundRectTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeRoundRectTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRoundRectTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testRoundRectCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0100
 * @tc.desc   test for testRoundRectCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0101
 * @tc.desc   test for testRoundRectCreateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectCreate with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(nullptr, 20, 20);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_RoundRectCreate with 0 as the second parameter
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 0, 20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // 3. OH_Drawing_RoundRectCreate with 0 as the third parameter
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect, 20, 0);
    // add assert
    EXPECT_NE(roundRect3, nullptr);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0102
 * @tc.desc   test for testRoundRectCreateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RoundRectCreate with a negative value for the second parameter xRad
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, -20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectCreate with a negative value for the third parameter yRad
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, -20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectCreateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0103
 * @tc.desc   test for testRoundRectCreateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateMaximum, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RoundRectCreate with the second parameter xRad as the maximum value
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectCreate with the third parameter yRad as the maximum value
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, FLT_MAX);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0104
 * @tc.desc   test for testRoundRectCreateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RoundRectCreate 10 times
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
        EXPECT_NE(roundRect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
}

/**
 * @tc.name   testRoundRectSetGetCornerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0200
 * @tc.desc   test for testRoundRectSetGetCornerNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. Enumerate OH_Drawing_RoundRectSetCorner and OH_Drawing_RoundRectGetCorner with OH_Drawing_CornerPos values
    OH_Drawing_CornerPos posArray[] = {
        CORNER_POS_TOP_LEFT,
        CORNER_POS_TOP_RIGHT,
        CORNER_POS_BOTTOM_RIGHT,
        CORNER_POS_BOTTOM_LEFT,
    };
    for (OH_Drawing_CornerPos pos : posArray) {
        OH_Drawing_RoundRectSetCorner(roundRect, pos, {10.0f, 10.0f});
        OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, pos);
        EXPECT_EQ(IsScalarAlmostEqual(radii.x, 10.0f), true);
        EXPECT_EQ(IsScalarAlmostEqual(radii.y, 10.0f), true);
    }
    // 3. OH_Drawing_RoundRectSetCorner with integer values for x and y radii, and call OH_Drawing_RoundRectGetCorner to
    // retrieve the values
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {10, 10});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, 10), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, 10), true);
    // 4. OH_Drawing_RoundRectSetCorner with decimal values for x and y radii, and call OH_Drawing_RoundRectGetCorner to
    // retrieve the values
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {10.1f, 10.1f});
    OH_Drawing_Corner_Radii radii2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.x, 10.1f), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.y, 10.1f), true);
    // 5. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectSetGetCornerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0201
 * @tc.desc   test for testRoundRectSetGetCornerNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectSetCorner(nullptr, CORNER_POS_TOP_LEFT, {10.0f, 10.0f});
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_RoundRectSetCorner with 0 as the third parameter
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {0, 0});
    // 4. OH_Drawing_RoundRectGetCorner with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectGetCorner(nullptr, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectSetGetCornerAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0202
 * @tc.desc   test for testRoundRectSetGetCornerAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner with negative value for x-axis in OH_Drawing_Corner_Radii, followed by
    // OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {-10.0f, 10.0f});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, -10.0f), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, 10.0f), true);
    // 3. OH_Drawing_RoundRectSetCorner with negative value for y-axis in OH_Drawing_Corner_Radii, followed by
    // OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {10.0f, -10.0f});
    OH_Drawing_Corner_Radii radii2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.x, 10.0f), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.y, -10.0f), true);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectSetGetCornerMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0203
 * @tc.desc   test for testRoundRectSetGetCornerMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. Call OH_Drawing_RoundRectSetCorner with the maximum value for the x-axis in OH_Drawing_Corner_Radii, followed
    // by OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {FLT_MAX, 10.0f});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, FLT_MAX), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, 10.0f), true);
    // 3. Call OH_Drawing_RoundRectSetCorner with the maximum value for the y-axis in OH_Drawing_Corner_Radii, followed
    // by OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {10.0f, FLT_MAX});
    OH_Drawing_Corner_Radii radii2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.x, 10.0f), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii2.y, FLT_MAX), true);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectSetGetCornerMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0204
 * @tc.desc   test for testRoundRectSetGetCornerMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner (pass random values for x-axis and y-axis radii, and a random enum value for
    // OH_Drawing_CornerPos), followed by calling OH_Drawing_RoundRectGetCorner
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    std::uniform_int_distribution<int> dis2(0, 3);
    for (int i = 0; i < 10; i++) {
        float x = dis(gen);
        float y = dis(gen);
        OH_Drawing_CornerPos pos = static_cast<OH_Drawing_CornerPos>(dis2(gen));
        OH_Drawing_RoundRectSetCorner(roundRect, pos, {x, y});
        OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, pos);
        EXPECT_EQ(IsScalarAlmostEqual(radii.x, x), true);
        EXPECT_EQ(IsScalarAlmostEqual(radii.y, y), true);
    }
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectGetCornerWhenNoSet
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0205
 * @tc.desc   test for testRoundRectGetCornerWhenNoSet.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectGetCornerWhenNoSet, Function | SmallTest | Level2) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RoundRectGetCorner directly
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, 20), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, 20), true);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0300
 * @tc.desc   test for testRoundRectDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectDestroyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectDestroy
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0301
 * @tc.desc   test for testRoundRectDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectDestroyNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RoundRectDestroy with nullptr as the parameter
    OH_Drawing_RoundRectDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testRoundRectOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0400
 * @tc.desc   test for testRoundRectOffsetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetNormal, Function | SmallTest | Level0) {
    //1. OH_Drawing_RoundRectCreate with the second parameter as integar values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //2. OH_Drawing_RoundRectCreate with the second parameter as floating-point values
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, 20.f, 20);
    // add assert
    EXPECT_NE(roundRect1, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //3. OH_Drawing_RoundRectCreate with the first parameter as integar values
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //4. OH_Drawing_RoundRectCreate with the first parameter as floating-point values
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0.f, 0.f, 100.f, 100.f);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect1, 20, 20);
    // add assert
    EXPECT_NE(roundRect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
}

/**
 * @tc.name   testRoundRectOffsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0401
 * @tc.desc   test for testRoundRectOffsetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RoundRectOffset with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    EXPECT_EQ(OH_Drawing_RoundRectOffset(nullptr, 1.0f, 1.0f), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Call OH_Drawing_RoundRectOffset with 0 as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_RoundRectOffset(roundRect, 0, 1.0f), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RoundRectOffset with 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_RoundRectOffset(roundRect, 1.0f, 0), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    //4. free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectOffsetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0402
 * @tc.desc   test for testRoundRectOffsetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetMultipleCalls, Function | SmallTest | Level3) {
    //1. Call OH_Drawing_RoundRectCreate with random values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(roundRect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    //2. free memory
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRoundRectCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0500
 * @tc.desc   test for testRoundRectCopyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCopyNormal, Function | SmallTest | Level0) {
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect1, nullptr);
    // 2. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect1, 0, 0);
    EXPECT_NE(roundRect1, nullptr);
    // 3. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCopy(roundRect1);
    EXPECT_NE(roundRect2, nullptr);
    // 4. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect2, nullptr);
    // 5. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect2, 20, 20);
    EXPECT_NE(roundRect3, nullptr);
    // 6. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect4 = OH_Drawing_RoundRectCopy(roundRect3);
    EXPECT_NE(roundRect4, nullptr);
    // 7. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect3, nullptr);
    // 8. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect5 = OH_Drawing_RoundRectCreate(rect3, 0, 0);
    EXPECT_NE(roundRect5, nullptr);
    // 9. Set the upper left corner of the rectangle as a rounded corner.
    OH_Drawing_RoundRectSetCorner(roundRect5, OH_Drawing_CornerPos::CORNER_POS_TOP_LEFT, {20, 20});
    // 10. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect6 = OH_Drawing_RoundRectCopy(roundRect5);
    EXPECT_NE(roundRect6, nullptr);
    // 11. free memory
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RoundRectDestroy(roundRect4);
    OH_Drawing_RoundRectDestroy(roundRect5);
    OH_Drawing_RoundRectDestroy(roundRect6);
}

/**
 * @tc.name   testRoundRectCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0501
 * @tc.desc   test for testRoundRectCopyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCopyNull, Function | SmallTest | Level3) {
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    // 2. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, 0, 0);
    EXPECT_NE(roundRect1, nullptr);
    // 3. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCopy(nullptr);
    EXPECT_EQ(roundRect2, nullptr);
    // 11. free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
}

/**
 * @tc.name   testRoundRectCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0502
 * @tc.desc   test for testRoundRectCopyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCopyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    // 2. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, 0, 0);
    EXPECT_NE(roundRect1, nullptr);
    // 3. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect2 = nullptr;
    // 4. The function OH_Drawing_RoundRectCopy is called 10 times.
    for (int i = 0; i < 10; i++) {
        roundRect2 = OH_Drawing_RoundRectCopy(roundRect1);
        EXPECT_NE(roundRect2, nullptr);
    }
    // 5. free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS