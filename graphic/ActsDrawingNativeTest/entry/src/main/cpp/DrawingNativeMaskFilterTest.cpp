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

#include "include/DrawingNativeMaskFilterTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;

constexpr time_t TEST_TIME_T_0 = 0;
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

// --- MaskFilter 测试常量 ---
constexpr float TEST_MASK_FILTER_SIGMA_NORMAL = 10.0f;
constexpr float TEST_MASK_FILTER_SIGMA_ZERO = 0.0f;
constexpr float TEST_MASK_FILTER_SIGMA_NEGATIVE = -10.0f;
constexpr bool TEST_MASK_FILTER_RESPECT_CTM_TRUE = true;
constexpr bool TEST_MASK_FILTER_RESPECT_CTM_FALSE = false;
constexpr float TEST_MASK_FILTER_SIGMA_MAX = FLT_MAX;

} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeMaskFilterTestSetUp()
{
    std::cout << "DrawingNativeMaskFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMaskFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMaskFilterTestTearDown()
{
    std::cout << "DrawingNativeMaskFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMaskFilterTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testMaskFilterCreateBlurDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0100
 * @tc.desc   Test for creating and destroying a blur mask filter with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestMaskFilterCreateBlurDestroyNormal()
{
    DrawingNativeMaskFilterTestSetUp();
    OH_Drawing_BlurType types[] = {
        NORMAL,
        SOLID,
        OUTER,
        INNER,
    };
    // 1. Enumerate through the blurType values in OH_Drawing_MaskFilterCreateBlur
    for (OH_Drawing_BlurType type : types) {
        OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
            type, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur with a floating-point value for sigma
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 3. Call OH_Drawing_MaskFilterCreateBlur with an integer value for sigma
    maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 4. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to false
    maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_FALSE);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 5. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to true
    maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 6. Call OH_Drawing_MaskFilterDestroy
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMaskFilterCreateBlurDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0200
 * @tc.desc   Test for creating and destroying a blur mask filter with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMaskFilterCreateBlurDestroyNULL()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with the second parameter as zero and check the error code
    // using
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_ZERO, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    EXPECT_NE(maskFilter, nullptr);
    // 2. Free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMaskFilterCreateBlurDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0300
 * @tc.desc   Test for multiple calls of creating and destroying a blur mask filter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMaskFilterCreateBlurDestroyMultipleCalls()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur and OH_Drawing_MaskFilterDestroy 10 times in a loop
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
            NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur 10 times consecutively
    OH_Drawing_MaskFilter* maskFilters[TEST_LOOP_COUNT_10];
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        maskFilters[i] = OH_Drawing_MaskFilterCreateBlur(
            NORMAL, TEST_MASK_FILTER_SIGMA_NORMAL, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
        // add assert
        EXPECT_NE(maskFilters[i], nullptr);
    }
    // 3. Call OH_Drawing_MaskFilterDestroy 10 times consecutively
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_MaskFilterDestroy(maskFilters[i]);
    }
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMaskFilterCreateBlurDestroyAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0400
 * @tc.desc   Test for creating and destroying a blur mask filter with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMaskFilterCreateBlurDestroyAbnormal()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a negative value for sigma and check the error code using
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_NEGATIVE, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    EXPECT_NE(maskFilter, nullptr);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testMaskFilterCreateBlurDestroyMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MASK_FILTER_0500
 * @tc.desc   Test for creating and destroying a blur mask filter with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestMaskFilterCreateBlurDestroyMaximum()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a maximum value for sigma
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(
        NORMAL, TEST_MASK_FILTER_SIGMA_MAX, TEST_MASK_FILTER_RESPECT_CTM_TRUE);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 2. Call OH_Drawing_MaskFilterDestroy to free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS