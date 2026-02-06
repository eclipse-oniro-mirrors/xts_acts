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
#include "DrawingNativeScalarCommon.h"

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

/**
 * @tc.name   testRectCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0100
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectCreateNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Free memory
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectIntersectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0200
 * @tc.desc   Test for intersecting two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectIntersectNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectIntersectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0201
 * @tc.desc   Test for intersecting rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectIntersectNull, Function | SmallTest | Level3) {
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
    bool ret = OH_Drawing_RectIntersect(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectIntersect with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    ret = OH_Drawing_RectIntersect(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectJoinNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0300
 * @tc.desc   Test for joining two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectJoinNormal, Function | SmallTest | Level0) {
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
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectJoinNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0301
 * @tc.desc   Test for joining rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectJoinNull, Function | SmallTest | Level3) {
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
    bool ret = OH_Drawing_RectJoin(nullptr, other);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_RectJoin with the second parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    ret = OH_Drawing_RectJoin(rect, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectSetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0400
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectSetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0401
 * @tc.desc   Test for setting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetLeftAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0402
 * @tc.desc   Test for setting the left coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftAbnormal, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetLeftMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0403
 * @tc.desc   Test for repeatedly setting and getting the left coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetLeftMultipleCalls, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0500
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectSetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0501
 * @tc.desc   Test for setting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetTopAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0502
 * @tc.desc   Test for setting the top coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopAbnormal, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetTopMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0503
 * @tc.desc   Test for repeatedly setting and getting the top coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetTopMultipleCalls, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0600
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectSetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0601
 * @tc.desc   Test for setting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetRightAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0602
 * @tc.desc   Test for setting the right coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightAbnormal, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetRightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0603
 * @tc.desc   Test for repeatedly setting and getting the right coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetRightMultipleCalls, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0700
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectSetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0701
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetBottomAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0702
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomAbnormal, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectSetBottomMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0703
 * @tc.desc   Test for repeatedly setting and getting the bottom coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetBottomMultipleCalls, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0800
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetLeftNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0801
 * @tc.desc   Test for getting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetLeftNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0900
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetTopNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_0901
 * @tc.desc   Test for getting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetTopNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1000
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetRightNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1001
 * @tc.desc   Test for getting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetRightNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1100
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetBottomNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1101
 * @tc.desc   Test for getting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetBottomNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1200
 * @tc.desc   Test for setting coordinates and getting the height of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetHeightNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1201
 * @tc.desc   Test for getting the height of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetHeightNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetWidthNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1300
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectGetWidthNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1301
 * @tc.desc   Test for getting the width of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectGetWidthBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1302
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectGetWidthBoundary, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1400
 * @tc.desc   Test for copying a rectangle with normal parameters and checking the copied values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectCopyNormal, Function | SmallTest | Level0) {
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

/**
 * @tc.name   testRectCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1401
 * @tc.desc   Test for copying a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectCopyNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1500
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectDestroyNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1501
 * @tc.desc   Test for destroying a rectangle object with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectDestroyNull, Function | SmallTest | Level3) {
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

/**
 * @tc.name   testRectInsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1600
 * @tc.desc   Test for testRectInsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectInsetNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 400, 300);
    EXPECT_NE(rect, nullptr);
    float left = 10.0;
    float top = -20.0;
    float right = 30.0;
    float bottom = -40.0;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 110.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 180.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 370.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 340.0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectInsetAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1601
 * @tc.desc   Test for testRectInsetAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectInsetAbNormal, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 400, 300);
    EXPECT_NE(rect, nullptr);
    float left = 100;
    float top = 0;
    float right = 200;
    float bottom = 100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectInsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1602
 * @tc.desc   Test for testRectInsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectInsetNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 400, 300);
    EXPECT_NE(rect, nullptr);
    float left = 100;
    float top = 0;
    float right = 200;
    float bottom = 100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(nullptr, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 400.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 300.0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectInsetCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1603
 * @tc.desc   Test for testRectInsetCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectInsetCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 400, 300);
    EXPECT_NE(rect, nullptr);
    float left = 10.0;
    float top = -20.0;
    float right = 30.0;
    float bottom = -40.0;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 700.0);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1700
 * @tc.desc   Test for testRectContainsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectContainsNormal, Function | SmallTest | Level0) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(200, 200, 300, 300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1701
 * @tc.desc   Test for testRectContainsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectContainsNull, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(200, 200, 300, 300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains = false;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(nullptr, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);

    code = OH_Drawing_RectContains(rect, nullptr, &isContains);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);

    code = OH_Drawing_RectContains(rect, other, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectContainsCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1703
 * @tc.desc   Test for testRectContainsCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectContainsCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(200, 200, 300, 300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectSetEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1800
 * @tc.desc   Test for testRectSetEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSetEmptyNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectSetEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1801
 * @tc.desc   Test for testRectSetEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetEmptyNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectSetEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1802
 * @tc.desc   Test for testRectSetEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSetEmptyMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1900
 * @tc.desc   Test for testRectIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectIsEmptyNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectSetEmpty(rect);
    errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, true);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1901
 * @tc.desc   Test for testRectIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectIsEmptyNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RectIsEmpty(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_1902
 * @tc.desc   Test for testRectIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectIsEmptyMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2000
 * @tc.desc   Test for testRectOffsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffset(rect, -100, -100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2001
 * @tc.desc   Test for testRectOffsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(nullptr, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    errorCode = OH_Drawing_RectOffset(rect, 0, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffset(rect, 100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2002
 * @tc.desc   Test for testRectOffsetAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 2139095170);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2003
 * @tc.desc   Test for testRectOffsetMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    for (float i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, 10, 10);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 10.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 10.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 110.0 + i * 10.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 110.0 + i * 10.0);
    }
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2100
 * @tc.desc   Test for testRectOffsetToNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetToNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2101
 * @tc.desc   Test for testRectOffsetToNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetToNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(nullptr, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    errorCode = OH_Drawing_RectOffsetTo(rect, 0, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    errorCode = OH_Drawing_RectOffsetTo(rect, 100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2102
 * @tc.desc   Test for testRectOffsetToAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetToAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 2139095170);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectOffsetToMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2103
 * @tc.desc   Test for testRectOffsetToMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectOffsetToMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, 100, 100);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    }
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectSortNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2200
 * @tc.desc   Test for testRectSortNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectSortNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    rect = OH_Drawing_RectCreate(100, 100, 0, 0);
    errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectSortNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2201
 * @tc.desc   Test for testRectSortNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSortNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectSortMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2202
 * @tc.desc   Test for testRectSortMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectSortMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0);
    }
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRectUnionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2300
 * @tc.desc   Test for testRectUnionNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRectTest, testRectUnionNormal, Function | SmallTest | Level0) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(100, 100, 200, 200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectUnionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2301
 * @tc.desc   Test for testRectUnionNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectUnionNull, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(100, 100, 200, 200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(nullptr, other);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RectUnion(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}

/**
 * @tc.name   testRectUnionMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECT_2302
 * @tc.desc   Test for testRectUnionMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRectTest, testRectUnionMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(100, 100, 200, 200);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS