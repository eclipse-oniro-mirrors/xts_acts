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
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1900
 * @tc.name: testPathAddArcNormal
 * @tc.desc: Test for adding an arc to a path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddArcNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, which serves as the starting point of the new contour.
    OH_Drawing_PathAddArc(path, rect, 0.0, 0.0);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1901
 * @tc.name: testPathAddArcNull
 * @tc.desc: Test for adding an arc to a path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddArcNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Call OH_Drawing_PathAddArc with a nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathAddArc(nullptr, rect, 0.0, 0.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddArc with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddArc(path, nullptr, 0.0, 0.0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddArc with 0.0 as the third parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, 0.0, 0.0);
    // 6. Call OH_Drawing_PathAddArc with 0.0 as the fourth parameter, expecting failure without crash.
    OH_Drawing_PathAddArc(path, rect, 0.0, 0.0);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1902
 * @tc.name: testPathAddArcAbnormal
 * @tc.desc: Test for adding an arc to a path with abnormal data types as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddArcAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the third
    // parameter.
    OH_Drawing_PathAddArc(path, rect, 30, 30.0f);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing an integer or character type as the fourth
    // parameter.
    OH_Drawing_PathAddArc(path, rect, 30.0f, 30);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_1903
 * @tc.name: testPathAddArcMaximal
 * @tc.desc: Test for adding an arc to a path with maximal values as parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddArcMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the third parameter, which will
    // fail without crashing.
    OH_Drawing_PathAddArc(path, rect, FLT_MAX + 1, 0.0);
    // 6. Add an arc to the path using OH_Drawing_PathAddArc, passing FLT_MAX + 1 as the fourth parameter, which will
    // fail without crashing.
    OH_Drawing_PathAddArc(path, rect, 0.0, FLT_MAX + 1);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2000
 * @tc.name: testPathAddPathNormal
 * @tc.desc: Test for adding a path to another path with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPath.
    OH_Drawing_PathAddPath(path, src, nullptr);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2001
 * @tc.name: testPathAddPathNull
 * @tc.desc: Test for adding a path to another path with NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Call OH_Drawing_PathAddPath with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_PathAddPath(nullptr, src, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2100
 * @tc.name: testPathAddPathWithMatrixAndModeNormal
 * @tc.desc: Test for adding a path to another path with matrix and mode transformations using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithMatrixAndModeNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithMatrixAndMode. The fourth
    // parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
        OH_Drawing_PathAddPathWithMatrixAndMode(path, src, matrix, modes[i]);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2101
 * @tc.name: testPathAddPathWithMatrixAndModeNull
 * @tc.desc: Test for adding a path to another path with matrix and mode transformations using NULL or invalid
 * parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithMatrixAndModeNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Call OH_Drawing_PathAddPathWithMatrixAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 5, 4, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_PathAddPathWithMatrixAndMode(nullptr, src, matrix, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2200
 * @tc.name: testPathAddPathWithModeNormal
 * @tc.desc: Test for adding a path to another path with mode transformations using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithModeNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Add the source path to the current path using OH_Drawing_PathAddPathWithMode. The third parameter enumerates
    // calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_PathAddPathWithMode(path, src, modes[i]);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2201
 * @tc.name: testPathAddPathWithModeNull
 * @tc.desc: Test for adding a path to another path with mode transformations using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithModeNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Call OH_Drawing_PathAddPathWithMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMode(nullptr, src, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddPathWithMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithMode(path, nullptr, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2300
 * @tc.name: testPathAddPathWithOffsetAndModeNormal
 * @tc.desc: Test for adding a path to another path with offset and mode transformations using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithOffsetAndModeNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Add the transformed source path to the current path using OH_Drawing_PathAddPathWithOffsetAndMode. The fifth
    // parameter enumerates calling this interface.
    OH_Drawing_PathAddMode modes[] = {PATH_ADD_MODE_APPEND, PATH_ADD_MODE_EXTEND};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0, 10.0, modes[i]);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2301
 * @tc.name: testPathAddPathWithOffsetAndModeNull
 * @tc.desc: Test for adding a path to another path with offset and mode transformations using NULL or invalid
 * parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithOffsetAndModeNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(nullptr, src, 10.0, 10.0, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddPathWithOffsetAndMode with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, nullptr, 10.0, 10.0, PATH_ADD_MODE_APPEND);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the third parameter, expecting failure without
    // crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 0.0, 10.0, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with 0.00 as the fourth parameter, expecting failure without
    // crash.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0, 0.0, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2302
 * @tc.name: testPathAddPathWithOffsetAndModeAbnormal
 * @tc.desc: Test for adding a path to another path with offset and mode transformations using abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithOffsetAndModeAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the third parameter, expecting successful
    // call.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10, 10.0f, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with an integer as the fourth parameter, expecting successful
    // call.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, 10, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(src);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2303
 * @tc.name: testPathAddPathWithOffsetAndModeMaximal
 * @tc.desc: Test for adding a path to another path with offset and mode transformations using maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPathWithOffsetAndModeMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo (create the source
    // path src).
    OH_Drawing_PathLineTo(src, 100, 100);
    // 5. Call OH_Drawing_PathAddPathWithOffsetAndMode with the third parameter as FLT_MAX + 1, without crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, FLT_MAX + 1, 10.0f, PATH_ADD_MODE_APPEND);
    // 6. Call OH_Drawing_PathAddPathWithOffsetAndMode with the fourth parameter as FLT_MAX + 1, without crashing.
    OH_Drawing_PathAddPathWithOffsetAndMode(path, src, 10.0f, FLT_MAX + 1, PATH_ADD_MODE_APPEND);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2400
 * @tc.name: testPathAddOvalNormal
 * @tc.desc: Test for adding an oval to a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add an oval to the path with the specified direction using OH_Drawing_PathAddOval. The third parameter
    // enumerates calling this interface.
    OH_Drawing_PathDirection directions[] = {PATH_DIRECTION_CW, PATH_DIRECTION_CCW};
    for (int i = 0; i < 2; i++) {
        OH_Drawing_PathAddOval(path, rect, directions[i]);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2401
 * @tc.name: testPathAddOvalNull
 * @tc.desc: Test for adding an oval to a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddOvalNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Call OH_Drawing_PathAddOval with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddOval(nullptr, rect, PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddOval with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddOval(path, nullptr, PATH_DIRECTION_CW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2500
 * @tc.name: testPathAddPolygonNormal
 * @tc.desc: Test for adding a polygon to a path with the fourth parameter set to true.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPolygonNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a polygon to the path. Set the fourth parameter to true.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {100, 0};
    OH_Drawing_Point2D point3 = {100, 100};
    OH_Drawing_Point2D point4 = {0, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, 4, true);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2501
 * @tc.name: testPathAddPolygonNormal2
 * @tc.desc: Test for adding a polygon to a path with the fourth parameter set to false.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddPolygonNormal2, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a polygon to the path. Set the fourth parameter to false.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {100, 0};
    OH_Drawing_Point2D point3 = {100, 100};
    OH_Drawing_Point2D point4 = {0, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, 4, false);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2502
 * @tc.name: testPathAddPolygonNull
 * @tc.desc: Test for adding a polygon to a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPolygonNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {100, 0};
    OH_Drawing_Point2D point3 = {100, 100};
    OH_Drawing_Point2D point4 = {0, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};
    // 2. Call OH_Drawing_PathAddPolygon with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(nullptr, points, 4, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddPolygon with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddPolygon(path, nullptr, 4, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathAddPolygon with the third parameter as 0, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathAddPolygon(path, points, 0, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2503
 * @tc.name: testPathAddPolygonAbnormal
 * @tc.desc: Test for adding a polygon to a path using abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPolygonAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a polygon to the path with the second parameter's x-coordinate as an integer or character type, which will
    // succeed.
    OH_Drawing_Point2D point1 = {0, 0};
    OH_Drawing_Point2D point2 = {100, 0};
    OH_Drawing_Point2D point3 = {100, 100};
    OH_Drawing_Point2D point4 = {0, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, 4, true);
    // 5. Add a polygon to the path with the second parameter's y-coordinate as an integer or character type, which will
    // succeed.
    OH_Drawing_PathAddPolygon(path, points, 4, true);
    // 6. Add a polygon to the path with the third parameter as a float or character type, which will succeed.
    OH_Drawing_PathAddPolygon(path, points, 4.0f, true);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2504
 * @tc.name: testPathAddPolygonMaximal
 * @tc.desc: Test for adding a polygon to a path using maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddPolygonMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a polygon to the path with the second parameter's x-coordinate set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_Point2D point1 = {FLT_MAX + 1, 0};
    OH_Drawing_Point2D point2 = {FLT_MAX + 1, 0};
    OH_Drawing_Point2D point3 = {FLT_MAX + 1, 100};
    OH_Drawing_Point2D point4 = {FLT_MAX + 1, 100};
    OH_Drawing_Point2D points[4] = {point1, point2, point3, point4};
    OH_Drawing_PathAddPolygon(path, points, 4, true);
    // 5. Add a polygon to the path with the second parameter's y-coordinate set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_Point2D point5 = {0, FLT_MAX + 1};
    OH_Drawing_Point2D point6 = {100, FLT_MAX + 1};
    OH_Drawing_Point2D point7 = {100, FLT_MAX + 1};
    OH_Drawing_Point2D point8 = {0, FLT_MAX + 1};
    OH_Drawing_Point2D points2[4] = {point5, point6, point7, point8};
    OH_Drawing_PathAddPolygon(path, points2, 4, true);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2600
 * @tc.name: testPathAddCircleNormal
 * @tc.desc: Test for adding a circle to a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathAddCircleNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a circle to the path with the specified direction.
    OH_Drawing_PathAddCircle(path, 50, 50, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2601
 * @tc.name: testPathAddCircleNull
 * @tc.desc: Test for adding a circle to a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddCircleNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathAddCircle with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathAddCircle(nullptr, 50, 50, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathAddCircle with the second parameter as 0.00, which will fail without crashing.
    OH_Drawing_PathAddCircle(path, 0.00, 50, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 4. Call OH_Drawing_PathAddCircle with the third parameter as 0.00, which will fail without crashing.
    OH_Drawing_PathAddCircle(path, 50, 0.00, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Call OH_Drawing_PathAddCircle with the fourth parameter less than or equal to 0.00, expecting
    // OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE error code.
    OH_Drawing_PathAddCircle(path, 50, 50, 0.00, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2602
 * @tc.name: testPathAddCircleAbnormal
 * @tc.desc: Test for adding a circle to a path using abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddCircleAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a circle to the path with the second parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, 50, 50.0f, 10.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Add a circle to the path with the third parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, 50.0f, 50, 10.0f, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 6. Add a circle to the path with the fourth parameter as an integer, which will succeed.
    OH_Drawing_PathAddCircle(path, 50.0f, 50.0f, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2603
 * @tc.name: testPathAddCircleMaximal
 * @tc.desc: Test for adding a circle to a path using maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathAddCircleMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a circle to the path with the second parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, FLT_MAX + 1, 50, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 5. Add a circle to the path with the third parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, 50, FLT_MAX + 1, 10, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 6. Add a circle to the path with the fourth parameter set to FLT_MAX + 1, no crash occurs.
    OH_Drawing_PathAddCircle(path, 50, 50, FLT_MAX + 1, OH_Drawing_PathDirection::PATH_DIRECTION_CCW);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2700
 * @tc.name: testPathBuildFromSvgStringNormal
 * @tc.desc: Test for building a path from an SVG string using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathBuildFromSvgStringNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Parse the path represented by the SVG string using OH_Drawing_PathBuildFromSvgString.
    const char *svgString = "M 0 0 L 100 100";
    OH_Drawing_PathBuildFromSvgString(path, svgString);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2701
 * @tc.name: testPathBuildFromSvgStringNull
 * @tc.desc: Test for building a path from an SVG string using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathBuildFromSvgStringNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathBuildFromSvgString(nullptr, "M 0 0 L 100 100");
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathBuildFromSvgString with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathBuildFromSvgString(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2800
 * @tc.name: testPathContainsNormal
 * @tc.desc: Test for checking if a path contains a specified point using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathContainsNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    EXPECT_EQ(OH_Drawing_PathContains(path, 50, 50), true);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2801
 * @tc.name: testPathContainsNull
 * @tc.desc: Test for checking if a path contains a specified point using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathContainsNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathContains with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathContains(nullptr, 50, 50);
    // 3. Call OH_Drawing_PathContains with the second parameter as 0.00, the call fails without crashing.
    OH_Drawing_PathContains(path, 0.0, 50);
    // 4. Call OH_Drawing_PathContains with the third parameter as 0.00, the call fails without crashing.
    OH_Drawing_PathContains(path, 50, 0.0);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2802
 * @tc.name: testPathContainsAbnormal
 * @tc.desc: Test for checking if a path contains a specified point using abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathContainsAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    OH_Drawing_PathContains(path, 50, 50.0f);
    // 8. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains.
    OH_Drawing_PathContains(path, 50.0f, 50);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2803
 * @tc.name: testPathContainsMaximal
 * @tc.desc: Test for checking if a path contains a specified point using maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathContainsMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 100);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains with the second
    // parameter as FLT_MAX + 1.
    OH_Drawing_PathContains(path, FLT_MAX + 1, 50);
    // 8. Check if the specified coordinates are contained in the path using OH_Drawing_PathContains with the third
    // parameter as FLT_MAX + 1.
    OH_Drawing_PathContains(path, 50, FLT_MAX + 1);
    // 9. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2900
 * @tc.name: testPathTransformNormal
 * @tc.desc: Test for transforming a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathTransformNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Transform the path using OH_Drawing_PathTransform.
    OH_Drawing_PathTransform(path, matrix);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_2901
 * @tc.name: testPathTransformNull
 * @tc.desc: Test for transforming a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathTransformNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Call OH_Drawing_PathTransform with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathTransform with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransform(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3000
 * @tc.name: testPathTransformWithPerspectiveClipNormal
 * @tc.desc: Test for transforming a path with perspective clip using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathTransformWithPerspectiveClipNormal, TestSize.Level0) {
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, 100, 100);
    // 6. Transform the path using OH_Drawing_PathTransformWithPerspectiveClip, with the fourth parameter set to true.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, true);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3001
 * @tc.name: testPathTransformWithPerspectiveClipNormal2
 * @tc.desc: Test for transforming a path with perspective clip using normal parameters with false perspective clip.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathTransformWithPerspectiveClipNormal2, TestSize.Level0) {
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 4. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(src, 0, 0);
    // 5. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(src, 100, 100);
    // 6. Transform the path using OH_Drawing_PathTransformWithPerspectiveClip, with the fourth parameter set to false.
    OH_Drawing_PathTransformWithPerspectiveClip(src, matrix, dst, false);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(src);
    OH_Drawing_PathDestroy(dst);
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3002
 * @tc.name: testPathTransformWithPerspectiveClipNull
 * @tc.desc: Test for transforming a path with perspective clip using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathTransformWithPerspectiveClipNull, TestSize.Level3) {
    // 1. Create a path object src using OH_Drawing_PathCreate.
    OH_Drawing_Path *src = OH_Drawing_PathCreate();
    // 2. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // 3. Create a path object dst using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 4. Call OH_Drawing_PathTransformWithPerspectiveClip with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathTransformWithPerspectiveClip(nullptr, matrix, dst, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3100
 * @tc.name: testPathSetFillTypeNormal
 * @tc.desc: Test for setting fill type of a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathSetFillTypeNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Set the fill type of the path using OH_Drawing_PathSetFillType, with the second parameter iterating through
    // the enumeration.
    OH_Drawing_PathSetFillType(path, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3101
 * @tc.name: testPathSetFillTypeNull
 * @tc.desc: Test for setting fill type of a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathSetFillTypeNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathSetFillType with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathSetFillType(nullptr, OH_Drawing_PathFillType::PATH_FILL_TYPE_WINDING);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_PathSetFillType with a value that is not within the enumeration range as the second parameter,
    // expecting OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE error code.
    OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(-1));
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 4. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3102
 * @tc.name: testPathSetFillTypeMultipleCalls
 * @tc.desc: Test for setting fill type of a path with multiple calls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathSetFillTypeMultipleCalls, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 0, 0);
    // 6. Close the path using OH_Drawing_PathClose.
    OH_Drawing_PathClose(path);
    // 7. Call OH_Drawing_PathSetFillType in a loop 10 times, iterating through the enumeration to set different fill
    // rules for the path.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PathSetFillType(path, static_cast<OH_Drawing_PathFillType>(i));
    }
    // 8. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3200
 * @tc.name: testPathGetLengthNormal
 * @tc.desc: Test for getting the length of a path using normal parameters with detailed length.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathGetLengthNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the length of the current path by calling OH_Drawing_PathGetLength, with the second parameter set to true.
    float length = OH_Drawing_PathGetLength(path, true);
    EXPECT_NE(length, 0.0f);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3201
 * @tc.name: testPathGetLengthNormal2
 * @tc.desc: Test for getting the length of a path using normal parameters without detailed length.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathGetLengthNormal2, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Get the length of the current path by calling OH_Drawing_PathGetLength, with the second parameter set to
    // false.
    float length = OH_Drawing_PathGetLength(path, false);
    EXPECT_NE(length, 0.0f);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3202
 * @tc.name: testPathGetLengthNull
 * @tc.desc: Test for getting the length of a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathGetLengthNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathGetLength with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetLength(nullptr, true);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3300
 * @tc.name: testPathGetBoundsNormal
 * @tc.desc: Test for getting the bounds of a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathGetBoundsNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Get the minimum bounding box that contains the path by calling OH_Drawing_PathGetBounds.
    OH_Drawing_PathGetBounds(path, rect);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3301
 * @tc.name: testPathGetBoundsNull
 * @tc.desc: Test for getting the bounds of a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathGetBoundsNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a rectangle object using OH_Drawing_RectCreate.
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 3. Call OH_Drawing_PathGetBounds with a nullptr as the first parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetBounds(nullptr, rect);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathGetBounds with a nullptr as the second parameter, expecting
    // OH_DRAWING_ERROR_INVALID_PARAMETER error code.
    OH_Drawing_PathGetBounds(path, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3400
 * @tc.name: testPathCloseNormal
 * @tc.desc: test for testPathCloseNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathCloseNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Add a line segment from the last point of the path to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 0);
    // 5. Close the path by adding a line segment from the last point of the path to the starting point.
    OH_Drawing_PathClose(path);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3401
 * @tc.name: testPathCloseNull
 * @tc.desc: Test for closing a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathCloseNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathClose with nullptr as the parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER error
    // code.
    OH_Drawing_PathClose(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3500
 * @tc.name: testPathOffsetNormal
 * @tc.desc: Test for offsetting a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathOffsetNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Offset all points in the path by a certain distance along the x and y axes, and store the result in the
    // destination path object using OH_Drawing_PathOffset.
    OH_Drawing_PathOffset(path, dst, 10, 10);
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3501
 * @tc.name: testPathOffsetNull
 * @tc.desc: Test for offsetting a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathOffsetNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 3. Call OH_Drawing_PathOffset with a nullptr as the first parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER
    // error code.
    OH_Drawing_PathOffset(nullptr, dst, 10, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Call OH_Drawing_PathOffset with a nullptr as the second parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, nullptr, 10, 10);
    // 5. Call OH_Drawing_PathOffset with 0.00 as the third parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, dst, 0.00, 10);
    // 6. Call OH_Drawing_PathOffset with 0.00 as the fourth parameter, expecting failure without crashing.
    OH_Drawing_PathOffset(path, dst, 10, 0.00);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3502
 * @tc.name: testPathOffsetAbnormal
 * @tc.desc: Test for offsetting a path with abnormal parameters (non-float values).
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathOffsetAbnormal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Call OH_Drawing_PathOffset with an integer as the third parameter.
    OH_Drawing_PathOffset(path, dst, 10, 10.0f);
    // 6. Call OH_Drawing_PathOffset with an integer as the fourth parameter.
    OH_Drawing_PathOffset(path, dst, 10.0f, 10);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3503
 * @tc.name: testPathOffsetMaximal
 * @tc.desc: Test for offsetting a path with maximal values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathOffsetMaximal, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *dst = OH_Drawing_PathCreate();
    // 3. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 4. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 5. Call OH_Drawing_PathOffset with the third parameter set to the maximum value FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, FLT_MAX + 1, 10.0f);
    // 6. Call OH_Drawing_PathOffset with the fourth parameter set to the maximum value FLT_MAX + 1.
    OH_Drawing_PathOffset(path, dst, 10.0f, FLT_MAX + 1);
    // 7. Free the memory.
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(dst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3600
 * @tc.name: testPathResetNormal
 * @tc.desc: Test for resetting a path using normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativePathTest, testPathResetNormal, TestSize.Level0) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Reset the custom path data using OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // 5. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3601
 * @tc.name: testPathResetNull
 * @tc.desc: Test for resetting a path using NULL or invalid parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathResetNull, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Call OH_Drawing_PathReset with nullptr as the parameter, expecting OH_DRAWING_ERROR_INVALID_PARAMETER error
    // code.
    OH_Drawing_PathReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free the memory.
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_3602
 * @tc.name: testPathResetMultipleCalls
 * @tc.desc: Test for resetting a path with multiple calls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativePathTest, testPathResetMultipleCalls, TestSize.Level3) {
    // 1. Create a path object using OH_Drawing_PathCreate.
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    // 2. Set the starting point of the path using OH_Drawing_PathMoveTo.
    OH_Drawing_PathMoveTo(path, 0, 0);
    // 3. Add a line segment from the starting point to the target point using OH_Drawing_PathLineTo.
    OH_Drawing_PathLineTo(path, 100, 100);
    // 4. Reset the custom path data using OH_Drawing_PathReset.
    OH_Drawing_PathReset(path);
    // 5. Loop through steps 2 to 4 for 10 times to verify success.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_PathMoveTo(path, 0, 0);
        OH_Drawing_PathLineTo(path, 100, 100);
        OH_Drawing_PathReset(path);
    }
    // 6. Free the memory.
    OH_Drawing_PathDestroy(path);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS