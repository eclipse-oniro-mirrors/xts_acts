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
const float REGION_RECT_LEFT = 0.0f;
const float REGION_RECT_TOP = 0.0f;
const float REGION_RECT_RIGHT = 256.0f;
const float REGION_RECT_BOTTOM = 256.0f;

const float SMALL_REGION_RECT_LEFT = 0.0f;
const float SMALL_REGION_RECT_TOP = 0.0f;
const float SMALL_REGION_RECT_RIGHT = 200.0f;
const float SMALL_REGION_RECT_BOTTOM = 200.0f;

const float EMPTY_REGION_RECT_LEFT = 0.0f;
const float EMPTY_REGION_RECT_TOP = 0.0f;
const float EMPTY_REGION_RECT_RIGHT = 0.0f;
const float EMPTY_REGION_RECT_BOTTOM = 0.0f;

const float REGION_OP_RECT1_LEFT = 0.0f;
const float REGION_OP_RECT1_TOP = 0.0f;
const float REGION_OP_RECT1_RIGHT = 200.0f;
const float REGION_OP_RECT1_BOTTOM = 200.0f;

const float REGION_OP_RECT2_LEFT = 100.0f;
const float REGION_OP_RECT2_TOP = 100.0f;
const float REGION_OP_RECT2_RIGHT = 300.0f;
const float REGION_OP_RECT2_BOTTOM = 300.0f;

const float PATH_CLIP_RECT_LEFT = 150.0f;
const float PATH_CLIP_RECT_TOP = 180.0f;
const float PATH_CLIP_RECT_RIGHT = 200.0f;
const float PATH_CLIP_RECT_BOTTOM = 200.0f;

const float PATH_RECT_LEFT = 100.0f;
const float PATH_RECT_TOP = 100.0f;
const float PATH_RECT_RIGHT = 256.0f;
const float PATH_RECT_BOTTOM = 256.0f;

const float ABNORMAL_RECT_LEFT = 400.0f;
const float ABNORMAL_RECT_TOP = 400.0f;
const float ABNORMAL_RECT_RIGHT = 200.0f;
const float ABNORMAL_RECT_BOTTOM = 200.0f;

const int POINT_IN_RANGE_X = 100;
const int POINT_IN_RANGE_Y = 100;
const int POINT_OUT_RANGE_X = 300;
const int POINT_OUT_RANGE_Y = 300;

const int LOOP_COUNT = 10;

// Common SetUp and TearDown functions implementation
void DrawingNativeRegionTestSetUp()
{
    std::cout << "DrawingNativeRegionTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRegionTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeRegionTestTearDown()
{
    std::cout << "DrawingNativeRegionTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeRegionTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testRegionCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0100
 * @tc.desc   test for testRegionCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionCreateNormal()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionCreateMoreTimes
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0200
 * @tc.desc   test for testRegionCreateMoreTimes.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionCreateMoreTimes()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 2. Create another region object using OH_Drawing_RegionCreate
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0300
 * @tc.desc   test for testRegionDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionDestroyNormal()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    // 2. OH_Drawing_RegionDestroy takes regionObject as input
    OH_Drawing_RegionDestroy(regionObject);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0400
 * @tc.desc   test for testRegionDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionDestroyNull()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionDestroy takes nullptr as input
    OH_Drawing_RegionDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionContainsInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0500
 * @tc.desc   test for testRegionContainsInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionContainsInRange()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject, the call is successful and the return value is
    // not nullptr
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value within the
    // range, the call is successful and the return value is true
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);
    bool ret = OH_Drawing_RegionContains(regionObject, POINT_IN_RANGE_X, POINT_IN_RANGE_Y);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionContainsXvalueNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0600
 * @tc.desc   test for testRegionContainsXvalueNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionContainsXvalueNotInRange()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, POINT_OUT_RANGE_X, POINT_IN_RANGE_Y);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionContainsYvalueNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0700
 * @tc.desc   test for testRegionContainsYvalueNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionContainsYvalueNotInRange()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value not within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, POINT_IN_RANGE_X, POINT_OUT_RANGE_Y);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionContainsAllNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0800
 * @tc.desc   test for testRegionContainsAllNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionContainsAllNotInRange()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value not within
    // the range
    bool ret = OH_Drawing_RegionContains(regionObject, POINT_OUT_RANGE_X, POINT_OUT_RANGE_Y);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionContainsRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0900
 * @tc.desc   test for testRegionContainsRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionContainsRegionNull()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionContains takes nullptr as input, x: a value within the range, y: a value within the range
    bool ret = OH_Drawing_RegionContains(nullptr, POINT_IN_RANGE_X, POINT_IN_RANGE_Y);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionOpNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1000
 * @tc.desc   test for testRegionOpNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionOpNormal()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region* regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);
    // 2. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region* dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_RegionSetRect(dst, rect);
    // 3. OH_Drawing_RegionOp takes regionObject, dst, and op: perform OH_Drawing_RegionOpMode operations in sequence
    OH_Drawing_RegionOpMode modes[] = {
        REGION_OP_MODE_DIFFERENCE, REGION_OP_MODE_INTERSECT,          REGION_OP_MODE_UNION,
        REGION_OP_MODE_XOR,        REGION_OP_MODE_REVERSE_DIFFERENCE, REGION_OP_MODE_REPLACE,
    };
    for (OH_Drawing_RegionOpMode mode : modes) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_RegionOp(regionObject, dst, mode);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(dst);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionOpRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1100
 * @tc.desc   test for testRegionOpRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionOpRegionNull()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region* src = OH_Drawing_RegionCreate();
    EXPECT_NE(src, nullptr);
    OH_Drawing_Region* dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    // 2. OH_Drawing_RegionOp takes nullptr as input for region, dst as input, and op: REGION_OP_MODE_DIFFERENCE,
    bool ret = OH_Drawing_RegionOp(nullptr, dst, REGION_OP_MODE_DIFFERENCE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_RegionOp(src, nullptr, REGION_OP_MODE_DIFFERENCE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RegionDestroy(src);
    OH_Drawing_RegionDestroy(dst);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionOpMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1200
 * @tc.desc   test for testRegionOpMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionOpMultipleCalls()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionCreate returns a pointer value region
    OH_Drawing_Region* src = OH_Drawing_RegionCreate();
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(
        SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, SMALL_REGION_RECT_RIGHT, SMALL_REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_RegionSetRect(src, rect1);
    OH_Drawing_Region* dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(REGION_OP_RECT2_LEFT, REGION_OP_RECT2_TOP, REGION_OP_RECT2_RIGHT, REGION_OP_RECT2_BOTTOM);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(dst, rect2);
    // 2. OH_Drawing_RegionOp takes region as input, dst: nullptr, op: REGION_OP_MODE_DIFFERENCE
    for (int i = 0; i < LOOP_COUNT; i++) {
        bool ret = OH_Drawing_RegionOp(src, dst, REGION_OP_MODE_INTERSECT);
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(src);
    OH_Drawing_RegionDestroy(dst);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetRectResultTrue
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1300
 * @tc.desc   test for testRegionSetRectResultTrue.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionSetRectResultTrue()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(ret, true);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetRectRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1400
 * @tc.desc   test for testRegionSetRectRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionSetRectRegionNull()
{
    DrawingNativeRegionTestSetUp();

    // 1. OH_Drawing_RegionSetRect takes a correct rect object pointer as input, region is nullptr, returns
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(REGION_RECT_LEFT, REGION_RECT_TOP, REGION_RECT_RIGHT, REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    bool ret = OH_Drawing_RegionSetRect(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetRectRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1500
 * @tc.desc   test for testRegionSetRectRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionSetRectRectNull()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 1. OH_Drawing_RegionSetRect takes a correct region object pointer as input, rect is nullptr
    bool ret = OH_Drawing_RegionSetRect(region, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetRectResultFalse
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1600
 * @tc.desc   test for testRegionSetRectResultFalse.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionSetRectResultFalse()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        EMPTY_REGION_RECT_LEFT, EMPTY_REGION_RECT_TOP, EMPTY_REGION_RECT_RIGHT, EMPTY_REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(ret, false);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetPathResultTrue
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1700
 * @tc.desc   test for testRegionSetPathResultTrue.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionSetPathResultTrue()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region* clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(PATH_CLIP_RECT_LEFT, PATH_CLIP_RECT_TOP, PATH_CLIP_RECT_RIGHT, PATH_CLIP_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(clip, rect);
    OH_Drawing_PathAddRect(path,
                           PATH_RECT_LEFT,
                           PATH_RECT_TOP,
                           PATH_RECT_RIGHT,
                           PATH_RECT_BOTTOM,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);

    // 1. OH_Drawing_RegionSetPath takes correct region, path, and clip object pointers as input
    bool ret = OH_Drawing_RegionSetPath(region, path, clip);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetPathRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1800
 * @tc.desc   test for testRegionSetPathRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionSetPathRegionNull()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region* clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(PATH_CLIP_RECT_LEFT, PATH_CLIP_RECT_TOP, PATH_CLIP_RECT_RIGHT, PATH_CLIP_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(clip, rect);

    // 1. OH_Drawing_RegionSetPath takes correct path and clip object pointers as input, region is nullptr
    bool ret = OH_Drawing_RegionSetPath(nullptr, path, clip);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);

    ret = OH_Drawing_RegionSetPath(region, nullptr, clip);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);

    ret = OH_Drawing_RegionSetPath(region, path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionSetPathResultFalse
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1900
 * @tc.desc   test for testRegionSetPathResultFalse.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestRegionSetPathResultFalse()
{
    DrawingNativeRegionTestSetUp();

    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region* clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        EMPTY_REGION_RECT_LEFT, EMPTY_REGION_RECT_TOP, EMPTY_REGION_RECT_RIGHT, EMPTY_REGION_RECT_BOTTOM);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(clip, rect);

    // 1. OH_Drawing_RegionSetPath takes correct region, path, and clip object pointers as input
    bool ret = OH_Drawing_RegionSetPath(region, path, clip);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2000
 * @tc.desc   test for testRegionCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionCopyNormal()
{
    DrawingNativeRegionTestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, SMALL_REGION_RECT_RIGHT, SMALL_REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2100
 * @tc.desc   test for testRegionCopyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionCopyNull()
{
    DrawingNativeRegionTestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, SMALL_REGION_RECT_RIGHT, SMALL_REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Copy a region object by OH_Drawing_RegionCopy.
    OH_Drawing_Region* region2 = OH_Drawing_RegionCopy(nullptr);
    EXPECT_EQ(region2, nullptr);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionCopyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2200
 * @tc.desc   test for testRegionCopyAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestRegionCopyAbnormal()
{
    DrawingNativeRegionTestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. The ordinate coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, SMALL_REGION_RECT_RIGHT, 0.0f);
    EXPECT_NE(rect1, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect1);
    // 4. Copy a region object by OH_Drawing_RegionCopy.
    OH_Drawing_Region* region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 5. The horizontal coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, 0.0f, SMALL_REGION_RECT_BOTTOM);
    EXPECT_NE(rect2, nullptr);
    // 6. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect2);
    // 7. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 8. The coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(
        EMPTY_REGION_RECT_LEFT, EMPTY_REGION_RECT_TOP, EMPTY_REGION_RECT_RIGHT, EMPTY_REGION_RECT_BOTTOM);
    EXPECT_NE(rect3, nullptr);
    // 9. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect3);
    // 10. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 11. The coordinates of the upper left corner are greater than those of the lower right corner.
    OH_Drawing_Rect* rect4 =
        OH_Drawing_RectCreate(ABNORMAL_RECT_LEFT, ABNORMAL_RECT_TOP, ABNORMAL_RECT_RIGHT, ABNORMAL_RECT_BOTTOM);
    EXPECT_NE(rect4, nullptr);
    // 12. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect4);
    // 13. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 14. Free memory.
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_RectDestroy(rect4);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testRegionCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2300
 * @tc.desc   test for testRegionCopyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestRegionCopyMultipleCalls()
{
    DrawingNativeRegionTestSetUp();

    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(
        SMALL_REGION_RECT_LEFT, SMALL_REGION_RECT_TOP, SMALL_REGION_RECT_RIGHT, SMALL_REGION_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region* region2 = OH_Drawing_RegionCreate();
    // 5. The function OH_Drawing_RegionCopy is called 10 times.
    for (int i = 0; i < LOOP_COUNT; i++) {
        region2 = OH_Drawing_RegionCopy(region1);
        EXPECT_NE(region2, nullptr);
    }
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);

    DrawingNativeRegionTestTearDown();

    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS