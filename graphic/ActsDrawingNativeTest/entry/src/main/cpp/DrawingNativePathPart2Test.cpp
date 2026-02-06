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
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int PATH_L2 = 2;
constexpr int TEST_NUMBER_0 = 0;
constexpr int TEST_NUMBER_1 = 1;
constexpr int TEST_NUMBER_2 = 2;
constexpr int TEST_NUMBER_3 = 3;
constexpr int TEST_NUMBER_4 = 4;
constexpr int TEST_NUMBER_5 = 5;
constexpr int TEST_NUMBER_6 = 6;
constexpr int TEST_NUMBER_7 = 7;
constexpr int TEST_NUMBER_8 = 8;
constexpr int TEST_NUMBER_10 = 10;

// New constants added for magic numbers
constexpr int TEST_RECT_SIZE = 100;
constexpr int TEST_CIRCLE_CENTER = 50;
constexpr int TEST_CIRCLE_RADIUS = 10;
constexpr int TEST_POLYGON_POINT_COUNT = 4;
constexpr float TEST_OFFSET_VALUE_10_F = 10.0f;
constexpr float TEST_OFFSET_VALUE_30_F = 30.0f;
constexpr float TEST_OFFSET_VALUE_10 = 10;
constexpr float TEST_OFFSET_VALUE_30 = 30;
constexpr bool TEST_BOOL_TRUE = true;
constexpr bool TEST_BOOL_FALSE = false;
constexpr float TEST_FLOAT_ZERO = 0.0f;
constexpr float TEST_FLOAT_MAX_PLUS_ONE = FLT_MAX + 1.0f;
constexpr int TEST_NUMBER_100 = 100;
constexpr float TEST_FLOAT_0 = 0.0f;
constexpr float TEST_FLOAT_10 = 10.0f;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativePathPart2TestSetUp()
{
    std::cout << "DrawingNativePathPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativePathPart2TestTearDown()
{
    std::cout << "DrawingNativePathPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePathPart2Test errorCodeReset after each test case." << std::endl;
}
/**
 * @tc.name   testPathAddArcNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10100
 * @tc.desc   Test for adding an arc to a path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddArcNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, which serves as the starting point of the new
    // contour.
    OH_Drawing_PathAddArc(path, rect, TEST_FLOAT_ZERO, TEST_FLOAT_ZERO);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddArcNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10200
 * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddArcNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathAddArc with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddArc(nullptr, rect, TEST_FLOAT_ZERO, TEST_FLOAT_ZERO);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddArc with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddArc(path, nullptr, TEST_FLOAT_ZERO, TEST_FLOAT_ZERO);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddArc with 0.0 as the third parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, TEST_FLOAT_ZERO, TEST_FLOAT_ZERO);
    // 6. Call OH_Drawing_PathAddArc with 0.0 as the fourth parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, TEST_FLOAT_ZERO, TEST_FLOAT_ZERO);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddArcAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10300
 * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddArcAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the
    // third parameter.
    OH_Drawing_PathAddArc(path, rect, TEST_OFFSET_VALUE_30, TEST_OFFSET_VALUE_30_F);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the
    // fourth parameter.
    OH_Drawing_PathAddArc(path, rect, TEST_OFFSET_VALUE_30_F, TEST_OFFSET_VALUE_30);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddArcMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10400
 * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddArcMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the third parameter,
    // which will fail without crashing.
    OH_Drawing_PathAddArc(path, rect, TEST_FLOAT_MAX_PLUS_ONE, TEST_FLOAT_ZERO);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the fourth parameter,
    // which will fail without crashing.
    OH_Drawing_PathAddArc(path, rect, TEST_FLOAT_ZERO, TEST_FLOAT_MAX_PLUS_ONE);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10500
 * @tc.desc   Test for adding a path to another path with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPathNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPath.
    OH_Drawing_PathAddPath(path, src, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10600
 * @tc.desc   Test for adding a path to another path with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPath with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, TEST_NUMBER_5, TEST_NUMBER_4, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_PathAddPath(nullptr, src, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPath with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPath(path, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPath with a nullptr as the third parameter, expecting failure without crash.
    OH_Drawing_PathAddPath(path, src, nullptr);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithMatrixAndModeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10700
 * @tc.desc   Test for adding a path to another path with matrix and mode transformations using normal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPathWithMatrixAndModeNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithMatrixAndMode.
    // The fourth parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = { PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND };
    for (int i = 0; i < PATH_L2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixSetMatrix(matrix, TEST_NUMBER_5, TEST_NUMBER_4, 0, 0, -1, 0, 0, 0, 1);
        OH_Drawing_PathAddPathWithMatrixAndMode(path, src, matrix, modes[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithMatrixAndModeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10800
 * @tc.desc   Test for adding a path to another path with matrix and mode transformations using NULL or
 * invalid
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathWithMatrixAndModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, TEST_NUMBER_5, TEST_NUMBER_4, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_PathAddPathWithMatrixAndMode(nullptr, src, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMatrixAndMode(path, nullptr, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the third parameter, expecting
    // failure without crash.
    OH_Drawing_PathAddPathWithMatrixAndMode(path, src, nullptr, PATH_ADD_MODE_APPEND);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithModeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10900
 * @tc.desc   Test for adding a path to another path with mode transformations using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPathWithModeNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add the source path to the current path using OH_Drawing_PathAddPathWithMode. The third parameter
    // enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = { PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND };
    for (int i = 0; i < PATH_L2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddPathWithMode(path, src, modes[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithModeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11000
 * @tc.desc   Test for adding a path to another path with mode transformations using NULL or invalid
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathWithModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPathWithMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMode(nullptr, src, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPathWithMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMode(path, nullptr, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithOffsetAndModeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11100
 * @tc.desc   Test for adding a path to another path with offset and mode transformations using normal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPathWithOffsetAndModeNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithOffsetAndMode.
    // The fifth parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = { PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND };
    for (int i = 0; i < PATH_L2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddPathWithOffsetAndMode(
            path, src, TEST_OFFSET_VALUE_10_F, TEST_OFFSET_VALUE_10_F, modes[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithOffsetAndModeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11200
 * @tc.desc   Test for adding a path to another path with offset and mode transformations using NULL or
 * invalid
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathWithOffsetAndModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        nullptr, src, TEST_OFFSET_VALUE_10_F, TEST_OFFSET_VALUE_10_F, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, nullptr, TEST_OFFSET_VALUE_10_F, TEST_OFFSET_VALUE_10_F, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the third parameter, expecting failure
    // without crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_FLOAT_ZERO, TEST_OFFSET_VALUE_10_F, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the fourth parameter, expecting failure
    // without crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_OFFSET_VALUE_10_F, TEST_FLOAT_ZERO, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithOffsetAndModeAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11300
 * @tc.desc   Test for adding a path to another path with offset and mode transformations using abnormal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathWithOffsetAndModeAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the third parameter, expecting
    // successful call.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_OFFSET_VALUE_10, TEST_OFFSET_VALUE_10_F, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the fourth parameter, expecting
    // successful call.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_OFFSET_VALUE_10_F, TEST_OFFSET_VALUE_10, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPathWithOffsetAndModeMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11400
 * @tc.desc   Test for adding a path to another path with offset and mode transformations using maximal
 * values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPathWithOffsetAndModeMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create
    // the source path src).
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with the third parameter as FLT_MAX + 1, without
    // crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_FLOAT_MAX_PLUS_ONE, TEST_OFFSET_VALUE_10_F, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with the fourth parameter as FLT_MAX + 1, without
    // crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(
        path, src, TEST_OFFSET_VALUE_10_F, TEST_FLOAT_MAX_PLUS_ONE, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11500
 * @tc.desc   Test for adding an oval to a path using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddOvalNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add an oval to the path with the specified direction using OH_Drawing_PathAddOval. The third
    // parameter enumerates calling this interface.
    OH_Drawing_PathDirection directions[] = { PATH_DIRECTION_CW, PATH_DIRECTION_CCW };
    for (int i = 0; i < PATH_L2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddOval(path, rect, directions[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddOvalNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11600
 * @tc.desc   Test for adding an oval to a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddOvalNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathAddOval with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddOval(nullptr, rect, PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddOval with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddOval(path, nullptr, PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPolygonNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11700
 * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to true.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPolygonNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    // 5. Add a polygon to the path. Set the fourth parameter to true.
    OH_Drawing_Point2D point1 = { TEST_NUMBER_0, TEST_NUMBER_0 };
    OH_Drawing_Point2D point2 = { TEST_RECT_SIZE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point3 = { TEST_RECT_SIZE, TEST_RECT_SIZE };
    OH_Drawing_Point2D point4 = { TEST_NUMBER_0, TEST_RECT_SIZE };
    OH_Drawing_Point2D points[TEST_POLYGON_POINT_COUNT] = { point1, point2, point3, point4 };
    OH_Drawing_PathAddPolygon(path, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPolygonNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11800
 * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to false.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddPolygonNormal2()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    // 5. Add a polygon to the path. Set the fourth parameter to false.
    OH_Drawing_Point2D point1 = { TEST_NUMBER_0, TEST_NUMBER_0 };
    OH_Drawing_Point2D point2 = { TEST_RECT_SIZE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point3 = { TEST_RECT_SIZE, TEST_RECT_SIZE };
    OH_Drawing_Point2D point4 = { TEST_NUMBER_0, TEST_RECT_SIZE };
    OH_Drawing_Point2D points[TEST_POLYGON_POINT_COUNT] = { point1, point2, point3, point4 };
    OH_Drawing_PathAddPolygon(path, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_FALSE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPolygonNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11900
 * @tc.desc   Test for adding a polygon to a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPolygonNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point2D point1 = { TEST_NUMBER_0, TEST_NUMBER_0 };
    OH_Drawing_Point2D point2 = { TEST_RECT_SIZE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point3 = { TEST_RECT_SIZE, TEST_RECT_SIZE };
    OH_Drawing_Point2D point4 = { TEST_NUMBER_0, TEST_RECT_SIZE };
    OH_Drawing_Point2D points[TEST_POLYGON_POINT_COUNT] = { point1, point2, point3, point4 };
    // 2. Call OH_Drawing_PathAddPolygon with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(nullptr, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathAddPolygon with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(path, nullptr, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPolygon with the third parameter as 0, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(path, points, TEST_NUMBER_0, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPolygonAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12100
 * @tc.desc   Test for adding a polygon to a path using abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPolygonAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a polygon to the path with the second parameter's x-coordinate as an integer or
    // character type, which will succeed.
    OH_Drawing_Point2D point1 = { TEST_NUMBER_0, TEST_NUMBER_0 };
    OH_Drawing_Point2D point2 = { TEST_RECT_SIZE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point3 = { TEST_RECT_SIZE, TEST_RECT_SIZE };
    OH_Drawing_Point2D point4 = { TEST_NUMBER_0, TEST_RECT_SIZE };
    OH_Drawing_Point2D points[TEST_POLYGON_POINT_COUNT] = { point1, point2, point3, point4 };
    OH_Drawing_PathAddPolygon(path, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a polygon to the path with the second parameter's y-coordinate as an integer or
    // character type, which will succeed.
    OH_Drawing_PathAddPolygon(path, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Add a polygon to the path with the third parameter as a float or character type, which
    // will succeed.
    OH_Drawing_PathAddPolygon(path, points, 4.0f, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddPolygonMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12200
 * @tc.desc   Test for adding a polygon to a path using maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddPolygonMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a polygon to the path with the second parameter's x-coordinate set to FLT_MAX + 1,
    // no crash occurs.
    OH_Drawing_Point2D point1 = { TEST_FLOAT_MAX_PLUS_ONE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point2 = { TEST_FLOAT_MAX_PLUS_ONE, TEST_NUMBER_0 };
    OH_Drawing_Point2D point3 = { TEST_FLOAT_MAX_PLUS_ONE, TEST_RECT_SIZE };
    OH_Drawing_Point2D point4 = { TEST_FLOAT_MAX_PLUS_ONE, TEST_RECT_SIZE };
    OH_Drawing_Point2D points[TEST_POLYGON_POINT_COUNT] = { point1, point2, point3, point4 };
    OH_Drawing_PathAddPolygon(path, points, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a polygon to the path with the second parameter's y-coordinate set to FLT_MAX + 1,
    // no crash occurs.
    OH_Drawing_Point2D point5 = { TEST_NUMBER_0, TEST_FLOAT_MAX_PLUS_ONE };
    OH_Drawing_Point2D point6 = { TEST_RECT_SIZE, TEST_FLOAT_MAX_PLUS_ONE };
    OH_Drawing_Point2D point7 = { TEST_RECT_SIZE, TEST_FLOAT_MAX_PLUS_ONE };
    OH_Drawing_Point2D point8 = { TEST_NUMBER_0, TEST_FLOAT_MAX_PLUS_ONE };
    OH_Drawing_Point2D points2[TEST_POLYGON_POINT_COUNT] = { point5, point6, point7, point8 };
    OH_Drawing_PathAddPolygon(path, points2, TEST_POLYGON_POINT_COUNT, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddCircleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12300
 * @tc.desc   Test for adding a circle to a path using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathAddCircleNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a circle to the path with the specified direction.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddCircleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12400
 * @tc.desc   Test for adding a circle to a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddCircleNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathAddCircle with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddCircle(nullptr,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddCircle with the second parameter as 0.00, which will fail
    // without crashing.
    OH_Drawing_PathAddCircle(path,
                             TEST_FLOAT_ZERO,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 4. Call OH_Drawing_PathAddCircle with the third parameter as 0.00, which will fail
    // without crashing.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_FLOAT_ZERO,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Call OH_Drawing_PathAddCircle with the fourth parameter less than or equal to
    // 0, expecting OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE error code.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_CENTER,
                             TEST_FLOAT_ZERO,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddCircleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12500
 * @tc.desc   Test for adding a circle to a path using abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddCircleAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a circle to the path with the second parameter as an integer, which will
    // succeed.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             50.0f,
                             TEST_OFFSET_VALUE_10_F,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a circle to the path with the third parameter as an integer, which will
    // succeed.
    OH_Drawing_PathAddCircle(path,
                             50.0f,
                             TEST_CIRCLE_CENTER,
                             TEST_OFFSET_VALUE_10_F,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Add a circle to the path with the fourth parameter as an integer, which will
    // succeed.
    OH_Drawing_PathAddCircle(
        path, 50.0f, 50.0f, TEST_CIRCLE_RADIUS, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathAddCircleMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12600
 * @tc.desc   Test for adding a circle to a path using maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathAddCircleMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a circle to the path with the second parameter set to FLT_MAX + 1, no crash
    // occurs.
    OH_Drawing_PathAddCircle(path,
                             TEST_FLOAT_MAX_PLUS_ONE,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Add a circle to the path with the third parameter set to FLT_MAX + 1, no crash
    // occurs.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_FLOAT_MAX_PLUS_ONE,
                             TEST_CIRCLE_RADIUS,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 6. Add a circle to the path with the fourth parameter set to FLT_MAX + 1, no crash
    // occurs.
    OH_Drawing_PathAddCircle(path,
                             TEST_CIRCLE_CENTER,
                             TEST_CIRCLE_CENTER,
                             TEST_FLOAT_MAX_PLUS_ONE,
                             OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathBuildFromSvgStringNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12700
 * @tc.desc   Test for building a path from an SVG string using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathBuildFromSvgStringNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Parse the path represented by the SVG string using
    // OH_Drawing_PathBuildFromSvgString.
    const char* svgString = "M 0 0 L 100 100";
    bool svgResult = OH_Drawing_PathBuildFromSvgString(path, svgString);
    // add assert
    EXPECT_EQ(svgResult, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathBuildFromSvgStringNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12800
 * @tc.desc   Test for building a path from an SVG string using NULL or invalid
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathBuildFromSvgStringNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the first parameter,
    // expecting OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    bool svgResult = OH_Drawing_PathBuildFromSvgString(nullptr, "M 0 0 L 100 100");
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(svgResult, false);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the second parameter,
    // expecting OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    svgResult = OH_Drawing_PathBuildFromSvgString(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(svgResult, false);
    // 4. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathContainsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12900
 * @tc.desc   Test for checking if a path contains a specified point using normal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathContainsNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    // 5. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using
    // OH_Drawing_PathContains.
    EXPECT_EQ(OH_Drawing_PathContains(path, TEST_CIRCLE_CENTER, TEST_CIRCLE_CENTER), TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathContainsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13100
 * @tc.desc   Test for checking if a path contains a specified point using NULL or
 * invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathContainsNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathContains with a nullptr as the first parameter,
    // expecting OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    bool ret = OH_Drawing_PathContains(nullptr, TEST_CIRCLE_CENTER, TEST_CIRCLE_CENTER);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, TEST_BOOL_FALSE);
    // 3. Call OH_Drawing_PathContains with the second parameter as 0.00, the call
    // fails without crashing.
    ret = OH_Drawing_PathContains(path, TEST_FLOAT_ZERO, TEST_CIRCLE_CENTER);
    EXPECT_EQ(ret, TEST_BOOL_FALSE);
    // 4. Call OH_Drawing_PathContains with the third parameter as 0.00, the call
    // fails without crashing.
    ret = OH_Drawing_PathContains(path, TEST_CIRCLE_CENTER, TEST_FLOAT_ZERO);
    EXPECT_EQ(ret, TEST_BOOL_FALSE);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathContainsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13200
 * @tc.desc   Test for checking if a path contains a specified point using abnormal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathContainsAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 4. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    // 5. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using
    // OH_Drawing_PathContains.
    bool ret = OH_Drawing_PathContains(path, TEST_CIRCLE_CENTER, 50.0f);
    EXPECT_EQ(ret, TEST_BOOL_TRUE);
    // 8. Check if the specified coordinates are contained in the path using
    // OH_Drawing_PathContains.
    ret = OH_Drawing_PathContains(path, 50.0f, TEST_CIRCLE_CENTER);
    EXPECT_EQ(ret, TEST_BOOL_TRUE);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathContainsMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13300
 * @tc.desc   Test for checking if a path contains a specified point using maximal
 * values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathContainsMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 3. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    // 4. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Add a line segment from the last point of the path to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_NUMBER_0, TEST_RECT_SIZE);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using
    // OH_Drawing_PathContains with the second parameter as FLT_MAX + 1.
    bool ret = OH_Drawing_PathContains(path, TEST_FLOAT_MAX_PLUS_ONE, TEST_CIRCLE_CENTER);
    EXPECT_EQ(ret, TEST_BOOL_FALSE);
    // 8. Check if the specified coordinates are contained in the path using
    // OH_Drawing_PathContains with the third parameter as FLT_MAX + 1.
    ret = OH_Drawing_PathContains(path, TEST_CIRCLE_CENTER, TEST_FLOAT_MAX_PLUS_ONE);
    EXPECT_EQ(ret, TEST_BOOL_FALSE);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathTransformNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13400
 * @tc.desc   Test for transforming a path using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathTransformNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    // 4. Add a line segment from the starting point to the target point using
    // OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 5. Transform the path using OH_Drawing_PathTransform.
    OH_Drawing_PathTransform(path, matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathTransformNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13500
 * @tc.desc   Test for transforming a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathTransformNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_PathTransform with a nullptr as the first parameter,
    // expecting OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathTransform with a nullptr as the second parameter,
    // expecting OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathTransformWithPerspectiveClipNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13600
 * @tc.desc   Test for transforming a path with perspective clip using normal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathTransformWithPerspectiveClipNormal()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 5. Add a line segment from the starting point to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 6. Transform the path using
    // OH_Drawing_PathTransformWithPerspectiveClip, with the fourth
    // parameter set to true.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, TEST_BOOL_TRUE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathTransformWithPerspectiveClipNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13700
 * @tc.desc   Test for transforming a path with perspective clip using
 * normal parameters with false perspective clip.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathTransformWithPerspectiveClipNormal2()
{
    DrawingNativePathPart2TestSetUp();

    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 4. Set the starting point of the path using
    // OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, TEST_NUMBER_0, TEST_NUMBER_0);
    // 5. Add a line segment from the starting point to the target point
    // using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, TEST_RECT_SIZE, TEST_RECT_SIZE);
    // 6. Transform the path using
    // OH_Drawing_PathTransformWithPerspectiveClip, with the fourth
    // parameter set to false.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, TEST_BOOL_FALSE);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathTransformWithPerspectiveClipNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13800
 * @tc.desc   Test for transforming a path with perspective clip using
 * NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathTransformWithPerspectiveClipNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path* src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 4. Call OH_Drawing_PathTransformWithPerspectiveClip with a
    // nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransformWithPerspectiveClip(nullptr, matrix, dst, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_PathTransformWithPerspectiveClip with a
    // nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransformWithPerspectiveClip(src, nullptr, dst, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Call OH_Drawing_PathTransformWithPerspectiveClip with a
    // nullptr as the third parameter, no crash.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, nullptr, TEST_BOOL_TRUE);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetFillTypeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13900
 * @tc.desc   Test for setting fill type of a path using normal
 * parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathSetFillTypeNormal()
{
    DrawingNativePathPart2TestSetUp();

    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathClose(path);
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14100
 * @tc.desc   Test for setting fill type of a path using NULL or
 * invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathSetFillTypeNull()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathSetFillType(nullptr, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathSetFillTypeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14200
 * @tc.desc   Test for setting fill type of a path with multiple
 * calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathSetFillTypeMultipleCalls()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);

    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_NUMBER_0);

    OH_Drawing_PathLineTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathClose(path);

    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(i));
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetLengthNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14300
 * @tc.desc   Test for getting the length of a path using normal
 * parameters with detailed length.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetLengthNormal()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    float length = OH_Drawing_PathGetLength(path, TEST_BOOL_TRUE);
    EXPECT_NE(length, TEST_FLOAT_ZERO);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetLengthNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14400
 * @tc.desc   Test for getting the length of a path using normal
 * parameters without detailed length.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetLengthNormal2()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    float length = OH_Drawing_PathGetLength(path, TEST_BOOL_FALSE);
    EXPECT_NE(length, TEST_FLOAT_ZERO);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetLengthNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14500
 * @tc.desc   Test for getting the length of a path using
 * NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetLengthNull()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathGetLength(nullptr, TEST_BOOL_TRUE);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetBoundsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14600
 * @tc.desc   Test for getting the bounds of a path using
 * normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathGetBoundsNormal()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_SIZE, TEST_RECT_SIZE);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_RECT_SIZE, TEST_RECT_SIZE);
    OH_Drawing_PathGetBounds(path, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathGetBoundsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14700
 * @tc.desc   Test for getting the bounds of a path
 * using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathGetBoundsNull()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_NUMBER_100, TEST_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_PathGetBounds(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_PathGetBounds(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCloseNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14800
 * @tc.desc   test for testPathCloseNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathCloseNormal()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_NUMBER_100, TEST_NUMBER_100);
    OH_Drawing_PathLineTo(path, TEST_NUMBER_100, TEST_NUMBER_0);
    OH_Drawing_PathClose(path);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathCloseNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14900
 * @tc.desc   Test for closing a path using NULL or
 * invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathCloseNull()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathClose(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15100
 * @tc.desc   Test for offsetting a path using
 * normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPathOffsetNormal()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathLineTo(path, TEST_NUMBER_100, TEST_NUMBER_100);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathOffset(path, dst, TEST_FLOAT_10, TEST_FLOAT_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathOffsetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15200
 * @tc.desc   Test for offsetting a path using
 * NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathOffsetNull()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_PathOffset(nullptr, dst, TEST_FLOAT_10, TEST_FLOAT_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_PathOffset(path, nullptr, TEST_FLOAT_10, TEST_FLOAT_10);
    OH_Drawing_PathOffset(path, dst, TEST_FLOAT_0, TEST_FLOAT_10);
    OH_Drawing_PathOffset(path, dst, TEST_FLOAT_10, TEST_FLOAT_0);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPathOffsetAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15300
 * @tc.desc   Test for offsetting a path with
 * abnormal parameters (non-float values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPathOffsetAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    OH_Drawing_Path* dst = OH_Drawing_PathCreate();
    EXPECT_NE(dst, nullptr);
    OH_Drawing_PathMoveTo(path, TEST_NUMBER_0, TEST_NUMBER_0);
    OH_Drawing_PathLineTo(path, TEST_NUMBER_100, TEST_NUMBER_100);
    OH_Drawing_PathOffset(path, dst, TEST_NUMBER_10, TEST_FLOAT_10);
    OH_Drawing_PathOffset(path, dst, TEST_FLOAT_10, TEST_NUMBER_10);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS