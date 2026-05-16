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
#include "drawing_canvas.h"
#include "drawing_brush.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativePathPart3Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativePathPart3Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePathPart3Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativePathPart3Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativePathPart3Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testPathIsClosedNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3700
 * @tc.desc   Test for checking if a path is closed using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, 100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose
    OH_Drawing_PathClose(path);
    // 7. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsClosedNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3701
 * @tc.desc   Test for checking if a path is closed without closing it.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNormal2, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Check if the path is closed using OH_Drawing_PathIsClosed
    bool isClosed = OH_Drawing_PathIsClosed(path, false);
    EXPECT_EQ(isClosed, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsClosedNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3702
 * @tc.desc   Test for checking if a path is closed with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsClosedNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Check if the path is closed using OH_Drawing_PathIsClosed with nullptr as the parameter, should return
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathIsClosed(nullptr, false);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetPositionTangentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3800
 * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to true.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetPositionTangentNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3801
 * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to false.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNormal2, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, false, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetPositionTangentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3802
 * @tc.desc   Test for getting position and tangent of a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathGetPositionTangent with the first parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(nullptr, true, 50, nullptr, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathGetPositionTangent with the third parameter as 0.00, no crash
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess = OH_Drawing_PathGetPositionTangent(path, true, 0.00, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess, false);
    // 4. Call OH_Drawing_PathGetPositionTangent with the fourth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, 50, nullptr, &tangent);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_PathGetPositionTangent with the fifth parameter as nullptr, expect
    // OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetPositionTangent(path, true, 50, &position, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetPositionTangentAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3803
 * @tc.desc   Test for getting position and tangent of a path with abnormal parameters (non-float values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentAbnormal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Call OH_Drawing_PathGetPositionTangent with the third parameter as an integer or character type
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fourth parameter as an integer or
    // character type
    position = {10, 10.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fourth parameter as an integer or
    // character type
    position = {10.0f, 10};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Call OH_Drawing_PathGetPositionTangent with the x coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10, 10.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Call OH_Drawing_PathGetPositionTangent with the y coordinate of the fifth parameter as an integer or character
    // type
    tangent = {10.0f, 10};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetPositionTangentMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3804
 * @tc.desc   Test for getting position and tangent of a path with maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetPositionTangentMaximal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    OH_Drawing_Point2D position;
    OH_Drawing_Point2D tangent;
    bool isSuccess1 = OH_Drawing_PathGetPositionTangent(path, true, FLT_MAX + 1, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess1, true);
    // 5. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {FLT_MAX + 1, 0.0f};
    bool isSuccess2 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess2, true);
    // 6. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fourth parameter to a large value FLT_MAX + 1.
    position = {0.0f, FLT_MAX + 1};
    bool isSuccess3 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess3, true);
    // 7. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the x
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {FLT_MAX + 1, 0.0f};
    bool isSuccess4 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess4, true);
    // 8. Get the position and tangent of a point at a specified distance from the starting point of the path. Set the y
    // coordinate of the fifth parameter to a large value FLT_MAX + 1.
    tangent = {0.0f, FLT_MAX + 1};
    bool isSuccess5 = OH_Drawing_PathGetPositionTangent(path, true, 50, &position, &tangent);
    // add assert
    EXPECT_EQ(isSuccess5, true);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathOpNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3900
 * @tc.desc   Test for performing path operations using normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathOpNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(src, 100, 100);
    // 7. Perform a path operation on the two paths according to the specified path operation mode. The third parameter
    // enumerates the possible path operation modes.
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
}

/**
 * @tc.name   testPathOpNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3901
 * @tc.desc   Test for performing path operations with NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathOpNull, Function | SmallTest | Level3) {
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
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathOp with the second parameter as nullptr, expect OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE
    pathOp = OH_Drawing_PathOp(path, nullptr, OH_Drawing_PathOpMode::PATH_OP_MODE_INTERSECT);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(pathOp, false);
    // 5. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/**
 * @tc.name   testPathGetMatrixNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4000
 * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to true.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to true. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testPathGetMatrixNormal2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4001
 * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to false.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNormal2, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // second parameter to false. Enumerate the possible values of the fifth parameter to call the interface.
    OH_Drawing_PathMeasureMatrixFlags flags[] = {
        GET_POSITION_MATRIX,
        GET_TANGENT_MATRIX,
        GET_POSITION_AND_TANGENT_MATRIX,
    };
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCodeReset();
        bool getMatrix = OH_Drawing_PathGetMatrix(path, false, 50, matrix, flags[i]);
        // add assert
        EXPECT_EQ(getMatrix, true);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testPathGetMatrixNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4002
 * @tc.desc   Test for getting transformation matrix of a path using NULL or invalid parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_PathGetMatrix with the first parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(nullptr, true, 50, matrix, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathGetMatrix with the third parameter as 0.00, the call should fail without crashing
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 0.00, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, false);
    // 5. Call OH_Drawing_PathGetMatrix with the fourth parameter as nullptr, expect OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_PathGetMatrix(path, true, 50, nullptr, GET_POSITION_MATRIX);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testPathGetMatrixAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4003
 * @tc.desc   Test for getting transformation matrix of a path with abnormal parameters (non-float values).
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixAbnormal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to an integer value.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, 50, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testPathGetMatrixMaximal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4004
 * @tc.desc   Test for getting transformation matrix of a path with maximal values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetMatrixMaximal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the transformation matrix of a point at a specified distance from the starting point of the path. Set the
    // third parameter to a large value FLT_MAX + 1.
    bool getMatrix = OH_Drawing_PathGetMatrix(path, true, FLT_MAX + 1, matrix, GET_POSITION_MATRIX);
    // add assert
    EXPECT_EQ(getMatrix, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testPathGetSegmentNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4100
 * @tc.desc   Testing the enumeration traversal of the interface for extracting path segments and appending them to the
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetSegmentNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. Parameter enumeration traversal
    errorCode = OH_Drawing_PathGetSegment(path, true, 120, 180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, true, 120, 180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 180, false, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
}

/**
 * @tc.name   testPathGetSegmentNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4101
 * @tc.desc   Tests when an interface that intercepts a path fragment and appends it to the target path passes a null
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetSegmentNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The function OH_Drawing_PathGetSegment passes a null pointer to the first argument
    errorCode = OH_Drawing_PathGetSegment(nullptr, false, 120, 180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 6. The function OH_Drawing_PathGetSegment passes 0 to the third argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 0, 180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes 0 to the forth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 0, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The function OH_Drawing_PathGetSegment passes a null pointer to the fifth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 180, true, nullptr, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 9. The function OH_Drawing_PathGetSegment passes a null pointer to the sixth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 180, true, dstPath, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(result, false);
    // 10. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
}

/**
 * @tc.name   testPathGetSegmentAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4102
 * @tc.desc   Test cases where the function intercepts a path fragment and appends it to the destination path with an
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetSegmentAbnormal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The third argument of the function OH_Drawing_PathGetSegment passes a negative number
    errorCode = OH_Drawing_PathGetSegment(path, false, -50, 180, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. The fourth parameter of the function OH_Drawing_PathGetSegment passes a number greater than the path length
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 999, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 7. The function OH_Drawing_PathGetSegment passes in the third and fourth arguments equal in value
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 120, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 8. The third argument of the function OH_Drawing_PathGetSegment is greater than the value of the fourth argument
    errorCode = OH_Drawing_PathGetSegment(path, false, 120, 100, true, dstPath, &result);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, false);
    // 9. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
}

/**
 * @tc.name   testPathGetSegmentMultiplies
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4103
 * @tc.desc   The test function intercepts the path fragment and appends it to the target path loop several times
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetSegmentMultiplies, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a target path object using OH_Drawing_PathCreate
    OH_Drawing_Path *dstPath = OH_Drawing_PathCreate();
    EXPECT_NE(dstPath, nullptr);
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    // 5. The function OH_Drawing_PathGetSegment is called 10 times
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathGetSegment(path, false, 120, 180, true, dstPath, &result);
    }
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(result, true);
    // 6. Free the memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dstPath);
}

/**
 * @tc.name   testPathSetPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4200
 * @tc.desc   test for testPathSetPathNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathSetPathNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, 200, 200, 150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathSetPath(path, other);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
}

/**
 * @tc.name   testPathSetPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4201
 * @tc.desc   test for testPathSetPathNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathSetPathNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, 200, 200, 150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath passes to nullptr.
    OH_Drawing_ErrorCode errorCode;
    errorCode = OH_Drawing_PathSetPath(nullptr, other);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathSetPath(path, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
}

/**
 * @tc.name   testPathSetPathMulptiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4202
 * @tc.desc   test for testPathSetPathMulptiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathSetPathMulptiCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a other path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    OH_Drawing_PathAddCircle(other, 200, 200, 150, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 5. The function OH_Drawing_PathSetPath is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathSetPath(path, other);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
}

/**
 * @tc.name   testPathIsEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4300
 * @tc.desc   test for testPathIsEmptyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsEmptyNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4301
 * @tc.desc   test for testPathIsEmptyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsEmptyNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Initialization of variable.
    bool isEmpty = false;
    // 5. The function OH_Drawing_PathIsEmpty passes to nullptr.
    OH_Drawing_ErrorCode errorCode;
    errorCode = OH_Drawing_PathIsEmpty(nullptr, &isEmpty);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_PathIsEmpty(path, nullptr);
    EXPECT_EQ(isEmpty, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4302
 * @tc.desc   test for testPathIsEmptyMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsEmptyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Initialization of variable.
    bool isEmpty = true;
    // 5. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathIsEmpty(path, &isEmpty);
        EXPECT_EQ(isEmpty, false);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4400
 * @tc.desc   test for testPathIsRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsRectNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path1 = OH_Drawing_PathCreate();
    EXPECT_NE(path1, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path1, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path1, 100, 200);
    OH_Drawing_PathLineTo(path1, 200, 200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The function OH_Drawing_PathIsRect is called normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathIsRect(path1, rect, &isRect);
    EXPECT_EQ(isRect, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path2 = OH_Drawing_PathCreate();
    EXPECT_NE(path2, nullptr);
    // 8. Set the path to a rectangle.
    OH_Drawing_PathAddRect(path2, 0, 0, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 9. The function OH_Drawing_PathIsRect is called normally.
    errorCode = OH_Drawing_PathIsRect(path2, rect, &isRect);
    EXPECT_EQ(isRect, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 10. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path1);
    OH_Drawing_PathDestroy(path2);
}

/**
 * @tc.name   testPathIsRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4401
 * @tc.desc   test for testPathIsRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsRectNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
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
}

/**
 * @tc.name   testPathIsRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4402
 * @tc.desc   test for testPathIsRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsRectMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. Create a rect object.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 5. Initialization of variable.
    bool isRect = true;
    // 6. The interface OH_Drawing_PathIsRect is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathIsRect(path, rect, &isRect);
        EXPECT_EQ(isRect, false);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 7. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathGetFillTypeNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4500
 * @tc.desc   test for testPathGetFillTypeNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetFillTypeNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
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
}

/**
 * @tc.name   testPathGetFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4501
 * @tc.desc   test for testPathGetFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetFillTypeNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
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
}

/**
 * @tc.name   testPathGetFillTypeMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4502
 * @tc.desc   test for testPathGetFillTypeMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathGetFillTypeMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add two lines segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 200);
    OH_Drawing_PathLineTo(path, 200, 200);
    // 4. The function OH_Drawing_PathIsEmpty is called 10 times.
    OH_Drawing_ErrorCode errorCode;
    OH_Drawing_PathFillType pathFillType = PATH_FILL_TYPE_WINDING;
    OH_Drawing_PathSetFillType(path, pathFillType);
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathGetFillType(path, &pathFillType);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathApproximateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4600
 * @tc.desc   test for testPathApproximateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathApproximateNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 200, 200);
    float acceptableError = 0.1;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    // 4. The interface OH_Drawing_PathApproximate is called normally.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
    EXPECT_EQ(count, 6);
    EXPECT_EQ(vals[0], 0);
    EXPECT_EQ(vals[1], 100.0);
    EXPECT_EQ(vals[2], 100.0);
    EXPECT_EQ(vals[3], 1.0);
    EXPECT_EQ(vals[4], 200.0);
    EXPECT_EQ(vals[5], 200.0);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathApproximateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4601
 * @tc.desc   test for testPathApproximateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathApproximateNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    float acceptableError = 0.1;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    // 2. Verify the empty path.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. The first parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathApproximate(nullptr, acceptableError, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. The second parameter of the verification interface is passed as 0.
    errorCode = OH_Drawing_PathApproximate(path, 0, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. The third parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. The third parameter and the forth parameter of the verification interface are passed as null pointer.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. The forth parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathApproximateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4602
 * @tc.desc   test for testPathApproximateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathApproximateAbnormal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 200, 200);
    float acceptableError = 0.1;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    // 4. AcceptableError lesses than 0.
    errorCode = OH_Drawing_PathApproximate(path, -0.1, vals, &count);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 3. The length of the array is greater than the length of the actual return point.
    uint32_t count1 = 10;
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count1);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. The length of the array is lesses than the length of the actual return point.
    uint32_t count2 = 2;
    errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count2);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathApproximateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4603
 * @tc.desc   test for testPathApproximateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathApproximateMultiCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 100, 100);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 200, 200);
    float acceptableError = 0.1;
    uint32_t count = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathApproximate(path, acceptableError, nullptr, &count);
    float *vals = new float[count];
    // 4. The interface is called in a loop 10 times.
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathApproximate(path, acceptableError, vals, &count);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathInterpolateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4700
 * @tc.desc   test for testPathInterpolateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathInterpolateNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, 200, 300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, 100, 100, 800, 800, 0, 180);
    // 9. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    bool result = false;
    // 10. Call the interface OH_Drawing_PathInterpolate to verify the straight line and the straight line.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other1, 1.0, &result, interpolatePath);
    EXPECT_EQ(result, true);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 11. Call the interface OH_Drawing_PathInterpolate to verify straight line and arc.
    errorCode = OH_Drawing_PathInterpolate(path, other2, 1.0, &result, interpolatePath);
    EXPECT_EQ(result, false);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other1);
    OH_Drawing_PathDestroy(other2);
    OH_Drawing_PathDestroy(interpolatePath);
}

/**
 * @tc.name   testPathInterpolateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4701
 * @tc.desc   test for testPathInterpolateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathInterpolateNull, Function | SmallTest | Level3) {
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
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other, 0.5, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 6. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, 100, 50);
    // 7. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, 200, 300);
    // 8. The first parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(nullptr, other, 0.5, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. The second parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, nullptr, 0.5, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 10. The third parameter of the verification interface is passed as 0.
    errorCode = OH_Drawing_PathInterpolate(path, other, 0, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 11. The forth parameter of the verification interface is passed as a null pointer
    errorCode = OH_Drawing_PathInterpolate(path, other, 0.5, nullptr, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 12. The fifth parameter of the verification interface is passed as a null pointer.
    errorCode = OH_Drawing_PathInterpolate(path, other, 0.5, &result, nullptr);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 13. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
}

/**
 * @tc.name   testPathInterpolateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4702
 * @tc.desc   test for testPathInterpolateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathInterpolateAbnormal, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, 200, 300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The third parameter of the verification interface is passed as a negative number.
    bool result = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PathInterpolate(path, other, -1.0, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 9. The third parameter of the verification interface is passed as a number greater than 1.
    errorCode = OH_Drawing_PathInterpolate(path, other, 2.0, &result, interpolatePath);
    EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 10. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
}

/**
 * @tc.name   testPathInterpolateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4703
 * @tc.desc   test for testPathInterpolateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathInterpolateMultiCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, 200, 300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *interpolatePath = OH_Drawing_PathCreate();
    EXPECT_NE(interpolatePath, nullptr);
    // 8. The interface is called in a loop 10 times.
    bool result = false;
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathInterpolate(path, other, 0.5, &result, interpolatePath);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
    OH_Drawing_PathDestroy(interpolatePath);
}

/**
 * @tc.name   testPathIsInterpolateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4800
 * @tc.desc   test for testPathIsInterpolateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInterpolateNormal, Function | SmallTest | Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other1 = OH_Drawing_PathCreate();
    EXPECT_NE(other1, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other1, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other1, 200, 300);
    // 7. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other2 = OH_Drawing_PathCreate();
    EXPECT_NE(other2, nullptr);
    // 8. Use the interface OH_Drawing_PathArcTo to add the path as an arc.
    OH_Drawing_PathArcTo(other2, 100, 100, 800, 800, 0, 180);
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
}

/**
 * @tc.name   testPathIsInterpolateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4801
 * @tc.desc   test for testPathIsInterpolateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInterpolateNull, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, 200, 300);
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
}

/**
 * @tc.name   testPathIsInterpolateMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4802
 * @tc.desc   test for testPathIsInterpolateMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInterpolateMultiCalls, Function | SmallTest | Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 50, 50);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 150);
    // 4. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *other = OH_Drawing_PathCreate();
    EXPECT_NE(other, nullptr);
    // 5. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(other, 100, 50);
    // 6. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(other, 200, 300);
    bool result = false;
    // 7. The interface is called in a loop 10 times.
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_PathIsInterpolate(path, other, &result);
        EXPECT_EQ(result, true);
        EXPECT_EQ(errorCode, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(other);
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalOne
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4900
 * @tc.desc   test for testPathIsInverseFillTypeNormalOne
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeNormalOne, Function | SmallTest | Level0) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0, 300.0, 100.0, PATH_DIRECTION_CW);
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
    OH_Drawing_PathAddCircle(path, 600.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalTwo
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4901
 * @tc.desc   test for testPathIsInverseFillTypeNormalTwo
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeNormalTwo, Function | SmallTest | Level0) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0, 300.0, 100.0, PATH_DIRECTION_CW);
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
    OH_Drawing_PathAddCircle(path, 600.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalThree
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4902
 * @tc.desc   test for testPathIsInverseFillTypeNormalThree
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeNormalThree, Function | SmallTest | Level0) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_WINDING);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testPathIsInverseFillTypeNormalFour
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4903
 * @tc.desc   test for testPathIsInverseFillTypeNormalFour
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeNormalFour, Function | SmallTest | Level0) {
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    bool isInverseFillType = false;
    // 设置路径初始填充类型为（PATH_FILL_TYPE_INVERSE_EVEN_ODD）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_INVERSE_EVEN_ODD);
    OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, true);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 200.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 300.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 切换路径的反向填充状态：调用ToggleInverseFillType接口
    OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, 600.0, 200.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_PathAddCircle(path, 700.0, 300.0, 100.0, PATH_DIRECTION_CW);
    OH_Drawing_BrushSetColor(brush, 0xff00ff00);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 销毁路径对象，释放内存资源
    OH_Drawing_PathDestroy(path);
    OH_Drawing_BrushDestroy(brush);
}

/**
 * @tc.name   testPathIsInverseFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4904
 * @tc.desc   test for testPathIsInverseFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeNull, Function | SmallTest | Level3) {
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
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER);  // 验证接口返回正确的错误码
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathToggleInverseFillTypeNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4905
 * @tc.desc   test for testPathToggleInverseFillTypeNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathToggleInverseFillTypeNull, Function | SmallTest | Level3) {
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
    EXPECT_EQ(code1, OH_DRAWING_ERROR_INCORRECT_PARAMETER);  // 验证返回无效参数错误码
    // 6. 销毁路径对象，释放内存资源（防止内存泄漏）
    code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
    EXPECT_EQ(isInverseFillType, false);  // 验证状态：非反向填充
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);  // 验证接口调用成功
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathIsInverseFillTypeCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4906
 * @tc.desc   test for testPathIsInverseFillTypeCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathIsInverseFillTypeCalls, Function | SmallTest | Level3) {
    // 1. 创建路径对象：基础资源初始化，用于循环校验接口稳定性
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // 2. 初始化反向填充状态标记，默认值为false，用于循环校验
    bool isInverseFillType = false;
    // 3. 设置路径填充类型为「正向缠绕填充」（PATH_FILL_TYPE_WINDING）
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 4. 循环10次调用获取反向填充状态接口，验证接口返回结果的稳定性
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(isInverseFillType, false);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    // 5. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
}

/**
 * @tc.name   testPathToggleInverseFillTypeCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_4907
 * @tc.desc   test for testPathToggleInverseFillTypeCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativePathPart3Test, testPathToggleInverseFillTypeCalls, Function | SmallTest | Level3) {
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
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code1 = OH_Drawing_PathToggleInverseFillType(path);
        code = OH_Drawing_PathIsInverseFillType(path, &isInverseFillType);
        EXPECT_EQ(code1, OH_DRAWING_SUCCESS);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
        // 验证状态按预期交替：第偶数次循环（0/2/4...）切换后为true，奇数次（1/3/5...）切回false
        EXPECT_EQ(isInverseFillType, (i % 2 == 0));
    }
    // 6. 销毁路径对象，释放内存资源，避免内存泄漏
    OH_Drawing_PathDestroy(path);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS