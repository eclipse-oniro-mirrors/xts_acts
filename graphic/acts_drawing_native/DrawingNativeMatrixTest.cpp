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

#include "DrawingNativeMatrixCommon.h"
#include "drawing_error_code.h"
#include "drawing_matrix.h"
#include "drawing_rect.h"
#include "utils/scalar.h"
#include "gtest/gtest.h"
#include <iostream>
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMatrixTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeMatrixTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMatrixTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeMatrixTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMatrixTest errorCodeReset after each test case." << std::endl;
    }
};
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0100
 * @tc.name: testMatrixCreateDestroyNormal
 * @tc.desc: Test for creating and destroying a matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixDestroy
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0101
 * @tc.name: testMatrixCreateDestroyNULL
 * @tc.desc: Test for creating and destroying a matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyNULL, TestSize.Level3) {
    // 1. OH_Drawing_MatrixDestroy with nullptr parameter
    OH_Drawing_MatrixDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0102
 * @tc.name: testMatrixCreateDestroyMultipleCalls
 * @tc.desc: Test for multiple calls of creating and destroying a matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateDestroyMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixCreate 10 times
    OH_Drawing_Matrix *matrices[10];
    for (int i = 0; i < 10; i++) {
        matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrices[i], nullptr);
    }
    // 2. Call OH_Drawing_MatrixDestroy 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixDestroy(matrices[i]);
    }
    // 3. Call OH_Drawing_MatrixCreate and OH_Drawing_MatrixDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0200
 * @tc.name: testMatrixCreateRotationNormal
 * @tc.desc: Test for creating a rotation matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreateRotation, rotate angles deg traverse 0 degrees, 180 degrees, 360 degrees, -90 degrees,
    // -180 degrees, -360 degrees, 45.5 degrees, x\y cover decimals and integers
    float degs[] = {0, 180, 360, -90, -180, -360, 45.5};
    float x[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    float y[] = {0, 10, 10.0f, 20, 20.0f, 30, 30.0f};
    for (int i = 0; i < 7; i++) {
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degs[i], x[i], y[i]);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0201
 * @tc.name: testMatrixCreateRotationNull
 * @tc.desc: Test for creating a rotation matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(0, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, 0, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(360, 10.0f, 0);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0202
 * @tc.name: testMatrixCreateRotationAbnormal
 * @tc.desc: Test for creating a rotation matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with an input angle greater than 360 degrees
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(361, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with a negative value for the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, -10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with a negative value for the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, -10.0f);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0203
 * @tc.name: testMatrixCreateRotationMaximum
 * @tc.desc: Test for creating a rotation matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateRotation with the maximum value of the rotation angle parameter deg
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(FLT_MAX, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateRotation with the maximum value of the x parameter
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateRotation(180, FLT_MAX, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateRotation with the maximum value of the y parameter
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateRotation(180, 10.0f, FLT_MAX);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0205
 * @tc.name: testMatrixCreateRotationMultipleCalls
 * @tc.desc: Test for multiple calls of creating a rotation matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateRotationMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixCreateRotation 10 times, each time with different rotation angles and coordinate points
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> deg_dist(-360, 360);
    std::uniform_real_distribution<float> x_dist(0.0f, 100.0f);
    std::uniform_real_distribution<float> y_dist(0.0f, 100.0f);
    for (int i = 0; i < 10; i++) {
        float deg = deg_dist(gen);
        float x = x_dist(gen);
        float y = y_dist(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(deg, x, y);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0300
 * @tc.name: testMatrixCreateTranslationNormal
 * @tc.desc: Test for creating a translation matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreateTranslation, passing in a decimal number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation, passing in an integer
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(20, 20);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0301
 * @tc.name: testMatrixCreateTranslationNull
 * @tc.desc: Test for creating a translation matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(0, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, 0);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0302
 * @tc.name: testMatrixCreateTranslationAbnormal
 * @tc.desc: Test for creating a translation matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(-10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, -10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0303
 * @tc.name: testMatrixCreateTranslationMaximum
 * @tc.desc: Test for creating a translation matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateTranslation with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(FLT_MAX, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateTranslation with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateTranslation(10.0f, FLT_MAX);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0304
 * @tc.name: testMatrixCreateTranslationMultipleCalls
 * @tc.desc: Test for multiple calls of creating a translation matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateTranslationMultipleCalls, TestSize.Level3) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    // 1. Call OH_Drawing_MatrixCreateTranslation 10 times, each time with different random values for dx and dy
    for (int i = 0; i < 10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(dx, dy);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0400
 * @tc.name: testMatrixMatrixSetGetMatrixNormal
 * @tc.desc: Test for setting and getting matrix values with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with integer parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1);
    // 3. OH_Drawing_MatrixSetMatrix with floating-point parameters, calling OH_Drawing_MatrixGetAll and
    // OH_Drawing_MatrixGetValue interfaces
    OH_Drawing_MatrixSetMatrix(matrix, 1.1, 0, 0, 0, -1.1, 0, 0, 0, 1.1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixGetValue(matrix, 1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), 0);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0401
 * @tc.name: testMatrixMatrixSetGetMatrixNull
 * @tc.desc: Test for setting and getting matrix values with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetMatrix(nullptr, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as null
    OH_Drawing_MatrixSetMatrix(matrix, 0, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 0, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 0, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 0, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 0, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 0, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 0, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, 0);
    // 4. OH_Drawing_MatrixGetAll with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    float value[9];
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(nullptr, value);
    EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_MatrixGetAll with the second parameter as an empty array, check the error code with
    // OH_Drawing_ErrorCodeGet
    float value2[0];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 6. OH_Drawing_MatrixGetAll with the second parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ErrorCode code3 = OH_Drawing_MatrixGetAll(matrix, nullptr);
    EXPECT_EQ(code3, OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. OH_Drawing_MatrixGetValue with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(nullptr, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. OH_Drawing_MatrixGetValue with the second parameter as null
    OH_Drawing_MatrixGetValue(matrix, 0);
    // 9. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0402
 * @tc.name: testMatrixMatrixSetGetMatrixAbnormal
 * @tc.desc: Test for setting and getting matrix values with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as negative numbers
    OH_Drawing_MatrixSetMatrix(matrix, -1, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, -1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, -1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, -1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, -1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, -1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, -1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, -1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, -1);
    // 3. OH_Drawing_MatrixGetAll with an array 'value' of length less than 9
    float value2[9];
    OH_Drawing_ErrorCode code2 = OH_Drawing_MatrixGetAll(matrix, value2);
    EXPECT_EQ(code2, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_MatrixGetValue with the parameter 'index' as -1, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 5. OH_Drawing_MatrixGetValue with the parameter 'index' as 9, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixGetValue(matrix, 9);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0403
 * @tc.name: testMatrixMatrixSetGetMatrixMaximum
 * @tc.desc: Test for setting and getting matrix values with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixSetMatrix with the second to tenth parameters as maximum values
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, FLT_MAX, 1, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, FLT_MAX, 1, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, FLT_MAX, 1, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, FLT_MAX, 1, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, FLT_MAX, 1, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, FLT_MAX, 1, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, FLT_MAX, 1, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, FLT_MAX, 1);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 1, 1, 1, 1, 1, 1, 1, FLT_MAX);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0404
 * @tc.name: testMatrixMatrixSetGetMatrixMultipleCalls
 * @tc.desc: Test for multiple calls of setting and getting matrix values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixMatrixSetGetMatrixMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetMatrix with random parameters, calling the interface 10 times, corresponding to calling
    // OH_Drawing_MatrixGetAll and OH_Drawing_MatrixGetValue interfaces
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float value[9];
        float val0 = dis(gen);
        float val1 = dis(gen);
        float val2 = dis(gen);
        float val3 = dis(gen);
        float val4 = dis(gen);
        float val5 = dis(gen);
        float val6 = dis(gen);
        float val7 = dis(gen);
        float val8 = dis(gen);
        OH_Drawing_MatrixSetMatrix(matrix, val0, val1, val2, val3, val4, val5, val6, val7, val8);
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, value);
        EXPECT_EQ(code, OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), val0);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), val1);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), val2);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), val3);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), val4);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), val5);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), val6);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), val7);
        EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), val8);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0500
 * @tc.name: testMatrixTranslateNormal
 * @tc.desc: Test for translating a matrix with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in floating point numbers
    OH_Drawing_MatrixTranslate(matrix, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixTranslate, passing in integers
    OH_Drawing_MatrixTranslate(matrix, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0501
 * @tc.name: testMatrixTranslateNull
 * @tc.desc: Test for translating a matrix with NULL parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixTranslate(nullptr, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixTranslate with the second parameter as null
    OH_Drawing_MatrixTranslate(matrix, 0, 10.0f);
    // 4. OH_Drawing_MatrixTranslate with the third parameter as null
    OH_Drawing_MatrixTranslate(matrix, 10.0f, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0502
 * @tc.name: testMatrixTranslateAbnormal
 * @tc.desc: Test for translating a matrix with abnormal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, -10.0f, 10.0f);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as a negative number
    OH_Drawing_MatrixTranslate(matrix, 10.0f, -10.0f);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0503
 * @tc.name: testMatrixTranslateMaximum
 * @tc.desc: Test for translating a matrix with maximum values.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, FLT_MAX, 10.0f);
    // 3. OH_Drawing_MatrixTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixTranslate(matrix, 10.0f, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0504
 * @tc.name: testMatrixTranslateMultipleCalls
 * @tc.desc: Test for multiple calls of translating a matrix.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixTranslateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixTranslate, passing in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0600
 * @tc.name: testMatrixRotateNormal
 * @tc.desc: test for testMatrixRotateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixRotateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180 degrees,
    // -360 degrees, and 45.5 degrees, px and py cover both decimals and integers
    OH_Drawing_MatrixRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, 180, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, 360, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -90, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -180, 20.0f, 20.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, -360, 30, 30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixRotate(matrix, 45.5, 30.0f, 30.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0601
 * @tc.name: testMatrixRotateNull
 * @tc.desc: test for testMatrixRotateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixRotateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the first parameter as null, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixRotate(nullptr, 180, 10, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixRotate with the second parameter as null
    OH_Drawing_MatrixRotate(matrix, 0, 10, 10);
    // 4. OH_Drawing_MatrixRotate with the third parameter as null
    OH_Drawing_MatrixRotate(matrix, 180, 0, 10);
    // 5. OH_Drawing_MatrixRotate with the fourth parameter as null
    OH_Drawing_MatrixRotate(matrix, 180, 10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0602
 * @tc.name: testMatrixRotateAbnormal
 * @tc.desc: test for testMatrixRotateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixRotateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the third parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, 180, -10, 10);
    // 3. OH_Drawing_MatrixRotate with the fourth parameter as a negative number
    OH_Drawing_MatrixRotate(matrix, 180, 10, -10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0603
 * @tc.name: testMatrixRotateMaximum
 * @tc.desc: test for testMatrixRotateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixRotateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate with the second parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, FLT_MAX, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixRotate with the third parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, 180, FLT_MAX, 10.0f);
    // 4. OH_Drawing_MatrixRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixRotate(matrix, 180, 10.0f, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0604
 * @tc.name: testMatrixRotateMultipleCalls
 * @tc.desc: test for testMatrixRotateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixRotateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixRotate, passing in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0700
 * @tc.name: testMatrixCreateScaleNormal
 * @tc.desc: test for testMatrixCreateScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateScaleNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreateScale, passing in decimals
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, 10.0f, 10.0f);
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale, passing in integers
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(20, 20, 20, 20);
    EXPECT_NE(matrix2, nullptr);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0701
 * @tc.name: testMatrixCreateScaleNull
 * @tc.desc: test for testMatrixCreateScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateScaleNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as null
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(0, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as null
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(10.0f, 0, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as null
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, 0, 10.0f);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as null
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, 10.0f, 0);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0702
 * @tc.name: testMatrixCreateScaleAbnormal
 * @tc.desc: test for testMatrixCreateScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateScaleAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as a negative number
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(-10.0f, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as a negative number
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(10.0f, -10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as a negative number
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, -10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as a negative number
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, 10.0f, -10.0f);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0703
 * @tc.name: testMatrixCreateScaleMaximum
 * @tc.desc: test for testMatrixCreateScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateScaleMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreateScale with the first parameter as the maximum value
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(FLT_MAX, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixCreateScale with the second parameter as the maximum value
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreateScale(10.0f, FLT_MAX, 10.0f, 10.0f);
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 3. OH_Drawing_MatrixCreateScale with the third parameter as the maximum value
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, FLT_MAX, 10.0f);
    // add assert
    EXPECT_NE(matrix3, nullptr);
    // 4. OH_Drawing_MatrixCreateScale with the fourth parameter as the maximum value
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreateScale(10.0f, 10.0f, 10.0f, FLT_MAX);
    // add assert
    EXPECT_NE(matrix4, nullptr);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0704
 * @tc.name: testMatrixCreateScaleMultipleCalls
 * @tc.desc: test for testMatrixCreateScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixCreateScaleMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_MatrixCreateScale 10 times with random numbers for sx, sy, px, and py, and ensure successful
    // execution
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(sx, sy, px, py);
        EXPECT_NE(matrix, nullptr);
        OH_Drawing_MatrixDestroy(matrix);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0800
 * @tc.name: testMatrixScaleNormal
 * @tc.desc: test for testMatrixScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixScaleNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale, passing in decimals
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixScale, passing in integers
    OH_Drawing_MatrixScale(matrix, 20, 20, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0801
 * @tc.name: testMatrixScaleNull
 * @tc.desc: test for testMatrixScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixScaleNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the first parameter as null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixScale(nullptr, 10.0f, 10.0f, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixScale with the second parameter as null
    OH_Drawing_MatrixScale(matrix, 0, 10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixScale with the third parameter as null
    OH_Drawing_MatrixScale(matrix, 10.0f, 0, 10.0f, 10.0f);
    // 5. OH_Drawing_MatrixScale with the fourth parameter as null
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, 0, 10.0f);
    // 6. OH_Drawing_MatrixScale with the fifth parameter as null
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, 10.0f, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0802
 * @tc.name: testMatrixScaleAbnormal
 * @tc.desc: test for testMatrixScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixScaleAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as a negative number
    OH_Drawing_MatrixScale(matrix, -10.0f, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixScale with the third parameter as a negative number
    OH_Drawing_MatrixScale(matrix, 10.0f, -10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, -10.0f, 10.0f);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as a negative number
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, 10.0f, -10.0f);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0803
 * @tc.name: testMatrixScaleMaximum
 * @tc.desc: test for testMatrixScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixScaleMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixScale with the second parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, FLT_MAX, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixScale with the third parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, 10.0f, FLT_MAX, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, FLT_MAX, 10.0f);
    // 5. OH_Drawing_MatrixScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixScale(matrix, 10.0f, 10.0f, 10.0f, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0804
 * @tc.name: testMatrixScaleMultipleCalls
 * @tc.desc: test for testMatrixScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixScaleMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times with random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0900
 * @tc.name: testMatrixSetRectToRectNormal
 * @tc.desc: test for testMatrixSetRectToRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetRectToRectNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Enumerate OH_Drawing_ScaleToFit values in OH_Drawing_MatrixSetRectToRect
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(0, 0, 200, 200);
    OH_Drawing_ScaleToFit fitList[] = {
        SCALE_TO_FIT_FILL,
        SCALE_TO_FIT_START,
        SCALE_TO_FIT_CENTER,
        SCALE_TO_FIT_END,
    };
    for (OH_Drawing_ScaleToFit fit : fitList) {
        bool isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, rectDst, fit);
        EXPECT_EQ(isSuccess, true);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0901
 * @tc.name: testMatrixSetRectToRectNull
 * @tc.desc: test for testMatrixSetRectToRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetRectToRectNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rectSrc, nullptr);
    OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(0, 0, 0, 0);
    // add assert
    EXPECT_NE(rectDst, nullptr);
    // 2. OH_Drawing_MatrixSetRectToRect, the first parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetRectToRect(nullptr, rectSrc, rectDst, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixSetRectToRect, the second parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetRectToRect(matrix, nullptr, rectDst, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixSetRectToRect, the third parameter is null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, nullptr, SCALE_TO_FIT_FILL);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(rectSrc);
    OH_Drawing_RectDestroy(rectDst);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_0902
 * @tc.name: testMatrixSetRectToRectMultipleCalls
 * @tc.desc: test for testMatrixSetRectToRectMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixSetRectToRectMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetRectToRect 10 times with random enum values and different rect sizes
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    OH_Drawing_ScaleToFit fitList[] = {
        SCALE_TO_FIT_FILL,
        SCALE_TO_FIT_START,
        SCALE_TO_FIT_CENTER,
        SCALE_TO_FIT_END,
    };
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Rect *rectSrc = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + 100, dis(gen) + 100);
        OH_Drawing_Rect *rectDst = OH_Drawing_RectCreate(dis(gen), dis(gen), dis(gen) + 200, dis(gen) + 200);
        OH_Drawing_ScaleToFit fit = fitList[i % 4];
        bool isSuccess = OH_Drawing_MatrixSetRectToRect(matrix, rectSrc, rectDst, fit);
        EXPECT_EQ(isSuccess, true);
        OH_Drawing_RectDestroy(rectSrc);
        OH_Drawing_RectDestroy(rectDst);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1000
 * @tc.name: testMatrixPreRotateNormal
 * @tc.desc: test for testMatrixPreRotateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreRotateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180
    // degrees, -360 degrees, and 45.5 degrees, px and py cover both decimals and integers
    OH_Drawing_MatrixPreRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, 180, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, 360, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -90, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -180, 20.0f, 20.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, -360, 30, 30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPreRotate(matrix, 45.5, 30.0f, 30.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1001
 * @tc.name: testMatrixPreRotateNull
 * @tc.desc: test for testMatrixPreRotateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreRotateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreRotate(nullptr, 180, 10, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreRotate with the second parameter as null
    OH_Drawing_MatrixPreRotate(matrix, 0, 10, 10);
    // 4. OH_Drawing_MatrixPreRotate with the third parameter as null
    OH_Drawing_MatrixPreRotate(matrix, 180, 0, 10);
    // 5. OH_Drawing_MatrixPreRotate with the fourth parameter as null
    OH_Drawing_MatrixPreRotate(matrix, 180, 10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1002
 * @tc.name: testMatrixPreRotateAbnormal
 * @tc.desc: test for testMatrixPreRotateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreRotateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with a negative value for the third parameter
    OH_Drawing_MatrixPreRotate(matrix, 180, -10, 10);
    // 3. OH_Drawing_MatrixPreRotate with a negative value for the fourth parameter
    OH_Drawing_MatrixPreRotate(matrix, 180, 10, -10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1003
 * @tc.name: testMatrixPreRotateMaximum
 * @tc.desc: test for testMatrixPreRotateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreRotateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, FLT_MAX, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPreRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, 180, FLT_MAX, 10.0f);
    // 4. OH_Drawing_MatrixPreRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreRotate(matrix, 180, 10.0f, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1004
 * @tc.name: testMatrixPreRotateMultipleCalls
 * @tc.desc: test for testMatrixPreRotateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreRotateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreRotate, pass in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPreRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1100
 * @tc.name: testMatrixPreScaleNormal
 * @tc.desc: test for testMatrixPreScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreScaleNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, pass in decimals
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreScale, pass in integers
    OH_Drawing_MatrixPreScale(matrix, 20, 20, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1101
 * @tc.name: testMatrixPreScaleNull
 * @tc.desc: test for testMatrixPreScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreScaleNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPreScale(nullptr, 10.0f, 10.0f, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreScale, the second parameter is null
    OH_Drawing_MatrixPreScale(matrix, 0, 10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPreScale, the third parameter is null
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 0, 10.0f, 10.0f);
    // 5. OH_Drawing_MatrixPreScale, the fourth parameter is null
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, 0, 10.0f);
    // 6. OH_Drawing_MatrixPreScale, the fifth parameter is null
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, 10.0f, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1102
 * @tc.name: testMatrixPreScaleAbnormal
 * @tc.desc: test for testMatrixPreScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreScaleAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale, the second parameter is negative
    OH_Drawing_MatrixPreScale(matrix, -10.0f, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPreScale, the third parameter is negative
    OH_Drawing_MatrixPreScale(matrix, 10.0f, -10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPreScale, the fourth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, -10.0f, 10.0f);
    // 5. OH_Drawing_MatrixPreScale, the fifth parameter is negative
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, 10.0f, -10.0f);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1103
 * @tc.name: testMatrixPreScaleMaximum
 * @tc.desc: test for testMatrixPreScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreScaleMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreScale with the second parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, FLT_MAX, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPreScale with the third parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, 10.0f, FLT_MAX, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPreScale with the fourth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, FLT_MAX, 10.0f);
    // 5. OH_Drawing_MatrixPreScale with the fifth parameter as the maximum value
    OH_Drawing_MatrixPreScale(matrix, 10.0f, 10.0f, 10.0f, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1104
 * @tc.name: testMatrixPreScaleMultipleCalls
 * @tc.desc: test for testMatrixPreScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreScaleMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times, passing in random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPreScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1200
 * @tc.name: testMatrixPreTranslateNormal
 * @tc.desc: test for testMatrixPreTranslateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreTranslateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, pass in decimals
    OH_Drawing_MatrixPreTranslate(matrix, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPreTranslate, pass in integers
    OH_Drawing_MatrixPreTranslate(matrix, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1201
 * @tc.name: testMatrixPreTranslateNull
 * @tc.desc: test for testMatrixPreTranslateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreTranslateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPreTranslate(nullptr, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPreTranslate, the second parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, 0, 10.0f);
    // 4. OH_Drawing_MatrixPreTranslate, the third parameter is null
    OH_Drawing_MatrixPreTranslate(matrix, 10.0f, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1202
 * @tc.name: testMatrixPreTranslateAbnormal
 * @tc.desc: test for testMatrixPreTranslateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreTranslateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, the second parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, -10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPreTranslate, the third parameter is negative
    OH_Drawing_MatrixPreTranslate(matrix, 10.0f, -10.0f);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1203
 * @tc.name: testMatrixPreTranslateMaximum
 * @tc.desc: test for testMatrixPreTranslateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreTranslateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, FLT_MAX, 10.0f);
    // 3. OH_Drawing_MatrixPreTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPreTranslate(matrix, 10.0f, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1204
 * @tc.name: testMatrixPreTranslateMultipleCalls
 * @tc.desc: test for testMatrixPreTranslateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPreTranslateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPreTranslate, pass in random numbers for dx and dy
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float dx = dis(gen);
        float dy = dis(gen);
        OH_Drawing_MatrixPreTranslate(matrix, dx, dy);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1300
 * @tc.name: testMatrixPostRotateNormal
 * @tc.desc: test for testMatrixPostRotateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostRotateNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, rotate angles include 0 degrees, 180 degrees, 360 degrees, -90 degrees, -180
    // degrees, -360 degrees, and 45.5 degrees, px and py cover decimals and integers
    OH_Drawing_MatrixPostRotate(matrix, 0, 0, 0);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, 180, 10, 10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, 360, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -90, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -180, 20.0f, 20.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, -360, 30, 30);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixPostRotate(matrix, 45.5, 30.0f, 30.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1301
 * @tc.name: testMatrixPostRotateNull
 * @tc.desc: test for testMatrixPostRotateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostRotateNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the first parameter as null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostRotate(nullptr, 180, 10, 10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostRotate with the second parameter as null
    OH_Drawing_MatrixPostRotate(matrix, 0, 10, 10);
    // 4. OH_Drawing_MatrixPostRotate with the third parameter as null
    OH_Drawing_MatrixPostRotate(matrix, 180, 0, 10);
    // 5. OH_Drawing_MatrixPostRotate with the fourth parameter as null
    OH_Drawing_MatrixPostRotate(matrix, 180, 10, 0);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1302
 * @tc.name: testMatrixPostRotateAbnormal
 * @tc.desc: test for testMatrixPostRotateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostRotateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, the third parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, 180, -10, 10);
    // 3. OH_Drawing_MatrixPostRotate, the fourth parameter is negative
    OH_Drawing_MatrixPostRotate(matrix, 180, 10, -10);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1303
 * @tc.name: testMatrixPostRotateMaximum
 * @tc.desc: test for testMatrixPostRotateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostRotateMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate with the second parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, FLT_MAX, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPostRotate with the third parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, 180, FLT_MAX, 10.0f);
    // 4. OH_Drawing_MatrixPostRotate with the fourth parameter as the maximum value
    OH_Drawing_MatrixPostRotate(matrix, 180, 10.0f, FLT_MAX);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1304
 * @tc.name: testMatrixPostRotateMultipleCalls
 * @tc.desc: test for testMatrixPostRotateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostRotateMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostRotate, pass in random numbers for degree, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float degree = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPostRotate(matrix, degree, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1400
 * @tc.name: testMatrixPostScaleNormal
 * @tc.desc: test for testMatrixPostScaleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostScaleNormal, TestSize.Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, pass in decimals
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, 10.0f, 10.0f);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostScale, pass in integers
    OH_Drawing_MatrixPostScale(matrix, 20, 20, 20, 20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1401
 * @tc.name: testMatrixPostScaleNull
 * @tc.desc: test for testMatrixPostScaleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostScaleNull, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostScale(nullptr, 10.0f, 10.0f, 10.0f, 10.0f);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostScale, the second parameter is null
    OH_Drawing_MatrixPostScale(matrix, 0, 10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPostScale, the third parameter is null
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 0, 10.0f, 10.0f);
    // 5. OH_Drawing_MatrixPostScale, the fourth parameter is null
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, 0, 10.0f);
    // 6. OH_Drawing_MatrixPostScale, the fifth parameter is null
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, 10.0f, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1402
 * @tc.name: testMatrixPostScaleAbnormal
 * @tc.desc: test for testMatrixPostScaleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostScaleAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is negative
    OH_Drawing_MatrixPostScale(matrix, -10.0f, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is negative
    OH_Drawing_MatrixPostScale(matrix, 10.0f, -10.0f, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, -10.0f, 10.0f);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, 10.0f, -10.0f);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1403
 * @tc.name: testMatrixPostScaleMaximum
 * @tc.desc: test for testMatrixPostScaleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostScaleMaximum, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, FLT_MAX, 10.0f, 10.0f, 10.0f);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, 10.0f, FLT_MAX, 10.0f, 10.0f);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, FLT_MAX, 10.0f);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, 10.0f, 10.0f, 10.0f, FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1404
 * @tc.name: testMatrixPostScaleMultipleCalls
 * @tc.desc: test for testMatrixPostScaleMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeMatrixTest, testMatrixPostScaleMultipleCalls, TestSize.Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times, passing in random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0, 100.0);
    for (int i = 0; i < 10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPostScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS