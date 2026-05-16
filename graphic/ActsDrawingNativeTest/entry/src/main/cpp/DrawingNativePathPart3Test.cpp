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

#define MAX_ALLOWED_SIZE 1024
#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_6 6
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_120 120
#define DRAWING_NUMBER_150 150
#define DRAWING_NUMBER_180 180
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_800 800
#define DRAWING_NUMBER_999 999
#define DRAWING_NUMBER_0XFF00FF00 0xFF00FF00
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestPathIsClosedNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, DRAWING_NUMBER_100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsClosedNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsClosedNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Check if the path is closed using OH_Drawing_PathIsClosed with nullptr as the parameter, should return
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathIsClosed(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPositionTangentNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPositionTangentNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, false, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPositionTangentNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathGetPositionTangent with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(nullptr, true, DRAWING_NUMBER_50, nullptr, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathGetPositionTangent with the third parameter as 0.00, no crash
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, 0.00f, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, false);
    // 4. Call OH_Drawing_PathGetPositionTangent with the fourth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, nullptr, &tangent);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_PathGetPositionTangent with the fifth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPositionTangentAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Call OH_Drawing_PathGetPositionTangent with the third parameter as an integer or character type
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fourth parameter as an integer or
    // character type
    position = {10, 10.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fourth parameter as an integer or
    // character type
    position = {10.0f, 10};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10, 10.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10.0f, 10};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetPositionTangentMaximal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, FLT_MAX + DRAWING_NUMBER_1, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {FLT_MAX + DRAWING_NUMBER_1, 0.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {0.0f, FLT_MAX + DRAWING_NUMBER_1};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {FLT_MAX + DRAWING_NUMBER_1, 0.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {0.0f, FLT_MAX + DRAWING_NUMBER_1};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, DRAWING_NUMBER_50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOpNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 7. Perform a path operation on the two paths according to the specified path operation mode. The third parameter
    // enumerates the possible path operation modes.
    bool pathOp1 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(pathOp1, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool pathOp2 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp2, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool pathOp3 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_UNION);
    // add assert
    EXPECT_EQ(pathOp3, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool pathOp4 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_XOR);
    // add assert
    EXPECT_EQ(pathOp4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    bool pathOp5 = OH_Drawing_PathOp(path, src, OH_Drawing_PathOpMode::PATH_OP_MODE_REVERSE_DIFFERENCE);
    // add assert
    EXPECT_EQ(pathOp5, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOpNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathOp with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    bool pathOp = OH_Drawing_PathOp(nullptr, src, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathOp with the second parameter as nullptr, expect OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE
    pathOp = OH_Drawing_PathOp(path, nullptr, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetMatrixNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < DRAWING_NUMBER_3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, true, DRAWING_NUMBER_50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetMatrixNormal2()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < DRAWING_NUMBER_3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, false, DRAWING_NUMBER_50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetMatrixNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_PathGetMatrix with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(nullptr, true, DRAWING_NUMBER_50, matrix, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathGetMatrix with the third parameter as 0.00, the call should fail without crashing
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 0.00f, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, false);
    // 5. Call OH_Drawing_PathGetMatrix with the fourth parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(path, true, DRAWING_NUMBER_50, nullptr, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetMatrixAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to an integer value.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, DRAWING_NUMBER_50, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetMatrixMaximal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, FLT_MAX + 1, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetSegmentNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode = {};
    // 5. Parameter enumeration traversal
    errorCode = OH_Drawing_PathGetSegment(path, true, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, true, DRAWING_NUMBER_120, DRAWING_NUMBER_180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetSegmentNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode = {};
    // 5. The function OH_Drawing_PathGetSegment passes a null pointer to the first argument
    errorCode = OH_Drawing_PathGetSegment(nullptr, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, dstPath,
        &result);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 6. The function OH_Drawing_PathGetSegment passes 0 to the third argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 0, DRAWING_NUMBER_180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes 0 to the forth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, 0, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The function OH_Drawing_PathGetSegment passes a null pointer to the fifth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, nullptr, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 9. The function OH_Drawing_PathGetSegment passes a null pointer to the sixth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, dstPath, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 10. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetSegmentAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode = {};
    // 5. The third argument of the function OH_Drawing_PathGetSegment passes a negative number
    errorCode = OH_Drawing_PathGetSegment(path, false, -DRAWING_NUMBER_50, DRAWING_NUMBER_180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. The fourth parameter of the function OH_Drawing_PathGetSegment passes a number greater than the path length
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_999, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes in the third and fourth arguments equal in value
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_120, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The third argument of the function OH_Drawing_PathGetSegment is greater than the value of the fourth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_100, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetSegmentMultiplies()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode = {};
    // 5. The function OH_Drawing_PathGetSegment is called 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode =
            OH_Drawing_PathGetSegment(path, false, DRAWING_NUMBER_120, DRAWING_NUMBER_180, true, dstPath, &result);
    }
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathSetPathNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_150,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathSetPath(path, other);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathSetPathNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_150,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath passes to nullptr.
    OH_Drawing_ErrorCode errorCode = {};
    errorCode = OH_Drawing_PathSetPath(nullptr, other);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathSetPath(path, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathSetPathMulptiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, DRAWING_NUMBER_200, DRAWING_NUMBER_200, DRAWING_NUMBER_150,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called 10 times.
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathSetPath(path, other);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEmptyNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEmptyNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Initialization of variable.
    bool isEmpty = false;
    // 5. The function OH_Drawing_PathIsEmpty passes to nullptr.
    OH_Drawing_ErrorCode errorCode = {};
    errorCode = OH_Drawing_PathIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathIsEmpty(path, nullptr);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsEmptyMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, false);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsRectNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path1, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path1, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The function OH_Drawing_PathIsRect is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsRect(path1, rect, &isRect);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    // 8. Set the path to a rectangle.
    OH_Drawing_PathAddRect(path2, 0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 9. The function OH_Drawing_PathIsRect is called normally.
    errorCode = OH_Drawing_PathIsRect(path2, rect, &isRect);
    EXPECT_EQ(isRect, true);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 10. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path1);
    OH_Drawing_PathDestroy(path2);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsRectNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The first parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsRect(nullptr, rect, &isRect);
    EXPECT_EQ(isRect, true);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. The second parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    errorCode = OH_Drawing_PathIsRect(path, nullptr, &isRect);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 8. The third parameter of the interface OH_Drawing_PathIsRect is passed to nullptr.
    errorCode = OH_Drawing_PathIsRect(path, rect, nullptr);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsRectMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The interface OH_Drawing_PathIsRect is called 10 times.
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathIsRect(path, rect, &isRect);
        EXPECT_EQ(isRect, false);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 7. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetFillTypeNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. Enumeration traversal.
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_INVERSE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);

    pathFillType = PATH_FILL_TYPE_INVERSE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
    EXPECT_EQ(pathFillType, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetFillTypeNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. The function OH_Drawing_PathIsEmpty passes to nullptr.
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathGetFillType(nullptr, &pathFillType);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);

    pathFillType = PATH_FILL_TYPE_EVEN_ODD;
    OH_Drawing_PathSetFillType(path, pathFillType);
    errorCode = OH_Drawing_PathGetFillType(path, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetFillTypeMultipleCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_200);
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    // 4. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode = {};
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathApproximateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    float acceptableError = 0.1f;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        // 4. The interface OH_Drawing_PathApproximate is called normally.
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
        EXPECT_EQ(count, DRAWING_NUMBER_6);
        EXPECT_EQ(vals[0], 0);
        EXPECT_EQ(vals[DRAWING_NUMBER_1], 100.0f);
        EXPECT_EQ(vals[DRAWING_NUMBER_2], 100.0f);
        EXPECT_EQ(vals[DRAWING_NUMBER_3], 1.0f);
        EXPECT_EQ(vals[DRAWING_NUMBER_4], 200.0f);
        EXPECT_EQ(vals[DRAWING_NUMBER_5], 200.0f);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathApproximateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    float acceptableError = 0.1f;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        // 2. Verify the empty path.
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        // 3. The first parameter of the verification interface is passed as a null pointer.
        errorCode = OH_Drawing_PathApproximate(nullptr, acceptableError, vals, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
        // 4. The second parameter of the verification interface is passed as 0.
        errorCode = OH_Drawing_PathApproximate(path, 0, vals, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        // 5. The third parameter of the verification interface is passed as a null pointer.
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        // 6. The third parameter and the forth parameter of the verification interface are passed as null pointer.
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, nullptr);
        EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
        // 7. The forth parameter of the verification interface is passed as a null pointer.
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, nullptr);
        EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathApproximateAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    float acceptableError = 0.1f;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        // 4. AcceptableError lesses than 0.
        errorCode = OH_Drawing_PathApproximate(path, -0.1f, vals, &count);
        EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
        // 3. The length of the array is greater than the length of the actual return point.
        uint32_t count1 = DRAWING_NUMBER_10;
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count1);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        // 4. The length of the array is lesses than the length of the actual return point.
        uint32_t count2 = DRAWING_NUMBER_2;
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count2);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathApproximateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    float acceptableError = 0.1f;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    if (count == 0 || count > MAX_ALLOWED_SIZE) {
        return -DRAWING_NUMBER_1;
    } else {
        // 4. The interface is called in a loop 10 times.
        for (int i = 0; i < DRAWING_NUMBER_10; i++) {
            errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
            EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        }
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathInterpolateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_800, DRAWING_NUMBER_800, 0,
        DRAWING_NUMBER_180);
    // 9. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    bool result = false;
    // 10. Call the interface OH_Drawing_PathInterpolate to verify the straight line and the straight line.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other1, 1.0f, &result, interpolatePath);
    EXPECT_EQ(result, true);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 11. Call the interface OH_Drawing_PathInterpolate to verify straight line and arc.
    errorCode = OH_Drawing_PathInterpolate(path, other2, 1.0f, &result, interpolatePath);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other1);
    OH_Drawing_PathDestroy(other2);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathInterpolateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 3. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    bool result = false;
    // 4. Call the interface OH_Drawing_PathInterpolate to verify the interpolation of the empty path.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other, 0.5f, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 6. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 7. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // 8. The first parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(nullptr, other, 0.5f, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. The second parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, nullptr, 0.5f, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 10. The third parameter of the verification interface is passed as 0.
    errorCode = OH_Drawing_PathInterpolate(path, other, 0, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 11. The forth parameter of the verification interface is passed as a null pointer
    errorCode = OH_Drawing_PathInterpolate(path, other, 0.5f, nullptr, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 12. The fifth parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, other, 0.5f, &result, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 13. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathInterpolateAbnormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The third parameter of the verification interface is passed as a negative number.
    bool result = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other, -1.0f, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 9. The third parameter of the verification interface is passed as a number greater than 1.
    errorCode = OH_Drawing_PathInterpolate(path, other, 2.0f, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 10. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathInterpolateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The interface is called in a loop 10 times.
    bool result = false;
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathInterpolate(path, other, 0.5f, &result, interpolatePath);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInterpolateNormal()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_800, DRAWING_NUMBER_800, 0,
        DRAWING_NUMBER_180);
    bool result = false;
    // 9. Return true when path and other can be interpolated.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsInterpolate(path, other1, &result);
    EXPECT_EQ(result, true);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 10. Return false when path and other can not be interpolated.
    errorCode = OH_Drawing_PathIsInterpolate(path, other2, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 11. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other1);
    OH_Drawing_PathDestroy(other2);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInterpolateNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    bool result = false;
    // 7. The first parameter of the verification interface is passed to nullptr.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsInterpolate(nullptr, other, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. The second parameter of the verification interface is passed to nullptr.
    errorCode = OH_Drawing_PathIsInterpolate(path, nullptr, &result);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. The third parameter of the verification interface is passed to nullptr.
    errorCode = OH_Drawing_PathIsInterpolate(path, other, nullptr);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 10. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInterpolateMultiCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, DRAWING_NUMBER_100, DRAWING_NUMBER_50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, DRAWING_NUMBER_200, DRAWING_NUMBER_300);
    bool result = false;
    // 7. The interface is called in a loop 10 times.
    OH_Drawing_ErrorCode errorCode = {};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        errorCode = OH_Drawing_PathIsInterpolate(path, other, &result);
        EXPECT_EQ(result, true);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeNormalOne()
{
    DrawingNativePathPart3TestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeNormalTwo()
{
    DrawingNativePathPart3TestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeNormalThree()
{
    DrawingNativePathPart3TestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xFFFF0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xFF00FF00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeNormalFour()
{
    DrawingNativePathPart3TestSetUp();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_0XFFFFFFFF);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0f, 200.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0f, 300.0f, 100.0f, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, DRAWING_NUMBER_0XFF00FF00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. 创建有效的路径对象，作为后续测试的基础资源
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值设为false，用于后续结果校验
    bool isInverseFillType = false;
    // 3. 预设路径填充类型为正向缠绕填充（PATH_FILL_TYPE_WINDING），确保路径本身状态正常
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 测试场景1：传入nullptr作为路径对象入参，调用获取反向填充状态接口
    // 预期：接口返回无效参数错误码，且输出参数isInverseFillType保持初始值false
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(nullptr, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);  // 验证输出参数未被修改
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);  // 验证接口返回正确的错误码
    // 5. 测试场景2：传入有效的路径对象，但反向填充状态输出参数为nullptr
    // 预期：接口返回无效参数错误码，且初始状态值isInverseFillType仍为false
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathIsInverseFillType(path, nullptr);
    EXPECT_EQ(isInverseFillType, false);  // 验证初始状态值未被修改
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathToggleInverseFillTypeNull()
{
    DrawingNativePathPart3TestSetUp();
    // 1. 创建路径对象（基础资源初始化）
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false
    bool isInverseFillType = false;
    // 3. 设置路径填充类型为「非反向缠绕填充」（WINDING为默认正向填充规则）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 获取路径当前反向填充状态，验证返回值和错误码
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);  // 验证状态：非反向填充
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);  // 验证接口调用成功
    // 5. 测试空指针入参的异常场景：调用切换反向填充接口，传入nullptr
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(nullptr);
    EXPECT_EQ(isInverseFillType, false);  // 状态未被修改，仍为false
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 6. 销毁路径对象，释放内存资源（防止内存泄漏）
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);  // 验证状态：非反向填充
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);  // 验证接口调用成功
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathIsInverseFillTypeCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. 创建路径对象：基础资源初始化，用于循环校验接口稳定性
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false，用于循环校验
    bool isInverseFillType = false;
    // 3. 设置路径填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 循环10次调用获取反向填充状态接口，验证接口返回结果的稳定性
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(isInverseFillType, false);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathToggleInverseFillTypeCalls()
{
    DrawingNativePathPart3TestSetUp();
    // 1. 创建路径对象：基础资源初始化，用于循环切换填充状态测试
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false
    bool isInverseFillType = false;
    // 3. 设置路径初始填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 校验初始反向填充状态：确认未切换前为非反向填充
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 5. 循环10次调用切换反向填充状态接口，验证状态交替切换的稳定性
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
        code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        // 验证状态按预期交替：第偶数次循环（0/2/4...）切换后为true，奇数次（1/3/5...）切回false
        EXPECT_EQ(isInverseFillType, (i % DRAWING_NUMBER_2 == 0));
    }
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
