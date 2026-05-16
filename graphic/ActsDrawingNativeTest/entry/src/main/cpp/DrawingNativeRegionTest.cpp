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

#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_150 150
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_299 299
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_401 401
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_600 600
#define DRAWING_NUMBER_700 700
#define DRAWING_NUMBER_0X7FFFFFFF 0x7FFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestRegionCreateNormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionCreateMoreTimes()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 2. Create another region object using OH_Drawing_RegionCreate
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionDestroyNormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    // 2. OH_Drawing_RegionDestroy takes regionObject as input
    OH_Drawing_RegionDestroy(regionObject);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionDestroyNull()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionDestroy takes nullptr as input
    OH_Drawing_Region *region = nullptr;
    OH_Drawing_RegionDestroy(nullptr);
    EXPECT_EQ(region, nullptr);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionContainsInRange()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject, the call is successful and the return value is
    // not nullptr
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value within the
    // range, the call is successful and the return value is true
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);
    bool ret = OH_Drawing_RegionContains(regionObject, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionContainsXvalueNotInRange()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, DRAWING_NUMBER_300, DRAWING_NUMBER_100);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionContainsYvalueNotInRange()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value within the range, y: a value not within the
    // range
    bool ret = OH_Drawing_RegionContains(regionObject, DRAWING_NUMBER_100, DRAWING_NUMBER_300);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionContainsAllNotInRange()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(regionObject, rect);

    // 2. OH_Drawing_RegionContains takes regionObject as input, x: a value not within the range, y: a value not within
    // the range
    bool ret = OH_Drawing_RegionContains(regionObject, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);

    OH_Drawing_RegionDestroy(regionObject);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionContainsRegionNull()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionContains takes nullptr as input, x: a value within the range, y: a value within the range
    bool ret = OH_Drawing_RegionContains(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionOpNormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value regionObject
    OH_Drawing_Region *regionObject = OH_Drawing_RegionCreate();
    EXPECT_NE(regionObject, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionOpRegionNull()
{
    DrawingNativeRegionTestSetUp();
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionOpMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionCreate returns a pointer value region
    OH_Drawing_Region *src = OH_Drawing_RegionCreate();
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect_1, nullptr);
    OH_Drawing_RegionSetRect(src, rect_1);
    OH_Drawing_Region *dst = OH_Drawing_RegionCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    // add assert
    EXPECT_NE(rect_2, nullptr);
    OH_Drawing_RegionSetRect(dst, rect_2);
    // 2. OH_Drawing_RegionOp takes region as input, dst: nullptr, op: REGION_OP_MODE_DIFFERENCE
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        bool ret = OH_Drawing_RegionOp(src, dst, REGION_OP_MODE_INTERSECT);
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RegionDestroy(src);
    OH_Drawing_RegionDestroy(dst);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionSetRectResultTrue()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
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

int TestRegionSetRectRegionNull()
{
    DrawingNativeRegionTestSetUp();
    // 1. OH_Drawing_RegionSetRect takes a correct rect object pointer as input, region is nullptr, returns
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_256, DRAWING_NUMBER_256);
    // add assert
    EXPECT_NE(rect, nullptr);
    bool ret = OH_Drawing_RegionSetRect(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionSetRectRectNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
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

int TestRegionSetRectResultFalse()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
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

int TestRegionSetPathResultTrue()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_150, DRAWING_NUMBER_180, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(clip, rect);
    OH_Drawing_PathAddRect(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_256, DRAWING_NUMBER_256,
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

int TestRegionSetPathRegionNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_150, DRAWING_NUMBER_180, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
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

int TestRegionSetPathResultFalse()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    OH_Drawing_Region *clip = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(clip, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 0, 0);
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

int TestRegionCopyNormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionCopyNull()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionCopyAbnormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. The ordinate coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, 0);
    EXPECT_NE(rect_1, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect_1);
    // 4. Copy a region object by OH_Drawing_RegionCopy.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 5. The horizontal coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(0, 0, 0, DRAWING_NUMBER_200);
    EXPECT_NE(rect_2, nullptr);
    // 6. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect_2);
    // 7. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 8. The coordinates of the upper left corner and the lower right corner are equal.
    OH_Drawing_Rect *rect_3 = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect_3, nullptr);
    // 9. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect_3);
    // 10. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 11. The coordinates of the upper left corner are greater than those of the lower right corner.
    OH_Drawing_Rect *rect_4 = OH_Drawing_RectCreate(DRAWING_NUMBER_400, DRAWING_NUMBER_400, DRAWING_NUMBER_200,
        DRAWING_NUMBER_200);
    EXPECT_NE(rect_4, nullptr);
    // 12. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect_4);
    // 13. Copy a region object by OH_Drawing_RegionCopy.
    region2 = OH_Drawing_RegionCopy(region1);
    EXPECT_NE(region2, nullptr);
    // 14. Free memory.
    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RectDestroy(rect_3);
    OH_Drawing_RectDestroy(rect_4);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionCopyMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region1, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    // 5. The function OH_Drawing_RegionCopy is called 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
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

int TestRegionEmptyNormal()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionEmptyNull()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionEmptyCalls()
{
    DrawingNativeRegionTestSetUp();
    // 1. Create a region object by OH_Drawing_RegionCreate.
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    // 2. Create a region object by OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    // 3. Set the region1 as the rectangle.
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Create another region object by OH_Drawing_RegionCreate.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_RegionEmpty(region);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. Free memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundaryNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
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
    bool ret = OH_Drawing_PathContains(path, 300.1f, DRAWING_NUMBER_200);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, DRAWING_NUMBER_200, 300.1f);
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_PathContains(path, 299.99f, 299.99f);
    EXPECT_EQ(ret, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundaryNull()
{
    DrawingNativeRegionTestSetUp();
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundaryMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBoundaryPath(region, path);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool isEmpty = false;
        OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, true);
    }
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_PathDestroy(path);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundsNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect_1, nullptr);
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect_2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect_1);
    OH_Drawing_RegionSetRect(region2, rect_2);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region1, rect_1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect_1), DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect_1), DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect_1), DRAWING_NUMBER_300);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect_1), DRAWING_NUMBER_300);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionGetBounds(region1, rect_1);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_RectGetLeft(rect_1), DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_RectGetTop(rect_1), DRAWING_NUMBER_100);
    EXPECT_EQ(OH_Drawing_RectGetRight(rect_1), DRAWING_NUMBER_400);
    EXPECT_EQ(OH_Drawing_RectGetBottom(rect_1), DRAWING_NUMBER_400);

    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundsNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(nullptr, rect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionGetBounds(region, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionGetBoundsMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionGetBounds(region, rect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_RectGetLeft(rect), DRAWING_NUMBER_100);
        EXPECT_EQ(OH_Drawing_RectGetTop(rect), DRAWING_NUMBER_100);
        EXPECT_EQ(OH_Drawing_RectGetRight(rect), DRAWING_NUMBER_300);
        EXPECT_EQ(OH_Drawing_RectGetBottom(rect), DRAWING_NUMBER_300);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsComplexNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect_1, nullptr);
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect_2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect_1);
    OH_Drawing_RegionSetRect(region2, rect_2);

    bool isComplex = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isComplex, false);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isComplex, true);

    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsComplexNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsComplexMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect_1, nullptr);
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect_2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect_1);
    OH_Drawing_RegionSetRect(region2, rect_2);

    bool isComplex = false;
    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsComplex(region1, &isComplex);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isComplex, true);
    }

    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsEmptyNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isEmpty = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, true);

    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isEmpty, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsEmptyNull()
{
    DrawingNativeRegionTestSetUp();
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsEmptyMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    bool isEmpty = false;
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsEmpty(region, &isEmpty);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isEmpty, false);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsRectNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region1 = OH_Drawing_RegionCreate();
    EXPECT_NE(region1, nullptr);
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    EXPECT_NE(region2, nullptr);
    OH_Drawing_Rect *rect_1 = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect_1, nullptr);
    OH_Drawing_Rect *rect_2 = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect_2, nullptr);
    OH_Drawing_RegionSetRect(region1, rect_1);
    OH_Drawing_RegionSetRect(region2, rect_2);

    bool isRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(region1, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRect, true);

    OH_Drawing_RegionOp(region1, region2, OH_Drawing_RegionOpMode::REGION_OP_MODE_UNION);
    errorCode = OH_Drawing_RegionIsRect(region1, &isRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRect, false);
    OH_Drawing_RectDestroy(rect_1);
    OH_Drawing_RectDestroy(rect_2);
    OH_Drawing_RegionDestroy(region1);
    OH_Drawing_RegionDestroy(region2);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsRectNull()
{
    DrawingNativeRegionTestSetUp();
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
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionIsRectMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isRect = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionIsRect(region, &isRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRect, false);
    }
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickContainsNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_400, DRAWING_NUMBER_400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, true);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_600,
        DRAWING_NUMBER_600, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickContainsNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(nullptr, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        DRAWING_NUMBER_400, DRAWING_NUMBER_400, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_400, DRAWING_NUMBER_400,
        &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, 0, DRAWING_NUMBER_400, DRAWING_NUMBER_400,
        &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200, 0, DRAWING_NUMBER_400,
        &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400, 0,
        &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickContainsAbnormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, -DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        DRAWING_NUMBER_100, DRAWING_NUMBER_100, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_0X7FFFFFFF, DRAWING_NUMBER_0X7FFFFFFF,
        DRAWING_NUMBER_0X7FFFFFFF, DRAWING_NUMBER_0X7FFFFFFF, &isContains);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isContains, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickContainsMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isContains = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickContains(region, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
            DRAWING_NUMBER_400, DRAWING_NUMBER_400, &isContains);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isContains, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickRejectNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, 0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100,
        &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_300, DRAWING_NUMBER_300, DRAWING_NUMBER_500,
        DRAWING_NUMBER_500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_500, DRAWING_NUMBER_500, DRAWING_NUMBER_700,
        DRAWING_NUMBER_700, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickRejectNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(nullptr, DRAWING_NUMBER_300, DRAWING_NUMBER_300,
        DRAWING_NUMBER_500, DRAWING_NUMBER_500, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, 0, DRAWING_NUMBER_300, DRAWING_NUMBER_500, DRAWING_NUMBER_500,
        &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_300, 0, DRAWING_NUMBER_500, DRAWING_NUMBER_500,
        &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, false);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_300, DRAWING_NUMBER_300, 0, DRAWING_NUMBER_500,
        &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_300, DRAWING_NUMBER_300, DRAWING_NUMBER_500, 0,
        &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_300, DRAWING_NUMBER_300, DRAWING_NUMBER_500, 0,
        nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickRejectAbnormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, -DRAWING_NUMBER_100, -DRAWING_NUMBER_100,
        DRAWING_NUMBER_100, DRAWING_NUMBER_100, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_0X7FFFFFFF, DRAWING_NUMBER_0X7FFFFFFF,
        DRAWING_NUMBER_0X7FFFFFFF, DRAWING_NUMBER_0X7FFFFFFF, &isReject);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isReject, true);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionQuickRejectMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_400,
        DRAWING_NUMBER_400);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    bool isReject = false;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionQuickReject(region, DRAWING_NUMBER_500, DRAWING_NUMBER_500,
            DRAWING_NUMBER_700, DRAWING_NUMBER_700, &isReject);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isReject, true);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionTranslateNormal()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_RegionContains(region, DRAWING_NUMBER_300, DRAWING_NUMBER_300);
    EXPECT_EQ(ret, true);
    ret = OH_Drawing_RegionContains(region, DRAWING_NUMBER_401, DRAWING_NUMBER_401);
    EXPECT_EQ(ret, false);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionTranslateNull()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(nullptr, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_RegionTranslate(region, 0, DRAWING_NUMBER_100);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_RegionTranslate(region, DRAWING_NUMBER_100, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestRegionTranslateMultipleCalls()
{
    DrawingNativeRegionTestSetUp();
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_300,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RegionSetRect(region, rect);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_RegionTranslate(region, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    DrawingNativeRegionTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
