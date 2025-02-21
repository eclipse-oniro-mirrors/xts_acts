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
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeSamplingOptionsTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0100
 * @tc.name: testSamplingOptionsCreateDestroyDestroyNormal
 * @tc.desc: test for testSamplingOptionsCreateDestroyDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyNormal, TestSize.Level0) {
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
            EXPECT_NE(options, nullptr);
            // 2. Destroy the objects created in step 1 with OH_Drawing_SamplingOptionsDestroy
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0101
 * @tc.name: testSamplingOptionsCreateDestroyDestroyNull
 * @tc.desc: test for testSamplingOptionsCreateDestroyDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_SamplingOptionsDestroy with empty parameter
    OH_Drawing_SamplingOptionsDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SAMPLING_OPTIONS_0102
 * @tc.name: testSamplingOptionsCreateDestroyDestroyMultipleCalls
 * @tc.desc: test for testSamplingOptionsCreateDestroyDestroyMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSamplingOptionsTest, testSamplingOptionsCreateDestroyDestroyMultipleCalls, TestSize.Level3) {
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

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS