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

#include "drawing_sampling_options.h"
#include "drawing_types.h"
#include "gtest/gtest.h"
#include "drawing_error_code.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeSamplingOptionsTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeSamplingOptionsTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeSamplingOptionsTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeSamplingOptionsTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeSamplingOptionsTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0100
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyNormal, Function | SmallTest | Level0) {
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
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            EXPECT_NE(options, nullptr);
            // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
}

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0101
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyNull, Function | SmallTest | Level3) {
    // 1. OH_Drawing_SamplingOptionsDestroy with empty parameter
    OH_Drawing_SamplingOptionsDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/**
 * @tc.name   testSamplingOptionsCreateDestroyDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0102
 * @tc.desc   test for testSamplingOptionsCreateDestroyDestroyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyMultipleCalls, Function | SmallTest | Level3) {
    // 1. Call OH_Drawing_SamplingOptionsCreate 10 times with random enum values
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dis(0, 10);
    OH_Drawing_SamplingOptions *options[10];
    for (int i = 0; i < 10; i++) {
        int random = dis(gen);
        OH_Drawing_FilterMode filterMode = static_cast<OH_Drawing_FilterMode>(random % 2);
        OH_Drawing_MipmapMode mipmapMode = static_cast<OH_Drawing_MipmapMode>(random % 3);
        options[i] = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
        EXPECT_NE(options[i], nullptr);
    }
    // 2. Call OH_Drawing_SamplingOptionsDestroy 10 times
    for (int i = 0; i < 10; i++) {
        OH_Drawing_SamplingOptionsDestroy(options[i]);
    }
    // 3. Call OH_Drawing_SamplingOptionsCreate and OH_Drawing_SamplingOptionsDestroy alternately 10 times
    for (int i = 0; i < 10; i++) {
        int random = dis(gen);
        OH_Drawing_FilterMode filterMode = static_cast<OH_Drawing_FilterMode>(random % 2);
        OH_Drawing_MipmapMode mipmapMode = static_cast<OH_Drawing_MipmapMode>(random % 3);
        OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode, mipmapMode);
        EXPECT_NE(options, nullptr);
        OH_Drawing_SamplingOptionsDestroy(options);
    }
}

/**
 * @tc.name   testSamplingOptionsCopyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0200
 * @tc.desc   test for testSamplingOptionsCopyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCopyNormal, Function | SmallTest | Level0) {
    OH_Drawing_SamplingOptions *src = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is called normally.
    OH_Drawing_SamplingOptions *samplingOptions = OH_Drawing_SamplingOptionsCopy(src);
    EXPECT_NE(samplingOptions, nullptr);
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
}

/**
 * @tc.name   testSamplingOptionsCopyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0201
 * @tc.desc   test for testSamplingOptionsCopyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCopyNull, Function | SmallTest | Level3) {
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is passed null.
    OH_Drawing_SamplingOptions *samplingOptions = OH_Drawing_SamplingOptionsCopy(nullptr);
    EXPECT_EQ(samplingOptions, nullptr);
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
}

/**
 * @tc.name   testSamplingOptionsCopyMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0202
 * @tc.desc   test for testSamplingOptionsCopyMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCopyMultiCalls, Function | SmallTest | Level3) {
    OH_Drawing_SamplingOptions *src = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_SamplingOptions *samplingOptions = nullptr;
    // 1. The interface of OH_Drawing_SamplingOptionsCopy is called 10 times.
    for (int i = 0; i < 10; i++) {
        samplingOptions = OH_Drawing_SamplingOptionsCopy(src);
        EXPECT_NE(samplingOptions, nullptr);
    }
    // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
    OH_Drawing_SamplingOptionsDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS