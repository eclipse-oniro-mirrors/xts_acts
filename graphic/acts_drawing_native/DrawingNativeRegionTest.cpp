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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0100
 * @tc.name: testRegionCreateNormal
 * @tc.desc: test for testRegionCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCreateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_RegionDestroy(region);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0101
 * @tc.name: testRegionCreateMoreTimes
 * @tc.desc: test for testRegionCreateMoreTimes.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0200
 * @tc.name: testRegionDestroyNormal
 * @tc.desc: test for testRegionDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    // 2. OH_Drawing_RegionDestroy takes regionObject as input
    OH_Drawing_RegionDestroy(regionObject);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0201
 * @tc.name: testRegionDestroyNull
 * @tc.desc: test for testRegionDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionDestroy takes nullptr as input
    OH_Drawing_RegionDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0300
 * @tc.name: testRegionContainsInRange
 * @tc.desc: test for testRegionContainsInRange.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
    EXPECT_TRUE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0301
 * @tc.name: testRegionContainsXvalueNotInRange
 * @tc.desc: test for testRegionContainsXvalueNotInRange.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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
    EXPECT_FALSE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0302
 * @tc.name: testRegionContainsYvalueNotInRange
 * @tc.desc: test for testRegionContainsYvalueNotInRange.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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
    EXPECT_FALSE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0303
 * @tc.name: testRegionContainsAllNotInRange
 * @tc.desc: test for testRegionContainsAllNotInRange.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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
    EXPECT_FALSE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0304
 * @tc.name: testRegionContainsRegionNull
 * @tc.desc: test for testRegionContainsRegionNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsRegionNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionContains takes nullptr as input, x: a value within the range, y: a value within the range
    OH_Drawing_RegionContains(nullptr, 100, 100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0400
 * @tc.name: testRegionOpNormal
 * @tc.desc: test for testRegionOpNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0401
 * @tc.name: testRegionOpRegionNull
 * @tc.desc: test for testRegionOpRegionNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionOpRegionNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(dst, rect);
    // 2. OH_Drawing_RegionOp takes nullptr as input for region, dst as input, and op: REGION_OP_MODE_DIFFERENCE,
    // returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_RegionOp(nullptr, dst, REGION_OP_MODE_DIFFERENCE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0402
 * @tc.name: testRegionOpRegionDstNull
 * @tc.desc: test for testRegionOpRegionDstNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionOpRegionDstNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value region
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    // 2. OH_Drawing_RegionOp takes region as input, dst: nullptr, op: REGION_OP_MODE_DIFFERENCE
    OH_Drawing_RegionOp(region, nullptr, REGION_OP_MODE_DIFFERENCE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0500
 * @tc.name: testRegionSetRectResultTrue
 * @tc.desc: test for testRegionSetRectResultTrue.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultTrue, Function | SmallTest | Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_TRUE(ret);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0501
 * @tc.name: testRegionSetRectRegionNull
 * @tc.desc: test for testRegionSetRectRegionNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRegionNull, Function | SmallTest | Level1) {
    // 1. OH_Drawing_RegionSetRect takes a correct rect object pointer as input, region is nullptr, returns
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0502
 * @tc.name: testRegionSetRectRectNull
 * @tc.desc: test for testRegionSetRectRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRectNull, Function | SmallTest | Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 1. OH_Drawing_RegionSetRect takes a correct region object pointer as input, rect is nullptr
    OH_Drawing_RegionSetRect(region, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_RegionDestroy(region);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0503
 * @tc.name: testRegionSetRectResultFalse
 * @tc.desc: test for testRegionSetRectResultFalse.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultFalse, Function | SmallTest | Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);
    // add assert
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_RegionSetRect takes correct region and rect object pointers as input
    bool ret = OH_Drawing_RegionSetRect(region, rect);
    EXPECT_FALSE(ret);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0600
 * @tc.name: testRegionSetPathResultTrue
 * @tc.desc: test for testRegionSetPathResultTrue.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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
    EXPECT_TRUE(OH_Drawing_RegionSetPath(region, path, clip));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0601
 * @tc.name: testRegionSetPathRegionNull
 * @tc.desc: test for testRegionSetPathRegionNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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
    OH_Drawing_RegionSetPath(nullptr, path, clip);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0602
 * @tc.name: testRegionSetPathPathNull
 * @tc.desc: test for testRegionSetPathPathNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathPathNull, Function | SmallTest | Level1) {
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

    // 1. OH_Drawing_RegionSetPath takes correct region and clip object pointers as input, path is nullptr
    OH_Drawing_RegionSetPath(region, nullptr, clip);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0603
 * @tc.name: testRegionSetPathClipNull
 * @tc.desc: test for testRegionSetPathClipNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathClipNull, Function | SmallTest | Level1) {
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

    // 1. OH_Drawing_RegionSetPath takes correct region, path object pointers as input, and clip is nullptr
    OH_Drawing_RegionSetPath(region, path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0604
 * @tc.name: testRegionSetPathResultFalse
 * @tc.desc: test for testRegionSetPathResultFalse.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
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
    EXPECT_FALSE(ret);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0700
 * @tc.name: testRegionCopyNormal
 * @tc.desc: test for testRegionCopyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0701
 * @tc.name: testRegionCopyNull
 * @tc.desc: test for testRegionCopyNull
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0702
 * @tc.name: testRegionCopyAbnormal
 * @tc.desc: test for testRegionCopyAbnormal
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0703
 * @tc.name: testRegionCopyMultipleCalls
 * @tc.desc: test for testRegionCopyMultipleCalls
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
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
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS