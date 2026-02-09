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
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Path test constants
constexpr int PATH_C_MAX = 100000;
constexpr float PATH_X0 = 0.0f;
constexpr float PATH_Y0 = 0.0f;
constexpr float PATH_X10 = 10.0f;
constexpr float PATH_Y10 = 10.0f;
constexpr float PATH_X50 = 50.0f;
constexpr float PATH_Y50 = 50.0f;
constexpr float PATH_X100 = 100.0f;
constexpr float PATH_Y100 = 100.0f;
constexpr float PATH_X150 = 150.0f;
constexpr float PATH_Y150 = 150.0f;
constexpr float PATH_X200 = 200.0f;
constexpr float PATH_Y200 = 200.0f;
constexpr float PATH_X300 = 300.0f;
constexpr float PATH_Y300 = 300.0f;
constexpr float PATH_X800 = 800.0f;
constexpr float PATH_Y800 = 800.0f;
constexpr float PATH_D50 = 50.0f;
constexpr float PATH_D120 = 120.0f;
constexpr float PATH_D180 = 180.0f;
constexpr float PATH_D999 = 999.0f;
constexpr float PATH_DN50 = -50.0f;
constexpr float PATH_OFF10 = 10.0f;
constexpr float PATH_R150 = 150.0f;
constexpr float PATH_E01 = 0.1f;
constexpr float PATH_EN01 = -0.1f;
constexpr float PATH_I05 = 0.5f;
constexpr float PATH_IN05 = -0.5f;
constexpr float PATH_I15 = 1.5f;
constexpr float PATH_Z = 0.0f;
constexpr float PATH_ONE = 1.0f;
constexpr int PATH_L10 = 10;
constexpr int PATH_L3 = 3;
constexpr int PATH_C0 = 0;
constexpr int PATH_C6 = 6;
constexpr int PATH_C2 = 2;
constexpr int PATH_IDX0 = 0;
constexpr int PATH_IDX1 = 1;
constexpr int PATH_IDX2 = 2;
constexpr int PATH_IDX3 = 3;
constexpr int PATH_IDX4 = 4;
constexpr int PATH_IDX5 = 5;
constexpr float PATH_M00 = 5.0f;
constexpr float PATH_M01 = 4.0f;
constexpr float PATH_M02 = 0.0f;
constexpr float PATH_M10 = 0.0f;
constexpr float PATH_M11 = -1.0f;
constexpr float PATH_M12 = 0.0f;
constexpr float PATH_M20 = 0.0f;
constexpr float PATH_M21 = 0.0f;
constexpr float PATH_M22 = 1.0f;
constexpr float PATH_AS = 0.0f;
constexpr float PATH_A180 = 180.0f;
constexpr float PATH_V0 = 0.0f;
constexpr float PATH_V1 = 1.0f;
constexpr float PATH_V100 = 100.0f;
constexpr float PATH_V200 = 200.0f;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativePathPart3TestSetUp()
{
    std::cout << "DrawingNativePathPart3Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart3Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathPart3TestTearDown()
{
    std::cout << "DrawingNativePathPart3Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart3Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testPathOffsetMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_020000
 * @tc.desc   Test for offsetting a path with maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathOffsetMaximal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using
    // OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using
    // OH_Drawing_PathCreate.
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Set the starting point of the path
    // using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 4. Add a line segment from the starting
    // point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 5. Call OH_Drawing_PathOffset with the
    // third parameter set to the maximum value
    // FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, FLT_MAX + 1, PATH_OFF10);
    // 6. Call OH_Drawing_PathOffset with the
    // fourth parameter set to the maximum value
    // FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, PATH_OFF10, FLT_MAX + 1);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20100
 * @tc.desc   Test for resetting a path using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathResetNormal()
{
    DrawingNativePathPart3TestSetUp();

    // 1. Create a path object using
    // OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path
    // using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the
    // starting point to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Reset the custom path data using
    // OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20200
 * @tc.desc   Test for resetting a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathResetNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using
    // OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathReset with
    // nullptr as the parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathResetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20300
 * @tc.desc   Test for resetting a path with multiple calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathResetMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using
    // OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path
    // using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the
    // starting point to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Reset the custom path data using
    // OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // 5. Loop through steps 2 to 4 for 10
    // times to verify success.
    for (int i = 0; i < PATH_L10; i++) {
        OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
        OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
        OH_Drawing_PathReset(path);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsClosedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20400
 * @tc.desc   Test for checking if a path is closed using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsClosedNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X0, PATH_Y100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X0, PATH_Y0);
    // 6. Close the path using OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsClosedNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20500
 * @tc.desc   Test for checking if a path is closed without closing it.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsClosedNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsClosedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20600
 * @tc.desc   Test for checking if a path is closed with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsClosedNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Check if the path is closed using OH_Drawing_PathIsClosed with nullptr as the parameter, should
    // return OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathIsClosed(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetPositionTangentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20700
 * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to
 * true.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetPositionTangentNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the second parameter to true.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetPositionTangentNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20800
 * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to
 * false.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetPositionTangentNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the second parameter to false.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, false, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetPositionTangentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20900
 * @tc.desc   Test for getting position and tangent of a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetPositionTangentNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathGetPositionTangent with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(nullptr, true, PATH_D50, nullptr, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathGetPositionTangent with the third parameter as 0.00, no crash
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, PATH_Z, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, false);
    // 4. Call OH_Drawing_PathGetPositionTangent with the fourth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, nullptr, &tangent);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_PathGetPositionTangent with the fifth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetPositionTangentAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21000
 * @tc.desc   Test for getting position and tangent of a path with abnormal parameters (non-float values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetPositionTangentAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Call OH_Drawing_PathGetPositionTangent with the third parameter as an integer or character type
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fourth parameter as an integer
    // or character type
    position = { PATH_X10, PATH_Y10 };
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fourth parameter as an integer
    // or character type
    position = { PATH_X10, PATH_Y10 };
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fifth parameter as an integer or
    // character type
    tangent = { PATH_X10, PATH_Y10 };
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fifth parameter as an integer or
    // character type
    tangent = { PATH_X10, PATH_Y10 };
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetPositionTangentMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21100
 * @tc.desc   Test for getting position and tangent of a path with maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetPositionTangentMaximal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the third parameter to a large value FLT_MAX + 1.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, FLT_MAX + PATH_ONE, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the x coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = { FLT_MAX + PATH_ONE, PATH_Z };
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the y coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = { PATH_Z, FLT_MAX + PATH_ONE };
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the x coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = { FLT_MAX + PATH_ONE, PATH_Z };
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Get the position and tangent of a point at a specified distance from the starting point of the path.
    // Set the y coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = { PATH_Z, FLT_MAX + PATH_ONE };
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, PATH_D50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathOpNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21200
 * @tc.desc   Test for performing path operations using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathOpNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 4. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(src, PATH_X0, PATH_Y0);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(src, PATH_X100, PATH_Y100);
    // 7. Perform a path operation on the two paths according to the specified path operation mode. The third
    // parameter enumerates the possible path operation modes.
    bool pathOp1 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(pathOp1, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp2 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp2, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp3 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_UNION);
    // add assert
    EXPECT_EQ(pathOp3, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp4 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_XOR);
    // add assert
    EXPECT_EQ(pathOp4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    bool pathOp5 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_REVERSE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp5, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathOpNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21300
 * @tc.desc   Test for performing path operations with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathOpNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathOp with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    bool pathOp = OH_Drawing_PathOp(nullptr, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathOp with the second parameter as nullptr, expect
    // OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE
    pathOp = OH_Drawing_PathOp(path, nullptr, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21400
 * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to
 * true.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetMatrixNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix, PATH_M00, PATH_M01, PATH_M02, PATH_M10, PATH_M11, PATH_M12, PATH_M20, PATH_M21, PATH_M22);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the
    // path. Set the second parameter to true. Enumerate the possible values of the fifth parameter to call
    // the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < PATH_L3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, true, PATH_D50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetMatrixNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21500
 * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to
 * false.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetMatrixNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix, PATH_M00, PATH_M01, PATH_M02, PATH_M10, PATH_M11, PATH_M12, PATH_M20, PATH_M21, PATH_M22);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the
    // path. Set the second parameter to false. Enumerate the possible values of the fifth parameter to call
    // the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < PATH_L3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, false, PATH_D50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21600
 * @tc.desc   Test for getting transformation matrix of a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetMatrixNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix, PATH_M00, PATH_M01, PATH_M02, PATH_M10, PATH_M11, PATH_M12, PATH_M20, PATH_M21, PATH_M22);
    // 3. Call OH_Drawing_PathGetMatrix with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(nullptr, true, PATH_D50, matrix, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathGetMatrix with the third parameter as 0.00, the call should fail without
    // crashing
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, PATH_Z, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, false);
    // 5. Call OH_Drawing_PathGetMatrix with the fourth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(path, true, PATH_D50, nullptr, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21700
 * @tc.desc   Test for getting transformation matrix of a path with abnormal parameters (non-float values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetMatrixAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix, PATH_M00, PATH_M01, PATH_M02, PATH_M10, PATH_M11, PATH_M12, PATH_M20, PATH_M21, PATH_M22);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the
    // path. Set the third parameter to an integer value.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, PATH_D50, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetMatrixMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21800
 * @tc.desc   Test for getting transformation matrix of a path with maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetMatrixMaximal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(
        matrix, PATH_M00, PATH_M01, PATH_M02, PATH_M10, PATH_M11, PATH_M12, PATH_M20, PATH_M21, PATH_M22);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X0, PATH_Y0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the
    // path. Set the third parameter to a large value FLT_MAX + 1.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, FLT_MAX + PATH_ONE, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetSegmentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21900
 * @tc.desc   Testing the enumeration traversal of the interface for extracting path segments and appending
 * them to the
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetSegmentNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path* dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. Parameter enumeration traversal
    errorCode = OH_Drawing_PathGetSegment(path, true, PATH_D120, PATH_D180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, true, PATH_D120, PATH_D180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetSegmentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22000
 * @tc.desc   Tests when an interface that intercepts a path fragment and appends it to the target path passes
 * a null
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetSegmentNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path* dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The function OH_Drawing_PathGetSegment passes a null pointer to the first argument
    errorCode = OH_Drawing_PathGetSegment(nullptr, false, PATH_D120, PATH_D180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 6. The function OH_Drawing_PathGetSegment passes 0 to the third argument
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_Z, PATH_D180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes 0 to the forth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_Z, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The function OH_Drawing_PathGetSegment passes a null pointer to the fifth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D180, true, nullptr, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 9. The function OH_Drawing_PathGetSegment passes a null pointer to the sixth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D180, true, dstPath, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 10. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetSegmentAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22100
 * @tc.desc   Test cases where the function intercepts a path fragment and appends it to the destination path
 * with an
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetSegmentAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path* dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The third argument of the function OH_Drawing_PathGetSegment passes a negative number
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_DN50, PATH_D180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. The fourth parameter of the function OH_Drawing_PathGetSegment passes a number greater than the path
    // length
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D999, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes in the third and fourth arguments equal in value
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D120, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The third argument of the function OH_Drawing_PathGetSegment is greater than the value of the fourth
    // argument
    errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_X100, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetSegmentMultiplies
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22200
 * @tc.desc   The test function intercepts the path fragment and appends it to the target path loop several
 * times
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetSegmentMultiplies()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path* dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The function OH_Drawing_PathGetSegment is called 10 times
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathGetSegment(path, false, PATH_D120, PATH_D180, true, dstPath, &result);
    }
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22300
 * @tc.desc   test for testPathSetPathNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathSetPathNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(
        other, PATH_X200, PATH_Y200, PATH_R150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathSetPath(path, other);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22400
 * @tc.desc   test for testPathSetPathNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathSetPathNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(
        other, PATH_X200, PATH_Y200, PATH_R150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath passes to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathSetPath(nullptr, other);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathSetPath(path, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetPathMulptiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22500
 * @tc.desc   test for testPathSetPathMulptiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathSetPathMulptiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(
        other, PATH_X200, PATH_Y200, PATH_R150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathSetPath(path, other);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22600
 * @tc.desc   test for testPathIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsEmptyNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22700
 * @tc.desc   test for testPathIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsEmptyNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Initialization of variable.
    bool isEmpty = false;
    // 5. The function OH_Drawing_PathIsEmpty passes to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathIsEmpty(path, nullptr);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22800
 * @tc.desc   test for testPathIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsEmptyMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, false);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22900
 * @tc.desc   test for testPathIsRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsRectNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path1, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path1, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path1, PATH_X200, PATH_Y200);
    // 4. Create a rect object.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X0, PATH_Y0, PATH_X100, PATH_Y100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The function OH_Drawing_PathIsRect is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsRect(path1, rect, &isRect);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    // 8. Set the path to a rectangle.
    OH_Drawing_PathAddRect(
        path2, PATH_X0, PATH_Y0, PATH_X200, PATH_Y200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 9. The function OH_Drawing_PathIsRect is called normally.
    errorCode = OH_Drawing_PathIsRect(path2, rect, &isRect);
    EXPECT_EQ(isRect, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 10. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path1);
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23000
 * @tc.desc   test for testPathIsRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsRectNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a rect object.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X0, PATH_Y0, PATH_X100, PATH_Y100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The first parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsRect(nullptr, rect, &isRect);
    EXPECT_EQ(isRect, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. The second parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    errorCode = OH_Drawing_PathIsRect(path, nullptr, &isRect);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. The third parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    errorCode = OH_Drawing_PathIsRect(path, rect, nullptr);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23100
 * @tc.desc   test for testPathIsRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsRectMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Create a rect object.
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(PATH_X0, PATH_Y0, PATH_X100, PATH_Y100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The interface OH_Drawing_PathIsRect is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathIsRect(path, rect, &isRect);
        EXPECT_EQ(isRect, false);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 7. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetFillTypeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23400
 * @tc.desc   test for testPathGetFillTypeNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetFillTypeNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. Enumeration traversal.
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_INVERSE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_INVERSE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23500
 * @tc.desc   test for testPathGetFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetFillTypeNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. The function OH_Drawing_PathIsEmpty passes to nullptr.
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetFillType(nullptr, &pathFillType);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    pathFillType = PATH_FILL_TYPE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetFillTypeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23600
 * @tc.desc   test for testPathGetFillTypeMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetFillTypeMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y200);
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    // 4. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathApproximateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23700
 * @tc.desc   test for testPathApproximateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathApproximateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    float acceptableError = PATH_E01;
    uint32_t count = PATH_C0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    if (count <= 0) {
        EXPECT_EQ(count, OH_DRAWING_SUCCESS);
    }
    float* vals = new float[count];
    // 4. The interface OH_Drawing_PathApproximate is called normally.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
    EXPECT_EQ(count, PATH_C6);
    EXPECT_EQ(vals[PATH_IDX0], PATH_V0);
    EXPECT_EQ(vals[PATH_IDX1], PATH_V100);
    EXPECT_EQ(vals[PATH_IDX2], PATH_V100);
    EXPECT_EQ(vals[PATH_IDX3], PATH_V1);
    EXPECT_EQ(vals[PATH_IDX4], PATH_V200);
    EXPECT_EQ(vals[PATH_IDX5], PATH_V200);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathApproximateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23800
 * @tc.desc   test for testPathApproximateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathApproximateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    float acceptableError = PATH_E01;
    uint32_t count = PATH_C0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    if (count <= 0) {
        EXPECT_EQ(count, OH_DRAWING_SUCCESS);
    }
    float* vals = new float[count];
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathApproximate(nullptr, acceptableError, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathApproximate(path, PATH_Z, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathApproximateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23900
 * @tc.desc   test for testPathApproximateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathApproximateAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    float acceptableError = PATH_E01;
    uint32_t count = PATH_C0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    if (count <= 0) {
        EXPECT_EQ(count, OH_DRAWING_SUCCESS);
    }
    float* vals = new float[count];
    // 4. AcceptableError lesses than 0.
    errorCode = OH_Drawing_PathApproximate(path, PATH_EN01, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 3. The length of the array is greater than the length of the actual return point.
    uint32_t count1 = PATH_L10;
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count1);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. The length of the array is lesses than the length of the actual return point.
    uint32_t count2 = PATH_C2;
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count2);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathApproximateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24000
 * @tc.desc   test for testPathApproximateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathApproximateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X100, PATH_Y100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X200, PATH_Y200);
    float acceptableError = PATH_E01;
    uint32_t count = PATH_C0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    if (count <= 0) {
        EXPECT_EQ(count, OH_DRAWING_SUCCESS);
    }
    float* vals = new float[count];
    // 4. The interface is called in a loop 10 times.
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    delete[] vals;
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathInterpolateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24100
 * @tc.desc   test for testPathInterpolateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathInterpolateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, PATH_X200, PATH_Y300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, PATH_X100, PATH_Y100, PATH_X800, PATH_Y800, PATH_AS, PATH_A180);
    // 9. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    bool result = false;
    // 10. Call the interface OH_Drawing_PathInterpolate to verify the straight line and the straight line.
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_PathInterpolate(path, other1, PATH_I05, &result, interpolatePath);
    EXPECT_EQ(result, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 11. Call the interface OH_Drawing_PathInterpolate to verify straight line and arc.
    errorCode = OH_Drawing_PathInterpolate(path, other2, PATH_I05, &result, interpolatePath);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other1);
    OH_Drawing_PathDestroy(other2);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathInterpolateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24200
 * @tc.desc   test for testPathInterpolateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathInterpolateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 3. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    bool result = false;
    // 4. Call the interface OH_Drawing_PathInterpolate to verify the interpolation of the empty path.
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_PathInterpolate(path, other, PATH_I05, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 6. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, PATH_X100, PATH_Y50);
    // 7. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, PATH_X200, PATH_Y300);
    // 8. The first parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(nullptr, other, PATH_I05, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. The second parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, nullptr, PATH_I05, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 10. The third parameter of the verification interface is passed as 0.
    errorCode = OH_Drawing_PathInterpolate(path, other, PATH_Z, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 11. The forth parameter of the verification interface is passed as a null pointer
    errorCode = OH_Drawing_PathInterpolate(path, other, PATH_I05, nullptr, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 12. The fifth parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, other, PATH_I05, &result, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 13. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathInterpolateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24300
 * @tc.desc   test for testPathInterpolateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathInterpolateAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, PATH_X200, PATH_Y300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The third parameter of the verification interface is passed as a negative number.
    bool result = false;
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_PathInterpolate(path, other, PATH_IN05, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 9. The third parameter of the verification interface is passed as a number greater than 1.
    errorCode = OH_Drawing_PathInterpolate(path, other, PATH_I15, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 10. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathInterpolateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24400
 * @tc.desc   test for testPathInterpolateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathInterpolateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, PATH_X200, PATH_Y300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The interface is called in a loop 10 times.
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathInterpolate(path, other, PATH_I05, &result, interpolatePath);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInterpolateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24500
 * @tc.desc   test for testPathIsInterpolateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathIsInterpolateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, PATH_X200, PATH_Y300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, PATH_X100, PATH_Y100, PATH_X800, PATH_Y800, PATH_AS, PATH_A180);
    bool result = false;
    // 9. Return true when path and other can be interpolated.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsInterpolate(path, other1, &result);
    EXPECT_EQ(result, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 10. Return false when path and other can not be interpolated.
    errorCode = OH_Drawing_PathIsInterpolate(path, other2, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 11. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other1);
    OH_Drawing_PathDestroy(other2);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInterpolateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24600
 * @tc.desc   test for testPathIsInterpolateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsInterpolateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, PATH_X200, PATH_Y300);
    bool result = false;
    // 7. The first parameter of the verification interface is passed to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsInterpolate(nullptr, other, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. The second parameter of the verification interface is passed to nullptr.
    errorCode = OH_Drawing_PathIsInterpolate(path, nullptr, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. The third parameter of the verification interface is passed to nullptr.
    errorCode = OH_Drawing_PathIsInterpolate(path, other, nullptr);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 10. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathIsInterpolateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24700
 * @tc.desc   test for testPathIsInterpolateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathIsInterpolateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, PATH_X50, PATH_Y50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, PATH_X100, PATH_Y150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, PATH_X100, PATH_Y50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, PATH_X200, PATH_Y300);
    bool result = false;
    // 7. The interface is called in a loop 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < PATH_L10; i++) {
        errorCode = OH_Drawing_PathIsInterpolate(path, other, &result);
        EXPECT_EQ(result, true);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS