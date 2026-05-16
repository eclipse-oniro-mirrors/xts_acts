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

#include "include/DrawingNativeRoundRectTest.h"
#include <cfloat>
#include <random>
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_19937 19937

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeRoundRectTestSetUp()
{
    std::cout << "DrawingNativeRoundRectTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRoundRectTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRoundRectTestTearDown()
{
    std::cout << "DrawingNativeRoundRectTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRoundRectTest errorCodeReset after each test case." << std::endl;
}

int TestRoundRectCreateNormal()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCreateNull()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(nullptr, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. OH_Drawing_RoundRectCreate with 0 as the second parameter
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, 0, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // 3. OH_Drawing_RoundRectCreate with 0 as the third parameter
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, 0);
    // add assert
    EXPECT_NE(roundRect3, nullptr);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCreateAbnormal()
{
    DrawingNativeRoundRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RoundRectCreate with a negative value for the second parameter xRad
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, -DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectCreate with a negative value for the third parameter yRad
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, -DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCreateMaximum()
{
    DrawingNativeRoundRectTestSetUp();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RoundRectCreate with the second parameter xRad as the maximum value
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, FLT_MAX, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectCreate with the third parameter yRad as the maximum value
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, FLT_MAX);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCreateMultipleCalls()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. Call OH_Drawing_RoundRectCreate 10 times
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
        EXPECT_NE(roundRect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectSetGetCornerNormal()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
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
        OH_Drawing_RoundRectSetCorner(roundRect, pos, {DRAWING_NUMBER_10, DRAWING_NUMBER_10});
        OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, pos);
        EXPECT_EQ(IsScalarAlmostEqual(radii.x, DRAWING_NUMBER_10), true);
        EXPECT_EQ(IsScalarAlmostEqual(radii.y, DRAWING_NUMBER_10), true);
    }
    // 3. OH_Drawing_RoundRectSetCorner with integer values for x and y radii, and call OH_Drawing_RoundRectGetCorner to
    // retrieve the values
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {DRAWING_NUMBER_10, DRAWING_NUMBER_10});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, DRAWING_NUMBER_10), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, DRAWING_NUMBER_10), true);
    // 4. OH_Drawing_RoundRectSetCorner with decimal values for x and y radii, and call OH_Drawing_RoundRectGetCorner to
    // retrieve the values
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {10.1f, 10.1f});
    OH_Drawing_Corner_Radii radiiDRAWING_NUMBER_2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.x, 10.1f), true);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.y, 10.1f), true);
    // 5. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectSetGetCornerNull()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_RoundRectSetCorner(nullptr, CORNER_POS_TOP_LEFT, {DRAWING_NUMBER_10, DRAWING_NUMBER_10});
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
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectSetGetCornerAbnormal()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner with negative value for x-axis in OH_Drawing_Corner_Radii, followed by
    // OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {-DRAWING_NUMBER_10, DRAWING_NUMBER_10});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, -DRAWING_NUMBER_10), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, DRAWING_NUMBER_10), true);
    // 3. OH_Drawing_RoundRectSetCorner with negative value for y-axis in OH_Drawing_Corner_Radii, followed by
    // OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {DRAWING_NUMBER_10, -DRAWING_NUMBER_10});
    OH_Drawing_Corner_Radii radiiDRAWING_NUMBER_2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.x, DRAWING_NUMBER_10), true);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.y, -DRAWING_NUMBER_10), true);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectSetGetCornerMaximum()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. Call OH_Drawing_RoundRectSetCorner with the maximum value for the x-axis in OH_Drawing_Corner_Radii, followed
    // by OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {FLT_MAX, DRAWING_NUMBER_10});
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, FLT_MAX), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, DRAWING_NUMBER_10), true);
    // 3. Call OH_Drawing_RoundRectSetCorner with the maximum value for the y-axis in OH_Drawing_Corner_Radii, followed
    // by OH_Drawing_RoundRectGetCorner
    OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, {DRAWING_NUMBER_10, FLT_MAX});
    OH_Drawing_Corner_Radii radiiDRAWING_NUMBER_2 = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.x, DRAWING_NUMBER_10), true);
    EXPECT_EQ(IsScalarAlmostEqual(radiiDRAWING_NUMBER_2.y, FLT_MAX), true);
    // 4. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectSetGetCornerMultipleCalls()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 2. OH_Drawing_RoundRectSetCorner (pass random values for x-axis and y-axis radii, and a random enum value for
    // OH_Drawing_CornerPos), followed by calling OH_Drawing_RoundRectGetCorner
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    std::uniform_int_distribution<int> dis2(0, DRAWING_NUMBER_3);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectGetCornerWhenNoSet()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RoundRectGetCorner directly
    OH_Drawing_Corner_Radii radii = OH_Drawing_RoundRectGetCorner(roundRect, CORNER_POS_TOP_LEFT);
    EXPECT_EQ(IsScalarAlmostEqual(radii.x, DRAWING_NUMBER_20), true);
    EXPECT_EQ(IsScalarAlmostEqual(radii.y, DRAWING_NUMBER_20), true);
    // 3. Free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectDestroyNormal()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 2. OH_Drawing_RoundRectDestroy
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectDestroyNull()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. OH_Drawing_RoundRectDestroy with nullptr as the parameter
    OH_Drawing_RoundRect *roundRect = nullptr;
    OH_Drawing_RoundRectDestroy(nullptr);
    EXPECT_EQ(roundRect, nullptr);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectOffsetNormal()
{
    DrawingNativeRoundRectTestSetUp();
    //1. OH_Drawing_RoundRectCreate with the second parameter as integar values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //2. OH_Drawing_RoundRectCreate with the second parameter as floating-point values
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect1, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //3. OH_Drawing_RoundRectCreate with the first parameter as integar values
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect2, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    //4. OH_Drawing_RoundRectCreate with the first parameter as floating-point values
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0.f, 0.f, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect1, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect3, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
    OH_Drawing_RoundRectDestroy(roundRect3);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectOffsetNull()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. Call OH_Drawing_RoundRectOffset with nullptr as the first parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    EXPECT_EQ(OH_Drawing_RoundRectOffset(nullptr, DRAWING_NUMBER_1, DRAWING_NUMBER_1),
        OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Call OH_Drawing_RoundRectOffset with 0 as the second parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_RoundRectOffset(roundRect, 0, DRAWING_NUMBER_1), OH_DRAWING_SUCCESS);
    // 3. Call OH_Drawing_RoundRectOffset with 0 as the third parameter, check the error code using
    // OH_Drawing_ErrorCodeGet
    EXPECT_EQ(OH_Drawing_RoundRectOffset(roundRect, DRAWING_NUMBER_1, 0), OH_DRAWING_SUCCESS);
    //4. free memory
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectOffsetMultipleCalls()
{
    DrawingNativeRoundRectTestSetUp();
    //1. Call OH_Drawing_RoundRectCreate with random values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(roundRect, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    //2. free memory
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCopyNormal()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect1, nullptr);
    // 2. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect1, 0, 0);
    EXPECT_NE(roundRect1, nullptr);
    // 3. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect2 = OH_Drawing_RoundRectCopy(roundRect1);
    EXPECT_NE(roundRect2, nullptr);
    // 4. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect2, nullptr);
    // 5. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect3 = OH_Drawing_RoundRectCreate(rect2, DRAWING_NUMBER_20, DRAWING_NUMBER_20);
    EXPECT_NE(roundRect3, nullptr);
    // 6. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect4 = OH_Drawing_RoundRectCopy(roundRect3);
    EXPECT_NE(roundRect4, nullptr);
    // 7. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect3, nullptr);
    // 8. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect5 = OH_Drawing_RoundRectCreate(rect3, 0, 0);
    EXPECT_NE(roundRect5, nullptr);
    // 9. Set the upper left corner of the rectangle as a rounded corner.
    OH_Drawing_RoundRectSetCorner(roundRect5, OH_Drawing_CornerPos::CORNER_POS_TOP_LEFT, {DRAWING_NUMBER_20,
        DRAWING_NUMBER_20});
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
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCopyNull()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRoundRectCopyMultipleCalls()
{
    DrawingNativeRoundRectTestSetUp();
    // 1. Create a rect object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    // 2. Create a roundRect object by OH_Drawing_RoundRectCreate.
    OH_Drawing_RoundRect *roundRect1 = OH_Drawing_RoundRectCreate(rect, 0, 0);
    EXPECT_NE(roundRect1, nullptr);
    // 3. Copy a roundRect object by OH_Drawing_RoundRectCopy.
    OH_Drawing_RoundRect *roundRect2 = nullptr;
    // 4. The function OH_Drawing_RoundRectCopy is called 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        roundRect2 = OH_Drawing_RoundRectCopy(roundRect1);
        EXPECT_NE(roundRect2, nullptr);
    }
    // 5. free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect1);
    OH_Drawing_RoundRectDestroy(roundRect2);
    DrawingNativeRoundRectTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS