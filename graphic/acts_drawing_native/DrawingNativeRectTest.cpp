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

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRectTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeRectTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRectTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeRectTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRectTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0100
 * @tc.name: testRectCreateNormal
 * @tc.desc: Test for creating and destroying a rectangle object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectCreateNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0200
 * @tc.name: testRectIntersectNormal
 * @tc.desc: Test for intersecting two rectangles with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectIntersectNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(300, 400, 700, 800);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, 200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, 200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectIntersect to check if the two rectangles intersect, Returns true if they intersect,
    // false otherwise
    bool ret = OH_Drawing_RectIntersect(rect, other);
    EXPECT_EQ(ret, true);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0201
 * @tc.name: testRectIntersectNull
 * @tc.desc: Test for intersecting rectangles with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectIntersectNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(300, 400, 700, 800);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectIntersect with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectIntersect(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectIntersect with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectIntersect(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0300
 * @tc.name: testRectJoinNormal
 * @tc.desc: Test for joining two rectangles with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectJoinNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(100, 100, 300, 300);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, 200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, 200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectJoin to take the union of the two rectangles
    bool ret = OH_Drawing_RectJoin(rect, other);
    EXPECT_TRUE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0301
 * @tc.name: testRectJoinNull
 * @tc.desc: Test for joining rectangles with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectJoinNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(100, 100, 300, 300);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectJoin with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectJoin(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectJoin with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectJoin(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0400
 * @tc.name: testRectSetLeftNormal
 * @tc.desc: Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0401
 * @tc.name: testRectSetLeftNull
 * @tc.desc: Test for setting the left coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetLeft(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetLeft with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetLeft(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0402
 * @tc.name: testRectSetLeftAbnormal
 * @tc.desc: Test for setting the left coordinate of a rectangle with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the second parameter as an integer or character data
    OH_Drawing_RectSetLeft(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0403
 * @tc.name: testRectSetLeftMultipleCalls
 * @tc.desc: Test for repeatedly setting and getting the left coordinate of a rectangle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftMultipleCalls, TestSize.Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetLeft(rect, i * 10);
        float left = OH_Drawing_RectGetLeft(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(left, i * 10));
    }
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0500
 * @tc.name: testRectSetTopNormal
 * @tc.desc: Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0501
 * @tc.name: testRectSetTopNull
 * @tc.desc: Test for setting the top coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetTop(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetTop with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetTop(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0502
 * @tc.name: testRectSetTopAbnormal
 * @tc.desc: Test for setting the top coordinate of a rectangle with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the second parameter as an integer or character data
    OH_Drawing_RectSetTop(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2 (the passed parameter is forcibly converted)
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0503
 * @tc.name: testRectSetTopMultipleCalls
 * @tc.desc: Test for repeatedly setting and getting the top coordinate of a rectangle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect 10 times (each time
    // with a different value)
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetTop(rect, i * 10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, i * 10));
    }
    // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each time
    // the returned value is consistent with the set value
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetTop(rect, 10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, 10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0600
 * @tc.name: testRectSetRightNormal
 * @tc.desc: Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0601
 * @tc.name: testRectSetRightNull
 * @tc.desc: Test for setting the right coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetRight(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetRight with the second parameter as 0.00, 3. Call fails without crashing
    OH_Drawing_RectSetRight(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0602
 * @tc.name: testRectSetRightAbnormal
 * @tc.desc: Test for setting the right coordinate of a rectangle with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the second parameter as an integer or character data
    OH_Drawing_RectSetRight(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0603
 * @tc.name: testRectSetRightMultipleCalls
 * @tc.desc: Test for repeatedly setting and getting the right coordinate of a rectangle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect 10 times (each
    // time with a different value)
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetRight(rect, i * 10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, i * 10));
    }
    // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times, Each
    // time the returned value is consistent with the set value
    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetRight(rect, 10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, 10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0700
 * @tc.name: testRectSetBottomNormal
 * @tc.desc: Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, 300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, 3. Returns the value
    // set in step 2
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0701
 * @tc.name: testRectSetBottomNull
 * @tc.desc: Test for setting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the first parameter as nullptr, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetBottom(nullptr, 0.00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetBottom with the second parameter as 0.00, the call fails without crashing
    OH_Drawing_RectSetBottom(rect, 0.00);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0702
 * @tc.name: testRectSetBottomAbnormal
 * @tc.desc: Test for setting the bottom coordinate of a rectangle with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomAbnormal, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the second parameter as an integer or character data
    OH_Drawing_RectSetBottom(rect, 100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0703
 * @tc.name: testRectSetBottomMultipleCalls
 * @tc.desc: Test for repeatedly setting and getting the bottom coordinate of a rectangle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomMultipleCalls, TestSize.Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);

    for (int i = 0; i < 10; i++) {
        OH_Drawing_RectSetBottom(rect, i * 10);
        float bottom = OH_Drawing_RectGetBottom(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(bottom, i * 10));
    }

    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0800
 * @tc.name: testRectGetLeftNormal
 * @tc.desc: Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetLeftNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 100);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0801
 * @tc.name: testRectGetLeftNull
 * @tc.desc: Test for getting the left coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetLeftNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetLeft with nullptr as the parameter
    OH_Drawing_RectGetLeft(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0900
 * @tc.name: testRectGetTopNormal
 * @tc.desc: Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetTopNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 100);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0901
 * @tc.name: testRectGetTopNull
 * @tc.desc: Test for getting the top coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetTopNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetTop with nullptr as the parameter
    OH_Drawing_RectGetTop(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1000
 * @tc.name: testRectGetRightNormal
 * @tc.desc: Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetRightNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, 300);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1001
 * @tc.name: testRectGetRightNull
 * @tc.desc: Test for getting the right coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetRightNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetRight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetRight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1100
 * @tc.name: testRectGetBottomNormal
 * @tc.desc: Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetBottomNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, 300);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, the return value
    // should be the same as the set value
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1101
 * @tc.name: testRectGetBottomNull
 * @tc.desc: Test for getting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetBottomNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetBottom with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetBottom(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1200
 * @tc.name: testRectGetHeightNormal
 * @tc.desc: Test for setting coordinates and getting the height of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetHeightNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, 200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, 200);
    // 6. Call OH_Drawing_RectGetHeight to get the height of the rectangle, which is the difference between the
    // y-coordinate of the bottom-right corner and the y-coordinate of the top-left corner
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, 200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1201
 * @tc.name: testRectGetHeightNull
 * @tc.desc: Test for getting the height of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetHeightNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetHeight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1300
 * @tc.name: testRectGetWidthNormal
 * @tc.desc: Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, 200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, 200);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, 200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1301
 * @tc.name: testRectGetWidthNull
 * @tc.desc: Test for getting the width of a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetWidth with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1302
 * @tc.name: testRectGetWidthBoundary
 * @tc.desc: Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthBoundary, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    uint32_t width = 4096;
    uint32_t height = 2160;
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, width, height);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, width);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, height);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float getWidth = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(getWidth, width - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1400
 * @tc.name: testRectCopyNormal
 * @tc.desc: Test for copying a rectangle with normal parameters and checking the copied values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectCopyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, 100);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, 100);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetRight(src, 300);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetBottom(src, 300);
    // 7. Call OH_Drawing_RectCopy to copy the source rectangle object src to the destination rectangle object dst
    OH_Drawing_RectCopy(src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 9. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 10. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float right = OH_Drawing_RectGetRight(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(right, 300));
    // 11. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float bottom = OH_Drawing_RectGetBottom(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, 300));
    // 12. Call OH_Drawing_RectSetLeft to modify the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, 200);
    // 13. Call OH_Drawing_RectSetTop to modify the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, 200);
    // 14. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same
    // as the previous value (indicating that the modification in src does not affect the result in dst)
    left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, 100));
    // 15. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the previous value (indicating that the modification in src does not affect the result in dst)
    top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, 100));
    // 16. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1401
 * @tc.name: testRectCopyNull
 * @tc.desc: Test for copying a rectangle with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectCopyNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectCopy with nullptr as the first parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectCopy(nullptr, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectCopy with nullptr as the second parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectCopy(src, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1500
 * @tc.name: testRectDestroyNormal
 * @tc.desc: Test for creating and destroying a rectangle object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRectTest, testRectDestroyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1501
 * @tc.name: testRectDestroyNull
 * @tc.desc: Test for destroying a rectangle object with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeRectTest, testRectDestroyNull, TestSize.Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectDestroy(nullptr);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS