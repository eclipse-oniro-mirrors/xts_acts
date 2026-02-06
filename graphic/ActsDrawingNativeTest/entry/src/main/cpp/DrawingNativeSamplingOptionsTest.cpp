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

#include "include/DrawingNativeSamplingOptionsTest.h"
#include <random>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_RANDOM_DISTRIBUTION_MIN_0 = 0;
constexpr int TEST_RANDOM_DISTRIBUTION_MAX_10 = 10;
constexpr int TEST_ARRAY_SIZE_10 = 10;
constexpr int TEST_FILTER_MODE_COUNT_2 = 2;
constexpr int TEST_MIPMAP_MODE_COUNT_3 = 3;
constexpr int TEST_ARRAY_INDEX_0 = 0;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeSamplingOptionsTestSetUp()
{
    std::cout << "DrawingNativeSamplingOptionsTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSamplingOptionsTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeSamplingOptionsTestTearDown()
{
    std::cout << "DrawingNativeSamplingOptionsTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSamplingOptionsTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0100
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSamplingOptionsCreateDestroyDestroyNormal()
{
    DrawingNativeSamplingOptionsTestSetUp();
    OH_Drawing_FilterMode filterModes[] = {
        FILTER_MODE_NEAREST,
        FILTER_MODE_LINEAR,
    };
    OH_Drawing_MipmapMode mipmapModes[] = {
        MIPMAP_MODE_NONE,
        MIPMAP_MODE_NEAREST,
        MIPMAP_MODE_LINEAR,
    };
    // 1. Enumerate OH_Drawing_FilterMode and OH_Drawing_MipmapMode values with cross iteration
    for (OH_Drawing_FilterMode filterMode : filterModes) {
        for (OH_Drawing_MipmapMode mipmapMode : mipmapModes) {
            OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            EXPECT_NE(options, nullptr);
            // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0200
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSamplingOptionsCreateDestroyDestroyNull()
{
    DrawingNativeSamplingOptionsTestSetUp();
    // 1. OH_Drawing_SamplingOptionsDestroy with empty parameter
    OH_Drawing_SamplingOptionsDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0300
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSamplingOptionsCreateDestroyDestroyMultipleCalls()
{
    // 1. Call OH_Drawing_SamplingOptionsCreate 10 times with random enum values
    DrawingNativeSamplingOptionsTestSetUp();
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(TEST_RANDOM_DISTRIBUTION_MIN_0, TEST_RANDOM_DISTRIBUTION_MAX_10);
    OH_Drawing_SamplingOptions* options[TEST_ARRAY_SIZE_10];
    for (int i = TEST_ARRAY_INDEX_0; i < TEST_LOOP_COUNT_10; i++) {
        int random = dis(gen);
        OH_Drawing_FilterMode filterMode = static_cast<OH_Drawing_FilterMode>(random % TEST_FILTER_MODE_COUNT_2);
        OH_Drawing_MipmapMode mipmapMode = static_cast<OH_Drawing_MipmapMode>(random % TEST_MIPMAP_MODE_COUNT_3);
        options[i] = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
        EXPECT_NE(options[i], nullptr);
    }
    // 2. Call OH_Drawing_SamplingOptionsDestroy 10 times
    for (int i = TEST_ARRAY_INDEX_0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_SamplingOptionsDestroy(options[i]);
    }
    // 3. Call OH_Drawing_SamplingOptionsCreate and OH_Drawing_SamplingOptionsDestroy alternately 10 times
    for (int i = TEST_ARRAY_INDEX_0; i < TEST_LOOP_COUNT_10; i++) {
        int random = dis(gen);
        OH_Drawing_FilterMode filterMode = static_cast<OH_Drawing_FilterMode>(random % TEST_FILTER_MODE_COUNT_2);
        OH_Drawing_MipmapMode mipmapMode = static_cast<OH_Drawing_MipmapMode>(random % TEST_MIPMAP_MODE_COUNT_3);
        OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
        EXPECT_NE(options, nullptr);
        OH_Drawing_SamplingOptionsDestroy(options);
    }
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSamplingOptionsCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0400
 * @tc.desc   test for testSamplingOptionsCopyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSamplingOptionsCopyNormal()
{
    DrawingNativeSamplingOptionsTestSetUp();
    OH_Drawing_SamplingOptions* src = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is called normally.
    OH_Drawing_SamplingOptions* samplingOptions = OH_Drawing_SamplingOptionsCopy(src);
    EXPECT_NE(samplingOptions, nullptr);
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSamplingOptionsCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0500
 * @tc.desc   test for testSamplingOptionsCopyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSamplingOptionsCopyNull()
{
    DrawingNativeSamplingOptionsTestSetUp();
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is passed null.
    OH_Drawing_SamplingOptions* samplingOptions = OH_Drawing_SamplingOptionsCopy(nullptr);
    EXPECT_EQ(samplingOptions, nullptr);
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSamplingOptionsCopyMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0600
 * @tc.desc   test for testSamplingOptionsCopyMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSamplingOptionsCopyMultiCalls()
{
    DrawingNativeSamplingOptionsTestSetUp();
    OH_Drawing_SamplingOptions* src = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_SamplingOptions* samplingOptions = nullptr;
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is called 10 times.
    for (int i = TEST_ARRAY_INDEX_0; i < TEST_LOOP_COUNT_10; i++) {
        samplingOptions = OH_Drawing_SamplingOptionsCopy(src);
        EXPECT_NE(samplingOptions, nullptr);
    }
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    DrawingNativeSamplingOptionsTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS