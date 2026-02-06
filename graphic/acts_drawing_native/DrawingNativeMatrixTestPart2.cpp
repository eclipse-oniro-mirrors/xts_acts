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
#include "gtest/gtest.h"
#include <iostream>
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMatrixPart2Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeMatrixPart2Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMatrixPart2Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeMatrixPart2Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeMatrixPart2Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testMatrixPostTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1500
 * @tc.desc   test for testMatrixPostTranslateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPostTranslateNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing decimal numbers
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, 2.5);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostTranslate, passing integers
    OH_Drawing_MatrixPostTranslate(matrix, 3, 4);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixPostTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1501
 * @tc.desc   test for testMatrixPostTranslateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPostTranslateNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPostTranslate(nullptr, 1.5, 2.5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostTranslate, passing 0 as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, 0, 2.5);
    // 4. OH_Drawing_MatrixPostTranslate, passing 0 as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixPostTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1502
 * @tc.desc   test for testMatrixPostTranslateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPostTranslateAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with a negative value as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, -1.5, 2.5);
    // 3. OH_Drawing_MatrixPostTranslate with a negative value as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, -2.5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixPostTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1503
 * @tc.desc   test for testMatrixPostTranslateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPostTranslateMaximum, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, FLT_MAX, 2.5);
    // 3. OH_Drawing_MatrixPostTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, 1.5, FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixPostTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1504
 * @tc.desc   test for testMatrixPostTranslateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPostTranslateMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixPostTranslate 10 times, with dx and dy as random numbers
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(-100, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixPostTranslate(matrix, dis(gen), dis(gen));
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1600
 * @tc.desc   test for testMatrixResetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixResetNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixReset with the identity matrix
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixReset with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1601
 * @tc.desc   test for testMatrixResetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixResetNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixReset with nullptr as the parameter, check the error code with OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   testMatrixResetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1602
 * @tc.desc   test for testMatrixResetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixResetMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetMatrix 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
    }
    // 3. Call OH_Drawing_MatrixReset 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixReset(matrix);
    }
    // 4. Call OH_Drawing_MatrixSetMatrix and OH_Drawing_MatrixReset alternately 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, 2, 1, 3, 1, 2, 2, 3, 1, 1);
        OH_Drawing_MatrixReset(matrix);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1700
 * @tc.desc   test for testMatrixConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixConcatNormal, Function | SmallTest | Level0) {
    // Define matrices a and b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    // 1. Call OH_Drawing_MatrixConcat with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_MatrixConcat(c, b, a);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float values[9];
    OH_Drawing_MatrixGetAll(c, values);
    EXPECT_EQ(values[0], 1);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
}

/**
 * @tc.name   testMatrixConcatNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1701
 * @tc.desc   test for testMatrixConcatNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixConcatNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixConcat, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(nullptr, matrix, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixConcat, passing nullptr as the second parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixConcat, passing nullptr as the third parameter, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixConcat(matrix, matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixConcatMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1702
 * @tc.desc   test for testMatrixConcatMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixConcatMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_MatrixConcat 10 times with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_Matrix *a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Matrix *b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    OH_Drawing_Matrix *c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixConcat(c, b, a);
        float values[9];
        OH_Drawing_MatrixGetAll(c, values);
        EXPECT_EQ(values[0], 1);
        EXPECT_EQ(values[1], 0);
        EXPECT_EQ(values[2], 0);
        EXPECT_EQ(values[3], 0);
        EXPECT_EQ(values[4], -1);
        EXPECT_EQ(values[5], 0);
        EXPECT_EQ(values[6], 0);
        EXPECT_EQ(values[7], 0);
        EXPECT_EQ(values[8], 1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
}

/**
 * @tc.name   testMatrixInvertNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1800
 * @tc.desc   test for testMatrixInvertNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixInvertNormal, Function | SmallTest | Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(inverse, nullptr);
    bool ret = OH_Drawing_MatrixInvert(matrix, inverse);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    ret = OH_Drawing_MatrixInvert(inverse, matrix);
    EXPECT_EQ(ret, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
}

/**
 * @tc.name   testMatrixInvertNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1801
 * @tc.desc   test for testMatrixInvertNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixInvertNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixInvert with the first parameter as nullptr, check the error code with OH_Drawing_ErrorCodeGet
    bool ret = OH_Drawing_MatrixInvert(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixInvert with the second parameter as nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixInvert(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixInvertMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1802
 * @tc.desc   test for testMatrixInvertMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixInvertMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_MatrixInvert 10 times with matrices of different sizes
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(inverse, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixInvert(matrix, inverse);
        OH_Drawing_MatrixInvert(inverse, matrix);
        float values[9];
        OH_Drawing_MatrixGetAll(matrix, values);
        EXPECT_EQ(values[0], 1);
        EXPECT_EQ(values[1], 0);
        EXPECT_EQ(values[2], 0);
        EXPECT_EQ(values[3], 0);
        EXPECT_EQ(values[4], -1);
        EXPECT_EQ(values[5], 0);
        EXPECT_EQ(values[6], 0);
        EXPECT_EQ(values[7], 0);
        EXPECT_EQ(values[8], 1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
}

/**
 * @tc.name   testMatrixSetPolyToPolyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1900
 * @tc.desc   test for testMatrixSetPolyToPolyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetPolyToPolyNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 0, 0, -1, 0, 0, 0, 1);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);

    // 3. OH_Drawing_MatrixSetPolyToPoly, iterate count from 0 to 4, keeping the length of the array consistent with
    // count
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 5; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Point2D src[i];
        OH_Drawing_Point2D dst[i];
        for (int j = 0; j < i; j++) {
            // Generate random numbers
            src[j] = {dis(gen), dis(gen)};
            dst[j] = {dis(gen), dis(gen)};
        }
        ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, i);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixSetPolyToPolyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1901
 * @tc.desc   test for testMatrixSetPolyToPolyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetPolyToPolyNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, the first parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(nullptr, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, the second parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, nullptr, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. OH_Drawing_MatrixSetPolyToPoly, the third parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, nullptr, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixSetPolyToPolyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1902
 * @tc.desc   test for testMatrixSetPolyToPolyAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetPolyToPolyAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}};
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, pass 5 as count, check the error code with OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixSetPolyToPolyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_1904
 * @tc.desc   test for testMatrixSetPolyToPolyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetPolyToPolyMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetPolyToPoly 10 times
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Point2D src[2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        OH_Drawing_Point2D dst[2] = {{dis(gen), dis(gen)}, {dis(gen), dis(gen)}};
        bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 2);
        EXPECT_EQ(ret, true);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixMapPointsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2000
 * @tc.desc   test for testMatrixMapPointsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapPointsNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, pass the float value 1.52 as count
    double value = 1.52;
    uint32_t count = static_cast<uint32_t>(value);
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, count);
    // 3. OH_Drawing_MatrixMapPoints, pass integer 5 as count
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, 5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixMapPointsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2001
 * @tc.desc   test for testMatrixMapPointsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapPointsNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(nullptr, src, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixMapPoints, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, nullptr, dst, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixMapPoints, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, nullptr, 5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. OH_Drawing_MatrixMapPoints, the fourth parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixMapPointsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2002
 * @tc.desc   test for testMatrixMapPointsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapPointsAbnormal, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. OH_Drawing_MatrixMapPoints, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, -1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixMapPointsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2003
 * @tc.desc   test for testMatrixMapPointsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapPointsMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = {{0, 0}, {100, 0}, {100, 100}, {0, 100}, {0, 100}};
    OH_Drawing_Point2D dst[] = {{0, 0}, {100, 30}, {100, 70}, {0, 100}, {0, 100}};
    // 2. Call OH_Drawing_MatrixMapPoints 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_MatrixMapPoints(matrix, src, dst, 5);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixMapRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2100
 * @tc.desc   test for testMatrixMapRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapRectNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, src and dst are the same
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(dst, nullptr);
    bool ret = OH_Drawing_MatrixMapRect(matrix, src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 3. OH_Drawing_MatrixMapRect, src and dst are different
    OH_Drawing_Rect *src2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_Rect *dst2 = OH_Drawing_RectCreate(0, 0, 200, 200);
    // add assert
    EXPECT_NE(dst2, nullptr);
    ret = OH_Drawing_MatrixMapRect(matrix, src2, dst2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst2);
}

/**
 * @tc.name   testMatrixMapRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2101
 * @tc.desc   test for testMatrixMapRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapRectNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(dst, nullptr);
    bool ret = OH_Drawing_MatrixMapRect(nullptr, src, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixMapRect, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapRect(matrix, nullptr, dst);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixMapRect, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapRect(matrix, src, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
}

/**
 * @tc.name   testMatrixMapRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2103
 * @tc.desc   test for testMatrixMapRectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixMapRectMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixMapRect 10 times with different src and dst
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(100, 200);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(src, nullptr);
        OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(dst, nullptr);
        bool ret = OH_Drawing_MatrixMapRect(matrix, src, dst);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
        OH_Drawing_RectDestroy(src);
        OH_Drawing_RectDestroy(dst);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsEqualNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2200
 * @tc.desc   test for testMatrixIsEqualNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsEqualNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixIsEqual with the same matrix
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix2, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsEqual with different matrices
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix3, 2, 2, 3, 4, 5, 6, 7, 8, 9);
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix3);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
}

/**
 * @tc.name   testMatrixIsEqualNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2201
 * @tc.desc   test for testMatrixIsEqualNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsEqualNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    // 2. OH_Drawing_MatrixIsEqual, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixIsEqual, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsEqualMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2202
 * @tc.desc   test for testMatrixIsEqualMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsEqualMultipleCalls, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 2. Call OH_Drawing_MatrixIsEqual 10 times with alternating different or same matrices
    for (int i = 0; i < 10; i++) {
        if (i % 2 == 0) {
            OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            OH_Drawing_MatrixSetMatrix(matrix2, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, true);
        } else {
            OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            OH_Drawing_MatrixSetMatrix(matrix2, 2, 2, 3, 4, 5, 6, 7, 8, 9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, false);
        }
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
}

/**
 * @tc.name   testMatrixIsIdentityNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2300
 * @tc.desc   test for testMatrixIsIdentityNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsIdentityNormal, Function | SmallTest | Level0) {
    // 1. OH_Drawing_MatrixIsIdentity with an identity matrix
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    bool ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsIdentity with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsIdentityNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2301
 * @tc.desc   test for testMatrixIsIdentityNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsIdentityNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixIsIdentity with nullptr as parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsIdentity(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsIdentityMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2302
 * @tc.desc   test for testMatrixIsIdentityMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsIdentityMultipleCalls, Function | SmallTest | Level3) {
    // Call OH_Drawing_MatrixIsIdentity 10 times with alternating identity or non-identity matrices
    for (int i = 0; i < 10; i++) {
        if (i % 2 == 0) {
            OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, true);
            OH_Drawing_MatrixDestroy(matrix);
        } else {
            OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, false);
            OH_Drawing_MatrixDestroy(matrix);
        }
    }
}

/**
 * @tc.name   testMatrixCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2400
 * @tc.desc   test for testMatrixCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixCopyNormal, Function | SmallTest | Level0) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCopy(matrix1);
    EXPECT_NE(matrix2, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 0), 1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 1), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 2), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 3), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 4), 1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 5), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 6), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 7), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, 8), 1);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
}

/**
 * @tc.name   testMatrixCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2401
 * @tc.desc   test for testMatrixCopyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixCopyNull, Function | SmallTest | Level3) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    // 3. The function OH_Drawing_MatrixCopy passes to nullptr.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCopy(nullptr);
    EXPECT_EQ(matrix2, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
}

/**
 * @tc.name   testMatrixCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2402
 * @tc.desc   test for testMatrixCopyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixCopyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    // 4. The function OH_Drawing_MatrixCopy is called 10 times.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_MatrixCopy(matrix1);
        EXPECT_NE(matrix2, nullptr);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
}

/**
 * @tc.name   testMatrixPerConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2500
 * @tc.desc   test for testMatrixPerConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPerConcatNormal, Function | SmallTest | Level0) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 0, -2, 0, 0, 3, 1);
    OH_Drawing_MatrixSetMatrix(other, 1, 1, 1, 0, -1, 0, -1, 0, 1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), 1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), 2.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), 2.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), -1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), -3.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), 1.0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
}

/**
 * @tc.name   testMatrixPerConcatNull1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2501
 * @tc.desc   test for testMatrixPerConcatNull1.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPerConcatNull1, Function | SmallTest | Level3) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 0, -2, 0, 0, 3, 1);
    OH_Drawing_MatrixSetMatrix(other, 1, 1, 1, 0, -1, 0, -1, 0, 1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(nullptr, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), 1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), -2.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), 3.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), 1.0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
}

/**
 * @tc.name   testMatrixPerConcatNull2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2502
 * @tc.desc   test for testMatrixPerConcatNull2.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPerConcatNull2, Function | SmallTest | Level3) {
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    EXPECT_NE(other, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1,  0, -2, 0, 0, 3, 1);
    OH_Drawing_MatrixSetMatrix(other, 1, 1, 1, 0, -1, 0, -1, 0, 1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), 1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), 1.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), -2.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), 3.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), 1.0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
}
/**
 * @tc.name   testMatrixPerConcatCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2503
 * @tc.desc   test for testMatrixPerConcatCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPerConcatCalls, Function | SmallTest | Level3) {
     // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix *other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, 1, 0, 1, 0, -2, 0, 0, 3, 1);
    OH_Drawing_MatrixSetMatrix(other, 1, 1, 1, 0, -1, 0, -1, 0, 1);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 0), -32.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 1), -7.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 2), 32.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 4), -2.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 6), -32.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 7), -10.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, 8), 0.0);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
}

/**
 * @tc.name   testMatrixIsAffineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2600
 * @tc.desc   test for testMatrixIsAffineNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsAffineNormal, Function | SmallTest | Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateRotation(45, 0, 0);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateScale(1, 1, 100, 100);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateTranslation(200, 200);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, -1, 0, 1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, false);

    OH_Drawing_MatrixSetMatrix(matrix, 1, 2, 3, 4, 5, 6, 0, 0, 1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsAffineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2601
 * @tc.desc   test for testMatrixIsAffineNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsAffineNull, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(nullptr, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixIsAffineMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2602
 * @tc.desc   test for testMatrixIsAffineMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixIsAffineMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isAffine, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixPreSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2700
 * @tc.desc   test for testMatrixPreSkewNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPreSkewNormal, Function | SmallTest | Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    
    OH_Drawing_MatrixSetMatrix(result, 1, 2, -10, 3, 1, -12, 0, 0, 1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(90, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, -3, -1, 12, 1, 2, -10, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(1, 1, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, 1, 2, -10, 3, 1, -12, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(50, 50);
    OH_Drawing_MatrixSetMatrix(result, 1, 2, 40, 3, 1, 38, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
}

/**
 * @tc.name   testMatrixPreSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2701
 * @tc.desc   test for testMatrixPreSkewNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPreSkewNull, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix4, nullptr);
    OH_Drawing_Matrix *matrix5 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix5, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    
    OH_Drawing_MatrixSetMatrix(result, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(nullptr, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(matrix1, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 1, 0, 0, 3, 1, -12, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix2, 0, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix2, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 1, 2, -10, 0, 1, 0, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix3, 2, 0, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix3, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 1, 2, -10, 3, 1, 0, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix4, 2, 3, 0, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix4, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 1, 2, 0, 3, 1, -12, 0, 0, 1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix5, 2, 3, 4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix5, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    OH_Drawing_MatrixDestroy(matrix5);
    OH_Drawing_MatrixDestroy(result);
}

/**
 * @tc.name   testMatrixPreSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2702
 * @tc.desc   test for testMatrixPreSkewMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixPreSkewMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    OH_Drawing_MatrixSetMatrix(result, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
}

/**
 * @tc.name   testMatrixRectStaysRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2800
 * @tc.desc   test for testMatrixRectStaysRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixRectStaysRectNormal, Function | SmallTest | Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixPreScale(matrix, 2, 3, 4, 5);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    OH_Drawing_MatrixPreSkew(matrix, 2, 3, 4, 5);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, false);

    matrix = OH_Drawing_MatrixCreateRotation(90, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateScale(1, 1, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateTranslation(50, 50);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixRectStaysRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2801
 * @tc.desc   test for testMatrixRectStaysRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixRectStaysRectNull, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(nullptr, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixRectStaysRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2802
 * @tc.desc   test for testMatrixRectStaysRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixRectStaysRectMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRectStaysRect, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
}

/**
 * @tc.name   testMatrixSetSinCosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2900
 * @tc.desc   test for testMatrixSetSinCosNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetSinCosNormal, Function | SmallTest | Level0) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    
    OH_Drawing_MatrixSetMatrix(result, 3, -2, 2, 2, 3, -18, 0, 0, 1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(90, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(1, 1, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(50, 50);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
}

/**
 * @tc.name   testMatrixSetSinCosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2901
 * @tc.desc   test for testMatrixSetSinCosNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetSinCosNull, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    OH_Drawing_Matrix *matrix2 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_Matrix *matrix3 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_Matrix *matrix4 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix4, nullptr);
    OH_Drawing_Matrix *matrix5 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix5, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(nullptr, 2, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(matrix1, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 3, 0, -8, 0, 3, -10, 0, 0, 1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix2, 0, 3, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix2, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 0, -2, 14, 2, 0, -3, 0, 0, 1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix3, 2, 0, 4, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix3, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 3, -2, 10, 2, 3, -10, 0, 0, 1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix4, 2, 3, 0, 5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix4, result);
    EXPECT_EQ(ret, true);

    OH_Drawing_MatrixSetMatrix(result, 3, -2, -8, 2, 3, -8, 0, 0, 1);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix5, 2, 3, 4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix5, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    OH_Drawing_MatrixDestroy(matrix4);
    OH_Drawing_MatrixDestroy(matrix5);
    OH_Drawing_MatrixDestroy(result);
}

/**
 * @tc.name   testMatrixSetSinCosMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_MATRIX_2902
 * @tc.desc   test for testMatrixSetSinCosMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeMatrixPart2Test, testMatrixSetSinCosMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix *result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS