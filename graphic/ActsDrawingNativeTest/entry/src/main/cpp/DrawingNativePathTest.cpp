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

#include "include/DrawingNativePathTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Path test constants
constexpr float PATH_X0 = 0.0f;
constexpr float PATH_Y0 = 0.0f;
constexpr float PATH_X1 = 1.0f;
constexpr float PATH_Y1 = 1.0f;
constexpr float PATH_X2 = 2.0f;
constexpr float PATH_Y2 = 2.0f;
constexpr float PATH_X10 = 10.0f;
constexpr float PATH_Y10 = 10.0f;
constexpr float PATH_X20 = 20.0f;
constexpr float PATH_Y20 = 20.0f;
constexpr float PATH_X50 = 50.0f;
constexpr float PATH_Y50 = 50.0f;
constexpr float PATH_X100 = 100.0f;
constexpr float PATH_Y100 = 100.0f;
constexpr float PATH_X200 = 200.0f;
constexpr float PATH_Y200 = 200.0f;
constexpr float PATH_X300 = 300.0f;
constexpr float PATH_Y300 = 300.0f;
constexpr float PATH_A90 = 90.0f;
constexpr float PATH_A20 = 20.0f;
constexpr float PATH_W05 = 0.5f;
constexpr float PATH_W5 = 5.0f;
constexpr float PATH_Z = 0.0f;
constexpr int PATH_C0 = 0;
constexpr int PATH_C5 = 5;
constexpr int PATH_C10 = 10;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativePathTestSetUp()
{
    std::cout << "DrawingNativePathTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathTestTearDown()
{
    std::cout << "DrawingNativePathTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathTest errorCodeReset after each test case." << std::endl;
}
/**
 * @tc.name   testPathCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
 * @tc.desc   Test for creating a path object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCreateNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
 * @tc.desc   Test for copying a path with normal parameters and checking the copied path length.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCopyNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    OH_Drawing_PathMoveTo(path1, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path1, PATH_X100, PATH_Y100);
    OH_Drawing_PathLineTo(path1, PATH_X200, PATH_Y200);
    OH_Drawing_PathLineTo(path1, PATH_X300, PATH_Y300);
    OH_Drawing_PathClose(path1);
    OH_Drawing_Path* path2 = OH_Drawing_PathCopy(path1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(path2, nullptr);
    bool isEqual =
        IsScalarAlmostEqual(OH_Drawing_PathGetLength(path1, false), OH_Drawing_PathGetLength(path2, false));
    EXPECT_TRUE(isEqual);
    OH_Drawing_PathDestroy(path1);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
 * @tc.desc   Test for copying a path with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCopyNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Path* path2 = OH_Drawing_PathCopy(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCopyInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
 * @tc.desc   Test for copying a path and checking if the copied path is affected after the original path is
 * destroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCopyInputDestroyed()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    OH_Drawing_PathMoveTo(path1, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path1, PATH_X100, PATH_Y100);
    OH_Drawing_PathLineTo(path1, PATH_X200, PATH_Y200);
    OH_Drawing_PathLineTo(path1, PATH_X300, PATH_Y300);
    OH_Drawing_PathClose(path1);
    OH_Drawing_Path* path2 = OH_Drawing_PathCopy(path1);
    EXPECT_NE(path2, nullptr);
    OH_Drawing_PathDestroy(path1);
    EXPECT_NE(OH_Drawing_PathGetLength(path2, false), PATH_C0);
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
 * @tc.desc   Test for creating and destroying a path object with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathDestroyNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
 * @tc.desc   Test for destroying a path object with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathDestroyNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_PathDestroy(nullptr);
    EXPECT_TRUE(true);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
 * @tc.desc   Test for moving a path to a normal position with valid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathMoveToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
 * @tc.desc   Test for moving a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(nullptr, PATH_X1, PATH_Y1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathMoveTo(path, PATH_Z, PATH_X1);
    OH_Drawing_PathMoveTo(path, PATH_X1, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
 * @tc.desc   Test for moving a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X2, PATH_X1);
    OH_Drawing_PathMoveTo(path, PATH_X1, PATH_X2);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathMoveToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01000
 * @tc.desc   Test for moving a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathMoveToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, FLT_MAX + PATH_X1, PATH_X1);
    OH_Drawing_PathMoveTo(path, PATH_X1, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01100
 * @tc.desc   Test for adding a line to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathLineToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01200
 * @tc.desc   Test for adding a line to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathLineTo(nullptr, PATH_X1, PATH_Y1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathLineTo(path, PATH_Z, PATH_X1);
    OH_Drawing_PathLineTo(path, PATH_X1, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01300
 * @tc.desc   Test for moving a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X2, PATH_X1);
    OH_Drawing_PathLineTo(path, PATH_X1, PATH_X2);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathLineToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01400
 * @tc.desc   Test for moving a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathLineToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, FLT_MAX + PATH_X1, PATH_X1);
    OH_Drawing_PathLineTo(path, PATH_X1, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01500
 * @tc.desc   Test for adding an arc to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathArcToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X300, PATH_Y300);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01600
 * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathArcTo(nullptr, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathArcTo(path, PATH_Z, PATH_X10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Z, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_Z, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01700
 * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X300, PATH_Y300);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_X20, PATH_X20, PATH_A90);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathArcToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01800
 * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathArcToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X300, PATH_Y300);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathArcTo(path, FLT_MAX + PATH_X1, PATH_X10, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, FLT_MAX + PATH_X1, PATH_X20, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, FLT_MAX + PATH_X1, PATH_Z, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, FLT_MAX + PATH_X1, PATH_Z, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, FLT_MAX + PATH_X1, PATH_A90);
    OH_Drawing_PathArcTo(path, PATH_X10, PATH_Y10, PATH_X20, PATH_Z, PATH_Z, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01900
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathQuadToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02000
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathQuadTo(nullptr, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathQuadTo(path, PATH_Z, PATH_X100, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Z, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_Z, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02100
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathQuadToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02200
 * @tc.desc   Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathQuadToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathQuadTo(path, FLT_MAX + PATH_X1, PATH_X100, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, FLT_MAX + PATH_X1, PATH_X200, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1, PATH_Y200);
    OH_Drawing_PathQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02300
 * @tc.desc   Test for adding a conic curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathConicToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02400
 * @tc.desc   Test for adding a conic curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathConicTo(nullptr, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathConicTo(path, PATH_Z, PATH_X50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Z, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_Z, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Z, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02500
 * @tc.desc   Test for adding a conic curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathConicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02600
 * @tc.desc   Test for adding a conic curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathConicToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathConicTo(path, FLT_MAX + PATH_X1, PATH_X50, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, FLT_MAX + PATH_X1, PATH_X100, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, FLT_MAX + PATH_X1, PATH_Y100, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, FLT_MAX + PATH_X1, PATH_W05);
    OH_Drawing_PathConicTo(path, PATH_X50, PATH_Y50, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02700
 * @tc.desc   Test for adding a cubic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCubicToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02800
 * @tc.desc   Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathCubicTo(nullptr, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathCubicTo(path, PATH_Z, PATH_X100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Z, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_Z, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Z, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_Z, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02900
 * @tc.desc   Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCubicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03000
 * @tc.desc   Test for adding a cubic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCubicToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathCubicTo(path, FLT_MAX + PATH_X1, PATH_X100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, FLT_MAX + PATH_X1, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, FLT_MAX + PATH_X1, PATH_X300, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, FLT_MAX + PATH_X1, PATH_Y300);
    OH_Drawing_PathCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03100
 * @tc.desc   Test for setting a relative move to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRMoveToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03200
 * @tc.desc   Test for setting a relative move to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathRMoveTo(nullptr, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathRMoveTo(path, PATH_Z, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03300
 * @tc.desc   Test for setting a relative move to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRMoveToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03400
 * @tc.desc   Test for setting a relative move to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRMoveToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, FLT_MAX + PATH_X1, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03500
 * @tc.desc   Test for adding a relative line to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRLineToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03600
 * @tc.desc   Test for adding a relative line to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathRLineTo(nullptr, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathRLineTo(path, PATH_Z, PATH_Y100);
    OH_Drawing_PathRLineTo(path, PATH_X100, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03700
 * @tc.desc   Test for adding a relative line to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRLineToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03800
 * @tc.desc   Test for adding a relative line to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRLineToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRLineTo(path, FLT_MAX + PATH_X1, PATH_Y100);
    OH_Drawing_PathRLineTo(path, PATH_X100, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03900
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRQuadToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04000
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathRQuadTo(nullptr, PATH_Z, PATH_Z, PATH_Z, PATH_Z);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathRQuadTo(path, PATH_Z, PATH_X100, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Z, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_Z, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04100
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with abnormal data types as
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRQuadToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04200
 * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRQuadToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRQuadTo(path, FLT_MAX + PATH_X1, PATH_X100, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, FLT_MAX + PATH_X1, PATH_X100, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1, PATH_X300);
    OH_Drawing_PathRQuadTo(path, PATH_X100, PATH_Y100, PATH_X100, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04300
 * @tc.desc   Test for adding a relative conic curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRConicToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04400
 * @tc.desc   Test for adding a relative conic curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathRConicTo(nullptr, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathRConicTo(path, PATH_Z, PATH_X100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Z, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_Z, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_Z, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04500
 * @tc.desc   Test for adding a relative conic curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRConicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04600
 * @tc.desc   Test for adding a relative conic curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRConicToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRConicTo(path, FLT_MAX + PATH_X1, PATH_X100, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, FLT_MAX + PATH_X1, PATH_X100, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1, PATH_X300, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, FLT_MAX + PATH_X1, PATH_W5);
    OH_Drawing_PathRConicTo(path, PATH_X100, PATH_Y100, PATH_X100, PATH_X300, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04700
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathRCubicToNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04800
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathRCubicTo(nullptr, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathRCubicTo(path, PATH_Z, PATH_X100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Z, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_Z, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Z, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_Z, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Z);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04900
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathRCubicToMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05000
 * @tc.desc   Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathRCubicToMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRMoveTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathRCubicTo(path, FLT_MAX + PATH_X1, PATH_X100, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, FLT_MAX + PATH_X1, PATH_X200, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, FLT_MAX + PATH_X1, PATH_Y200, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, FLT_MAX + PATH_X1, PATH_X300, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, FLT_MAX + PATH_X1, PATH_Y300);
    OH_Drawing_PathRCubicTo(path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, PATH_X300, FLT_MAX + PATH_X1);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05100
 * @tc.desc   Test for adding a rectangle to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRectNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05200
 * @tc.desc   Test for adding a rectangle to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathAddRect(
        nullptr, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathAddRect(
        path, PATH_Z, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Z, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_Z, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Z, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05300
 * @tc.desc   Test for adding a rectangle to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(
        path, PATH_X100, PATH_Y100, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05400
 * @tc.desc   Test for adding a rectangle to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRect(path,
                           FLT_MAX + PATH_X1,
                           PATH_Y100,
                           PATH_X200,
                           PATH_Y200,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(path,
                           PATH_X100,
                           FLT_MAX + PATH_X1,
                           PATH_X200,
                           PATH_Y200,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(path,
                           PATH_X100,
                           PATH_Y100,
                           FLT_MAX + PATH_X1,
                           PATH_Y200,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathAddRect(path,
                           PATH_X100,
                           PATH_Y100,
                           PATH_X200,
                           FLT_MAX + PATH_X1,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05500
 * @tc.desc   Test for adding a rectangle to a path with initial corner and normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRectWithInitialCornerNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, PATH_C0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05600
 * @tc.desc   Test for adding a rectangle to a path with initial corner and NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathAddRectWithInitialCorner(nullptr, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_PathAddRectWithInitialCorner(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, PATH_C0);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05700
 * @tc.desc   Test for adding a rectangle to a path with initial corner and abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRectWithInitialCorner(path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, PATH_W5);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRectWithInitialCornerMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05800
 * @tc.desc   Test for adding a rectangle to a path with initial corner and maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRectWithInitialCornerMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddRectWithInitialCorner(
        path, rect, OH_Drawing_PathDirection::PATH_DIRECTION_CW, INT32_MAX);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05900
 * @tc.desc   Test for adding a round rectangle to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddRoundRectNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, PATH_X20, PATH_Y20);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddRoundRect(path, roundRect, directions[i]);
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06000
 * @tc.desc   Test for adding a round rectangle to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddRoundRectNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, PATH_X20, PATH_Y20);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_PathAddRoundRect(nullptr, roundRect, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_PathAddRoundRect(path, nullptr, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06100
 * @tc.desc   Test for adding an oval to a path with initial point and normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddOvalWithInitialPointNormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathDirection directions[] = {
        PATH_DIRECTION_CW,
        PATH_DIRECTION_CCW,
    };
    for (int i = 0; i < sizeof(directions) / sizeof(directions[0]); i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddOvalWithInitialPoint(path, rect, PATH_C10, directions[i]);
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06200
 * @tc.desc   Test for adding an oval to a path with initial point and NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointNull()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathAddOvalWithInitialPoint(
        nullptr, rect, PATH_C10, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_PathAddOvalWithInitialPoint(
        path, nullptr, PATH_C10, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, PATH_C0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06300
 * @tc.desc   Test for adding an oval to a path with initial point and abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointAbnormal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddOvalWithInitialPoint(path, rect, PATH_W5, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalWithInitialPointMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06400
 * @tc.desc   Test for adding an oval to a path with initial point and maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalWithInitialPointMaximal()
{
    DrawingNativePathTestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X100, PATH_Y100, PATH_X200, PATH_Y200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    OH_Drawing_PathAddOvalWithInitialPoint(
        path, rect, UINT32_MAX + 1, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS