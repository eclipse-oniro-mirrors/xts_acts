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
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants for rectangle dimensions and test values
const float DEFAULT_RECT_LEFT = 0.0f;
const float DEFAULT_RECT_TOP = 0.0f;
const float DEFAULT_RECT_RIGHT = 100.0f;
const float DEFAULT_RECT_BOTTOM = 100.0f;

const float TEST_RECT_LEFT = 100.0f;
const float TEST_RECT_TOP = 200.0f;
const float TEST_RECT_RIGHT = 400.0f;
const float TEST_RECT_BOTTOM = 300.0f;

const float CONTAINS_RECT_LEFT = 100.0f;
const float CONTAINS_RECT_TOP = 100.0f;
const float CONTAINS_RECT_RIGHT = 500.0f;
const float CONTAINS_RECT_BOTTOM = 500.0f;

const float CONTAINED_RECT_LEFT = 200.0f;
const float CONTAINED_RECT_TOP = 200.0f;
const float CONTAINED_RECT_RIGHT = 300.0f;
const float CONTAINED_RECT_BOTTOM = 300.0f;

const float UNION_RECT_LEFT = 100.0f;
const float UNION_RECT_TOP = 100.0f;
const float UNION_RECT_RIGHT = 200.0f;
const float UNION_RECT_BOTTOM = 200.0f;

const float INSET_LEFT = 10.0f;
const float INSET_TOP = -20.0f;
const float INSET_RIGHT = 30.0f;
const float INSET_BOTTOM = -40.0f;

const float INSET_ABNORMAL_LEFT = 100.0f;
const float INSET_ABNORMAL_TOP = 0.0f;
const float INSET_ABNORMAL_RIGHT = 200.0f;
const float INSET_ABNORMAL_BOTTOM = 100.0f;

const float OFFSET_X = 100.0f;
const float OFFSET_Y = 100.0f;
const float OFFSET_STEP = 10.0f;

const int LOOP_COUNT = 10;
const int ABNORMAL_OFFSET_VALUE = 0x7F7FFFFF;
const float ABNORMAL_OFFSET_FLOAT = 2139095040.0f;
const float ABNORMAL_OFFSET_RIGHT = 2139095170.0f;

// Expected values after inset calls
const float INSET_CALLS_EXPECTED_LEFT = 200.0f;
const float INSET_CALLS_EXPECTED_RIGHT = 100.0f;
const float INSET_CALLS_EXPECTED_BOTTOM = 700.0f;

// Expected values after offset multiple calls
const float OFFSET_CALLS_EXPECTED_RIGHT = 110.0f;

// Expected values after offset to operations
const float OFFSET_TO_EXPECTED_RIGHT = 200.0f;
const float OFFSET_TO_EXPECTED_BOTTOM = 200.0f;

// Expected values after union operations
const float UNION_EXPECTED_RIGHT = 200.0f;
const float UNION_EXPECTED_BOTTOM = 200.0f;

// Union test rect values
const float UNION_TEST_RECT_OTHER_LEFT = 100.0f;
const float UNION_TEST_RECT_OTHER_TOP = 100.0f;
const float UNION_TEST_RECT_OTHER_RIGHT = 200.0f;
const float UNION_TEST_RECT_OTHER_BOTTOM = 200.0f;

// Common SetUp and TearDown functions implementation
void DrawingNativeRectPart2TestSetUp()
{
    std::cout << "DrawingNativeRectPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRectPart2TestTearDown()
{
    std::cout << "DrawingNativeRectPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRectPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRectInsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3900
 * @tc.desc   Test for testRectInsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectInsetNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_LEFT, TEST_RECT_TOP, TEST_RECT_RIGHT, TEST_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    float left = INSET_LEFT;
    float top = INSET_TOP;
    float right = INSET_RIGHT;
    float bottom = INSET_BOTTOM;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), TEST_RECT_LEFT + INSET_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), TEST_RECT_TOP + INSET_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), TEST_RECT_RIGHT - INSET_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), TEST_RECT_BOTTOM - INSET_BOTTOM);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4000
 * @tc.desc   Test for testRectInsetAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetAbNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_LEFT, TEST_RECT_TOP, TEST_RECT_RIGHT, TEST_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    float left = INSET_ABNORMAL_LEFT;
    float top = INSET_ABNORMAL_TOP;
    float right = INSET_ABNORMAL_RIGHT;
    float bottom = INSET_ABNORMAL_BOTTOM;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), TEST_RECT_LEFT + INSET_ABNORMAL_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), TEST_RECT_TOP + INSET_ABNORMAL_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), TEST_RECT_RIGHT - INSET_ABNORMAL_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), TEST_RECT_BOTTOM - INSET_ABNORMAL_BOTTOM);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4100
 * @tc.desc   Test for testRectInsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_LEFT, TEST_RECT_TOP, TEST_RECT_RIGHT, TEST_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    float left = INSET_ABNORMAL_LEFT;
    float top = INSET_ABNORMAL_TOP;
    float right = INSET_ABNORMAL_RIGHT;
    float bottom = INSET_ABNORMAL_BOTTOM;
    OH_Drawing_ErrorCode code = OH_Drawing_RectInset(nullptr, left, top, right, bottom);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), TEST_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), TEST_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), TEST_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), TEST_RECT_BOTTOM);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectInsetCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4200
 * @tc.desc   Test for testRectInsetCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectInsetCalls()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_LEFT, TEST_RECT_TOP, TEST_RECT_RIGHT, TEST_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    float left = INSET_LEFT;
    float top = INSET_TOP;
    float right = INSET_RIGHT;
    float bottom = INSET_BOTTOM;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectInset(rect, left, top, right, bottom);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), INSET_CALLS_EXPECTED_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), INSET_CALLS_EXPECTED_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), INSET_CALLS_EXPECTED_BOTTOM);
    // 2. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4300
 * @tc.desc   Test for testRectContainsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectContainsNormal()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(CONTAINS_RECT_LEFT, CONTAINS_RECT_TOP, CONTAINS_RECT_RIGHT, CONTAINS_RECT_BOTTOM);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(CONTAINED_RECT_LEFT, CONTAINED_RECT_TOP, CONTAINED_RECT_RIGHT, CONTAINED_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4400
 * @tc.desc   Test for testRectContainsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectContainsNull()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(CONTAINS_RECT_LEFT, CONTAINS_RECT_TOP, CONTAINS_RECT_RIGHT, CONTAINS_RECT_BOTTOM);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(CONTAINED_RECT_LEFT, CONTAINED_RECT_TOP, CONTAINED_RECT_RIGHT, CONTAINED_RECT_BOTTOM);
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
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectContainsCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4500
 * @tc.desc   Test for testRectContainsCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectContainsCalls()
{
    // 1. Call OH_Drawing_RectCreate to create a rectangle object
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(CONTAINS_RECT_LEFT, CONTAINS_RECT_TOP, CONTAINS_RECT_RIGHT, CONTAINS_RECT_BOTTOM);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(CONTAINED_RECT_LEFT, CONTAINED_RECT_TOP, CONTAINED_RECT_RIGHT, CONTAINED_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    EXPECT_NE(other, nullptr);
    bool isContains;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RectContains(rect, other, &isContains);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    // 3. Call OH_Drawing_RectDestroy to destroy the rectangle object
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4600
 * @tc.desc   Test for testRectSetEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSetEmptyNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4700
 * @tc.desc   Test for testRectSetEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetEmptyNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSetEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4800
 * @tc.desc   Test for testRectSetEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSetEmptyMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSetEmpty(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4900
 * @tc.desc   Test for testRectIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectIsEmptyNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
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
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5000
 * @tc.desc   Test for testRectIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIsEmptyNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RectIsEmpty(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5100
 * @tc.desc   Test for testRectIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectIsEmptyMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = true;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectIsEmpty(rect, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5200
 * @tc.desc   Test for testRectOffsetNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectOffsetNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, OFFSET_X, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT + OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP + OFFSET_Y);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT + OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM + OFFSET_Y);
    errorCode = OH_Drawing_RectOffset(rect, -OFFSET_X, -OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5300
 * @tc.desc   Test for testRectOffsetNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(nullptr, OFFSET_X, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    errorCode = OH_Drawing_RectOffset(rect, DEFAULT_RECT_LEFT, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP + OFFSET_Y);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM + OFFSET_Y);
    errorCode = OH_Drawing_RectOffset(rect, OFFSET_X, DEFAULT_RECT_TOP);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT + OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP + OFFSET_Y);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT + OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM + OFFSET_Y);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5400
 * @tc.desc   Test for testRectOffsetAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetAbnormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, ABNORMAL_OFFSET_VALUE, ABNORMAL_OFFSET_VALUE);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), ABNORMAL_OFFSET_FLOAT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), ABNORMAL_OFFSET_FLOAT);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), ABNORMAL_OFFSET_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), ABNORMAL_OFFSET_RIGHT);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5500
 * @tc.desc   Test for testRectOffsetMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    for (float i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffset(rect, OFFSET_STEP, OFFSET_STEP);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), OFFSET_STEP + i * OFFSET_STEP);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), OFFSET_STEP + i * OFFSET_STEP);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT + OFFSET_STEP + i * OFFSET_STEP);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM + OFFSET_STEP + i * OFFSET_STEP);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5600
 * @tc.desc   Test for testRectOffsetToNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectOffsetToNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, OFFSET_X, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), OFFSET_Y);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), OFFSET_TO_EXPECTED_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), OFFSET_TO_EXPECTED_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5700
 * @tc.desc   Test for testRectOffsetToNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(nullptr, OFFSET_X, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    errorCode = OH_Drawing_RectOffsetTo(rect, DEFAULT_RECT_LEFT, OFFSET_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), OFFSET_Y);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), OFFSET_TO_EXPECTED_BOTTOM);
    errorCode = OH_Drawing_RectOffsetTo(rect, OFFSET_X, DEFAULT_RECT_TOP);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), OFFSET_X);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), OFFSET_TO_EXPECTED_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5800
 * @tc.desc   Test for testRectOffsetToAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToAbnormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, ABNORMAL_OFFSET_VALUE, ABNORMAL_OFFSET_VALUE);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), ABNORMAL_OFFSET_FLOAT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), ABNORMAL_OFFSET_FLOAT);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), ABNORMAL_OFFSET_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), ABNORMAL_OFFSET_RIGHT);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectOffsetToMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5900
 * @tc.desc   Test for testRectOffsetToMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectOffsetToMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectOffsetTo(rect, OFFSET_X, OFFSET_Y);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), OFFSET_X);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), OFFSET_Y);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), OFFSET_TO_EXPECTED_RIGHT);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), OFFSET_TO_EXPECTED_BOTTOM);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6000
 * @tc.desc   Test for testRectSortNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectSortNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    rect = OH_Drawing_RectCreate(DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM, DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP);
    errorCode = OH_Drawing_RectSort(rect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6100
 * @tc.desc   Test for testRectSortNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSortNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectSortMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6200
 * @tc.desc   Test for testRectSortMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectSortMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectSort(rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), DEFAULT_RECT_RIGHT);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DEFAULT_RECT_BOTTOM);
    }
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6300
 * @tc.desc   Test for testRectUnionNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRectUnionNormal()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(UNION_RECT_LEFT, UNION_RECT_TOP, UNION_RECT_RIGHT, UNION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect), UNION_EXPECTED_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect), UNION_EXPECTED_BOTTOM);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6400
 * @tc.desc   Test for testRectUnionNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectUnionNull()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(UNION_RECT_LEFT, UNION_RECT_TOP, UNION_RECT_RIGHT, UNION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(nullptr, other);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RectUnion(rect, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRectUnionMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6500
 * @tc.desc   Test for testRectUnionMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRectUnionMultipleCalls()
{
    DrawingNativeRectPart2TestSetUp();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Rect* other =
        OH_Drawing_RectCreate(UNION_RECT_LEFT, UNION_RECT_TOP, UNION_RECT_RIGHT, UNION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RectUnion(rect, other);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DEFAULT_RECT_LEFT);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), DEFAULT_RECT_TOP);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), UNION_EXPECTED_RIGHT);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), UNION_EXPECTED_BOTTOM);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RectDestroy(other);
    DrawingNativeRectPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS