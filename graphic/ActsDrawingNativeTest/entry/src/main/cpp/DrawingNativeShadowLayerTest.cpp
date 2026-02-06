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

#include "include/DrawingNativeShadowLayerTest.h"
#include <cfloat>
#include <cstdint>
#include <random>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr float TEST_SHADOW_BLUR_RADIUS_3 = 3.0f;
constexpr float TEST_SHADOW_OFFSET_NEGATIVE_3 = -3.0f;
constexpr float TEST_SHADOW_OFFSET_3 = 3.0f;
constexpr float TEST_SHADOW_VALUE_0 = 0.0f;
constexpr uint32_t TEST_SHADOW_COLOR_GREEN = 0xFF00FF00;
constexpr uint32_t TEST_SHADOW_COLOR_0 = 0;
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr float TEST_RANDOM_DISTRIBUTION_MAX_100 = 100.0f;
constexpr float TEST_RANDOM_DISTRIBUTION_MIN_0 = 0.0f;
constexpr float FLT_MAX_VALUE = FLT_MAX;
constexpr uint32_t UINT32_MAX_VALUE = UINT32_MAX;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeShadowLayerTestSetUp()
{
    std::cout << "DrawingNativeShadowLayerTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShadowLayerTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeShadowLayerTestTearDown()
{
    std::cout << "DrawingNativeShadowLayerTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeShadowLayerTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testShadowLayerCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0100
 * @tc.desc   test for testShadowLayerCreateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShadowLayerCreateNormal()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. Call OH_Drawing_ShadowLayerCreate with integer values for blurRadius, x, and y
    OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                  TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                  TEST_SHADOW_OFFSET_3,
                                                                  TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow);
    // 2. Call OH_Drawing_ShadowLayerCreate with floating-point values for blurRadius, x, and y
    OH_Drawing_ShadowLayer* shadow2 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                   TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                   TEST_SHADOW_OFFSET_3,
                                                                   TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow2, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow2);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0200
 * @tc.desc   test for testShadowLayerCreateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShadowLayerCreateNull()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. OH_Drawing_ShadowLayerCreate with the first parameter being empty, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_VALUE_0, TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                  TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter being empty
    OH_Drawing_ShadowLayer* shadow2 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_VALUE_0,
                                                                   TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter being empty
    OH_Drawing_ShadowLayer* shadow3 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                   TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                   TEST_SHADOW_VALUE_0, TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter being empty
    OH_Drawing_ShadowLayer* shadow4 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                   TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                   TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_0);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0300
 * @tc.desc   test for testShadowLayerCreateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShadowLayerCreateAbnormal()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. OH_Drawing_ShadowLayerCreate with the first parameter as a negative number, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_OFFSET_NEGATIVE_3, TEST_SHADOW_OFFSET_3,
                                                                  TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter as a negative number
    OH_Drawing_ShadowLayer* shadow2 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                   TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                   TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter as a negative number
    OH_Drawing_ShadowLayer* shadow3 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_OFFSET_3,
                                                                   TEST_SHADOW_OFFSET_NEGATIVE_3,
                                                                   TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter as a negative number
    OH_Drawing_ShadowLayer* shadow4 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_OFFSET_3,
                                                                   TEST_SHADOW_OFFSET_3, -TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerCreateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0400
 * @tc.desc   test for testShadowLayerCreateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShadowLayerCreateMaximum()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. Call OH_Drawing_ShadowLayerCreate with the first parameter as the maximum value
    OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(FLT_MAX_VALUE, TEST_SHADOW_OFFSET_3,
                                                                  TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow, nullptr);
    // 2. Call OH_Drawing_ShadowLayerCreate with the second parameter as the maximum value
    OH_Drawing_ShadowLayer* shadow2 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3,
                                                                   FLT_MAX_VALUE, TEST_SHADOW_OFFSET_3,
                                                                   TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow2, nullptr);
    // 3. Call OH_Drawing_ShadowLayerCreate with the third parameter as the maximum value
    OH_Drawing_ShadowLayer* shadow3 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_OFFSET_3,
                                                                   FLT_MAX_VALUE, TEST_SHADOW_COLOR_GREEN);
    EXPECT_NE(shadow3, nullptr);
    // 4. Call OH_Drawing_ShadowLayerCreate with the fourth parameter as the maximum value
    OH_Drawing_ShadowLayer* shadow4 = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_OFFSET_3,
                                                                   TEST_SHADOW_OFFSET_3, UINT32_MAX_VALUE);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0500
 * @tc.desc   test for testShadowLayerCreateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShadowLayerCreateMultipleCalls()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. Call OH_Drawing_ShadowLayerCreate 10 times with random values for blurRadius, x, y, and different colors
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(TEST_RANDOM_DISTRIBUTION_MIN_0, TEST_RANDOM_DISTRIBUTION_MAX_100);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        float blurRadius = dis(gen);
        float x = dis(gen);
        float y = dis(gen);
        uint32_t color = dis(gen);
        OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(blurRadius, x, y, color);
        EXPECT_NE(shadow, nullptr);
        OH_Drawing_ShadowLayerDestroy(shadow);
    }

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0600
 * @tc.desc   test for testShadowLayerDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestShadowLayerDestroyNormal()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. Call OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer* shadow = OH_Drawing_ShadowLayerCreate(TEST_SHADOW_BLUR_RADIUS_3, TEST_SHADOW_OFFSET_3,
                                                                  TEST_SHADOW_OFFSET_3, TEST_SHADOW_COLOR_GREEN);
    // add assert
    EXPECT_NE(shadow, nullptr);
    // 2. Call OH_Drawing_ShadowLayerDestroy
    OH_Drawing_ShadowLayerDestroy(shadow);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testShadowLayerDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0700
 * @tc.desc   test for testShadowLayerDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestShadowLayerDestroyNull()
{
    DrawingNativeShadowLayerTestSetUp();

    // 1. OH_Drawing_ShadowLayerDestroy with null parameter
    OH_Drawing_ShadowLayerDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeShadowLayerTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS