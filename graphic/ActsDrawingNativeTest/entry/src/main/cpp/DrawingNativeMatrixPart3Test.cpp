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

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativeMatrixPart3TestSetUp()
{
    std::cout << "DrawingNativeMatrixPart3Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart3Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMatrixPart3TestTearDown()
{
    std::cout << "DrawingNativeMatrixPart3Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMatrixPart3Test errorCodeReset after each test case." << std::endl;
}

// Structure to hold test matrices for null parameter tests
struct MatrixNullTestData {
    OH_Drawing_Matrix* matrices[MATRIX_INT_5];
    OH_Drawing_Matrix* result;
};

// Initialize test matrices
MatrixNullTestData InitMatrixNullTestData()
{
    MatrixNullTestData data;
    for (int i = 0; i < MATRIX_INT_5; i++) {
        data.matrices[i] = OH_Drawing_MatrixCreate();
        EXPECT_NE(data.matrices[i], nullptr);
    }
    data.result = OH_Drawing_MatrixCreate();
    EXPECT_NE(data.result, nullptr);
    return data;
}

// Cleanup test matrices
void CleanupMatrixNullTestData(MatrixNullTestData& data)
{
    for (int i = 0; i < MATRIX_INT_5; i++) {
        OH_Drawing_MatrixDestroy(data.matrices[i]);
    }
    OH_Drawing_MatrixDestroy(data.result);
}

/**
 * @tc.name   testMatrixPerConcatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100
 * @tc.desc   test for testMatrixPerConcatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPerConcatNormal()
{
    DrawingNativeMatrixPart3TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix* other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_2_0, 0, 0, MATRIX_INT_3,
                               MATRIX_INT_1);
    OH_Drawing_MatrixSetMatrix(other, MATRIX_INT_1, MATRIX_INT_1, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_1_0, 0,
                               MATRIX_VALUE_NEGATIVE_1_0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_0), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_1), MATRIX_VALUE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_2), MATRIX_VALUE_2_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_4), MATRIX_VALUE_2_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_6), MATRIX_VALUE_NEGATIVE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_7), MATRIX_VALUE_NEGATIVE_3_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_8), MATRIX_VALUE_1_0);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPerConcatNull1
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10200
 * @tc.desc   test for testMatrixPerConcatNull1.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatNull1()
{
    DrawingNativeMatrixPart3TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix* other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_2_0, 0, 0, MATRIX_INT_3,
                               MATRIX_INT_1);
    OH_Drawing_MatrixSetMatrix(other, MATRIX_INT_1, MATRIX_INT_1, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_1_0, 0,
                               MATRIX_VALUE_NEGATIVE_1_0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(nullptr, other);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_0), MATRIX_VALUE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_1), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_2), MATRIX_VALUE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_4), MATRIX_VALUE_NEGATIVE_2_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_6), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_7), MATRIX_VALUE_3_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_8), MATRIX_VALUE_1_0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPerConcatNull2
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300
 * @tc.desc   test for testMatrixPerConcatNull2.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatNull2()
{
    DrawingNativeMatrixPart3TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix* other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    EXPECT_NE(other, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_2_0, 0, 0, MATRIX_INT_3,
                               MATRIX_INT_1);
    OH_Drawing_MatrixSetMatrix(other, MATRIX_INT_1, MATRIX_INT_1, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_1_0, 0,
                               MATRIX_VALUE_NEGATIVE_1_0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, nullptr);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_0), MATRIX_VALUE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_1), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_2), MATRIX_VALUE_1_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_4), MATRIX_VALUE_NEGATIVE_2_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_6), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_7), MATRIX_VALUE_3_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_8), MATRIX_VALUE_1_0);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testMatrixPerConcatCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400
 * @tc.desc   test for testMatrixPerConcatCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPerConcatCalls()
{
    DrawingNativeMatrixPart3TestSetUp();
    // 1. Create a matrix object using OH_Drawing_MatrixCreate.
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Matrix* other = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    // 2. The function OH_Drawing_MatrixSetMatrix creates a identity matrix.
    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, 0, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_2_0, 0, 0, MATRIX_INT_3,
                               MATRIX_INT_1);
    OH_Drawing_MatrixSetMatrix(other, MATRIX_INT_1, MATRIX_INT_1, MATRIX_INT_1, 0, MATRIX_VALUE_NEGATIVE_1_0, 0,
                               MATRIX_VALUE_NEGATIVE_1_0, 0, MATRIX_INT_1);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreConcat(matrix, other);
        EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    }
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_0), MATRIX_VALUE_NEGATIVE_32_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_1), MATRIX_VALUE_NEGATIVE_7_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_2), MATRIX_VALUE_32_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_3), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_4), MATRIX_VALUE_NEGATIVE_2_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_5), 0.0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_6), MATRIX_VALUE_NEGATIVE_32_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_7), MATRIX_VALUE_NEGATIVE_10_0);
    EXPECT_EQ(OH_Drawing_MatrixGetValue(matrix, MATRIX_MATRIX_INDEX_8), 0.0);
    // 3. Free memory
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(other);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500
 * @tc.desc   test for testMatrixIsAffineNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixIsAffineNormal()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateRotation(MATRIX_ANGLE_45, 0, 0);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateScale(MATRIX_INT_1, MATRIX_INT_1, MATRIX_RECT_INT_100, MATRIX_RECT_INT_100);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    matrix = OH_Drawing_MatrixCreateTranslation(MATRIX_COORD_200, MATRIX_COORD_200);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);

    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, MATRIX_NEGATIVE_1, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, false);

    OH_Drawing_MatrixSetMatrix(matrix, MATRIX_INT_1, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5,
                               MATRIX_INT_6, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isAffine, true);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600
 * @tc.desc   test for testMatrixIsAffineNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsAffineNull()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(nullptr, &isAffine);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    errorCode = OH_Drawing_MatrixIsAffine(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isAffine, false);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixIsAffineMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700
 * @tc.desc   test for testMatrixIsAffineMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixIsAffineMultipleCalls()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isAffine = false;
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixIsAffine(matrix, &isAffine);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isAffine, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800
 * @tc.desc   test for testMatrixPreSkewNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixPreSkewNormal()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_MatrixSetMatrix(result, MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_NEGATIVE_10_0, MATRIX_INT_3,
                               MATRIX_INT_1, MATRIX_VALUE_NEGATIVE_12_0, 0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                                              MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(MATRIX_ANGLE_90, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, MATRIX_VALUE_NEGATIVE_3_0, MATRIX_VALUE_NEGATIVE_1_0, MATRIX_VALUE_12_0,
                               MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_NEGATIVE_10_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(MATRIX_INT_1, MATRIX_INT_1, 0, 0);
    OH_Drawing_MatrixSetMatrix(result, MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_NEGATIVE_10_0, MATRIX_INT_3,
                               MATRIX_INT_1, MATRIX_VALUE_NEGATIVE_12_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(MATRIX_COORD_50, MATRIX_COORD_50);
    OH_Drawing_MatrixSetMatrix(result, MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_40_0, MATRIX_INT_3, MATRIX_INT_1,
                               MATRIX_VALUE_38_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900
 * @tc.desc   test for testMatrixPreSkewNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreSkewNull()
{
    DrawingNativeMatrixPart3TestSetUp();
    MatrixNullTestData testData = InitMatrixNullTestData();
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(nullptr, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                                              MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_0], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_1, 0, 0, MATRIX_INT_3, MATRIX_INT_1,
                               MATRIX_VALUE_NEGATIVE_12_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(testData.matrices[MATRIX_MATRIX_INDEX_1], 0, MATRIX_INT_3, MATRIX_INT_4,
                                         MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_1], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_NEGATIVE_10_0, 0,
                               MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(testData.matrices[MATRIX_MATRIX_INDEX_2], MATRIX_INT_2, 0, MATRIX_INT_4,
                                         MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_2], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_1, MATRIX_INT_2, MATRIX_VALUE_NEGATIVE_10_0, MATRIX_INT_3,
                               MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(testData.matrices[MATRIX_MATRIX_INDEX_3], MATRIX_INT_2, MATRIX_INT_3, 0,
                                         MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_3], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_1, MATRIX_INT_2, 0, MATRIX_INT_3, MATRIX_INT_1,
                               MATRIX_VALUE_NEGATIVE_12_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixPreSkew(testData.matrices[MATRIX_MATRIX_INDEX_4], MATRIX_INT_2, MATRIX_INT_3,
                                         MATRIX_INT_4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_INT_4], testData.result);
    EXPECT_EQ(ret, true);
    
    CleanupMatrixNullTestData(testData);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixPreSkewMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000
 * @tc.desc   test for testMatrixPreSkewMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixPreSkewMultipleCalls()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    OH_Drawing_MatrixSetMatrix(result, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1, 0, 0, 0, MATRIX_INT_1);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixPreSkew(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
        EXPECT_EQ(ret, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100
 * @tc.desc   test for testMatrixRectStaysRectNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixRectStaysRectNormal()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_MatrixPreScale(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    OH_Drawing_MatrixPreSkew(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, false);

    matrix = OH_Drawing_MatrixCreateRotation(MATRIX_ANGLE_90, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateScale(MATRIX_INT_1, MATRIX_INT_1, 0, 0);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);

    matrix = OH_Drawing_MatrixCreateTranslation(MATRIX_COORD_50, MATRIX_COORD_50);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(isRectStaysRect, true);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200
 * @tc.desc   test for testMatrixRectStaysRectNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRectStaysRectNull()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(nullptr, &isRectStaysRect);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    errorCode = OH_Drawing_MatrixRectStaysRect(matrix, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(isRectStaysRect, false);
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixRectStaysRectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300
 * @tc.desc   test for testMatrixRectStaysRectMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixRectStaysRectMultipleCalls()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    bool isRectStaysRect = false;
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixRectStaysRect(matrix, &isRectStaysRect);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(isRectStaysRect, true);
    }
    OH_Drawing_MatrixDestroy(matrix);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400
 * @tc.desc   test for testMatrixSetSinCosNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMatrixSetSinCosNormal()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);

    OH_Drawing_MatrixSetMatrix(result, MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_2_0, MATRIX_INT_2, MATRIX_INT_2,
                               MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_18_0, 0, 0, MATRIX_INT_1);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                                                MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    bool ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateRotation(MATRIX_ANGLE_90, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateScale(MATRIX_INT_1, MATRIX_INT_1, 0, 0);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);

    matrix = OH_Drawing_MatrixCreateTranslation(MATRIX_COORD_50, MATRIX_COORD_50);
    errorCode = OH_Drawing_MatrixSetSinCos(matrix, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4, MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(matrix, result);
    EXPECT_EQ(ret, true);
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500
 * @tc.desc   test for testMatrixSetSinCosNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetSinCosNull()
{
    DrawingNativeMatrixPart3TestSetUp();
    MatrixNullTestData testData = InitMatrixNullTestData();
    
    OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(nullptr, MATRIX_INT_2, MATRIX_INT_3, MATRIX_INT_4,
                                                                MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    bool ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_0], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_3, 0, MATRIX_VALUE_NEGATIVE_8_0, 0, MATRIX_INT_3,
                               MATRIX_VALUE_NEGATIVE_10_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixSetSinCos(testData.matrices[MATRIX_MATRIX_INDEX_1], 0, MATRIX_INT_3, MATRIX_INT_4,
                                           MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_1], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, 0, MATRIX_VALUE_NEGATIVE_2_0, MATRIX_VALUE_14_0, MATRIX_INT_2, 0,
                               MATRIX_VALUE_NEGATIVE_3_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixSetSinCos(testData.matrices[MATRIX_MATRIX_INDEX_2], MATRIX_INT_2, 0, MATRIX_INT_4,
                                           MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_2], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_2_0, MATRIX_COORD_10, MATRIX_INT_2,
                               MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_10_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixSetSinCos(testData.matrices[MATRIX_MATRIX_INDEX_3], MATRIX_INT_2, MATRIX_INT_3, 0,
                                           MATRIX_INT_5);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_MATRIX_INDEX_3], testData.result);
    EXPECT_EQ(ret, true);
    
    OH_Drawing_MatrixSetMatrix(testData.result, MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_2_0, MATRIX_VALUE_NEGATIVE_8_0,
                               MATRIX_INT_2, MATRIX_INT_3, MATRIX_VALUE_NEGATIVE_8_0, 0, 0, MATRIX_INT_1);
    errorCode = OH_Drawing_MatrixSetSinCos(testData.matrices[MATRIX_MATRIX_INDEX_4], MATRIX_INT_2, MATRIX_INT_3,
                                           MATRIX_INT_4, 0);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    ret = OH_Drawing_MatrixIsEqual(testData.matrices[MATRIX_INT_4], testData.result);
    EXPECT_EQ(ret, true);
    
    CleanupMatrixNullTestData(testData);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMatrixSetSinCosMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600
 * @tc.desc   test for testMatrixSetSinCosMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMatrixSetSinCosMultipleCalls()
{
    DrawingNativeMatrixPart3TestSetUp();
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    EXPECT_NE(matrix, nullptr);
    OH_Drawing_Matrix* result = OH_Drawing_MatrixCreate();
    EXPECT_NE(result, nullptr);
    for (int i = 0; i < MATRIX_LOOP_COUNT_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_MatrixSetSinCos(matrix, 0, 0, 0, 0);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_MatrixDestroy(matrix);
    OH_Drawing_MatrixDestroy(result);
    DrawingNativeMatrixPart3TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS