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
#include "utils/scalar.h"
#include "gtest/gtest.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRoundRectTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0100
 * @tc.name: testRoundRectCreateNormal
 * @tc.desc: test for testRoundRectCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateNormal, TestSize.Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 2. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0101
 * @tc.name: testRoundRectCreateNull
 * @tc.desc: test for testRoundRectCreateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateNull, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectCreate with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(nullptr, 20, 20);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_RoundRectCreate with 0 as the second parameter
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 0, 20);
    // 3. OH_Drawing_RoundRectCreate with 0 as the third parameter
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect, 20, 0);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0102
 * @tc.name: testRoundRectCreateAbnormal
 * @tc.desc: test for testRoundRectCreateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateAbnormal, TestSize.Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 1. OH_Drawing_RoundRectCreate with a negative value for the second parameter xRad
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, -20, 20);
    // 2. OH_Drawing_RoundRectCreate with a negative value for the third parameter yRad
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, -20);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0103
 * @tc.name: testRoundRectCreateMaximum
 * @tc.desc: test for testRoundRectCreateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateMaximum, TestSize.Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 1. OH_Drawing_RoundRectCreate with the second parameter xRad as the maximum value
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, 20);
    // 2. OH_Drawing_RoundRectCreate with the third parameter yRad as the maximum value
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, FLT_MAX);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0104
 * @tc.name: testRoundRectCreateMultipleCalls
 * @tc.desc: test for testRoundRectCreateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectCreateMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_RoundRectCreate 10 times
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
        EXPECT_NE(roundRect, nullptr);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0200
 * @tc.name: testRoundRectSetGetCornerNormal
 * @tc.desc: test for testRoundRectSetGetCornerNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerNormal, TestSize.Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0201
 * @tc.name: testRoundRectSetGetCornerNull
 * @tc.desc: test for testRoundRectSetGetCornerNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerNull, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 2. OH_Drawing_RoundRectSetCorner with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectSetCorner(nullptr, CORNER_POS_TOP_LEFT, {10.0f, 10.0f});
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0202
 * @tc.name: testRoundRectSetGetCornerAbnormal
 * @tc.desc: test for testRoundRectSetGetCornerAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0203
 * @tc.name: testRoundRectSetGetCornerMaximum
 * @tc.desc: test for testRoundRectSetGetCornerMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerMaximum, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0204
 * @tc.name: testRoundRectSetGetCornerMultipleCalls
 * @tc.desc: test for testRoundRectSetGetCornerMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectSetGetCornerMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0205
 * @tc.name: testRoundRectGetCornerWhenNoSet
 * @tc.desc: test for testRoundRectGetCornerWhenNoSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectGetCornerWhenNoSet, TestSize.Level2) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 2. Call OH_Drawing_RoundRectGetCorner directly
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, 20), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, 20), true);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0300
 * @tc.name: testRoundRectDestroyNormal
 * @tc.desc: test for testRoundRectDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectDestroyNormal, TestSize.Level0) {
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 2. OH_Drawing_RoundRectDestroy
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0301
 * @tc.name: testRoundRectDestroyNull
 * @tc.desc: test for testRoundRectDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_RoundRectDestroy with nullptr as the parameter
    OH_Drawing_RoundRectDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0400
 * @tc.name: testRoundRectOffsetNormal
 * @tc.desc: test for testRoundRectOffsetNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetNormal, TestSize.Level0) {
    //1. OH_Drawing_RoundRectCreate with the second parameter as integar values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    //2. OH_Drawing_RoundRectCreate with the second parameter as floating-point values
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, 20.f, 20);
    //3. OH_Drawing_RoundRectCreate with the first parameter as integar values
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 20, 20);
    //4. OH_Drawing_RoundRectCreate with the first parameter as floating-point values
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0.f, 0.f, 100.f, 100.f);
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect1, 20, 20);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0401
 * @tc.name: testRoundRectOffsetNull
 * @tc.desc: test for testRoundRectOffsetNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RoundRectOffset with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    OH_Drawing_RoundRectOffset(nullptr, 1.0f, 1.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Call OH_Drawing_RoundRectOffset with 0 as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectOffset(roundRect, 0, 1.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RoundRectOffset with 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectOffset(roundRect, 1.0f, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    //4. free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_ROUND_RECT_0402
 * @tc.name: testRoundRectOffsetMultipleCalls
 * @tc.desc: test for testRoundRectOffsetMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRoundRectTest, testRoundRectOffsetMultipleCalls, TestSize.Level3) {
    //1. Call OH_Drawing_RoundRectCreate with random values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, dis(gen), dis(gen));
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    //2. free memory
    OH_Drawing_RectDestroy(rect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS