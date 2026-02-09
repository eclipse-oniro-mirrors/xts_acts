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

#include "include/DrawingNativeRegionTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants definitions
const float REGION_RECT_LEFT = 100.0f;
const float REGION_RECT_TOP = 100.0f;
const float REGION_RECT_RIGHT = 300.0f;
const float REGION_RECT_BOTTOM = 300.0f;

const float REGION_RECT_LARGE_LEFT = 100.0f;
const float REGION_RECT_LARGE_TOP = 100.0f;
const float REGION_RECT_LARGE_RIGHT = 500.0f;
const float REGION_RECT_LARGE_BOTTOM = 500.0f;

const float REGION_RECT_QUICK_REJECT_LEFT = 200.0f;
const float REGION_RECT_QUICK_REJECT_TOP = 200.0f;
const float REGION_RECT_QUICK_REJECT_RIGHT = 400.0f;
const float REGION_RECT_QUICK_REJECT_BOTTOM = 400.0f;

const float REGION_RECT_UNION_LEFT = 200.0f;
const float REGION_RECT_UNION_TOP = 200.0f;
const float REGION_RECT_UNION_RIGHT = 400.0f;
const float REGION_RECT_UNION_BOTTOM = 400.0f;

const int LOOP_COUNT = 10;

const float POINT_INSIDE_X = 200.0f;
const float POINT_INSIDE_Y = 200.0f;
const float POINT_OUTSIDE_X = 401.0f;
const float POINT_OUTSIDE_Y = 401.0f;

const float RECT_INSIDE_LEFT = 200.0f;
const float RECT_INSIDE_TOP = 200.0f;
const float RECT_INSIDE_RIGHT = 400.0f;
const float RECT_INSIDE_BOTTOM = 400.0f;

const float RECT_OUTSIDE_LEFT = 200.0f;
const float RECT_OUTSIDE_TOP = 200.0f;
const float RECT_OUTSIDE_RIGHT = 600.0f;
const float RECT_OUTSIDE_BOTTOM = 600.0f;

const int TRANSLATE_X = 100;
const int TRANSLATE_Y = 100;

const float TEST_POINT_1_X = 300.01f;
const float TEST_POINT_1_Y = 200.00f;
const float TEST_POINT_2_X = 200.0f;
const float TEST_POINT_2_Y = 300.01f;
const float TEST_POINT_3_X = 299.99f;
const float TEST_POINT_3_Y = 299.99f;

const int ABNORMAL_VALUE = 0x7FFFFFFF;
const int NEGATIVE_VALUE = -100;

const float ZERO_VALUE = 0.0f;
const float REGION_RECT_QUICK_REJECT_TEST_LEFT = 500.0f;
const float REGION_RECT_QUICK_REJECT_TEST_TOP = 500.0f;
const float REGION_RECT_QUICK_REJECT_TEST_RIGHT = 700.0f;
const float REGION_RECT_QUICK_REJECT_TEST_BOTTOM = 700.0f;

// Common SetUp and TearDown functions implementation
void DrawingNativeRegionPart2TestSetUp()
{
    std::cout << "DrawingNativeRegionPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRegionPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRegionPart2TestTearDown()
{
    std::cout << "DrawingNativeRegionPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRegionPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRegionEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2400
 * @tc.desc   test for testRegionEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionEmptyNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2500
 * @tc.desc   test for testRegionEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionEmptyNull()
{
    DrawingNativeRegionPart2TestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionEmptyCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2600
 * @tc.desc   test for testRegionEmptyCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionEmptyCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundaryNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2700
 * @tc.desc   test for testRegionGetBoundaryNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionGetBoundaryNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBoundaryPath(region, path);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool isEmpty = false;
    OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, true);

    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionGetBoundaryPath(region, path);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    bool ret = OH_Drawing_PathContains(path, TEST_POINT_1_X, TEST_POINT_1_Y);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, TEST_POINT_2_X, TEST_POINT_2_Y);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, TEST_POINT_3_X, TEST_POINT_3_Y);
    EXPECT_EQ(ret, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundaryNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2800
 * @tc.desc   test for testRegionGetBoundaryNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionGetBoundaryNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBoundaryPath(nullptr, path);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool isEmpty = false;
    OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, true);

    errorCode = OH_Drawing_RegionGetBoundaryPath(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, true);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundaryMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2900
 * @tc.desc   test for testRegionGetBoundaryMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionGetBoundaryMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBoundaryPath(region, path);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool isEmpty = false;
        OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, true);
    }
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3000
 * @tc.desc   test for testRegionGetBoundsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionGetBoundsNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(
        REGION_RECT_UNION_LEFT, REGION_RECT_UNION_TOP, REGION_RECT_UNION_RIGHT, REGION_RECT_UNION_BOTTOM);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region1, rect1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect1), REGION_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect1), REGION_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect1), REGION_RECT_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect1), REGION_RECT_BOTTOM);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionGetBounds(region1, rect1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect1), REGION_RECT_LEFT);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect1), REGION_RECT_TOP);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect1), REGION_RECT_UNION_RIGHT);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect1), REGION_RECT_UNION_BOTTOM);

    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3100
 * @tc.desc   test for testRegionGetBoundsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionGetBoundsNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(nullptr, rect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionGetBounds(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionGetBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3200
 * @tc.desc   test for testRegionGetBoundsMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionGetBoundsMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region, rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), REGION_RECT_LEFT);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), REGION_RECT_TOP);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), REGION_RECT_RIGHT);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), REGION_RECT_BOTTOM);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsComplexNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3300
 * @tc.desc   test for testRegionIsComplexNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionIsComplexNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(
        REGION_RECT_UNION_LEFT, REGION_RECT_UNION_TOP, REGION_RECT_UNION_RIGHT, REGION_RECT_UNION_BOTTOM);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    bool isComplex = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isComplex, false);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isComplex, true);

    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsComplexNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3400
 * @tc.desc   test for testRegionIsComplexNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionIsComplexNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isComplex = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(nullptr, &isComplex);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isComplex, false);
    errorCode = OH_Drawing_RegionIsComplex(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isComplex, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsComplexMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3500
 * @tc.desc   test for testRegionIsComplexMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionIsComplexMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(
        REGION_RECT_UNION_LEFT, REGION_RECT_UNION_TOP, REGION_RECT_UNION_RIGHT, REGION_RECT_UNION_BOTTOM);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    bool isComplex = false;
    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isComplex, true);
    }

    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3600
 * @tc.desc   test for testRegionIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionIsEmptyNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, true);

    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3700
 * @tc.desc   test for testRegionIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionIsEmptyNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RegionIsEmpty(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3800
 * @tc.desc   test for testRegionIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionIsEmptyMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3900
 * @tc.desc   test for testRegionIsRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionIsRectNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(
        REGION_RECT_UNION_LEFT, REGION_RECT_UNION_TOP, REGION_RECT_UNION_RIGHT, REGION_RECT_UNION_BOTTOM);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    bool isRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(region1, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRect, true);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionIsRect(region1, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRect, false);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4000
 * @tc.desc   test for testRegionIsRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionIsRectNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(nullptr, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRect, false);
    errorCode = OH_Drawing_RegionIsRect(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRect, false);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionIsRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4100
 * @tc.desc   test for testRegionIsRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionIsRectMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isRect = false;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(region, &isRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRect, false);
    }
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4200
 * @tc.desc   test for testRegionQuickContainsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionQuickContainsNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        REGION_RECT_LARGE_LEFT, REGION_RECT_LARGE_TOP, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_OUTSIDE_LEFT, RECT_OUTSIDE_TOP, RECT_OUTSIDE_RIGHT, RECT_OUTSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4300
 * @tc.desc   test for testRegionQuickContainsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionQuickContainsNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        REGION_RECT_LARGE_LEFT, REGION_RECT_LARGE_TOP, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(
        nullptr, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, ZERO_VALUE, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_INSIDE_LEFT, ZERO_VALUE, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, ZERO_VALUE, RECT_INSIDE_BOTTOM, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, ZERO_VALUE, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickContainsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4400
 * @tc.desc   test for testRegionQuickContainsAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionQuickContainsAbnormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        REGION_RECT_LARGE_LEFT, REGION_RECT_LARGE_TOP, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(
        region, NEGATIVE_VALUE, REGION_RECT_TOP, REGION_RECT_LEFT, REGION_RECT_TOP, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(
        region, ABNORMAL_VALUE, ABNORMAL_VALUE, ABNORMAL_VALUE, ABNORMAL_VALUE, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickContainsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4500
 * @tc.desc   test for testRegionQuickContainsMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionQuickContainsMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        REGION_RECT_LARGE_LEFT, REGION_RECT_LARGE_TOP, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(
            region, RECT_INSIDE_LEFT, RECT_INSIDE_TOP, RECT_INSIDE_RIGHT, RECT_INSIDE_BOTTOM, &isContains);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickRejectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4600
 * @tc.desc   test for testRegionQuickRejectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionQuickRejectNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_RegionQuickReject(region, 0, 0, REGION_RECT_LEFT, REGION_RECT_TOP, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(REGION_RECT_QUICK_REJECT_LEFT,
                                                  REGION_RECT_QUICK_REJECT_TOP,
                                                  REGION_RECT_QUICK_REJECT_RIGHT,
                                                  REGION_RECT_QUICK_REJECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionQuickReject(
        region, REGION_RECT_RIGHT, REGION_RECT_BOTTOM, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region,
                                             REGION_RECT_LARGE_RIGHT,
                                             REGION_RECT_LARGE_BOTTOM,
                                             REGION_RECT_QUICK_REJECT_TEST_RIGHT,
                                             REGION_RECT_QUICK_REJECT_TEST_BOTTOM,
                                             &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickRejectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4700
 * @tc.desc   test for testRegionQuickRejectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionQuickRejectNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(REGION_RECT_QUICK_REJECT_LEFT,
                                                  REGION_RECT_QUICK_REJECT_TOP,
                                                  REGION_RECT_QUICK_REJECT_RIGHT,
                                                  REGION_RECT_QUICK_REJECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(
        nullptr, REGION_RECT_RIGHT, REGION_RECT_BOTTOM, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(
        region, ZERO_VALUE, REGION_RECT_BOTTOM, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(
        region, REGION_RECT_RIGHT, ZERO_VALUE, REGION_RECT_LARGE_RIGHT, REGION_RECT_LARGE_BOTTOM, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(
        region, REGION_RECT_RIGHT, REGION_RECT_BOTTOM, ZERO_VALUE, REGION_RECT_LARGE_BOTTOM, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(
        region, REGION_RECT_RIGHT, REGION_RECT_BOTTOM, REGION_RECT_LARGE_RIGHT, ZERO_VALUE, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(
        region, REGION_RECT_RIGHT, REGION_RECT_BOTTOM, REGION_RECT_LARGE_RIGHT, ZERO_VALUE, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickRejectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4800
 * @tc.desc   test for testRegionQuickRejectAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionQuickRejectAbnormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(REGION_RECT_QUICK_REJECT_LEFT,
                                                  REGION_RECT_QUICK_REJECT_TOP,
                                                  REGION_RECT_QUICK_REJECT_RIGHT,
                                                  REGION_RECT_QUICK_REJECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(
        region, NEGATIVE_VALUE, NEGATIVE_VALUE, REGION_RECT_LEFT, REGION_RECT_TOP, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode =
        OH_Drawing_RegionQuickReject(region, ABNORMAL_VALUE, ABNORMAL_VALUE, ABNORMAL_VALUE, ABNORMAL_VALUE, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionQuickRejectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4900
 * @tc.desc   test for testRegionQuickRejectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionQuickRejectMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(REGION_RECT_QUICK_REJECT_LEFT,
                                                  REGION_RECT_QUICK_REJECT_TOP,
                                                  REGION_RECT_QUICK_REJECT_RIGHT,
                                                  REGION_RECT_QUICK_REJECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region,
                                                                      REGION_RECT_QUICK_REJECT_TEST_LEFT,
                                                                      REGION_RECT_QUICK_REJECT_TEST_TOP,
                                                                      REGION_RECT_QUICK_REJECT_TEST_RIGHT,
                                                                      REGION_RECT_QUICK_REJECT_TEST_BOTTOM,
                                                                      &isReject);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isReject, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5000
 * @tc.desc   test for testRegionTranslateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionTranslateNormal()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, TRANSLATE_X, TRANSLATE_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_RegionContains(region, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_EQ(ret, true);
    ret = OH_Drawing_RegionContains(region, POINT_OUTSIDE_X, POINT_OUTSIDE_Y);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5100
 * @tc.desc   test for testRegionTranslateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionTranslateNull()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(nullptr, TRANSLATE_X, TRANSLATE_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionTranslate(region, ZERO_VALUE, TRANSLATE_Y);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_RegionTranslate(region, TRANSLATE_X, ZERO_VALUE);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5200
 * @tc.desc   test for testRegionTranslateMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionTranslateMultipleCalls()
{
    DrawingNativeRegionPart2TestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, TRANSLATE_X, TRANSLATE_Y);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionPart2TestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS