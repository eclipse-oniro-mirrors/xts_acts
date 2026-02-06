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

#include "include/DrawingNativeMatrixTest.h"
#include <iostream>
#include <random>
#include "include/OhosCommonTest.h"
#include <cfloat> // For FLT_MAX

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeMatrixPart2TestSetUp()
{
    std::cout << "DrawingNativeMatrixPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMatrixPart2TestTearDown()
{
    std::cout << "DrawingNativeMatrixPart2Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart2Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testMatrixPostScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06200
 * @tc.desc   test for testMatrixPostScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPostScaleNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, pass in decimals
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostScale, pass in integers
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_20, MATRIX_COORD_20, MATRIX_COORD_20, MATRIX_COORD_20);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06300
 * @tc.desc   test for testMatrixPostScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the first parameter is null, check the error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixPostScale(nullptr, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostScale, the second parameter is null
    OH_Drawing_MatrixPostScale(matrix, 0, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10);
    // 4. OH_Drawing_MatrixPostScale, the third parameter is null
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, 0, MATRIX_COORD_10, MATRIX_COORD_10);
    // 5. OH_Drawing_MatrixPostScale, the fourth parameter is null
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, 0, MATRIX_COORD_10);
    // 6. OH_Drawing_MatrixPostScale, the fifth parameter is null
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10, 0);
    // 7. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06400
 * @tc.desc   test for testMatrixPostScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is negative
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_NEGATIVE_10, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is negative
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_NEGATIVE_10, MATRIX_COORD_10, MATRIX_COORD_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_NEGATIVE_10, MATRIX_COORD_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is negative
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_NEGATIVE_10);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06500
 * @tc.desc   test for testMatrixPostScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleMaximum()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostScale, the second parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, MATRIX_FLT_MAX, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10);
    // 3. OH_Drawing_MatrixPostScale, the third parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_FLT_MAX, MATRIX_COORD_10, MATRIX_COORD_10);
    // 4. OH_Drawing_MatrixPostScale, the fourth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_FLT_MAX, MATRIX_COORD_10);
    // 5. OH_Drawing_MatrixPostScale, the fifth parameter is the maximum value
    OH_Drawing_MatrixPostScale(matrix, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_COORD_10, MATRIX_FLT_MAX);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06600
 * @tc.desc   test for testMatrixPostScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostScaleMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixCreateScale 10 times, passing in random numbers for sx, sy, px, and py
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(MATRIX_RANDOM_DIST_MIN_0, MATRIX_RANDOM_DIST_MAX_100);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        float sx = dis(gen);
        float sy = dis(gen);
        float px = dis(gen);
        float py = dis(gen);
        OH_Drawing_MatrixPostScale(matrix, sx, sy, px, py);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06700
 * @tc.desc   test for testMatrixPostTranslateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPostTranslateNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing decimal numbers
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_1_5, MATRIX_TRANSLATE_2_5);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixPostTranslate, passing integers
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_3, MATRIX_TRANSLATE_4);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06800
 * @tc.desc   test for testMatrixPostTranslateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate, passing nullptr as the first parameter, check the error code with
    // OH_Drawing_ErrorCodeGet, no crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixPostTranslate(nullptr, MATRIX_TRANSLATE_1_5, MATRIX_TRANSLATE_2_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_MatrixPostTranslate, passing 0 as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, 0, MATRIX_TRANSLATE_2_5);
    // 4. OH_Drawing_MatrixPostTranslate, passing 0 as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_1_5, 0);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_06900
 * @tc.desc   test for testMatrixPostTranslateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with a negative value as the second parameter
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_NEGATIVE_1_5, MATRIX_TRANSLATE_2_5);
    // 3. OH_Drawing_MatrixPostTranslate with a negative value as the third parameter
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_1_5, MATRIX_TRANSLATE_NEGATIVE_2_5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07000
 * @tc.desc   test for testMatrixPostTranslateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateMaximum()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixPostTranslate with the second parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_FLT_MAX, MATRIX_TRANSLATE_2_5);
    // 3. OH_Drawing_MatrixPostTranslate with the third parameter as the maximum value
    OH_Drawing_MatrixPostTranslate(matrix, MATRIX_TRANSLATE_1_5, MATRIX_FLT_MAX);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPostTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07100
 * @tc.desc   test for testMatrixPostTranslateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPostTranslateMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixPostTranslate 10 times, with dx and dy as random numbers
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(MATRIX_RANDOM_DIST_MIN_NEGATIVE_100, MATRIX_RANDOM_DIST_MAX_100);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixPostTranslate(matrix, dis(gen), dis(gen));
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07200
 * @tc.desc   test for testMatrixResetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixResetNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixReset with the identity matrix
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 3. OH_Drawing_MatrixReset with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_2, MATRIX_INT_1, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_2,
                               MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_1);
    OH_Drawing_MatrixReset(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07300
 * @tc.desc   test for testMatrixResetNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixResetNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixReset with nullptr as the parameter, check the error code with OH_Drawing_ErrorCodeGet, no
    // crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_MatrixReset(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixResetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07400
 * @tc.desc   test for testMatrixResetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixResetMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetMatrix 10 times
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_2, MATRIX_INT_1, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_2,
                                   MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_1);
    }
    // 3. Call OH_Drawing_MatrixReset 10 times
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixReset(matrix);
    }
    // 4. Call OH_Drawing_MatrixSetMatrix and OH_Drawing_MatrixReset alternately 10 times
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_2, MATRIX_INT_1, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_2,
                                   MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_1, MATRIX_INT_1);
        OH_Drawing_MatrixReset(matrix);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07500
 * @tc.desc   test for testMatrixConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixConcatNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // Define matrices a and b
    OH_Drawing_Matrix* a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, MATRIX_INT_1, 0, 0, 0, MATRIX_NEGATIVE_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_Matrix* b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_Matrix* c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    // 1. Call OH_Drawing_MatrixConcat with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_MatrixConcat(c, b, a);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    float values[MATRIX_ARRAY_SIZE_9];
    OH_Drawing_MatrixGetAll(c, values);
    EXPECT_EQ(values[MATRIX_MATRIX_INDEX_0], MATRIX_INT_1);
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07600
 * @tc.desc   test for testMatrixConcatNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixConcatNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixConcatMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07700
 * @tc.desc   test for testMatrixConcatMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixConcatMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Call OH_Drawing_MatrixConcat 10 times with matrices a and b of different sizes,
    // and use OH_Drawing_MatrixGetAll to get the result of matrix a multiplied by matrix b
    OH_Drawing_Matrix* a = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(a, nullptr);
    OH_Drawing_MatrixSetMatrix(a, MATRIX_INT_1, 0, 0, 0, MATRIX_NEGATIVE_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_Matrix* b = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(b, nullptr);
    OH_Drawing_MatrixSetMatrix(b, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_Matrix* c = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(c, nullptr);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixConcat(c, b, a);
        float values[MATRIX_ARRAY_SIZE_9];
        OH_Drawing_MatrixGetAll(c, values);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_0], MATRIX_INT_1);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_1], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_2], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_3], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_4], MATRIX_NEGATIVE_1);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_5], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_6], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_7], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_8], MATRIX_INT_1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(a);
    OH_Drawing_MatrixDestroy(b);
    OH_Drawing_MatrixDestroy(c);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07800
 * @tc.desc   test for testMatrixInvertNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixInvertNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* inverse = OH_Drawing_MatrixCreate();
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_07900
 * @tc.desc   test for testMatrixInvertNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixInvertNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixInvertMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08000
 * @tc.desc   test for testMatrixInvertMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixInvertMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Call OH_Drawing_MatrixInvert 10 times with matrices of different sizes
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* inverse = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(inverse, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, 0, 0, MATRIX_NEGATIVE_1, 0, 0, 0, MATRIX_INT_1);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixInvert(matrix, inverse);
        OH_Drawing_MatrixInvert(inverse, matrix);
        float values[MATRIX_ARRAY_SIZE_9];
        OH_Drawing_MatrixGetAll(matrix, values);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_0], MATRIX_INT_1);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_1], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_2], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_3], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_4], MATRIX_NEGATIVE_1);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_5], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_6], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_7], 0);
        EXPECT_EQ(values[MATRIX_MATRIX_INDEX_8], MATRIX_INT_1);
    }
    // 2. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(inverse);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08100
 * @tc.desc   test for testMatrixSetPolyToPolyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixSetPolyToPolyNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, 0, 0, MATRIX_NEGATIVE_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, MATRIX_INT_1);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);

    // 3. OH_Drawing_MatrixSetPolyToPoly, iterate count from 0 to 4, keeping the length of the array consistent with
    // count
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(MATRIX_RANDOM_DIST_MIN_0, MATRIX_RANDOM_DIST_MAX_100);
    for (int i = 0; i < MATRIX_ARRAY_SIZE_5; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Point2D src[i];
        OH_Drawing_Point2D dst[i];
        for (int j = 0; j < i; j++) {
            // Generate random numbers
            src[j] = { dis(gen), dis(gen) };
            dst[j] = { dis(gen), dis(gen) };
        }
        ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, i);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        EXPECT_EQ(ret, true);
    }
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08200
 * @tc.desc   test for testMatrixSetPolyToPolyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, the first parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    bool ret = OH_Drawing_MatrixSetPolyToPoly(nullptr, src, dst, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, the second parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, nullptr, dst, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. OH_Drawing_MatrixSetPolyToPoly, the third parameter is nullptr, check the error code with
    // OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, nullptr, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08300
 * @tc.desc   test for testMatrixSetPolyToPolyAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixSetPolyToPoly, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 } };
    bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, MATRIX_NEGATIVE_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 3. OH_Drawing_MatrixSetPolyToPoly, pass 5 as count, check the error code with OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetPolyToPolyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08400
 * @tc.desc   test for testMatrixSetPolyToPolyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetPolyToPolyMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixSetPolyToPoly 10 times
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(MATRIX_RANDOM_DIST_MIN_0, MATRIX_RANDOM_DIST_MAX_100);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_Point2D src[MATRIX_ARRAY_SIZE_2] = { { dis(gen), dis(gen) }, { dis(gen), dis(gen) } };
        OH_Drawing_Point2D dst[MATRIX_ARRAY_SIZE_2] = { { dis(gen), dis(gen) }, { dis(gen), dis(gen) } };
        bool ret = OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, MATRIX_ARRAY_SIZE_2);
        EXPECT_EQ(ret, true);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08500
 * @tc.desc   test for testMatrixMapPointsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixMapPointsNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    // 2. OH_Drawing_MatrixMapPoints, pass the float value 1.52 as count
    double value = MATRIX_POLY_COUNT_1_52;
    uint32_t count = static_cast<uint32_t>(value);
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, count);
    // 3. OH_Drawing_MatrixMapPoints, pass integer 5 as count
    OH_Drawing_MatrixSetPolyToPoly(matrix, src, dst, MATRIX_POLY_COUNT_5);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08600
 * @tc.desc   test for testMatrixMapPointsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    // 2. OH_Drawing_MatrixMapPoints, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(nullptr, src, dst, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixMapPoints, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, nullptr, dst, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_MatrixMapPoints, the third parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, nullptr, MATRIX_POLY_COUNT_5);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. OH_Drawing_MatrixMapPoints, the fourth parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, 0);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08700
 * @tc.desc   test for testMatrixMapPointsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsAbnormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    // 2. OH_Drawing_MatrixMapPoints, pass -1 as count, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixMapPoints(matrix, src, dst, MATRIX_NEGATIVE_1);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapPointsMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08800
 * @tc.desc   test for testMatrixMapPointsMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapPointsMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Point2D src[] = { { 0, 0 }, { MATRIX_RECT_INT_100, 0 }, { MATRIX_RECT_INT_100, MATRIX_RECT_INT_100 },
        { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    OH_Drawing_Point2D dst[] = { { 0, 0 }, { MATRIX_RECT_INT_100, MATRIX_POINT_Y_30 },
        { MATRIX_RECT_INT_100, MATRIX_POINT_Y_70 }, { 0, MATRIX_RECT_INT_100 }, { 0, MATRIX_RECT_INT_100 } };
    // 2. Call OH_Drawing_MatrixMapPoints 10 times
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_MatrixMapPoints(matrix, src, dst, MATRIX_POLY_COUNT_5);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_08900
 * @tc.desc   test for testMatrixMapRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixMapRectNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, src and dst are the same
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
    // add assert
    EXPECT_NE(dst, nullptr);
    bool ret = OH_Drawing_MatrixMapRect(matrix, src, dst);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 3. OH_Drawing_MatrixMapRect, src and dst are different
    OH_Drawing_Rect* src2 = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
    // add assert
    EXPECT_NE(src2, nullptr);
    OH_Drawing_Rect* dst2 = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_200, MATRIX_RECT_INT_200);
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09000
 * @tc.desc   test for testMatrixMapRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapRectNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixMapRect, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
    // add assert
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixMapRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09100
 * @tc.desc   test for testMatrixMapRectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixMapRectMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. Call OH_Drawing_MatrixMapRect 10 times with different src and dst
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(MATRIX_RANDOM_DIST_MIN_100, MATRIX_RANDOM_DIST_MAX_200);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
        // add assert
        EXPECT_NE(src, nullptr);
        OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, dis(gen), dis(gen));
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
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09200
 * @tc.desc   test for testMatrixIsEqualNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsEqualNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixIsEqual with the same matrix
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix2, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsEqual with different matrices
    OH_Drawing_Matrix* matrix3 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix3, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix3, MATRIX_INT_2, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
    ret = OH_Drawing_MatrixIsEqual(matrix, matrix3);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    OH_Drawing_MatrixDestroy(matrix3);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09300
 * @tc.desc   test for testMatrixIsEqualNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsEqualNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
    // 2. OH_Drawing_MatrixIsEqual, the first parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(nullptr, matrix);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 3. OH_Drawing_MatrixIsEqual, the second parameter is nullptr, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsEqual(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsEqualMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09400
 * @tc.desc   test for testMatrixIsEqualMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsEqualMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix2, nullptr);
    // 2. Call OH_Drawing_MatrixIsEqual 10 times with alternating different or same matrices
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        if (i % MATRIX_INT_2 == 0) {
            OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                       MATRIX_INT_5, MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
            OH_Drawing_MatrixSetMatrix(matrix2, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                       MATRIX_INT_5, MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, true);
        } else {
            OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                                       MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
            OH_Drawing_MatrixSetMatrix(matrix2, MATRIX_INT_2, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                                       MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
            bool ret = OH_Drawing_MatrixIsEqual(matrix, matrix2);
            EXPECT_EQ(ret, false);
        }
    }
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09500
 * @tc.desc   test for testMatrixIsIdentityNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsIdentityNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixIsIdentity with an identity matrix
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    bool ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, true);
    // 2. OH_Drawing_MatrixIsIdentity with a non-identity matrix
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
    ret = OH_Drawing_MatrixIsIdentity(matrix);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09600
 * @tc.desc   test for testMatrixIsIdentityNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsIdentityNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. OH_Drawing_MatrixCreate
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    // add assert
    EXPECT_NE(matrix, nullptr);
    // 2. OH_Drawing_MatrixIsIdentity with nullptr as parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_MatrixIsIdentity(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsIdentityMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09700
 * @tc.desc   test for testMatrixIsIdentityMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsIdentityMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // Call OH_Drawing_MatrixIsIdentity 10 times with alternating identity or non-identity matrices
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        if (i % MATRIX_INT_2 == 0) {
            OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, true);
            OH_Drawing_MatrixDestroy(matrix);
        } else {
            OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
            // add assert
            EXPECT_NE(matrix, nullptr);
            OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                                       MATRIX_INT_6, MATRIX_INT_7, MATRIX_INT_8, MATRIX_INT_9);
            bool ret = OH_Drawing_MatrixIsIdentity(matrix);
            EXPECT_EQ(ret, false);
            OH_Drawing_MatrixDestroy(matrix);
        }
    }
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09800
 * @tc.desc   test for testMatrixCopyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixCopyNormal()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCopy(matrix1);
    EXPECT_NE(matrix2, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_0), MATRIX_INT_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_1), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_2), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_3), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_4), MATRIX_INT_1);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_5), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_6), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_7), 0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix2, MATRIX_MATRIX_INDEX_8), MATRIX_INT_1);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_09900
 * @tc.desc   test for testMatrixCopyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCopyNull()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    // 3. The function OH_Drawing_MatrixCopy passes to nullptr.
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCopy(nullptr);
    EXPECT_EQ(matrix2, nullptr);
    // 4. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixCopyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10000
 * @tc.desc   test for testMatrixCopyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixCopyMultipleCalls()
{
    DrawingNativeMatrixPart2TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix1 = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix1, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix1, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    // 3. Using the function OH_Drawing_MatrixCopy copy another matrix.
    OH_Drawing_Matrix* matrix2 = OH_Drawing_MatrixCreate();
    // 4. The function OH_Drawing_MatrixCopy is called 10 times.
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_MatrixCopy(matrix1);
        EXPECT_NE(matrix2, nullptr);
    }
    // 5. Free memory
    OH_Drawing_MatrixDestroy(matrix1);
    OH_Drawing_MatrixDestroy(matrix2);
    DrawingNativeMatrixPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS