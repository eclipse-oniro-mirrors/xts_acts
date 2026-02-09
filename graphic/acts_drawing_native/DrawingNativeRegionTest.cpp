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

#include "gtest/gtest.h"

#include "drawing_error_code.h"
#include "drawing_path.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeRegionTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeRegionTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRegionTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeRegionTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeRegionTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testRegionCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0100
 * @tc.desc   test for testRegionCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCreateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionCreateMoreTimes
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0101
 * @tc.desc   test for testRegionCreateMoreTimes.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCreateMoreTimes, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 2. Create another region object using OH_Drawing_RegionCreate
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0200
 * @tc.desc   test for testRegionDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    // 2. OH_Drawing_RegionDestroy takes regionObject as input
    OH_Drawing_RegionDestroy(regionObject);
}

/**
 * @tc.name   testRegionDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0201
 * @tc.desc   test for testRegionDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionDestroy takes nullptr as input
    OH_Drawing_RegionDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testRegionContainsInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0300
 * @tc.desc   test for testRegionContainsInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsInRange, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject, the call is successful and the return value is
    // not nullptr
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value within the
    // range, the call is successful and the return value is true
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);
    bool ret = OH_Drawing_RegionContains(regionObject, 100, 100);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionContainsXvalueNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0301
 * @tc.desc   test for testRegionContainsXvalueNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsXvalueNotInRange, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, 300, 100);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionContainsYvalueNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0302
 * @tc.desc   test for testRegionContainsYvalueNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsYvalueNotInRange, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value not within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, 100, 300);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionContainsAllNotInRange
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0303
 * @tc.desc   test for testRegionContainsAllNotInRange.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsAllNotInRange, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value not within
    // the range
    bool ret = OH_Drawing_RegionContains(regionObject, 300, 300);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionContainsRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0304
 * @tc.desc   test for testRegionContainsRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsRegionNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionContains takes nullptr as input, x: a value within the range, y: a value within the range
    bool ret = OH_Drawing_RegionContains(nullptr, 100, 100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
}

/**
 * @tc.name   testRegionOpNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0400
 * @tc.desc   test for testRegionOpNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionOpNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);
    // 2. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
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
}

/**
 * @tc.name   testRegionOpRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0401
 * @tc.desc   test for testRegionOpRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionOpRegionNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region *src = OH_Drawing_RegionCreate();
    EXPECT_NE(src, nullptr);
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
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
}

/**
 * @tc.name   testRegionOpMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0402
 * @tc.desc   test for testRegionOpMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionOpMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_RegionCreate returns a pointer value region
    OH_Drawing_Region *src = OH_Drawing_RegionCreate();
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 200.0f);
    // add assert
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_RegionSetRect(src, rect1);
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(100.0f, 100.0f, 300.0f, 300.0f);
    // add assert
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(dst, rect2);
    // 2. OH_Drawing_RegionOp takes region as input, dst: nullptr, op: REGION_OP_MODE_DIFFERENCE
    for (int i = 0; i < 10; i++) {
        bool ret = OH_Drawing_RegionOp(src, dst, REGION_OP_MODE_INTERSECT);
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(src);
    OH_Drawing_RegionDestroy(dst);
}

/**
 * @tc.name   testRegionSetRectResultTrue
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0500
 * @tc.desc   test for testRegionSetRectResultTrue.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultTrue, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(ret, true);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionSetRectRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0501
 * @tc.desc   test for testRegionSetRectRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRegionNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionSetRect takes a correct rect object pointer as input, region is nullptr, returns
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    bool ret = OH_Drawing_RegionSetRect(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionSetRectRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0502
 * @tc.desc   test for testRegionSetRectRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRectNull, Function | SmallTest | Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 1. OH_Drawing_RegionSetRect takes a correct region object pointer as input, rect is nullptr
    bool ret = OH_Drawing_RegionSetRect(region, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionSetRectResultFalse
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0503
 * @tc.desc   test for testRegionSetRectResultFalse.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultFalse, Function | SmallTest | Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);
    // add assert
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(ret, false);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionSetPathResultTrue
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0600
 * @tc.desc   test for testRegionSetPathResultTrue.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathResultTrue, Function | SmallTest | Level0) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(clip, rect);
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 256.0f, 256.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);

    // 1. OH_Drawing_RegionSetPath takes correct region, path, and clip object pointers as input
    bool ret = OH_Drawing_RegionSetPath(region, path, clip);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/**
 * @tc.name   testRegionSetPathRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0601
 * @tc.desc   test for testRegionSetPathRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathRegionNull, Function | SmallTest | Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
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
}

/**
 * @tc.name   testRegionSetPathResultFalse
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0602
 * @tc.desc   test for testRegionSetPathResultFalse.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathResultFalse, Function | SmallTest | Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);
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
}

/**
 * @tc.name   testRegionCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0700
 * @tc.desc   test for testRegionCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCopyNormal, Function | SmallTest | Level0) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 200.0f);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0701
 * @tc.desc   test for testRegionCopyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCopyNull, Function | SmallTest | Level3) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 200.0f);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Copy a region object by OH_Drawing_RegionCopy.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCopy(nullptr);
    EXPECT_EQ(region2, nullptr);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionCopyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0702
 * @tc.desc   test for testRegionCopyAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCopyAbnormal, Function | SmallTest | Level3) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. The ordinate coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 0.0f);
    EXPECT_NE(rect1, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect1);
    // 4. Copy a region object by OH_Drawing_RegionCopy.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 5. The horizontal coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 200.0f);
    EXPECT_NE(rect2, nullptr);
    // 6. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect2);
    // 7. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 8. The coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect3 = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);
    EXPECT_NE(rect3, nullptr);
    // 9. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect3);
    // 10. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 11. The coordinates of the upper left corner are greater than those of the lower right corner.
    OH_Drawing_Rect *rect4 = OH_Drawing_RectCreate(400.0f, 400.0f, 200.0f, 200.0f);
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
}

/**
 * @tc.name   testRegionCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0703
 * @tc.desc   test for testRegionCopyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCopyMultipleCalls, Function | SmallTest | Level0) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 200.0f, 200.0f);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    // 5. The function OH_Drawing_RegionCopy is called 10 times.
    for (int i = 0; i < 10; i++) {
        region2 = OH_Drawing_RegionCopy(region1);
        EXPECT_NE(region2, nullptr);
    }
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0800
 * @tc.desc   test for testRegionEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionEmptyNormal, Function | SmallTest | Level0) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0801
 * @tc.desc   test for testRegionEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionEmptyNull, Function | SmallTest | Level3) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionEmptyCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0802
 * @tc.desc   test for testRegionEmptyCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionEmptyCalls, Function | SmallTest | Level3) {
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionGetBoundaryNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0900
 * @tc.desc   test for testRegionGetBoundaryNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundaryNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
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
    bool ret = OH_Drawing_PathContains(path, 300.01, 200.00);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, 200, 300.01);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, 299.99, 299.99);
    EXPECT_EQ(ret, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testRegionGetBoundaryNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0901
 * @tc.desc   test for testRegionGetBoundaryNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundaryNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
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
}

/**
 * @tc.name   testRegionGetBoundaryMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0902
 * @tc.desc   test for testRegionGetBoundaryMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundaryMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBoundaryPath(region, path);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool isEmpty = false;
        OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, true);
    }
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testRegionGetBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1000
 * @tc.desc   test for testRegionGetBoundsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundsNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region1, rect1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect1), 100);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect1), 100);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect1), 300);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect1), 300);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionGetBounds(region1, rect1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect1), 100);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect1), 100);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect1), 400);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect1), 400);
    
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionGetBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1001
 * @tc.desc   test for testRegionGetBoundsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundsNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(nullptr, rect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionGetBounds(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionGetBoundsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1002
 * @tc.desc   test for testRegionGetBoundsMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionGetBoundsMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region, rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), 100);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), 100);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), 300);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), 300);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionIsComplexNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1100
 * @tc.desc   test for testRegionIsComplexNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsComplexNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(200, 200, 400, 400);
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
}

/**
 * @tc.name   testRegionIsComplexNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1101
 * @tc.desc   test for testRegionIsComplexNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsComplexNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
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
}

/**
 * @tc.name   testRegionIsComplexMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1102
 * @tc.desc   test for testRegionIsComplexMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsComplexMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect1);
    OH_Drawing_RegionSetRect(region2, rect2);

    bool isComplex = false;
    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isComplex, true);
    }
    
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
}

/**
 * @tc.name   testRegionIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1200
 * @tc.desc   test for testRegionIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsEmptyNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, true);

    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1201
 * @tc.desc   test for testRegionIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsEmptyNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    errorCode = OH_Drawing_RegionIsEmpty(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1202
 * @tc.desc   test for testRegionIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsEmptyMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionIsRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1300
 * @tc.desc   test for testRegionIsRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsRectNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect1, nullptr);
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(200, 200, 400, 400);
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
}

/**
 * @tc.name   testRegionIsRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1301
 * @tc.desc   test for testRegionIsRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsRectNull, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(nullptr, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRect, false);
    errorCode = OH_Drawing_RegionIsRect(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRect, false);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionIsRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1302
 * @tc.desc   test for testRegionIsRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionIsRectMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isRect = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(region, &isRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRect, false);
    }
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1400
 * @tc.desc   test for testRegionQuickContainsNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickContainsNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 400, 400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 600, 600, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1401
 * @tc.desc   test for testRegionQuickContainsNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickContainsNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(nullptr, 200, 200, 400, 400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 0, 200, 400, 400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 200, 0, 400, 400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 0, 400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 400, 0, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 400, 400, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickContainsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1402
 * @tc.desc   test for testRegionQuickContainsAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickContainsAbnormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, -100, 100, 100, 100, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickContainsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1403
 * @tc.desc   test for testRegionQuickContainsMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickContainsMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 500, 500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, 200, 200, 400, 400, &isContains);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickRejectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1500
 * @tc.desc   test for testRegionQuickRejectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickRejectNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, 0, 0, 100, 100, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionQuickReject(region, 300, 300, 500, 500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, 500, 500, 700, 700, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickRejectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1501
 * @tc.desc   test for testRegionQuickRejectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickRejectNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(nullptr, 300, 300, 500, 500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, 0, 300, 500, 500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, 300, 0, 500, 500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, 300, 300, 0, 500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, 300, 300, 500, 0, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, 300, 300, 500, 0, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickRejectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1502
 * @tc.desc   test for testRegionQuickRejectAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickRejectAbnormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, -100, -100, 100, 100, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionQuickRejectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1503
 * @tc.desc   test for testRegionQuickRejectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionQuickRejectMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 200, 400, 400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, 500, 500, 700, 700, &isReject);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isReject, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1600
 * @tc.desc   test for testRegionTranslateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionTranslateNormal, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_RegionContains(region, 300, 300);
    EXPECT_EQ(ret, true);
    ret = OH_Drawing_RegionContains(region, 401, 401);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1601
 * @tc.desc   test for testRegionTranslateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionTranslateNull, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(nullptr, 100, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionTranslate(region, 0, 100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_RegionTranslate(region, 100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/**
 * @tc.name   testRegionTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_1602
 * @tc.desc   test for testRegionTranslateMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeRegionTest, testRegionTranslateMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 300, 300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, 100, 100);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS