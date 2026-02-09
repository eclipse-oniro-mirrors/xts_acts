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

#include "include/DrawingNativeRectTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants for rectangle dimensions and test values
const float DEFAULT_RECT_LEFT = 0.0f;
const float DEFAULT_RECT_TOP = 0.0f;
const float DEFAULT_RECT_RIGHT = 200.0f;
const float DEFAULT_RECT_BOTTOM = 200.0f;

const float LARGE_RECT_LEFT = 100.0f;
const float LARGE_RECT_TOP = 200.0f;
const float LARGE_RECT_RIGHT = 500.0f;
const float LARGE_RECT_BOTTOM = 600.0f;

const float SECOND_RECT_LEFT = 300.0f;
const float SECOND_RECT_TOP = 400.0f;
const float SECOND_RECT_RIGHT = 700.0f;
const float SECOND_RECT_BOTTOM = 800.0f;

const float INTERSECT_RECT1_LEFT = 0.0f;
const float INTERSECT_RECT1_TOP = 0.0f;
const float INTERSECT_RECT1_RIGHT = 200.0f;
const float INTERSECT_RECT1_BOTTOM = 200.0f;

const float INTERSECT_RECT2_LEFT = 100.0f;
const float INTERSECT_RECT2_TOP = 100.0f;
const float INTERSECT_RECT2_RIGHT = 300.0f;
const float INTERSECT_RECT2_BOTTOM = 300.0f;

const float TEST_SET_LEFT_VALUE = 100.0f;
const float TEST_SET_TOP_VALUE = 100.0f;
const float TEST_SET_RIGHT_VALUE = 300.0f;
const float TEST_SET_BOTTOM_VALUE = 300.0f;

const float ZERO_VALUE = 0.0f;
const float LOOP_MULTIPLIER = 10.0f;
const int LOOP_COUNT = 10;

const uint32_t BOUNDARY_WIDTH = 4096;
const uint32_t BOUNDARY_HEIGHT = 2160;

// Common SetUp and TearDown functions implementation
void DrawingNativeRectTestSetUp()
{
    std::cout << "DrawingNativeRectTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRectTestTearDown()
{
    std::cout << "DrawingNativeRectTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRectCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0100
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectCreateNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(LARGE_RECT_LEFT, LARGE_RECT_TOP, LARGE_RECT_RIGHT, LARGE_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIntersectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0200
 * @tc.desc   Test for intersecting two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectIntersectNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(LARGE_RECT_LEFT, LARGE_RECT_TOP, LARGE_RECT_RIGHT, LARGE_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(SECOND_RECT_LEFT, SECOND_RECT_TOP, SECOND_RECT_RIGHT, SECOND_RECT_BOTTOM);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, INTERSECT_RECT1_LEFT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, INTERSECT_RECT1_TOP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, INTERSECT_RECT1_RIGHT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, INTERSECT_RECT1_BOTTOM);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, INTERSECT_RECT2_LEFT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, INTERSECT_RECT2_TOP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, INTERSECT_RECT2_RIGHT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, INTERSECT_RECT2_BOTTOM);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectIntersect to check if the two rectangles intersect, Returns true if they intersect,
    // false otherwise
    bool ret = OH_Drawing_RectIntersect(rect, other);
    EXPECT_EQ(ret, true);
    // 9. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIntersectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0300
 * @tc.desc   Test for intersecting rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIntersectNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(LARGE_RECT_LEFT, LARGE_RECT_TOP, LARGE_RECT_RIGHT, LARGE_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(SECOND_RECT_LEFT, SECOND_RECT_TOP, SECOND_RECT_RIGHT, SECOND_RECT_BOTTOM);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectJoinNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0400
 * @tc.desc   Test for joining two rectangles with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectJoinNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(INTERSECT_RECT2_LEFT, INTERSECT_RECT2_TOP, INTERSECT_RECT2_RIGHT, INTERSECT_RECT2_BOTTOM);
    // add assert
    EXPECT_NE(other, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, INTERSECT_RECT1_LEFT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, INTERSECT_RECT1_TOP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, INTERSECT_RECT1_RIGHT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, INTERSECT_RECT1_BOTTOM);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, INTERSECT_RECT2_LEFT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, INTERSECT_RECT2_TOP);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, INTERSECT_RECT2_RIGHT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, INTERSECT_RECT2_BOTTOM);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectJoinNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0500
 * @tc.desc   Test for joining rectangles with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectJoinNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(INTERSECT_RECT2_LEFT, INTERSECT_RECT2_TOP, INTERSECT_RECT2_RIGHT, INTERSECT_RECT2_BOTTOM);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0600
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetLeftNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, TEST_SET_LEFT_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, TEST_SET_LEFT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0700
 * @tc.desc   Test for setting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetLeft(nullptr, ZERO_VALUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetLeft with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetLeft(rect, ZERO_VALUE);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0800
 * @tc.desc   Test for setting the left coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftAbnormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the second parameter as an integer or character data
    OH_Drawing_RectSetLeft(rect, TEST_SET_LEFT_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, TEST_SET_LEFT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetLeftMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_0900
 * @tc.desc   Test for repeatedly setting and getting the left coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetLeftMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetLeft(rect, i * LOOP_MULTIPLIER);
        float left = OH_Drawing_RectGetLeft(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(left, i * LOOP_MULTIPLIER));
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1000
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetTopNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, TEST_SET_TOP_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, TEST_SET_TOP_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1100
 * @tc.desc   Test for setting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetTop(nullptr, ZERO_VALUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetTop with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetTop(rect, ZERO_VALUE);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1200
 * @tc.desc   Test for setting the top coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopAbnormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the second parameter as an integer or character data
    OH_Drawing_RectSetTop(rect, TEST_SET_TOP_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2 (the passed parameter is forcibly converted)
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, TEST_SET_TOP_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetTopMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1300
 * @tc.desc   Test for repeatedly setting and getting the top coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetTopMultipleCalls()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect 10 times (each time
    // with a different value)
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetTop(rect, i * LOOP_MULTIPLIER);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, i * LOOP_MULTIPLIER));
    }
    // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each time
    // the returned value is consistent with the set value
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetTop(rect, LOOP_MULTIPLIER);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, LOOP_MULTIPLIER));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1400
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetRightNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, TEST_SET_RIGHT_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, TEST_SET_RIGHT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1500
 * @tc.desc   Test for setting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetRight(nullptr, ZERO_VALUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetRight with the second parameter as 0.00, 3. Call fails without crashing
    OH_Drawing_RectSetRight(rect, ZERO_VALUE);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1600
 * @tc.desc   Test for setting the right coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightAbnormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the second parameter as an integer or character data
    OH_Drawing_RectSetRight(rect, TEST_SET_LEFT_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, TEST_SET_LEFT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetRightMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1700
 * @tc.desc   Test for repeatedly setting and getting the right coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetRightMultipleCalls()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect 10 times (each
    // time with a different value)
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetRight(rect, i * LOOP_MULTIPLIER);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, i * LOOP_MULTIPLIER));
    }
    // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times, Each
    // time the returned value is consistent with the set value
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetRight(rect, LOOP_MULTIPLIER);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, LOOP_MULTIPLIER));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1800
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetBottomNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, TEST_SET_BOTTOM_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, 3. Returns the value
    // set in step 2
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, TEST_SET_BOTTOM_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_1900
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the first parameter as nullptr, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetBottom(nullptr, ZERO_VALUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetBottom with the second parameter as 0.00, the call fails without crashing
    OH_Drawing_RectSetBottom(rect, ZERO_VALUE);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2000
 * @tc.desc   Test for setting the bottom coordinate of a rectangle with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomAbnormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the second parameter as an integer or character data
    OH_Drawing_RectSetBottom(rect, TEST_SET_LEFT_VALUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, TEST_SET_LEFT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetBottomMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2100
 * @tc.desc   Test for repeatedly setting and getting the bottom coordinate of a rectangle.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetBottomMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);

    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_RectSetBottom(rect, i * LOOP_MULTIPLIER);
        float bottom = OH_Drawing_RectGetBottom(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(bottom, i * LOOP_MULTIPLIER));
    }

    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetLeftNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2200
 * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetLeftNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, TEST_SET_LEFT_VALUE);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, TEST_SET_LEFT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetLeftNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2300
 * @tc.desc   Test for getting the left coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetLeftNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetLeft with nullptr as the parameter
    OH_Drawing_RectGetLeft(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetTopNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2400
 * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetTopNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, TEST_SET_TOP_VALUE);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, TEST_SET_TOP_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetTopNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2500
 * @tc.desc   Test for getting the top coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetTopNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetTop with nullptr as the parameter
    OH_Drawing_RectGetTop(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetRightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2600
 * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetRightNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, TEST_SET_RIGHT_VALUE);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, TEST_SET_RIGHT_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetRightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2700
 * @tc.desc   Test for getting the right coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetRightNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetRight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetRight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetBottomNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2800
 * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetBottomNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, TEST_SET_BOTTOM_VALUE);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, the return value
    // should be the same as the set value
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, TEST_SET_BOTTOM_VALUE));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetBottomNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_2900
 * @tc.desc   Test for getting the bottom coordinate of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetBottomNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetBottom with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetBottom(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetHeightNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3000
 * @tc.desc   Test for setting coordinates and getting the height of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetHeightNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, DEFAULT_RECT_LEFT);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, DEFAULT_RECT_TOP);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DEFAULT_RECT_RIGHT);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DEFAULT_RECT_BOTTOM);
    // 6. Call OH_Drawing_RectGetHeight to get the height of the rectangle, which is the difference between the
    // y-coordinate of the bottom-right corner and the y-coordinate of the top-left corner
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, DEFAULT_RECT_BOTTOM - DEFAULT_RECT_TOP));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetHeightNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3100
 * @tc.desc   Test for getting the height of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetHeightNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetHeight with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3200
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetWidthNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, DEFAULT_RECT_LEFT);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, DEFAULT_RECT_TOP);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, DEFAULT_RECT_RIGHT);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, DEFAULT_RECT_BOTTOM);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, DEFAULT_RECT_RIGHT - DEFAULT_RECT_LEFT));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3300
 * @tc.desc   Test for getting the width of a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectGetWidthNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectGetWidth with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectGetWidthBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3400
 * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectGetWidthBoundary()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    DrawingNativeRectTestSetUp();
    uint32_t width = BOUNDARY_WIDTH;
    uint32_t height = BOUNDARY_HEIGHT;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(ZERO_VALUE, ZERO_VALUE, width, height);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, ZERO_VALUE);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, ZERO_VALUE);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, width);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, height);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float getWidth = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(getWidth, width - ZERO_VALUE));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3500
 * @tc.desc   Test for copying a rectangle with normal parameters and checking the copied values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectCopyNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(ZERO_VALUE, ZERO_VALUE, ZERO_VALUE, ZERO_VALUE);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, TEST_SET_LEFT_VALUE);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, TEST_SET_TOP_VALUE);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetRight(src, TEST_SET_RIGHT_VALUE);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetBottom(src, TEST_SET_BOTTOM_VALUE);
    // 7. Call OH_Drawing_RectCopy to copy the source rectangle object src to the destination rectangle object dst
    OH_Drawing_RectCopy(src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, TEST_SET_LEFT_VALUE));
    // 9. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, TEST_SET_TOP_VALUE));
    // 10. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float right = OH_Drawing_RectGetRight(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(right, TEST_SET_RIGHT_VALUE));
    // 11. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float bottom = OH_Drawing_RectGetBottom(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, TEST_SET_BOTTOM_VALUE));
    // 12. Call OH_Drawing_RectSetLeft to modify the x-coordinate of the top-left corner of src
    const float modifiedLeft = 200.0f;
    OH_Drawing_RectSetLeft(src, modifiedLeft);
    // 13. Call OH_Drawing_RectSetTop to modify the y-coordinate of the top-left corner of src
    const float modifiedTop = 200.0f;
    OH_Drawing_RectSetTop(src, modifiedTop);
    // 14. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same
    // as the previous value (indicating that the modification in src does not affect the result in dst)
    left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, TEST_SET_LEFT_VALUE));
    // 15. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the previous value (indicating that the modification in src does not affect the result in dst)
    top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, TEST_SET_TOP_VALUE));
    // 16. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3600
 * @tc.desc   Test for copying a rectangle with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectCopyNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(ZERO_VALUE, ZERO_VALUE, ZERO_VALUE, ZERO_VALUE);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3700
 * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectDestroyNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3800
 * @tc.desc   Test for destroying a rectangle object with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectDestroyNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy with nullptr as the parameter, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectDestroy(nullptr);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS