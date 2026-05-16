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

#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_40 40
#define DRAWING_NUMBER_440 40
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_600 600
#define DRAWING_NUMBER_700 700
#define DRAWING_NUMBER_800 800
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_2139095040 2139095040
#define DRAWING_NUMBER_2139095170 2139095170

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestRectCreateNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectIntersectNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_300, DRAWING_NUMBER_400, 700, 800);
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
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, DRAWING_NUMBER_300);
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

int TestRectIntersectNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, DRAWING_NUMBER_500, 600);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_300, DRAWING_NUMBER_400, 700, 800);
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

int TestRectJoinNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
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
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Repeat steps 3-6 to set the coordinates of the other rectangle object
    OH_Drawing_RectSetLeft(other, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetTop(other, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetRight(other, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_RectSetBottom(other, DRAWING_NUMBER_300);
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

int TestRectJoinNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectCreate to create another rectangle object other
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
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

int TestRectSetLeftNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetLeftNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetLeft(nullptr, 0.00f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetLeft with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetLeft(rect, 0.00f);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetLeftAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft with the second parameter as an integer or character data
    OH_Drawing_RectSetLeft(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetLeftMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetLeft(rect, i * DRAWING_NUMBER_10);
        float left = OH_Drawing_RectGetLeft(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(left, i * DRAWING_NUMBER_10));
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetTopNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetTopNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetTop(nullptr, 0.00f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetTop with the second parameter as 0.00, Call fails without crashing
    OH_Drawing_RectSetTop(rect, 0.00f);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetTopAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop with the second parameter as an integer or character data
    OH_Drawing_RectSetTop(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect, Returns the value set in
    // step 2 (the passed parameter is forcibly converted)
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetTopMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect 10 times (each time
    // with a different value)
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetTop(rect, i * DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, i * DRAWING_NUMBER_10));
    }
    // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each time
    // the returned value is consistent with the set value
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetTop(rect, DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect 10 times, Each
        // time the returned value is consistent with the set value
        float top = OH_Drawing_RectGetTop(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetRightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetRightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the first parameter as nullptr, Returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetRight(nullptr, 0.00f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetRight with the second parameter as 0.00, 3. Call fails without crashing
    OH_Drawing_RectSetRight(rect, 0.00f);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetRightAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight with the second parameter as an integer or character data
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect, Returns the value set
    // in step 2 (the passed parameter is forcibly converted)
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetRightMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Loop to call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect 10 times (each
    // time with a different value)
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetRight(rect, i * DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, i * DRAWING_NUMBER_10));
    }
    // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times, Each
    // time the returned value is consistent with the set value
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        // 3. Loop to call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect 10 times,
        // Each time the returned value is consistent with the set value
        float right = OH_Drawing_RectGetRight(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_10));
    }
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetBottomNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_300);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, 3. Returns the value
    // set in step 2
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetBottomNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the first parameter as nullptr, returns error code
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RectSetBottom(nullptr, 0.00f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_RectSetBottom with the second parameter as 0.00, the call fails without crashing
    OH_Drawing_RectSetBottom(rect, 0.00f);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetBottomAbnormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom with the second parameter as an integer or character data
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetBottomMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);

    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RectSetBottom(rect, i * DRAWING_NUMBER_10);
        float bottom = OH_Drawing_RectGetBottom(rect);
        EXPECT_TRUE(IsScalarAlmostEqual(bottom, i * DRAWING_NUMBER_10));
    }

    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetLeftNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, DRAWING_NUMBER_100);
    // 3. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of rect
    float left = OH_Drawing_RectGetLeft(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(left, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetLeftNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetTopNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, DRAWING_NUMBER_100);
    // 3. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of rect
    float top = OH_Drawing_RectGetTop(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_100));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetTopNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetRightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_300);
    // 3. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of rect
    float right = OH_Drawing_RectGetRight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetRightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetBottomNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_300);
    // 3. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of rect, the return value
    // should be the same as the set value
    float bottom = OH_Drawing_RectGetBottom(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetBottomNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetHeightNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of rect
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of rect
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of rect
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_RectGetHeight to get the height of the rectangle, which is the difference between the
    // y-coordinate of the bottom-right corner and the y-coordinate of the top-left corner
    float height = OH_Drawing_RectGetHeight(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(height, DRAWING_NUMBER_200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetHeightNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetWidthNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner
    OH_Drawing_RectSetLeft(rect, 0);
    // 3. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner
    OH_Drawing_RectSetTop(rect, 0);
    // 4. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner
    OH_Drawing_RectSetRight(rect, DRAWING_NUMBER_200);
    // 5. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner
    OH_Drawing_RectSetBottom(rect, DRAWING_NUMBER_200);
    // 6. Call OH_Drawing_RectGetWidth to get the width of the rectangle, which is the difference between the
    // x-coordinate of the bottom-right corner and the x-coordinate of the top-left corner
    float width = OH_Drawing_RectGetWidth(rect);
    EXPECT_TRUE(IsScalarAlmostEqual(width, DRAWING_NUMBER_200 - 0));
    // 7. Free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectGetWidthNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectGetWidthBoundary()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object rect
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectCopyNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Call OH_Drawing_RectCreate to create a rectangle object dst
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_RectSetLeft to set the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_RectSetTop to set the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_RectSetRight to set the x-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetRight(src, DRAWING_NUMBER_300);
    // 6. Call OH_Drawing_RectSetBottom to set the y-coordinate of the bottom-right corner of src
    OH_Drawing_RectSetBottom(src, DRAWING_NUMBER_300);
    // 7. Call OH_Drawing_RectCopy to copy the source rectangle object src to the destination rectangle object dst
    OH_Drawing_RectCopy(src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, DRAWING_NUMBER_100));
    // 9. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the value set in src
    float top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_100));
    // 10. Call OH_Drawing_RectGetRight to get the x-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float right = OH_Drawing_RectGetRight(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(right, DRAWING_NUMBER_300));
    // 11. Call OH_Drawing_RectGetBottom to get the y-coordinate of the bottom-right corner of dst, which should be the
    // same as the value set in src
    float bottom = OH_Drawing_RectGetBottom(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(bottom, DRAWING_NUMBER_300));
    // 12. Call OH_Drawing_RectSetLeft to modify the x-coordinate of the top-left corner of src
    OH_Drawing_RectSetLeft(src, DRAWING_NUMBER_200);
    // 13. Call OH_Drawing_RectSetTop to modify the y-coordinate of the top-left corner of src
    OH_Drawing_RectSetTop(src, DRAWING_NUMBER_200);
    // 14. Call OH_Drawing_RectGetLeft to get the x-coordinate of the top-left corner of dst, which should be the same
    // as the previous value (indicating that the modification in src does not affect the result in dst)
    left = OH_Drawing_RectGetLeft(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(left, DRAWING_NUMBER_100));
    // 15. Call OH_Drawing_RectGetTop to get the y-coordinate of the top-left corner of dst, which should be the same as
    // the previous value (indicating that the modification in src does not affect the result in dst)
    top = OH_Drawing_RectGetTop(dst);
    EXPECT_TRUE(IsScalarAlmostEqual(top, DRAWING_NUMBER_100));
    // 16. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectCopyNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object src
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectDestroyNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectDestroyNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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

int TestRectInsetNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_10;
    float top = -DRAWING_NUMBER_20;
    float right = DRAWING_NUMBER_30;
    float bottom = -DRAWING_NUMBER_40;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 110.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 180.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 370.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 340.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectInsetAbNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_100;
    float top = 0;
    float right = DRAWING_NUMBER_200;
    float bottom = DRAWING_NUMBER_100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectInsetNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_100;
    float top = 0;
    float right = DRAWING_NUMBER_200;
    float bottom = DRAWING_NUMBER_100;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(nullptr, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 400.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 300.0f);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectInsetCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    float left = DRAWING_NUMBER_10;
    float top = -DRAWING_NUMBER_20;
    float right = DRAWING_NUMBER_30;
    float bottom = -DRAWING_NUMBER_40;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 700.0f);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectContainsNormal()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectContainsNull()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectContainsCalls()
{
    DrawingNativeRectTestSetUp();
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetEmptyNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetEmptyNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSetEmptyMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectIsEmptyNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectIsEmptyNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RectIsEmpty(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectIsEmptyMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    errorCode = OH_Drawing_RectOffset(rect, -DRAWING_NUMBER_100, -DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    errorCode = OH_Drawing_RectOffset(rect, 0, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    errorCode = OH_Drawing_RectOffset(rect, DRAWING_NUMBER_100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetAbnormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DRAWING_NUMBER_2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DRAWING_NUMBER_2139095170);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (float i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 10.0f + i * 10.0f);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 10.0f + i * 10.0f);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 110.0f + i * 10.0f);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 110.0f + i * 10.0f);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetToNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetToNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    errorCode = OH_Drawing_RectOffsetTo(rect, 0, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    errorCode = OH_Drawing_RectOffsetTo(rect, DRAWING_NUMBER_100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetToAbnormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, 0x7F7FFFFF, 0x7F7FFFFF);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DRAWING_NUMBER_2139095040);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DRAWING_NUMBER_2139095170);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DRAWING_NUMBER_2139095170);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectOffsetToMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100.0f);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100.0f);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSortNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, 0, 0);
    errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSortNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectSortMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 100.0f);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 100.0f);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectUnionNormal()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectUnionNull()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(nullptr, other);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RectUnion(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRectUnionMultipleCalls()
{
    DrawingNativeRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect *other = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 0.0f);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 0.0f);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 200.0f);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 200.0f);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS