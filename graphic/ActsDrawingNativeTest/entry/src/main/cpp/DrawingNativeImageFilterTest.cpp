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

#include "include/DrawingNativeImageFilterTest.h"
#include <iostream>
#include <random>
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_COUNT_100 = 100;
constexpr int TEST_COUNT_200 = 200;
constexpr uint32_t TEST_RECT_SIZE_4096 = 4096;
constexpr uint32_t TEST_RECT_SIZE_2160 = 2160;
constexpr uint32_t TEST_RECT_SIZE_400 = 400;
constexpr uint32_t TEST_RECT_SIZE_200 = 200;
constexpr uint32_t TEST_RECT_SIZE_NEGATIVE_400 = -400;

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


// 用于 ImageFilter 模糊效果的 Sigma 值
constexpr float TEST_SIGMA_SMALL = 1.0f;
constexpr float TEST_SIGMA_MEDIUM = 10.0f;
constexpr float TEST_SIGMA_NEGATIVE = -1.0f;

// 用于 ImageFilter 偏移效果的偏移量
constexpr int TEST_OFFSET_DEFAULT = 10;
constexpr int TEST_OFFSET_MAX_INT = 0xFFFFFFFF;

// 用于 ShaderEffect 的颜色值
constexpr uint32_t TEST_COLOR_OPAQUE_GREEN = 0xFF00FF00;

// 用于 Rect 创建的尺寸
constexpr float TEST_RECT_DIMENSION_200 = 200.0f;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeImageFilterTestSetUp()
{
    std::cout << "DrawingNativeImageFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeImageFilterTestTearDown()
{
    std::cout << "DrawingNativeImageFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageFilterTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testImageFilterCreateBlurNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0100
 * @tc.desc   Test for creating a blur image filter with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterCreateBlurNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_TileMode modes[] = { CLAMP, REPEAT, MIRROR, DECAL };
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ImageFilter* filter =
            OH_Drawing_ImageFilterCreateBlur(TEST_SIGMA_SMALL, TEST_SIGMA_SMALL, mode, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    // 2. Pass decimal values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter* filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_SIGMA_SMALL, TEST_SIGMA_SMALL, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Pass integer values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    filter =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 4. Pass NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_SIGMA_SMALL, TEST_SIGMA_SMALL, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 5. Pass non-NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_SIGMA_SMALL, TEST_SIGMA_SMALL, OH_Drawing_TileMode::MIRROR, filter);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 6. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0200
 * @tc.desc   Test for creating a blur image filter with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur with the first parameter being null
    OH_Drawing_ImageFilter* filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_NUMBER_0, TEST_SIGMA_SMALL, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ImageFilterCreateBlur with the second parameter being null
    filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_SIGMA_SMALL, TEST_NUMBER_0, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0300
 * @tc.desc   Test for multiple calls of creating a blur image filter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur (pass random values for sigmaX and sigmaY, random enum value for
    // OH_Drawing_TileMode), call 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(TEST_NUMBER_0, TEST_NUMBER_10);
        std::uniform_int_distribution<int> enum_dis(TEST_NUMBER_0, TEST_NUMBER_3);
        OH_Drawing_TileMode tileMode = static_cast<OH_Drawing_TileMode>(enum_dis(gen));
        OH_Drawing_ImageFilter* filter =
            OH_Drawing_ImageFilterCreateBlur(dis(gen), dis(gen), tileMode, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0400
 * @tc.desc   Test for creating a blur image filter with abnormal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurAbnormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Pass negative values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter* filter = OH_Drawing_ImageFilterCreateBlur(
        TEST_SIGMA_NEGATIVE, TEST_SIGMA_NEGATIVE, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0500
 * @tc.desc   Test for creating a blur image filter with maximum values.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurMaximum()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create a blur image filter with maximum values for sigmaX and sigmaY in
    // OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter* filter =
        OH_Drawing_ImageFilterCreateBlur(FLT_MAX, FLT_MAX, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromColorFilterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0600
 * @tc.desc   Test for creating an image filter from a color filter with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterCreateFromColorFilterNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter* filter =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 3. OH_Drawing_ImageFilterCreateFromColorFilter with null input parameter
    OH_Drawing_ImageFilter* imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ImageFilterCreateFromColorFilter with non-null input parameter
    imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, filter);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_ImageFilterDestroy(imageFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromColorFilterNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0700
 * @tc.desc   Test for creating an image filter from a color filter with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateFromColorFilterNULL()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilter* filter =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 1. OH_Drawing_ImageFilterCreateFromColorFilter with the first parameter being null, check the error
    // code using OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageFilterCreateFromColorFilter(nullptr, filter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromColorFilterMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0800
 * @tc.desc   Test for multiple calls of creating an image filter from a color filter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateFromColorFilterMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ImageFilter* filter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
        EXPECT_NE(filter, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ImageFilterDestroy(filter);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0900
 * @tc.desc   Test for destroying an image filter with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterDestroyNormal()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilter* filter =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1000
 * @tc.desc   Test for destroying an image filter with NULL parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterDestroyNULL()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilterDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1100
 * @tc.desc   Test for multiple calls of destroying an image filter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterDestroyMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Call OH_Drawing_ImageFilterCreateFromColorFilter 10 times
    OH_Drawing_ColorFilter* colorFilters[TEST_LOOP_COUNT_10];
    OH_Drawing_ImageFilter* filters[TEST_LOOP_COUNT_10];
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        colorFilters[i] = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilters[i], nullptr);
        filters[i] = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilters[i], nullptr);
        // add assert
        EXPECT_NE(filters[i], nullptr);
    }
    // 2. Call OH_Drawing_ImageFilterDestroy 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ImageFilterDestroy(filters[i]);
        OH_Drawing_ColorFilterDestroy(colorFilters[i]);
    }
    // 3. Call OH_Drawing_ImageFilterCreateBlur and OH_Drawing_ImageFilterDestroy alternately 10 times
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ImageFilter* filter = OH_Drawing_ImageFilterCreateBlur(static_cast<float>(TEST_NUMBER_1),
                                                                          static_cast<float>(TEST_NUMBER_1),
                                                                          OH_Drawing_TileMode::MIRROR,
                                                                          nullptr);
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateOffsetNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1200
 * @tc.desc   test for testImageFilterCreateOffsetNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterCreateOffsetNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter* imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateOffset.
    OH_Drawing_ImageFilter* imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_DEFAULT, TEST_OFFSET_DEFAULT, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateOffsetNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1300
 * @tc.desc   test for testImageFilterCreateOffsetNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateOffsetNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter* imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. The first parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to 0.
    OH_Drawing_ImageFilter* imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(TEST_NUMBER_0, TEST_OFFSET_DEFAULT, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The second parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to 0.
    OH_Drawing_ImageFilter* imageFilter3 =
        OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_DEFAULT, TEST_NUMBER_0, imageFilter1);
    EXPECT_NE(imageFilter3, nullptr);
    // 4. The third parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to nullptr.
    OH_Drawing_ImageFilter* imageFilter4 =
        OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_DEFAULT, TEST_OFFSET_DEFAULT, nullptr);
    EXPECT_NE(imageFilter4, nullptr);
    // 5. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    OH_Drawing_ImageFilterDestroy(imageFilter3);
    OH_Drawing_ImageFilterDestroy(imageFilter4);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateOffsetAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1400
 * @tc.desc   test for testImageFilterCreateOffsetAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateOffsetAbnormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter* imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. The first parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to maximum value.
    OH_Drawing_ImageFilter* imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_MAX_INT, TEST_OFFSET_DEFAULT, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The second parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to maximum value.
    OH_Drawing_ImageFilter* imageFilter3 =
        OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_DEFAULT, TEST_OFFSET_MAX_INT, imageFilter1);
    EXPECT_NE(imageFilter3, nullptr);
    // 4. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    OH_Drawing_ImageFilterDestroy(imageFilter3);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateOffsetMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1500
 * @tc.desc   test for testImageFilterCreateOffsetMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateOffsetMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter* imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(TEST_NUMBER_1, TEST_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. OH_Drawing_ImageFilterCreateOffset is called multiple times.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ImageFilter* imageFilter2 =
            OH_Drawing_ImageFilterCreateOffset(TEST_OFFSET_MAX_INT, TEST_OFFSET_DEFAULT, imageFilter1);
        EXPECT_NE(imageFilter2, nullptr);
        OH_Drawing_ImageFilterDestroy(imageFilter2);
    }
    // 3. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromShderEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1600
 * @tc.desc   test for testImageFilterCreateFromShderEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterCreateFromShderEffectNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ShaderEffectCreateColorShder.
    OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreateColorShader(TEST_COLOR_OPAQUE_GREEN);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    OH_Drawing_ImageFilter* imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(shaderEffect);
    EXPECT_NE(imageFilter, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    OH_Drawing_ImageFilterDestroy(imageFilter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromShderEffectNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1700
 * @tc.desc   test for testImageFilterCreateFromShderEffectNULL.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateFromShderEffectNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    OH_Drawing_ImageFilter* imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(nullptr);
    EXPECT_EQ(imageFilter, nullptr);
    // 2. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateFromShderEffectMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1800
 * @tc.desc   test for testImageFilterCreateFromShderEffectMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateFromShderEffectMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ShaderEffectCreateColorShder.
    OH_Drawing_ShaderEffect* shaderEffect = OH_Drawing_ShaderEffectCreateColorShader(TEST_COLOR_OPAQUE_GREEN);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_ImageFilter* imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(shaderEffect);
        EXPECT_NE(imageFilter, nullptr);
        OH_Drawing_ImageFilterDestroy(imageFilter);
    }
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurWithCropNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1900
 * @tc.desc   test for testImageFilterCreateBlurWithCropNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestImageFilterCreateBlurWithCropNormal()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect* cropRect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_DIMENSION_200, TEST_RECT_DIMENSION_200);
    OH_Drawing_ImageFilter* imageFilter1 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, nullptr, nullptr);
    // 1. The interface of OH_Drawing_ImageFilterCreateBlurWithCrop is called normally.
    OH_Drawing_ImageFilter* imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, imageFilter1, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 2. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurWithCropNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2000
 * @tc.desc   test for testImageFilterCreateBlurWithCropNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurWithCropNull()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect* cropRect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_DIMENSION_200, TEST_RECT_DIMENSION_200);
    OH_Drawing_ImageFilter* imageFilter1 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, nullptr, nullptr);
    // 1. The first parameter of the verification interface is passed null.
    OH_Drawing_ImageFilter* imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_NUMBER_0, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, imageFilter1, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 2. The second parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_NUMBER_0, OH_Drawing_TileMode::CLAMP, imageFilter1, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The forth parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, nullptr, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 4. The fifth parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, imageFilter1, nullptr);
    EXPECT_NE(imageFilter2, nullptr);
    // 5. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testImageFilterCreateBlurWithCropMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2100
 * @tc.desc   test for testImageFilterCreateBlurWithCropMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestImageFilterCreateBlurWithCropMultiCalls()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect* cropRect =
        OH_Drawing_RectCreate(TEST_NUMBER_0, TEST_NUMBER_0, TEST_RECT_DIMENSION_200, TEST_RECT_DIMENSION_200);
    OH_Drawing_ImageFilter* imageFilter1 = OH_Drawing_ImageFilterCreateBlurWithCrop(
        TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, nullptr, nullptr);
    OH_Drawing_ImageFilter* imageFilter2 = nullptr;
    // 1. The interface of OH_Drawing_ImageFilterCreateBlurWithCrop is called 10 times.
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
            TEST_SIGMA_MEDIUM, TEST_SIGMA_MEDIUM, OH_Drawing_TileMode::CLAMP, imageFilter1, cropRect);
        EXPECT_NE(imageFilter2, nullptr);
    }
    // 2. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS