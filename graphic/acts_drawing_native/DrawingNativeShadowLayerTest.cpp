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

#include "drawing_error_code.h"
#include "drawing_shadow_layer.h"
#include "gtest/gtest.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeShadowLayerTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0100
 * @tc.name: testShadowLayerCreateNormal
 * @tc.desc: test for testShadowLayerCreateNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerCreateNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ShadowLayerCreate with integer values for blurRadius, x, and y
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(3, -3, 3, 0xFF00FF00);
    EXPECT_NE(shadow, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow);
    // 2. Call OH_Drawing_ShadowLayerCreate with floating-point values for blurRadius, x, and y
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(3.f, -3.f, 3.f, 0xFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow2);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0101
 * @tc.name: testShadowLayerCreateNull
 * @tc.desc: test for testShadowLayerCreateNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerCreateNull, TestSize.Level3) {
    // 1. OH_Drawing_ShadowLayerCreate with the first parameter being empty, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(0, -3, 3, 0xFF00FF00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter being empty
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(3, 0, 3, 0xFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter being empty
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(3, -3, 0, 0xFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter being empty
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(3, -3, 3, 0);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0102
 * @tc.name: testShadowLayerCreateAbnormal
 * @tc.desc: test for testShadowLayerCreateAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerCreateAbnormal, TestSize.Level3) {
    // 1. OH_Drawing_ShadowLayerCreate with the first parameter as a negative number, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(-3, 3, 3, 0xFF00FF00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter as a negative number
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(3, -3, 3, 0xFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter as a negative number
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(3, 3, -3, 0xFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter as a negative number
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(3, 3, 3, -0xFF00FF00);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0103
 * @tc.name: testShadowLayerCreateMaximum
 * @tc.desc: test for testShadowLayerCreateMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerCreateMaximum, TestSize.Level3) {
    // 1. Call OH_Drawing_ShadowLayerCreate with the first parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(FLT_MAX, 3, 3, 0xFF00FF00);
    EXPECT_NE(shadow, nullptr);
    // 2. Call OH_Drawing_ShadowLayerCreate with the second parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(3, FLT_MAX, 3, 0xFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. Call OH_Drawing_ShadowLayerCreate with the third parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(3, 3, FLT_MAX, 0xFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. Call OH_Drawing_ShadowLayerCreate with the fourth parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(3, 3, 3, UINT32_MAX);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0104
 * @tc.name: testShadowLayerCreateMultipleCalls
 * @tc.desc: test for testShadowLayerCreateMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerCreateMultipleCalls, TestSize.Level3) {
    // 1. Call OH_Drawing_ShadowLayerCreate 10 times with random values for blurRadius, x, y, and different colors
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, 100);
    for (int i = 0; i < 10; i++) {
        float blurRadius = dis(gen);
        float x = dis(gen);
        float y = dis(gen);
        uint32_t color = dis(gen);
        OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(blurRadius, x, y, color);
        EXPECT_NE(shadow, nullptr);
        OH_Drawing_ShadowLayerDestroy(shadow);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0200
 * @tc.name: testShadowLayerDestroyNormal
 * @tc.desc: test for testShadowLayerDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerDestroyNormal, TestSize.Level0) {
    // 1. Call OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(3, 3, 3, 0xFF00FF00);
    // 2. Call OH_Drawing_ShadowLayerDestroy
    OH_Drawing_ShadowLayerDestroy(shadow);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SHADOW_LAYER_0201
 * @tc.name: testShadowLayerDestroyNull
 * @tc.desc: test for testShadowLayerDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeShadowLayerTest, testShadowLayerDestroyNull, TestSize.Level3) {
    // 1. OH_Drawing_ShadowLayerDestroy with null parameter
    OH_Drawing_ShadowLayerDestroy(nullptr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS