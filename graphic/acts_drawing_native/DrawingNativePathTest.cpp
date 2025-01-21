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

#include "DrawingNativePathCommon.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_image.h"
#include "drawing_matrix.h"
#include "drawing_path.h"
#include "drawing_path_effect.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "utils/scalar.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
 * @tc.name: testPathCreateNormal
 * @tc.desc: Test for creating a path object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCreateNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_PathCreate to create a path object
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
 * @tc.name: testPathCopyNormal
 * @tc.desc: Test for copying a path with normal parameters and checking the copied path length.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCopyNormal, TestSize.Level0) {
    // 1. Create a path object 1 by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 200, 200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 300, 300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path1);
    // 7. Copy path 1 to path 2 by calling OH_Drawing_PathCopy
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // 8. Get the length of path 2 by calling OH_Drawing_PathGetLength
    bool isEqual = IsScalarAlmostEqual(OH_Drawing_PathGetLength(path1, false), OH_Drawing_PathGetLength(path2, false));
    EXPECT_TRUE(isEqual);
    // 9. Free memory
    OH_Drawing_PathDestroy(path1);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0201
 * @tc.name: testPathCopyNull
 * @tc.desc: Test for copying a path with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCopyNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Copy a path with nullptr as the parameter
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0202
 * @tc.name: testPathCopyInputDestroyed
 * @tc.desc: Test for copying a path and checking if the copied path is affected after the original path is destroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCopyInputDestroyed, TestSize.Level3) {
    // 1. Create a path object 1 by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path1, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 200, 200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path1, 300, 300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path1);
    // 7. Copy path 1 to path 2 by calling OH_Drawing_PathCopy
    OH_Drawing_Path *path2 = OH_Drawing_PathCopy(path1);
    // 8. Destroy path 1 by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path1);
    // 9. Get the length of path 2 by calling OH_Drawing_PathGetLength, if the return value is not 0, it means
    // destroying path 1 does not affect path 2
    EXPECT_NE(OH_Drawing_PathGetLength(path2, false), 0);
    // 10. Free memory
    OH_Drawing_PathDestroy(path2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
 * @tc.name: testPathDestroyNormal
 * @tc.desc: Test for creating and destroying a path object with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathDestroyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_PathCreate to create a path object
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0301
 * @tc.name: testPathDestroyNull
 * @tc.desc: Test for destroying a path object with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathDestroyNull, TestSize.Level3) {
    // 1. Call OH_Drawing_PathCreate to create a path object
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathDestroy with nullptr as the parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER error
    // code
    OH_Drawing_PathDestroy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
 * @tc.name: testPathMoveToNormal
 * @tc.desc: Test for moving a path to a normal position with valid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0401
 * @tc.name: testPathMoveToNull
 * @tc.desc: Test for moving a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathMoveTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathMoveTo(nullptr, 1, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathMoveTo with 0.00 as the second parameter
    OH_Drawing_PathMoveTo(path, 0.00, 1);
    // 4. Call OH_Drawing_PathMoveTo with 0.00 as the third parameter
    OH_Drawing_PathMoveTo(path, 1, 0.00);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0402
 * @tc.name: testPathMoveToAbnormal
 * @tc.desc: Test for moving a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo with an integer or character type as the
    // second parameter
    OH_Drawing_PathMoveTo(path, 2, 1.0f);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo with an integer or character type as the
    // third parameter
    OH_Drawing_PathMoveTo(path, 1.0f, 2);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0403
 * @tc.name: testPathMoveToMaximal
 * @tc.desc: Test for moving a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathMoveToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo with the second parameter as the maximum
    // value of FLT_MAX + 1, no crash
    OH_Drawing_PathMoveTo(path, FLT_MAX + 1, 1.0);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo with the third parameter as the maximum
    // value of FLT_MAX + 1, no crash
    OH_Drawing_PathMoveTo(path, 1.0, FLT_MAX + 1);
    // 4. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
 * @tc.name: testPathLineToNormal
 * @tc.desc: Test for adding a line to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathLineToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0501
 * @tc.name: testPathLineToNull
 * @tc.desc: Test for adding a line to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathLineTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathLineTo(nullptr, 1, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathLineTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathLineTo(path, 0.00, 1);
    // 4. Call OH_Drawing_PathLineTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathLineTo(path, 1, 0.00);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0502
 * @tc.name: testPathLineToAbnormal
 * @tc.desc: Test for moving a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with an integer or character type as the second parameter
    OH_Drawing_PathLineTo(path, 2, 1.0f);
    // 4. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with an integer or character type as the third parameter
    OH_Drawing_PathLineTo(path, 1.0f, 2);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0503
 * @tc.name: testPathLineToMaximal
 * @tc.desc: Test for moving a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathLineToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathLineTo(path, FLT_MAX + 1, 1.0);
    // 4. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    // with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathLineTo(path, 1.0, FLT_MAX + 1);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
 * @tc.name: testPathArcToNormal
 * @tc.desc: Test for adding an arc to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathArcToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, 90);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0601
 * @tc.name: testPathArcToNull
 * @tc.desc: Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathArcTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathArcTo(nullptr, 10, 10, 20, 0, 0, 90);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathArcTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathArcTo(path, 0.00, 10, 20, 0, 0, 90);
    // 4. Call OH_Drawing_PathArcTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathArcTo(path, 10, 0.00, 20, 0, 0, 90);
    // 5. Call OH_Drawing_PathArcTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 0.00, 0, 0, 90);
    // 6. Call OH_Drawing_PathArcTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0.00, 0, 90);
    // 7. Call OH_Drawing_PathArcTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0.00, 90);
    // 8. Call OH_Drawing_PathArcTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, 0.00);
    // 9. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0602
 * @tc.name: testPathArcToAbnormal
 * @tc.desc: Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo with integer parameters
    OH_Drawing_PathArcTo(path, 10, 10, 20, 20, 20, 90);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0603
 * @tc.name: testPathArcToMaximal
 * @tc.desc: Test for adding an arc to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathArcToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point to the path by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 200, 200);
    // 5. Add a line segment from the last point of the path to the target point to the path by calling
    // OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 300, 300);
    // 6. Close the path by calling OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Add an arc to the path by calling OH_Drawing_PathArcTo with the second parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, FLT_MAX + 1, 10, 20, 0, 0, 90);
    // 8. Add an arc to the path by calling OH_Drawing_PathArcTo with the third parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, 10, FLT_MAX + 1, 20, 0, 0, 90);
    // 9. Add an arc to the path by calling OH_Drawing_PathArcTo with the fourth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, 10, 10, FLT_MAX + 1, 0, 0, 90);
    // 10. Add an arc to the path by calling OH_Drawing_PathArcTo with the fifth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, FLT_MAX + 1, 0, 90);
    // 11. Add an arc to the path by calling OH_Drawing_PathArcTo with the sixth parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, FLT_MAX + 1, 90);
    // 12. Add an arc to the path by calling OH_Drawing_PathArcTo with the seventh parameter as the maximum value of
    // FLT_MAX + 1, no crash
    OH_Drawing_PathArcTo(path, 10, 10, 20, 0, 0, FLT_MAX + 1);
    // 13. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
 * @tc.name: testPathQuadToNormal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a quadratic Bezier curve from the last point of the path to the target point by calling
    // OH_Drawing_PathQuadTo
    OH_Drawing_PathQuadTo(path, 100, 100, 200, 200);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0701
 * @tc.name: testPathQuadToNull
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathQuadTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathQuadTo(nullptr, 100, 100, 200, 200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathQuadTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathQuadTo(path, 0.00, 100, 200, 200);
    // 4. Call OH_Drawing_PathQuadTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathQuadTo(path, 100, 0.00, 200, 200);
    // 5. Call OH_Drawing_PathQuadTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathQuadTo(path, 100, 100, 0.00, 200);
    // 6. Call OH_Drawing_PathQuadTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathQuadTo(path, 100, 100, 200, 0.00);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0702
 * @tc.name: testPathQuadToAbnormal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a quadratic Bezier curve to the path with the second parameter as an integer
    OH_Drawing_PathQuadTo(path, 100, 100.0f, 200.0f, 200.0f);
    // 4. Add a quadratic Bezier curve to the path with the third parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, 100, 200.0f, 200.0f);
    // 5. Add a quadratic Bezier curve to the path with the fourth parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, 200, 200.0f);
    // 6. Add a quadratic Bezier curve to the path with the fifth parameter as an integer
    OH_Drawing_PathQuadTo(path, 100.0f, 100.0f, 200.0f, 200);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0703
 * @tc.name: testPathQuadToMaximal
 * @tc.desc: Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathQuadToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Call OH_Drawing_PathQuadTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, FLT_MAX + 1, 100, 200, 200);
    // 4. Call OH_Drawing_PathQuadTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, 100, FLT_MAX + 1, 200, 200);
    // 5. Call OH_Drawing_PathQuadTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, 100, 100, FLT_MAX + 1, 200);
    // 6. Call OH_Drawing_PathQuadTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathQuadTo(path, 100, 100, 200, FLT_MAX + 1);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
 * @tc.name: testPathConicToNormal
 * @tc.desc: Test for adding a conic curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathConicToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a quadratic Bezier curve to the path by calling OH_Drawing_PathConicTo
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, 0.5);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0801
 * @tc.name: testPathConicToNull
 * @tc.desc: Test for adding a conic curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathConicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathConicTo(nullptr, 50, 50, 100, 100, 0.5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathConicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathConicTo(path, 0.00, 50, 100, 100, 0.5);
    // 4. Call OH_Drawing_PathConicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathConicTo(path, 50, 0.00, 100, 100, 0.5);
    // 5. Call OH_Drawing_PathConicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathConicTo(path, 50, 50, 0.00, 100, 0.5);
    // 6. Call OH_Drawing_PathConicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, 0.00, 0.5);
    // 7. Call OH_Drawing_PathConicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, 0.00);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0802
 * @tc.name: testPathConicToAbnormal
 * @tc.desc: Test for adding a conic curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the last point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Add a conic curve to the path with the second parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50, 50.0f, 100.0f, 100.0f, 0.5f);
    // 5. Add a conic curve to the path with the third parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50, 100.0f, 100.0f, 0.5f);
    // 6. Add a conic curve to the path with the fourth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100, 100.0f, 0.5f);
    // 7. Add a conic curve to the path with the fifth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100, 0.5f);
    // 8. Add a conic curve to the path with the sixth parameter as an integer or character type
    OH_Drawing_PathConicTo(path, 50.0f, 50.0f, 100.0f, 100.0f, 1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0803
 * @tc.name: testPathConicToMaximal
 * @tc.desc: Test for adding a conic curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathConicToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Call OH_Drawing_PathConicTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, FLT_MAX + 1, 50, 100, 100, 0.5);
    // 5. Call OH_Drawing_PathConicTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, 50, FLT_MAX + 1, 100, 100, 0.5);
    // 6. Call OH_Drawing_PathConicTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, 50, 50, FLT_MAX + 1, 100, 0.5);
    // 7. Call OH_Drawing_PathConicTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, FLT_MAX + 1, 0.5);
    // 8. Call OH_Drawing_PathConicTo with the sixth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathConicTo(path, 50, 50, 100, 100, FLT_MAX + 1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
 * @tc.name: testPathCubicToNormal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a cubic Bezier curve from the last point of the path to the target point by calling OH_Drawing_PathCubicTo
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, 300);
    // 4. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0901
 * @tc.name: testPathCubicToNull
 * @tc.desc: Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathCubicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathCubicTo(nullptr, 100, 100, 200, 200, 300, 300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathCubicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathCubicTo(path, 0.00, 100, 200, 200, 300, 300);
    // 4. Call OH_Drawing_PathCubicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathCubicTo(path, 100, 0.00, 200, 200, 300, 300);
    // 5. Call OH_Drawing_PathCubicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 0.00, 200, 300, 300);
    // 6. Call OH_Drawing_PathCubicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 0.00, 300, 300);
    // 7. Call OH_Drawing_PathCubicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 0.00, 300);
    // 8. Call OH_Drawing_PathCubicTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, 0.00);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0902
 * @tc.name: testPathCubicToAbnormal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a cubic Bezier curve to the path with the second parameter as an integer
    OH_Drawing_PathCubicTo(path, 100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 4. Add a cubic Bezier curve to the path with the third parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 5. Add a cubic Bezier curve to the path with the fourth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200, 200.0f, 300.0f, 300.0f);
    // 6. Add a cubic Bezier curve to the path with the fifth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200, 300.0f, 300.0f);
    // 7. Add a cubic Bezier curve to the path with the sixth parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300, 300.0f);
    // 8. Add a cubic Bezier curve to the path with the seventh parameter as an integer
    OH_Drawing_PathCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0903
 * @tc.name: testPathCubicToMaximal
 * @tc.desc: Test for adding a cubic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCubicToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Call OH_Drawing_PathCubicTo with the second parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, FLT_MAX + 1, 100, 200, 200, 300, 300);
    // 4. Call OH_Drawing_PathCubicTo with the third parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, 100, FLT_MAX + 1, 200, 200, 300, 300);
    // 5. Call OH_Drawing_PathCubicTo with the fourth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, FLT_MAX + 1, 200, 300, 300);
    // 6. Call OH_Drawing_PathCubicTo with the fifth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, FLT_MAX + 1, 300, 300);
    // 7. Call OH_Drawing_PathCubicTo with the sixth parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, FLT_MAX + 1, 300);
    // 8. Call OH_Drawing_PathCubicTo with the seventh parameter as the maximum value of FLT_MAX + 1, no crash
    OH_Drawing_PathCubicTo(path, 100, 100, 200, 200, 300, FLT_MAX + 1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1000
 * @tc.name: testPathRMoveToNormal
 * @tc.desc: Test for setting a relative move to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1001
 * @tc.name: testPathRMoveToNull
 * @tc.desc: Test for setting a relative move to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathRMoveTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRMoveTo(nullptr, 100, 100);
    // 3. Call OH_Drawing_PathRMoveTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRMoveTo(path, 0.00, 100);
    // 4. Call OH_Drawing_PathRMoveTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRMoveTo(path, 100, 0.00);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1002
 * @tc.name: testPathRMoveToAbnormal
 * @tc.desc: Test for setting a relative move to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100.0f);
    // 5. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100.0f, 100);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1003
 * @tc.name: testPathRMoveToMaximal
 * @tc.desc: Test for setting a relative move to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRMoveToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, FLT_MAX + 1, 100);
    // 5. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, FLT_MAX + 1);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1100
 * @tc.name: testPathRLineToNormal
 * @tc.desc: Test for adding a relative line to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, 100, 100);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1101
 * @tc.name: testPathRLineToNull
 * @tc.desc: Test for adding a relative line to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathRLineTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRLineTo(nullptr, 100, 100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRLineTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRLineTo(path, 0.00, 100);
    // 4. Call OH_Drawing_PathRLineTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRLineTo(path, 100, 0.00);
    // 5. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1102
 * @tc.name: testPathRLineToAbnormal
 * @tc.desc: Test for adding a relative line to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, 100.0f, 100);
    // 6. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, 100, 100.0f);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1103
 * @tc.name: testPathRLineToMaximal
 * @tc.desc: Test for adding a relative line to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRLineToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, FLT_MAX + 1, 100);
    // 6. Add a relative line to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRLineTo
    OH_Drawing_PathRLineTo(path, 100, FLT_MAX + 1);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1200
 * @tc.name: testPathRQuadToNormal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative quadratic Bezier curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRQuadTo
    OH_Drawing_PathRQuadTo(path, 100, 100, 200, 200);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1201
 * @tc.name: testPathRQuadToNull
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathRQuadTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRQuadTo(nullptr, 0, 0, 0, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRQuadTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRQuadTo(path, 0.00, 100, 100, 300);
    // 4. Call OH_Drawing_PathRQuadTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRQuadTo(path, 100, 0.00, 100, 300);
    // 5. Call OH_Drawing_PathRQuadTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRQuadTo(path, 100, 100, 0.00, 300);
    // 6. Call OH_Drawing_PathRQuadTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRQuadTo(path, 100, 100, 100, 0.00);
    // 7. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1202
 * @tc.name: testPathRQuadToAbnormal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRQuadTo with an integer or character type as the second parameter
    OH_Drawing_PathRQuadTo(path, 100, 100.0f, 100.0f, 300.0f);
    // 6. Call OH_Drawing_PathRQuadTo with an integer or character type as the third parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, 100, 100.0f, 300.0f);
    // 7. Call OH_Drawing_PathRQuadTo with an integer or character type as the fourth parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, 100, 300.0f);
    // 8. Call OH_Drawing_PathRQuadTo with an integer or character type as the fifth parameter
    OH_Drawing_PathRQuadTo(path, 100.0f, 100.0f, 100.0f, 300);
    // 9. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1203
 * @tc.name: testPathRQuadToMaximal
 * @tc.desc: Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRQuadToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRQuadTo with a second parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, FLT_MAX + 1, 100, 100, 300);
    // 6. Call OH_Drawing_PathRQuadTo with a third parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, 100, FLT_MAX + 1, 100, 300);
    // 7. Call OH_Drawing_PathRQuadTo with a fourth parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, 100, 100, FLT_MAX + 1, 300);
    // 8. Call OH_Drawing_PathRQuadTo with a fifth parameter of FLT_MAX + 1
    OH_Drawing_PathRQuadTo(path, 100, 100, 100, FLT_MAX + 1);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1300
 * @tc.name: testPathRConicToNormal
 * @tc.desc: Test for adding a relative conic curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative conic curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRConicTo
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 5);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1301
 * @tc.name: testPathRConicToNull
 * @tc.desc: Test for adding a relative conic curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathRConicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRConicTo(nullptr, 100, 100, 100, 300, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathRConicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRConicTo(path, 0.00, 100, 100, 300, 5);
    // 4. Call OH_Drawing_PathRConicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRConicTo(path, 100, 0.00, 100, 300, 5);
    // 5. Call OH_Drawing_PathRConicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, 0.00, 300, 5);
    // 6. Call OH_Drawing_PathRConicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 0.00, 5);
    // 7. Call OH_Drawing_PathRConicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, 0.00);
    // 8. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1302
 * @tc.name: testPathRConicToAbnormal
 * @tc.desc: Test for adding a relative conic curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRConicTo with an integer as the second parameter
    OH_Drawing_PathRConicTo(path, 100, 100.0f, 100.0f, 300.0f, 5.0f);
    // 6. Call OH_Drawing_PathRConicTo with an integer as the third parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100, 100.0f, 300.0f, 5.0f);
    // 7. Call OH_Drawing_PathRConicTo with an integer as the fourth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100, 300.0f, 5.0f);
    // 8. Call OH_Drawing_PathRConicTo with an integer as the fifth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, 300, 5.0f);
    // 9. Call OH_Drawing_PathRConicTo with an integer as the sixth parameter
    OH_Drawing_PathRConicTo(path, 100.0f, 100.0f, 100.0f, 300.0f, 5);
    // 10. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1303
 * @tc.name: testPathRConicToMaximal
 * @tc.desc: Test for adding a relative conic curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRConicToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRConicTo with a second parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, FLT_MAX + 1, 100, 100, 300, 5);
    // 6. Call OH_Drawing_PathRConicTo with a third parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, 100, FLT_MAX + 1, 100, 300, 5);
    // 7. Call OH_Drawing_PathRConicTo with a fourth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, FLT_MAX + 1, 300, 5);
    // 8. Call OH_Drawing_PathRConicTo with a fifth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, FLT_MAX + 1, 5);
    // 9. Call OH_Drawing_PathRConicTo with a sixth parameter of FLT_MAX + 1, no crash
    OH_Drawing_PathRConicTo(path, 100, 100, 100, 300, FLT_MAX + 1);
    // 10. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1400
 * @tc.name: testPathRCubicToNormal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Add a relative cubic Bezier curve to the path from the current endpoint to the target point by calling
    // OH_Drawing_PathRCubicTo
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, 300);
    // 6. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1401
 * @tc.name: testPathRCubicToNull
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathRCubicTo with nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code
    OH_Drawing_PathRCubicTo(nullptr, 100, 100, 200, 200, 300, 300);
    // 3. Call OH_Drawing_PathRCubicTo with 0.00 as the second parameter, no crash
    OH_Drawing_PathRCubicTo(path, 0.00, 100, 200, 200, 300, 300);
    // 4. Call OH_Drawing_PathRCubicTo with 0.00 as the third parameter, no crash
    OH_Drawing_PathRCubicTo(path, 100, 0.00, 200, 200, 300, 300);
    // 5. Call OH_Drawing_PathRCubicTo with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 0.00, 200, 300, 300);
    // 6. Call OH_Drawing_PathRCubicTo with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 0.00, 300, 300);
    // 7. Call OH_Drawing_PathRCubicTo with 0.00 as the sixth parameter, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 0.00, 300);
    // 8. Call OH_Drawing_PathRCubicTo with 0.00 as the seventh parameter, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, 0.00);
    // 9. Free memory by calling OH_Drawing_PathDestroy
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1402
 * @tc.name: testPathRCubicToAbnormal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRCubicTo with an integer as the second parameter
    OH_Drawing_PathRCubicTo(path, 100, 100.0f, 200.0f, 200.0f, 300.0f, 300.0f);
    // 6. Call OH_Drawing_PathRCubicTo with an integer as the third parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100, 200.0f, 200.0f, 300.0f, 300.0f);
    // 7. Call OH_Drawing_PathRCubicTo with an integer as the fourth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200, 200.0f, 300.0f, 300.0f);
    // 8. Call OH_Drawing_PathRCubicTo with an integer as the fifth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200, 300.0f, 300.0f);
    // 9. Call OH_Drawing_PathRCubicTo with an integer as the sixth parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300, 300.0f);
    // 10. Call OH_Drawing_PathRCubicTo with an integer as the seventh parameter
    OH_Drawing_PathRCubicTo(path, 100.0f, 100.0f, 200.0f, 200.0f, 300.0f, 300);
    // 11. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1403
 * @tc.name: testPathRCubicToMaximal
 * @tc.desc: Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathRCubicToMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Set a relative move to the path starting from the current endpoint by calling OH_Drawing_PathRMoveTo
    OH_Drawing_PathRMoveTo(path, 100, 100);
    // 5. Call OH_Drawing_PathRCubicTo with the second parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, FLT_MAX + 1, 100, 200, 200, 300, 300);
    // 6. Call OH_Drawing_PathRCubicTo with the third parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, 100, FLT_MAX + 1, 200, 200, 300, 300);
    // 7. Call OH_Drawing_PathRCubicTo with the fourth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, FLT_MAX + 1, 200, 300, 300);
    // 8. Call OH_Drawing_PathRCubicTo with the fifth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, FLT_MAX + 1, 300, 300);
    // 9. Call OH_Drawing_PathRCubicTo with the sixth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, FLT_MAX + 1, 300);
    // 10. Call OH_Drawing_PathRCubicTo with the seventh parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathRCubicTo(path, 100, 100, 200, 200, 300, FLT_MAX + 1);
    // 11. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1500
 * @tc.name: testPathAddRectNormal
 * @tc.desc: Test for adding a rectangle to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a rectangle outline to the path with the specified direction by calling OH_Drawing_PathAddRect. Iterate
    // through the enum to call this interface.
    OH_Drawing_PathAddRect(path, 100, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1501
 * @tc.name: testPathAddRectNull
 * @tc.desc: Test for adding a rectangle to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathAddRect with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRect(nullptr, 100, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddRect with 0.00 as the second parameter, no crash
    OH_Drawing_PathAddRect(path, 0.00, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. Call OH_Drawing_PathAddRect with 0.00 as the third parameter, no crash
    OH_Drawing_PathAddRect(path, 100, 0.00, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with 0.00 as the fourth parameter, no crash
    OH_Drawing_PathAddRect(path, 100, 100, 0.00, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with 0.00 as the fifth parameter, no crash
    OH_Drawing_PathAddRect(path, 100, 100, 200, 0.00, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1502
 * @tc.name: testPathAddRectAbnormal
 * @tc.desc: Test for adding a rectangle to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 4. Call OH_Drawing_PathAddRect with an integer as the second parameter
    OH_Drawing_PathAddRect(path, 100, 100.0f, 200.0f, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with an integer as the third parameter
    OH_Drawing_PathAddRect(path, 100.0f, 100, 200.0f, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with an integer as the fourth parameter
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 200, 200.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Call OH_Drawing_PathAddRect with an integer as the fifth parameter
    OH_Drawing_PathAddRect(path, 100.0f, 100.0f, 200.0f, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1503
 * @tc.name: testPathAddRectMaximal
 * @tc.desc: Test for adding a rectangle to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Call OH_Drawing_PathAddRect with the second parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, FLT_MAX + 1, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. Call OH_Drawing_PathAddRect with the third parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, 100, FLT_MAX + 1, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Call OH_Drawing_PathAddRect with the fourth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, 100, 100, FLT_MAX + 1, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 7. Call OH_Drawing_PathAddRect with the fifth parameter as the maximum value FLT_MAX+1, no crash
    OH_Drawing_PathAddRect(path, 100, 100, 200, FLT_MAX + 1, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 8. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1600
 * @tc.name: testPathAddRectWithInitialCornerNormal
 * @tc.desc: Test for adding a rectangle to a path with initial corner and normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectWithInitialCornerNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add a rectangle outline to the path with the specified direction by calling
    // OH_Drawing_PathAddRectWithInitialCorner. Iterate through the enum to call this interface.
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1601
 * @tc.name: testPathAddRectWithInitialCornerNull
 * @tc.desc: Test for adding a rectangle to a path with initial corner and NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectWithInitialCornerNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Call OH_Drawing_PathAddRectWithInitialCorner with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRectWithInitialCorner(nullptr, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddRectWithInitialCorner with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRectWithInitialCorner(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as 0
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1602
 * @tc.name: testPathAddRectWithInitialCornerAbnormal
 * @tc.desc: Test for adding a rectangle to a path with initial corner and abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectWithInitialCornerAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as a float or a character
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 5.0f);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1603
 * @tc.name: testPathAddRectWithInitialCornerMaximal
 * @tc.desc: Test for adding a rectangle to a path with initial corner and maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRectWithInitialCornerMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Call OH_Drawing_PathAddRectWithInitialCorner with the fourth parameter as the maximum value INT32_MAX, no
    // crash
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, INT32_MAX);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1700
 * @tc.name: testPathAddRoundRectNormal
 * @tc.desc: Test for adding a round rectangle to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddRoundRectNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rounded rectangle object by calling OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add the rounded rectangle outline to the path with the specified direction by calling
    // OH_Drawing_PathAddRoundRect. Iterate through the enum to call this interface.
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_PathAddRoundRect(path, roundRect, directions[i]);
    }
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1701
 * @tc.name: testPathAddRoundRectNull
 * @tc.desc: Test for adding a round rectangle to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddRoundRectNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rounded rectangle object by calling OH_Drawing_RoundRectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    // 3. Call OH_Drawing_PathAddRoundRect with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRoundRect(nullptr, roundRect, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddRoundRect with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddRoundRect(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1800
 * @tc.name: testPathAddOvalWithInitialPointNormal
 * @tc.desc: Test for adding an oval to a path with initial point and normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalWithInitialPointNormal, TestSize.Level0) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add an oval to the path, where the rectangle object is the bounding rectangle of the oval. Iterate through the
    // enum to call this interface.
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 10, directions[i]);
    }
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1801
 * @tc.name: testPathAddOvalWithInitialPointNull
 * @tc.desc: Test for adding an oval to a path with initial point and NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalWithInitialPointNull, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Call OH_Drawing_PathAddOvalWithInitialPoint with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddOvalWithInitialPoint(nullptr, rect, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddOvalWithInitialPoint with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathAddOvalWithInitialPoint(path, nullptr, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as 0, no crash
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1802
 * @tc.name: testPathAddOvalWithInitialPointAbnormal
 * @tc.desc: Test for adding an oval to a path with initial point and abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalWithInitialPointAbnormal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100.0f, 100.0f);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as a float or a character
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, 5.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1803
 * @tc.name: testPathAddOvalWithInitialPointMaximal
 * @tc.desc: Test for adding an oval to a path with initial point and maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalWithInitialPointMaximal, TestSize.Level3) {
    // 1. Create a path object by calling OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object by calling OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    // 3. Set the starting point of the path by calling OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point of the path to the target point by calling OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Call OH_Drawing_PathAddOvalWithInitialPoint with the third parameter as the maximum value UINT32_MAX + 1, no
    // crash
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, UINT32_MAX + 1, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 6. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS