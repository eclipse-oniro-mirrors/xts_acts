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
class DrawingNativeRegionTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0100
 * @tc.name: testRegionCreateNormal
 * @tc.desc: test for testRegionCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionCreateNormal, TestSize.Level0) {
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
HWTEST_F(DrawingNativeRegionTest, testRegionCreateMoreTimes, TestSize.Level1) {
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
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNormal, TestSize.Level0) {
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
HWTEST_F(DrawingNativeRegionTest, testRegionDestroyNull, TestSize.Level1) {
    // 1. OH_Drawing_RegionDestroy takes nullptr as input
    OH_Drawing_RegionDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_REGION_0300
 * @tc.name: testRegionContainsInRange
 * @tc.desc: test for testRegionContainsInRange.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeRegionTest, testRegionContainsInRange, TestSize.Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject, the call is successful and the return value is
    // not nullptr
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value within the
    // range, the call is successful and the return value is true
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(regionObject, rect);
    bool ret = OH_Drawing_RegionContains(regionObject, 100, 100);
    EXPECT_TRUE(ret);

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
HWTEST_F(DrawingNativeRegionTest, testRegionContainsXvalueNotInRange, TestSize.Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, 300, 100);
    EXPECT_FALSE(ret);

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
HWTEST_F(DrawingNativeRegionTest, testRegionContainsYvalueNotInRange, TestSize.Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value not within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, 100, 300);
    EXPECT_FALSE(ret);

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
HWTEST_F(DrawingNativeRegionTest, testRegionContainsAllNotInRange, TestSize.Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value not within
    // the range
    bool ret = OH_Drawing_RegionContains(regionObject, 300, 300);
    EXPECT_FALSE(ret);

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
HWTEST_F(DrawingNativeRegionTest, testRegionContainsRegionNull, TestSize.Level1) {
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
HWTEST_F(DrawingNativeRegionTest, testRegionOpNormal, TestSize.Level0) {
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
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
        OH_Drawing_RegionOp(regionObject, dst, mode);
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
HWTEST_F(DrawingNativeRegionTest, testRegionOpRegionNull, TestSize.Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value dst
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionOpRegionDstNull, TestSize.Level1) {
    // 1. OH_Drawing_RegionCreate returns a pointer value region
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultTrue, TestSize.Level0) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRegionNull, TestSize.Level1) {
    // 1. OH_Drawing_RegionSetRect takes a correct rect object pointer as input, region is nullptr, returns
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectRectNull, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetRectResultFalse, TestSize.Level1) {
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);

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
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathResultTrue, TestSize.Level0) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
    OH_Drawing_RegionSetRect(clip, rect);
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 256.0f, 256.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);

    // 1. OH_Drawing_RegionSetPath takes correct region, path, and clip object pointers as input
    EXPECT_TRUE(OH_Drawing_RegionSetPath(region, path, clip));

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
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathRegionNull, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathPathNull, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathClipNull, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(150.0f, 180.0f, 200.0f, 200.0f);
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
HWTEST_F(DrawingNativeRegionTest, testRegionSetPathResultFalse, TestSize.Level1) {
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 0.0f, 0.0f);
    OH_Drawing_RegionSetRect(clip, rect);

    // 1. OH_Drawing_RegionSetPath takes correct region, path, and clip object pointers as input
    bool ret = OH_Drawing_RegionSetPath(region, path, clip);
    EXPECT_FALSE(ret);

    OH_Drawing_PathDestroy(path);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(clip);
    OH_Drawing_RectDestroy(rect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS