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

#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_19937 19937
#define DRAWING_NUMBER_0XFF00FF00 0xFF00FF00

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestShadowLayerCreateNormal()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. Call OH_Drawing_ShadowLayerCreate with integer values for blurRadius, x, and y
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, -DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow);
    // 2. Call OH_Drawing_ShadowLayerCreate with floating-point values for blurRadius, x, and y
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, -DRAWING_NUMBER_3,
        DRAWING_NUMBER_3, DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerCreateNull()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. OH_Drawing_ShadowLayerCreate with the first parameter being empty, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(0, -DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter being empty
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, 0, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter being empty
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, -DRAWING_NUMBER_3, 0,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter being empty
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, -DRAWING_NUMBER_3,
        DRAWING_NUMBER_3, 0);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerCreateAbnormal()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. OH_Drawing_ShadowLayerCreate with the first parameter as a negative number, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(-DRAWING_NUMBER_3, DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    // 2. OH_Drawing_ShadowLayerCreate with the second parameter as a negative number
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, -DRAWING_NUMBER_3,
        DRAWING_NUMBER_3, DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. OH_Drawing_ShadowLayerCreate with the third parameter as a negative number
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        -DRAWING_NUMBER_3, DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. OH_Drawing_ShadowLayerCreate with the fourth parameter as a negative number
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        -DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerCreateMaximum()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. Call OH_Drawing_ShadowLayerCreate with the first parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(FLT_MAX, DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow, nullptr);
    // 2. Call OH_Drawing_ShadowLayerCreate with the second parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow2 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, FLT_MAX, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow2, nullptr);
    // 3. Call OH_Drawing_ShadowLayerCreate with the third parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow3 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, DRAWING_NUMBER_3, FLT_MAX,
        DRAWING_NUMBER_0XFF00FF00);
    EXPECT_NE(shadow3, nullptr);
    // 4. Call OH_Drawing_ShadowLayerCreate with the fourth parameter as the maximum value
    OH_Drawing_ShadowLayer *shadow4 = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        UINT32_MAX);
    EXPECT_NE(shadow4, nullptr);
    // 5. Free memory
    OH_Drawing_ShadowLayerDestroy(shadow);
    OH_Drawing_ShadowLayerDestroy(shadow2);
    OH_Drawing_ShadowLayerDestroy(shadow3);
    OH_Drawing_ShadowLayerDestroy(shadow4);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerCreateMultipleCalls()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. Call OH_Drawing_ShadowLayerCreate 10 times with random values for blurRadius, x, y, and different colors
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_100);
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        float blurRadius = dis(gen);
        float x = dis(gen);
        float y = dis(gen);
        uint32_t color = dis(gen);
        OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(blurRadius, x, y, color);
        EXPECT_NE(shadow, nullptr);
        OH_Drawing_ShadowLayerDestroy(shadow);
    }
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerDestroyNormal()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. Call OH_Drawing_ShadowLayerCreate
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(DRAWING_NUMBER_3, DRAWING_NUMBER_3, DRAWING_NUMBER_3,
        DRAWING_NUMBER_0XFF00FF00);
    // add assert
    EXPECT_NE(shadow, nullptr);
    // 2. Call OH_Drawing_ShadowLayerDestroy
    OH_Drawing_ShadowLayerDestroy(shadow);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestShadowLayerDestroyNull()
{
    DrawingNativeShadowLayerTestSetUp();
    // 1. OH_Drawing_ShadowLayerDestroy with null parameter
    OH_Drawing_ShadowLayer *shadowLayer = nullptr;
    OH_Drawing_ShadowLayerDestroy(nullptr);
    EXPECT_EQ(shadowLayer, nullptr);
    DrawingNativeShadowLayerTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS