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

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_100 100

namespace OHOS {
namespace Rosen {
namespace Drawing {

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
int TestPathAddArcNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, which serves as the starting point of the new contour.
    OH_Drawing_PathAddArc(path, rect, 0.0f, 0.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddArcNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathAddArc with a nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathAddArc(nullptr, rect, 0.0f, 0.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddArc with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddArc(path, nullptr, 0.0f, 0.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddArc with 0.0 as the third parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, 0.0f, 0.0f);
    // 6. Call OH_Drawing_PathAddArc with 0.0 as the fourth parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, 0.0f, 0.0f);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddArcAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the third
    // parameter.
    OH_Drawing_PathAddArc(path, rect, DRAWING_NUMBER_30, 30.0f);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the fourth
    // parameter.
    OH_Drawing_PathAddArc(path, rect, 30.0f, DRAWING_NUMBER_30);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddArcMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the third parameter, which will
    // fail without crashing.
    OH_Drawing_PathAddArc(path, rect, FLT_MAX + DRAWING_NUMBER_1, 0.0f);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the fourth parameter, which will
    // fail without crashing.
    OH_Drawing_PathAddArc(path, rect, 0.0f, FLT_MAX + DRAWING_NUMBER_1);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPathNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestPathAddPathNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPath with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
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

int TestPathAddPathWithMatrixAndModeNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithMatrixAndMode. The fourth
    // parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        // add assert
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
            DRAWING_NUMBER_1);
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

int TestPathAddPathWithMatrixAndModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_5, DRAWING_NUMBER_4, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0,
        DRAWING_NUMBER_1);
    OH_Drawing_PathAddPathWithMatrixAndMode(nullptr, src, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMatrixAndMode(path, nullptr, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the third parameter, expecting failure without
    // crash.
    OH_Drawing_PathAddPathWithMatrixAndMode(path, src, nullptr, PATH_ADD_MODE_APPEND);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPathWithModeNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add the source path to the current path using OH_Drawing_PathAddPathWithMode. The third parameter enumerates
    // calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
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

int TestPathAddPathWithModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
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

int TestPathAddPathWithOffsetAndModeNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithOffsetAndMode. The fifth
    // parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, 10.0f, modes[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPathWithOffsetAndModeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(nullptr, src, 10.0f, 10.0f, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, nullptr, 10.0f, 10.0f, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the third parameter, expecting failure without
    // crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 0.0f, 10.0f, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the fourth parameter, expecting failure without
    // crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, 0.0f, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPathWithOffsetAndModeAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the third parameter, expecting successful
    // call.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, DRAWING_NUMBER_10, 10.0f, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the fourth parameter, expecting successful
    // call.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, DRAWING_NUMBER_10, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPathWithOffsetAndModeMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with the third parameter as FLT_MAX + 1, without crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, FLT_MAX + DRAWING_NUMBER_1, 10.0f, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with the fourth parameter as FLT_MAX + 1, without crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, FLT_MAX + DRAWING_NUMBER_1, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddOvalNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add an oval to the path with the specified direction using OH_Drawing_PathAddOval. The third parameter
    // enumerates calling this interface.
    OH_Drawing_PathDirection directions[] = {PATH_DIRECTION_CW, PATH_DIRECTION_CCW};
    for (int i = 0; i < DRAWING_NUMBER_2; i++) {
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

int TestPathAddOvalNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestPathAddPolygonNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a polygon to the path. Set the fourth parameter to true.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {DRAWING_NUMBER_100, 0};
    OH_Drawing_Point2D point3 = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point4 = {0, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points[DRAWING_NUMBER_4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, DRAWING_NUMBER_4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPolygonNormal2()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a polygon to the path. Set the fourth parameter to false.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {DRAWING_NUMBER_100, 0};
    OH_Drawing_Point2D point3 = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point4 = {0, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points[DRAWING_NUMBER_4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, DRAWING_NUMBER_4, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPolygonNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {DRAWING_NUMBER_100, 0};
    OH_Drawing_Point2D point3 = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point4 = {0, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points[DRAWING_NUMBER_4] = {point1, point2, point3, point4};
    // 2. Call OH_Drawing_PathAddPolygon with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(nullptr, points, DRAWING_NUMBER_4, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathAddPolygon with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(path, nullptr, DRAWING_NUMBER_4, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathAddPolygon with the third parameter as 0, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathAddPolygon(path, points, 0, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPolygonAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a polygon to the path with the second parameter's x-coordinate as an integer or character type, which will
    // succeed.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {DRAWING_NUMBER_100, 0};
    OH_Drawing_Point2D point3 = {DRAWING_NUMBER_100, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point4 = {0, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points[DRAWING_NUMBER_4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, DRAWING_NUMBER_4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a polygon to the path with the second parameter's y-coordinate as an integer or character type, which will
    // succeed.
    OH_Drawing_PathAddPolygon(path, points, DRAWING_NUMBER_4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Add a polygon to the path with the third parameter as a float or character type, which will succeed.
    OH_Drawing_PathAddPolygon(path, points, 4.0f, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddPolygonMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a polygon to the path with the second parameter's x-coordinate set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_Point2D point1 = {FLT_MAX + DRAWING_NUMBER_1, 0};
    OH_Drawing_Point2D point2 = {FLT_MAX + DRAWING_NUMBER_1, 0};
    OH_Drawing_Point2D point3 = {FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100};
    OH_Drawing_Point2D point4 = {FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_100};
    OH_Drawing_Point2D points[DRAWING_NUMBER_4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, DRAWING_NUMBER_4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a polygon to the path with the second parameter's y-coordinate set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_Point2D point5 = {0, FLT_MAX + DRAWING_NUMBER_1};
    OH_Drawing_Point2D point6 = {DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1};
    OH_Drawing_Point2D point7 = {DRAWING_NUMBER_100, FLT_MAX + DRAWING_NUMBER_1};
    OH_Drawing_Point2D point8 = {0, FLT_MAX + DRAWING_NUMBER_1};
    OH_Drawing_Point2D points2[DRAWING_NUMBER_4] = {point5, point6, point7, point8};
    OH_Drawing_PathAddPolygon(path, points2, DRAWING_NUMBER_4, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddCircleNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a circle to the path with the specified direction.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddCircleNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathAddCircle with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddCircle(nullptr, DRAWING_NUMBER_50, DRAWING_NUMBER_50, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddCircle with the second parameter as 0.00, which will fail without crashing.
    OH_Drawing_PathAddCircle(path, 0.00f, DRAWING_NUMBER_50, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 4. Call OH_Drawing_PathAddCircle with the third parameter as 0.00, which will fail without crashing.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, 0.00f, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Call OH_Drawing_PathAddCircle with the fourth parameter less than or equal to 0.00, expecting
    // OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE error code.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, 0.00f,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddCircleAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a circle to the path with the second parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, 50.0f, 10.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Add a circle to the path with the third parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, 50.0f, DRAWING_NUMBER_50, 10.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Add a circle to the path with the fourth parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, 50.0f, 50.0f, DRAWING_NUMBER_10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathAddCircleMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a circle to the path with the second parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_50, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Add a circle to the path with the third parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_10,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 6. Add a circle to the path with the fourth parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50, FLT_MAX + DRAWING_NUMBER_1,
        OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathBuildFromSvgStringNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Parse the path represented by the SVG string using OH_Drawing_PathBuildFromSvgString.
    const char *svgString = "M 0 0 L 100 100";
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

int TestPathBuildFromSvgStringNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    bool svgResult = OH_Drawing_PathBuildFromSvgString(nullptr, "M 0 0 L 100 100");
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(svgResult, false);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    svgResult = OH_Drawing_PathBuildFromSvgString(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(svgResult, false);
    // 4. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathContainsNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    EXPECT_EQ(OH_Drawing_PathContains(path, DRAWING_NUMBER_50, DRAWING_NUMBER_50), true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathContainsNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathContains with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    bool ret = OH_Drawing_PathContains(nullptr, DRAWING_NUMBER_50, DRAWING_NUMBER_50);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_PathContains with the second parameter as 0.00, the call fails without crashing.
    ret = OH_Drawing_PathContains(path, 0.0f, DRAWING_NUMBER_50);
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_PathContains with the third parameter as 0.00, the call fails without crashing.
    ret = OH_Drawing_PathContains(path, DRAWING_NUMBER_50, 0.0f);
    EXPECT_EQ(ret, false);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathContainsAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    bool ret = OH_Drawing_PathContains(path, DRAWING_NUMBER_50, 50.0f);
    EXPECT_EQ(ret, true);
    // 8. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    ret = OH_Drawing_PathContains(path, 50.0f, DRAWING_NUMBER_50);
    EXPECT_EQ(ret, true);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathContainsMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, DRAWING_NUMBER_100);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains with the second
    // parameter as FLT_MAX + 1.
    bool ret = OH_Drawing_PathContains(path, FLT_MAX + DRAWING_NUMBER_1, DRAWING_NUMBER_50);
    EXPECT_EQ(ret, false);
    // 8. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains with the third
    // parameter as FLT_MAX + 1.
    ret = OH_Drawing_PathContains(path, DRAWING_NUMBER_50, FLT_MAX + DRAWING_NUMBER_1);
    EXPECT_EQ(ret, false);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathTransformNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
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

int TestPathTransformNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Call OH_Drawing_PathTransform with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathTransform with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathTransformWithPerspectiveClipNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, DRAWING_NUMBER_1, 0, 0, 0, -DRAWING_NUMBER_1, 0, 0, 0, DRAWING_NUMBER_1);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 6. Transform the path using OH_Drawing_PathTransformWithPerspectiveClip, with the fourth parameter set to true.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathTransformWithPerspectiveClipNormal2()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 6. Transform the path using OH_Drawing_PathTransformWithPerspectiveClip, with the fourth parameter set to false.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathTransformWithPerspectiveClipNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(src, nullptr);
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 4. Call OH_Drawing_PathTransformWithPerspectiveClip with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransformWithPerspectiveClip(nullptr, matrix, dst, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. Call OH_Drawing_PathTransformWithPerspectiveClip with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransformWithPerspectiveClip(src, nullptr, dst, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Call OH_Drawing_PathTransformWithPerspectiveClip with a nullptr as the third parameter, no crash.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, nullptr, true);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathSetFillTypeNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Set the fill type of the path using OH_Drawing_PathSetFillType, with the second parameter iterating through
    // the enumeration.
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

int TestPathSetFillTypeNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathSetFillType with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathSetFillType(nullptr, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathSetFillType with a value that is not within the enumeration range as the second parameter,
    // expecting OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE error code.
    OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(-DRAWING_NUMBER_1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 4. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathSetFillTypeMultipleCalls()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Call OH_Drawing_PathSetFillType in a loop 10 times, iterating through the enumeration to set different fill
    // rules for the path.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(i));
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLengthNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Get the length of the current path by calling OH_Drawing_PathGetLength, with the second parameter set to true.
    float length = OH_Drawing_PathGetLength(path, true);
    EXPECT_NE(length, 0.0f);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLengthNormal2()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Get the length of the current path by calling OH_Drawing_PathGetLength, with the second parameter set to
    // false.
    float length = OH_Drawing_PathGetLength(path, false);
    EXPECT_NE(length, 0.0f);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetLengthNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathGetLength with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetLength(nullptr, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetBoundsNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Get the minimum bounding box that contains the path by calling OH_Drawing_PathGetBounds.
    OH_Drawing_PathGetBounds(path, rect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathGetBoundsNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 3. Call OH_Drawing_PathGetBounds with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetBounds(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Call OH_Drawing_PathGetBounds with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetBounds(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathCloseNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, 0);
    // 5. Close the path by adding a line segment from the last point of the path to the starting point.
    OH_Drawing_PathClose(path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathCloseNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathClose with nullptr as the parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER error
    // code.
    OH_Drawing_PathClose(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOffsetNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Offset all points in the path by a certain distance along the x and y axes, and store the result in the
    // destination path object using OH_Drawing_PathOffset.
    OH_Drawing_PathOffset(path, dst, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOffsetNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Call OH_Drawing_PathOffset with a nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathOffset(nullptr, dst, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathOffset with a nullptr as the second parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, nullptr, DRAWING_NUMBER_10, DRAWING_NUMBER_10);
    // 5. Call OH_Drawing_PathOffset with 0.00 as the third parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, dst, 0.00f, DRAWING_NUMBER_10);
    // 6. Call OH_Drawing_PathOffset with 0.00 as the fourth parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, dst, DRAWING_NUMBER_10, 0.00f);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOffsetAbnormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathOffset with an integer as the third parameter.
    OH_Drawing_PathOffset(path, dst, DRAWING_NUMBER_10, 10.0f);
    // 6. Call OH_Drawing_PathOffset with an integer as the fourth parameter.
    OH_Drawing_PathOffset(path, dst, 10.0f, DRAWING_NUMBER_10);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathOffsetMaximal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(dst, nullptr);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 5. Call OH_Drawing_PathOffset with the third parameter set to the maximum value FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, FLT_MAX + DRAWING_NUMBER_1, 10.0f);
    // 6. Call OH_Drawing_PathOffset with the fourth parameter set to the maximum value FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, 10.0f, FLT_MAX + DRAWING_NUMBER_1);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathResetNormal()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Reset the custom path data using OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathResetNull()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Call OH_Drawing_PathReset with nullptr as the parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER error
    // code.
    OH_Drawing_PathReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestPathResetMultipleCalls()
{
    DrawingNativePathPart2TestSetUp();
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    // 4. Reset the custom path data using OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // 5. Loop through steps 2 to 4 for 10 times to verify success.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_PathMoveTo(path, 0, 0);
        OH_Drawing_PathLineTo(path, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
        OH_Drawing_PathReset(path);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    DrawingNativePathPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS